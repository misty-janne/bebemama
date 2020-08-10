package com.naver.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.AttachDTO;
import kr.co.domain.BoardVO;
import kr.co.domain.CategoryDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.MemberDTO;
import kr.co.domain.PageTo;
import kr.co.domain.PurBoardDTO;
import kr.co.service.BoardService;
import kr.co.service.MemberService;
import kr.co.service.PurBoardService;

@Controller
@RequestMapping("order")
public class OrderController {
	

	@Inject
	private BoardService bService;
	@Inject
	private PurBoardService pService;
	@Inject
	private MemberService memberService;


	
	
	
	@RequestMapping(value = "/read/{bno}", method = RequestMethod.GET)
	public String read(@PathVariable("bno") int bno, Model model) {
		BoardVO vo = bService.read(bno);
		
		//상품명 불러오기
		int gno = vo.getGno();
		GoodsDTO getGoodsData = new GoodsDTO();
		getGoodsData = bService.getGoodsData(gno);		
		
		//카테명 불러오기
		int cno = vo.getCno();
		CategoryDTO getCateData = new CategoryDTO();
		getCateData = bService.getCateData(cno);
		
		//첨부이미지 불러오기
		AttachDTO getAttData = new AttachDTO();
		getAttData = bService.getAttData(bno);
		
		model.addAttribute("vo", vo);
		model.addAttribute("getGoodsData", getGoodsData);
		model.addAttribute("getCateData", getCateData);
		model.addAttribute("getAttData", getAttData);
		return "board/read";
	}
	

	@RequestMapping(value = "/delete/{pno}")
	public String delete(@PathVariable("pno") int pno) {
		pService.delete(pno);
		return "redirect:/order/list";
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
		PageTo<PurBoardDTO> to = new PageTo<PurBoardDTO>(page);
//		List<BoardVO> list = bService.list();		
		to = pService.mylist(to, id);		
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());

		//페이지 path를 위한 id 받기
		MemberDTO getMemData = memberService.read(id);
		model.addAttribute("getMemData", getMemData);		
		
		return "order/mylist";
		
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, String curPage) {
		
		int page = -1;
		if (curPage != null) {
//			└페이지방문시 null인 경우가 많으므로 (속도개선)
			page = Integer.parseInt(curPage);
		} else {
			page = 1;
		}
		PageTo<PurBoardDTO> to = new PageTo<PurBoardDTO>(page);
//		List<BoardVO> list = bService.list();		
		to = pService.list(to);		
		model.addAttribute("to", to);
		model.addAttribute("list", to.getList());
		
	}

	@RequestMapping(value = "/complete", method = RequestMethod.POST)
	public void complete(PurBoardDTO pDto, Model model) {
		//order에서 확인한 내용대로 purchase_board에 입력 수행 
		PurBoardDTO npdto = pService.insert(pDto);

	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void insert(PurBoardDTO pDto) {	
		pService.insert(pDto);
//		return "redirect:/board/list";
//		return "redirect:/order/read/"+purDto.getPno();
	}
	

	@RequestMapping(value = "/insert/{bno}", method = RequestMethod.GET)
	public String insert(@PathVariable("bno") int bno, Model model) {

		//buy it now 버튼 클릭시 이동
		//purchase_board에 입력할 내용 확인
		PurBoardDTO pdto = new PurBoardDTO();
		BoardVO vo = bService.read(bno);
		int gno = vo.getGno();
		GoodsDTO getGoodsData = new GoodsDTO();
		int cno = vo.getCno();
		getGoodsData = bService.getGoodsData(gno);		
		CategoryDTO getCateData = new CategoryDTO();
		getCateData = bService.getCateData(cno);
		model.addAttribute("vo", vo);
		model.addAttribute("getGoodsData", getGoodsData);
		model.addAttribute("getCateData", getCateData);
		model.addAttribute("pdto", pdto);
		return "order/insert";

	}
	/* 기존 baket
	@RequestMapping(value = "/basket", method = RequestMethod.POST)
	public void basket(PurBoardDTO pDto) {	
		pService.insert(pDto);
//		return "redirect:/board/list";
//		return "redirect:/order/read/"+purDto.getPno();
	}
	
	
	@RequestMapping(value = "/basket/{bno}", method = RequestMethod.GET)
	public String basket(@PathVariable("bno") int bno, Model model) {
		
		//add to cart 클릭시 이동
		//basket에 입력할 내용 확인 --basket 컨트롤러 새로 생성(뷰 basket 폴더 구분)
		PurBoardDTO pdto = new PurBoardDTO();
		BoardVO vo = bService.read(bno);
		int gno = vo.getGno();
		GoodsDTO getGoodsData = new GoodsDTO();
		int cno = vo.getCno();
		getGoodsData = bService.getGoodsData(gno);		
		CategoryDTO getCateData = new CategoryDTO();
		getCateData = bService.getCateData(cno);
		model.addAttribute("vo", vo);
		model.addAttribute("getGoodsData", getGoodsData);
		model.addAttribute("getCateData", getCateData);
		model.addAttribute("pdto", pdto);
		return "order/basket";
		
	}*/
	/* 기존 order
	@RequestMapping(value = "/order/{bno}", method = RequestMethod.GET)
	public String order(@PathVariable("bno") int bno, Model model) {
		//구매버튼 클릭시 이동
		//purchase_board에 입력할 내용 확인
		PurBoardDTO pdto = new PurBoardDTO();
		BoardVO vo = bService.read(bno);
		int gno = vo.getGno();
		GoodsDTO getGoodsData = new GoodsDTO();
		int cno = vo.getCno();
		getGoodsData = bService.getGoodsData(gno);		
		CategoryDTO getCateData = new CategoryDTO();
		getCateData = bService.getCateData(cno);
		model.addAttribute("vo", vo);
		model.addAttribute("getGoodsData", getGoodsData);
		model.addAttribute("getCateData", getCateData);
		model.addAttribute("pdto", pdto);
		return "board/order";
	}*/
}
