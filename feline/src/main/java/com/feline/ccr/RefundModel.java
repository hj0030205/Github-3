package com.feline.ccr;

public class RefundModel {

	private int trade_num;
	private int order_num;
	private String trade_reason;
	private int trade_state;
	private String member_id;
	private String order_trade_num;
	
	
	public String getOrder_trade_num() {
		return order_trade_num;
	}
	public void setOrder_trade_num(String order_trade_num) {
		this.order_trade_num = order_trade_num;
	}
	public int getTrade_num() {
		return trade_num;
	}
	public void setTrade_num(int trade_num) {
		this.trade_num = trade_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getTrade_reason() {
		return trade_reason;
	}
	public void setTrade_reason(String trade_reason) {
		this.trade_reason = trade_reason;
	}
	public int getTrade_state() {
		return trade_state;
	}
	public void setTrade_state(int trade_state) {
		this.trade_state = trade_state;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
