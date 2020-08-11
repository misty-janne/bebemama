package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.BasketDTO;
import kr.co.domain.PageTo;
import kr.co.persistence.BasketDAO;

@Service
public class BasketServiceImpl implements BasketService {

	@Inject
	private BasketDAO bsDao;

	@Override
	public void insert(BasketDTO bsDto) {
		bsDao.insert(bsDto);
	}

	@Override
	public PageTo<BasketDTO> mylist(PageTo<BasketDTO> to, String id) {
		return bsDao.mylist(to, id);
	}

	@Override
	public List<BasketDTO> priceList(String id) {
		return bsDao.priceList(id);
	}

	@Override
	public void delete(int bsno) {
		bsDao.delete(bsno);
	}

	@Override
	public BasketDTO read(int bsno) {
		return bsDao.read(bsno);
	}


}
