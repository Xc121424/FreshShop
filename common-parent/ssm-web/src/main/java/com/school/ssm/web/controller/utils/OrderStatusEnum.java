package com.school.ssm.web.controller.utils;


public enum OrderStatusEnum {

	WAIT_PAY("10", "待付款"),			// 代付款
	PAID("20", "已付款"),				// 已付款
	CANCELED("30", "已取消");		// 已取消

	
	public final String key;
	public final String value;
	
	OrderStatusEnum(String key, String value) {
		this.key = key;
		this.value = value;
	}

	public static String getName(String key) {
		for (OrderStatusEnum status : OrderStatusEnum.values()) {
			if (status.getKey().equals(key)) {
				return status.value;
			}
		}
		return null;
	}
	 
	public String getKey() {
		return key;
	}

	public String getValue() {
		return value;
	}
}
