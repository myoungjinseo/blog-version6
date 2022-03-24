package net.blog.dto;

import java.sql.Date;

public class text {
	String title;
	String maintext;
	Date date;
	String userid;

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMaintext() {
		return maintext;
	}
	public void setMaintext(String maintext) {
		this.maintext = maintext;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

}
