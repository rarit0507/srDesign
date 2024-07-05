package com.sqlrecord.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sqlrecord.dto.Reply;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Reply> getReplyList() {
		return sqlSession.selectList("reply.getReplyList");
	}

	@Override
	public Reply getReply(int rno) {
		return sqlSession.selectOne("reply.getReply",rno);
	}

	@Override
	public int replyCount() {
		return sqlSession.selectOne("reply.replyCount");
	}

	@Override
	public int insReply(Reply reply) {
		return sqlSession.insert("reply.insReply", reply);
	}

	@Override
	public int changeReply(Reply reply) {
		return sqlSession.update("reply.changeReply", reply);
	}

	@Override
	public int delReply(Reply rno) {
		return sqlSession.delete("reply.delReply", rno);
	}

	@Override
	public List<Map<String, Object>> getReplyStarAll() {
		return sqlSession.selectList("reply.getReplyStarAll");
	}

	@Override
	public float avgStar() {
		return sqlSession.selectOne("reply.avgStar");
	}

}
