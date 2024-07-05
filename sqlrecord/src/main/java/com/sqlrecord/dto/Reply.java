package com.sqlrecord.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private String id;
	private int rno; //댓글 번호
	private int pno; //상품 번호
	private int nno; //대댓글 번호
	private int depth; //댓글의 깊이 부모 0 자식 1
	private String content;
	private String resdate;
	private float star;
	private String img1;
	private String img2;
	private String img3;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public float getStar() {
		return star;
	}
	public void setStar(float star) {
		this.star = star;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getImg3() {
		return img3;
	}
	public void setImg3(String img3) {
		this.img3 = img3;
	}
	@Override
	public String toString() {
		return "Reply [id=" + id + ", rno=" + rno + ", pno=" + pno + ", nno=" + nno + ", depth=" + depth + ", content="
				+ content + ", resdate=" + resdate + ", star=" + star + ", img1=" + img1 + ", img2=" + img2 + ", img3="
				+ img3 + "]";
	}
	
	
}
