package com.animo.service.impl;

import com.animo.calculate.*;
import com.animo.common.Pager;
import com.animo.common.ServerResponse;
import com.animo.dao.BorrowapplyMapper;
import com.animo.dao.SkbMapper;
import com.animo.dao.TzbMapper;
import com.animo.pojo.Skb;
import com.animo.pojo.Tzb;
import com.animo.service.SkbService;
import com.animo.vo.BorrowapplyMoneyVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Animo on 2018-01-02.
 */
@Service
public class SkbServiceImpl extends AbstractServiceImpl implements SkbService{

    private SkbMapper skbMapper;

    private TzbMapper tzbMapper;

    private BorrowapplyMapper borrowapplyMapper;

    private Loan loan;

    @Override
    @Transactional
    public ServerResponse skblist(int pageNo, int pageSize, Integer uid,Integer baid) {
        ServerResponse serverResponse  = saveSkb(uid,baid);
        if(serverResponse.isSuccess()) {
            Pager pager = new Pager(pageNo, pageSize);
            pager.setRows(skbMapper.list(pager, uid, baid));
            pager.setTotal(skbMapper.countUid(uid, baid));
            return ServerResponse.createBySuccess(pager);
        }
        return serverResponse;
    }

    public ServerResponse saveSkb(Integer uid, Integer baid){
        //装载保存收款表的list
        List<Skb> skbList = new ArrayList<>();
        //根据用户id 和借款id查出所有的金额
        BorrowapplyMoneyVo borrowapplyMoneyVo = (BorrowapplyMoneyVo)borrowapplyMapper.getById(baid);
        //根据用户id和收款表的id去查询有没有记录
        Long count = skbMapper.getByUidAndBaid(uid, baid);
        //如果没有记录就生成
        if(count==0) {
            //如果当前借款的目标金额和已筹金额相等
            if (borrowapplyMoneyVo.getMoney().compareTo(borrowapplyMoneyVo.getMmoney()) == 0) {
                //查询出该用户对该借款投了几次
                List<Tzb> tzbList = tzbMapper.listTzb(uid, baid);
                //计算出总投资金额
                BigDecimal money = new BigDecimal(0);
                for (Tzb tzb : tzbList) {
                    money = money.add(tzb.getMoney());
                }
                Tzb tzb = tzbList.get(0);
                if(tzb.getResint2() == 1) {
                    ACPIMLoanCalculator calculator = new ACPIMLoanCalculator();
                    loan = calculator.calLoan(LoanUtil.totalLoanMoney(money, 0), tzb.getResint1(), LoanUtil.rate(tzb.getNprofit(), 1), LoanUtil.RATE_TYPE_YEAR);
                }else if(tzb.getResint2() == 2){
                    ACMLoanCalculator calculator = new ACMLoanCalculator();
                    loan = calculator.calLoan(LoanUtil.totalLoanMoney(money, 0), tzb.getResint1(), LoanUtil.rate(tzb.getNprofit(), 1), LoanUtil.RATE_TYPE_YEAR);
                }
                for (LoanByMonth loanByMonth : loan.getAllLoans()) {
                    Skb skb = new Skb();
                    skb.setUid(uid);
                    skb.setJuid(tzb.getJuid());
                    skb.setBaid(baid);
                    skb.setYbx(loanByMonth.getRepayment());
                    skb.setRbx(new BigDecimal(0));
                    skb.setYlx(loanByMonth.getInterest());
                    skb.setRlx(new BigDecimal(0));
                    skb.setYbj(loanByMonth.getPayPrincipal());
                    skb.setRbj(new BigDecimal(0));
                    skb.setTnum(tzb.getResint1());
                    skbList.add(skb);
                }
                skbMapper.saveList(skbList);
                return ServerResponse.createBySuccess();
            }
            return ServerResponse.createByError("未投满");
        }
        return ServerResponse.createBySuccess();
    }


    @Autowired
    public void setSkbMapper(SkbMapper skbMapper) {
        super.setBaseMapper(skbMapper);
        this.skbMapper = skbMapper;
    }

    @Autowired
    public void setBorrowapplyMapper(BorrowapplyMapper borrowapplyMapper) {
        this.borrowapplyMapper = borrowapplyMapper;
    }

    @Autowired
    public void setTzbMapper(TzbMapper tzbMapper) {
        this.tzbMapper = tzbMapper;
    }
}