package com.huangshihe.mahoutdemo.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseMovie<M extends BaseMovie<M>> extends Model<M> implements IBean {

	public void setId(java.lang.Integer id) {
		set("id", id);
	}

	public java.lang.Integer getId() {
		return get("id");
	}

	public void setTitle(java.lang.String title) {
		set("title", title);
	}

	public java.lang.String getTitle() {
		return get("title");
	}

	public void setGenres(java.lang.String genres) {
		set("genres", genres);
	}

	public java.lang.String getGenres() {
		return get("genres");
	}

	public void setUrl(java.lang.String url) {
		set("url", url);
	}

	public java.lang.String getUrl() {
		return get("url");
	}

	public void setYear(java.lang.Integer year) {
		set("year", year);
	}

	public java.lang.Integer getYear() {
		return get("year");
	}

}
