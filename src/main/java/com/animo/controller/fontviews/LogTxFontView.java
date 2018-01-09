package com.animo.controller.fontviews;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by qm on 2018/1/3.
 *
 * @author qm
 * @date 2018-01-03 15:05
 */
@Controller
@RequestMapping("logTx")
public class LogTxFontView {

    @RequestMapping("/withdraw")
    public String mybank() {
        return "user/recharge";
    }
}
