package com.feline.qna;

import java.util.Date;

public class QnaModel {
	private int no;
	private String subject;
	private String id;
	private String password;
	private String content;
	
	private int goods_num;
	private String image_orgname;
	private String image_savname;
	private Date regdate;
	
	private int ref;
	private int re_step;
	private int answer;
	private int status;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public String getImage_orgname() {
		return image_orgname;
	}
	public void setImage_orgname(String image_orgname) {
		this.image_orgname = image_orgname;
	}
	public String getImage_savname() {
		return image_savname;
	}
	public void setImage_savname(String image_savname) {
		this.image_savname = image_savname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
