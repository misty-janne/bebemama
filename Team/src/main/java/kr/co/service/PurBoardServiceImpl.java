package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.PageTo;
import kr.co.domain.PurBoardDTO;
import kr.co.persistence.PurBoardDAO;

@Service
public class PurBoardServiceImpl implements PurBoardService {

	@Inject
	private PurBoardDAO pDao;

	@Override
	public PurBoardDTO insert(PurBoardDTO pDto) {
		return pDao.insert(pDto);
		
	}

	@Override
	public List<PurBoardDTO> list() {
		return pDao.list();
	}

	@Override
	public PageTo<PurBoardDTO> list(PageTo<PurBoardDTO> to) {
		return pDao.list(to);
	}

	@Override
	public PageTo<PurBoardDTO> mylist(PageTo<PurBoardDTO> to, String id) {
		return pDao.mylist(to, id);
	}

	@Override
	public void delete(int pno) {
		pDao.delete(pno);
		
	}
	
}
