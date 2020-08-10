package kr.co.persistence;

import kr.co.domain.BasketDTO;
import kr.co.domain.PageTo;

public interface BasketDAO {

	void insert(BasketDTO bsDto);

	PageTo<BasketDTO> mylist(PageTo<BasketDTO> to, String id);

}
