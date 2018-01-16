package com.animo.common;

import com.animo.utils.HttpUtils;

/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;

	/**
	 * 验证码通知短信
	 */
	public static String execute(String to)
	{
		String code = PhoneCode.randomStr();

		String smsContent = "【PM科技】您的验证码为{"+code+"}，如非本人操作，请忽略此短信。";
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + smsContent
				+ HttpUtils.createCommonParam();
		// 提交请求
		String result = HttpUtils.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
		return code;
	}
}
