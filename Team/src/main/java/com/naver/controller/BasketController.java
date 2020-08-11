package com.naver.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.domain.AttachDTO;
import kr.co.domain.BasketDTO;
import kr.co.domain.BoardVO;
import kr.co.domain.CategoryDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.domain.PageTo;
import kr.co.domain.PurBoardDTO;
import kr.co.service.BasketService;
import kr.co.service.BoardService;
import kr.co.service.MemberService;
import kr.co.service.PurBoardService;

@Controller
@RequestMapping("basket")
public class BasketController {
	

	@Inject
	private PurBoardService pService;
	@Inject
	private MemberService memberService;
	@Inject
	private BasketService bsService;

	

	
/*

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public void complete(PurBoardDTO pDto, Model model) {
		//order에서 확인한 내용대로 purchase_board에 입력 수행 
		PurBoardDTO npdto = pService.insert(pDto);

	}*/
	

	@RequestMapping(value = "/delete/{bsno}")
	public String delete(@PathVariable("bsno") int bsno) {
		BasketDTO bsDto = bsService.read(bsno);
		String id = bsDto.getId();
		
		bsService.delete(bsno);


		return "redirect:/basket/mylist/"+id;
	}
	
	@RequestMapping(value = "/mylist/{id}", method = RequestMethod.GET)
	public String mylist(@PathVariable("id") String id, Model model, String curPage) {
		
		
		int page = -1;
		if (curPage != null) {
//			└페이지방문시 null인 경우가 많으므로 (속도개선)
			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		PageTo<BasketDTO> to = new PageTo<BasketDTO>(page);
//		List<BoardVO> list = bService.list();		
		to = bsService.mylist(to, id);		
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());
		
		//페이지 path를 위한 id 받기
		MemberDTO getMemData = memberService.read(id);
		model.addAttribute("getMemData", getMemData);		

		//장바구니 상품 금액 합계 계산
		int totalPrice = 0;

		for(int i=0; i<to.getList().size(); i++) {
			totalPrice += to.getList().get(i).getPrice();
		}
		model.addAttribute("totalPrice", totalPrice);

		return "basket/mylist";
		
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(BasketDTO bsDto) {	
		//board read 화면에서 form action 실행
		bsService.insert(bsDto);
		return "redirect:/basket/mylist/"+bsDto.getId();
	}

}
