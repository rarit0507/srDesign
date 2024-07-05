package com.sqlrecord.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sqlrecord.dao.ReplyDAO;
import com.sqlrecord.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<Reply> getReplyList() {
		return replyDAO.getReplyList();
	}

	@Override
	public Reply getReply(int rno) {
		return replyDAO.getReply(rno);
	}

	@Override
	public int replyCount() {
		return replyDAO.replyCount();
	}

	@Override
	public int insReply(Reply reply) {
		return replyDAO.insReply(reply);
		
	}

	@Override
	public int changeReply(Reply reply) {
		return replyDAO.changeReply(reply);
		
	}

	@Override
	public int delReply(Reply rno) {
		return replyDAO.delReply(rno);
	}

	@Override
	public List<Map<String, Object>> getReplyStarAll() {
		return replyDAO.getReplyStarAll();
	}

	@Override
	public float avgStar() {
		return replyDAO.avgStar();
	}

	

}
