package com.sqlrecord.ctrl;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sqlrecord.dto.Member;
import com.sqlrecord.service.MemberService;


@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private HttpSession session;
	
	
	@GetMapping("term.do")
	public String agree(Model model, RedirectAttributes rttr) {
		rttr.addAttribute("msg", "회원 약관에 동의하시기 바랍니다.");
		return "member/term";
	}

	@GetMapping("join.do")
	public String join(Model model, @ModelAttribute("member") Member member) {
		model.addAttribute("member", member);
		return "member/join";
	}
	
	@GetMapping("idCheck.do")
	public void idCheck(@RequestParam("id") String id, HttpServletResponse response, Model model) throws IllegalArgumentException, IOException {
		
		Member cus = memberService.getMember(id);
		
		//boolean result = (cus == null); cus가 null이 아니면 false
		
		boolean result;
		if(cus!=null) {
			result = false;
		} else {
			result = true;
		}
		JSONObject json = new JSONObject();
		json.put("data", result);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}
	
	@PostMapping("joinPro.do")
	public String joinPro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		Member member = new Member();
		member.setId(request.getParameter("id"));
		member.setPw(pwdEncoder.encode(request.getParameter("pw")));	//비밀번호 암호화
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setTel(request.getParameter("tel"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		member.setPostcode(request.getParameter("postcode"));
		member.setBirth(request.getParameter("birth"));
		member.setTag1(request.getParameter("tag1"));
		member.setTag2(request.getParameter("tag2"));
		member.setTag3(request.getParameter("tag3"));
		memberService.insMember(member);
		model.addAttribute("msg", "회원가입을 축하합니다.");
		return "redirect:/";
	}
	
	@GetMapping("login.do")
	public String login(Model model) {
		return "member/login";
	}
	
	@PostMapping("loginPro.do")
	public String loginPro(@RequestParam("lid") String id, @RequestParam("lpw") String pw, Model model, RedirectAttributes rttr) {
		session.invalidate();
		Member cus = memberService.getMember(id);
		
		if (cus == null) {
			rttr.addFlashAttribute("msg", "아이디가 존재하지 않습니다.");
	        return "redirect:login.do";
	    }
		
		boolean loginSuccess = pwdEncoder.matches(pw, cus.getPw());
		if(loginSuccess) {
			session.setAttribute("cus", cus);
			session.setAttribute("sid", id);
			session.setAttribute("sname", cus.getName());
			//model.addAttribute("msg", "로그인 성공");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
			return "redirect:login.do";	
		}
	}
}
