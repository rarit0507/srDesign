package com.sqlrecord.ctrl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sqlrecord.dto.Reply;
import com.sqlrecord.service.MemberService;
import com.sqlrecord.service.ReplyService;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	
	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private HttpSession session;
	
//	@RequestMapping("list.do")
//	public String getReplyList(Model model) {
//		
//		return "reply/list";
//	}
	
	@RequestMapping("detail.do")
	public String getReply(@RequestParam("rno") int rno, Model model) {
		Reply reply = replyService.getReply(rno);
        model.addAttribute("reply", reply);
		return "reply/detail";
	}
	
	@GetMapping("count.do")
    public String getReplyCount(Model model) {
        int replyCount = replyService.replyCount();
        model.addAttribute("replyCount", replyCount);
        return "reply/list"; 
    }
	
	@RequestMapping("insReply.do")
    public String insReply(@ModelAttribute Reply reply, Model model) {
    	String id = (String) session.getAttribute("sid");
    	reply.setId(id);
    	replyService.insReply(reply);
    	//model.addAttribute("rslt", replyService.insReply(reply));
    	return "redirect:getReplyStarAll.do";
    }
    //Reply 클래스의 필드명과 폼의 입력 필드명(name 속성)이 일치해야함
    
    @PostMapping("delReply.do")
	public String delReply(@ModelAttribute Reply rno) {
    	//model.addAttribute("rslt", replyService.delReply(rno));
    	replyService.delReply(rno);
    	return "redirect:getReplyStarAll.do";
	}
    
    @PostMapping("upReply.do")
    public String upReply(@ModelAttribute Reply reply) {
    	String id = (String) session.getAttribute("sid");
    	reply.setId(id);
    	replyService.changeReply(reply);
    	log.info("댓글 수정 : {}", reply);
    	return "redirect:getReplyStarAll.do";
    }
    
    // 한페이지라서 호출을 별도로 못하니까 여기다 다 때려넣어버림 댓글 등록 빼고
    @RequestMapping("getReplyStarAll.do")
    public String getReplyStarAll(Model model) {
    	//리뷰 총 갯수 가져오기
    	int replyCount = replyService.replyCount();
    	model.addAttribute("replyCount", replyCount);

    	//별점 점수대별 갯수 퍼센트 가져오기
    	List<Map<String, Object>> starAll = replyService.getReplyStarAll();
        model.addAttribute("starAll", starAll);
        
        
        //총 리뷰 평점 가져오기
        float avgStar = replyService.avgStar();
        model.addAttribute("avgStar", avgStar);
        
        //댓글 목록 가져오기
        model.addAttribute("list", replyService.getReplyList());
        
        return "reply/list"; // 별점 분포를 표시할 JSP 페이지
    }
}
