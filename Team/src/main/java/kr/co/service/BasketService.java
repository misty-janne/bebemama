package kr.co.service;

import kr.co.domain.BasketDTO;
import kr.co.domain.PageTo;

public interface BasketService {

	void insert(BasketDTO bsDto);

	PageTo<BasketDTO> mylist(PageTo<BasketDTO> to, String id);



}
