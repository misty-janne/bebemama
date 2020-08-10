package kr.co.persistence;

import java.util.List;

import kr.co.domain.PageTo;
import kr.co.domain.PurBoardDTO;

public interface PurBoardDAO {

	PurBoardDTO insert(PurBoardDTO pDto);

	List<PurBoardDTO> list();

	PageTo<PurBoardDTO> list(PageTo<PurBoardDTO> to);

	PageTo<PurBoardDTO> mylist(PageTo<PurBoardDTO> to, String id);

	void delete(int pno);

	

}
