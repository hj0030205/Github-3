package com.feline.ccr;

public class ChangeModel {

	private int change_num;
	private int order_num;
	private String change_reason;
	private int change_state;
	private String member_id;
	
	public int getChange_num() {
		return change_num;
	}
	public void setChange_num(int change_num) {
		this.change_num = change_num;
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getChange_reason() {
		return change_reason;
	}
	public void setChange_reason(String change_reason) {
		this.change_reason = change_reason;
	}
	public int getChange_state() {
		return change_state;
	}
	public void setChange_state(int change_state) {
		this.change_state = change_state;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
}
