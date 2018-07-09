package com.feline.event;

import java.util.Date;

import com.feline.goods.GoodsModel;

public class EventModel {
	
	private int event_num;
	private String goods_num;
	private Date reg_date;
	private Date start_date;
	private Date end_date;
	private int dc_rate;
	private int status;
	private String event_name;
	private GoodsModel goodsModel;
	
	public int getEvent_num() {
		return event_num;
	}
	public void setEvent_num(int event_num) {
		this.event_num = event_num;
	}
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getDc_rate() {
		return dc_rate;
	}
	public void setDc_rate(int dc_rate) {
		this.dc_rate = dc_rate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public GoodsModel getGoodsModel() {
		return goodsModel;
	}
	public void setGoodsModel(GoodsModel goodsModel) {
		this.goodsModel = goodsModel;
	}
	
}
