package com.sqlrecord.service;

import java.util.List;
import java.util.Map;

import com.sqlrecord.dto.Reply;

public interface ReplyService {
	public List<Reply> getReplyList();
	public Reply getReply(int rno );
	public int replyCount();
	public int insReply(Reply reply);
	public int changeReply(Reply reply);
	public int delReply(Reply rno);
	public List<Map<String, Object>> getReplyStarAll();
	public float avgStar();
}
