package kr.co.persistence;

import java.util.List;

import kr.co.domain.BasketDTO;
import kr.co.domain.PageTo;

public interface BasketDAO {

	void insert(BasketDTO bsDto);

	PageTo<BasketDTO> mylist(PageTo<BasketDTO> to, String id);

	List<BasketDTO> priceList(String id);

	void delete(int bsno);

	BasketDTO read(int bsno);

}
