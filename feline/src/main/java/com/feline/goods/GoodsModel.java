package com.feline.goods;

import java.util.Date;

public class GoodsModel {

	private int goods_num;
	private String goods_name;
	private int goods_price;
	private int goods_amount;
	private String goods_content;
	private String goods_category;
	private String goods_size;
	private String goods_image_orgname;
	private String goods_image_savname;
	private int goods_hit;
	private Date goods_date;
	
	public int getGoods_num() {
		return goods_num;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public int getGoods_price() {
		return goods_price;
	}
	public int getGoods_amount() {
		return goods_amount;
	}
	public String getGoods_content() {
		return goods_content;
	}
	public void setGoods_num(int goods_num) {
		this.goods_num = goods_num;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}
	public void setGoods_amount(int goods_amount) {
		this.goods_amount = goods_amount;
	}
	public void setGoods_content(String goods_content) {
		this.goods_content = goods_content;
	}
	public String getGoods_category() {
		return goods_category;
	}
	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}
	public String getGoods_size() {
		return goods_size;
	}
	public void setGoods_size(String goods_size) {
		this.goods_size = goods_size;
	}
	public String getGoods_image_orgname() {
		return goods_image_orgname;
	}
	public void setGoods_image_orgname(String goods_image_orgname) {
		this.goods_image_orgname = goods_image_orgname;
	}
	public String getGoods_image_savname() {
		return goods_image_savname;
	}
	public void setGoods_image_savname(String goods_image_savname) {
		this.goods_image_savname = goods_image_savname;
	}
	public int getGoods_hit() {
		return goods_hit;
	}
	public void setGoods_hit(int goods_hit) {
		this.goods_hit = goods_hit;
	}
	public Date getGoods_date() {
		return goods_date;
	}
	public void setGoods_date(Date goods_date) {
		this.goods_date = goods_date;
	}
	
	
}
