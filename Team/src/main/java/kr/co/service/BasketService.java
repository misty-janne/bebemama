package kr.co.service;

import java.util.List;

import kr.co.domain.BasketDTO;
import kr.co.domain.PageTo;

public interface BasketService {

	void insert(BasketDTO bsDto);

	PageTo<BasketDTO> mylist(PageTo<BasketDTO> to, String id);

	List<BasketDTO> priceList(String id);

	void delete(int bsno);

	BasketDTO read(int bsno);



}
