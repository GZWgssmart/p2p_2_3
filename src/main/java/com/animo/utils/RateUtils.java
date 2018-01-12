package com.animo.utils;

import com.animo.calculate.ACMLoanCalculator;
import com.animo.calculate.ACPIMLoanCalculator;
import com.animo.calculate.LoanUtil;
import com.animo.enums.WayEnum;

import java.math.BigDecimal;

/**
 * Created by Animo on 2018-01-12.
 */
public class RateUtils {

    /**
     * 计算用户投资利息
     * @param way 计息方式
     * @param tzMoney 投资金额
     * @param month 回款月数
     * @param yearNpro 年利率
     * @return 利息
     */
    public static BigDecimal getSyMoney(String way, BigDecimal tzMoney, Integer month, Float yearNpro) {
        //一次还清和先息后本的用户收益计息方式
        if(way.equals(WayEnum.PAYOFF_ONCE.getCode())|| way.equals(WayEnum.XIAN_XI.getCode())) {
            //投资金额乘以年利率
            return tzMoney.multiply(BigDecimal.valueOf(yearNpro/100))
                    .setScale(2, BigDecimal.ROUND_HALF_UP);
        }
        // 等额本金的用户收益计息
        if(way.equals(WayEnum.EQUAL_BJ.getCode())) {
            return new ACMLoanCalculator().calLoan(tzMoney, month, yearNpro, LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        //等额本息的用户收益计息
        if(way.equals(WayEnum.EQUAL_BX.getCode())) {
            return new ACPIMLoanCalculator().calLoan(tzMoney, month,yearNpro,LoanUtil.RATE_TYPE_YEAR).getTotalInterest();
        }
        return BigDecimal.valueOf(0);
    }

}
