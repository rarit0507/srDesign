package com.sqlrecord.service;

import java.util.List;

import com.sqlrecord.dto.Member;


public interface MemberService {
	public List<Member> getMemberList();
	public Member getMember(String id);
	public int memberCount();
	public void insMember(Member member);
	public void changeInfo(Member member);
	public void changePoint(Member member);
	public void delMember(String id);
}
