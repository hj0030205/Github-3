package com.feline.member;

import java.util.Date;

public class MemberModel 
{
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_jumin1;
	private String member_email;
	private String member_phone;
	private String member_zipcode;
	private String member_addr1;
	private String member_addr2;
	private Date member_join_date;
	private int member_status;
	
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_jumin1() {
		return member_jumin1;
	}
	public void setMember_jumin1(String member_jumin1) {
		this.member_jumin1 = member_jumin1;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_zipcode() {
		return member_zipcode;
	}
	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}
	public String getMember_addr1() {
		return member_addr1;
	}
	public void setMember_addr1(String member_addr1) {
		this.member_addr1 = member_addr1;
	}
	public String getMember_addr2() {
		return member_addr2;
	}
	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}
	public Date getMember_join_date() {
		return member_join_date;
	}
	public void setMember_join_date(Date member_join_date) {
		this.member_join_date = member_join_date;
	}
	public int getMember_status() {
		return member_status;
	}
	public void setMember_status(int member_status) {
		this.member_status = member_status;
	}

}
