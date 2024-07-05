package com.sqlrecord.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sqlrecord.service.MemberService;
import com.sqlrecord.service.ProductService;
import com.sqlrecord.service.ReplyService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReplyService replyService;
	
	//관리자페이지 호출
	@GetMapping("/adminPage")
	public String adminpage() {
	    return "admin/adminPage"; 
	}
	
	//★★★상품★★★//
	//상품 수 카운트(리스트 출력)
    @GetMapping("/product")
    public String getProductList(@RequestParam("tag") String tag, Model model) {
        int productCount = productService.getProductCount();
        model.addAttribute("productCount", productCount);
        model.addAttribute("tag", tag);
        return "product";
    }
}
