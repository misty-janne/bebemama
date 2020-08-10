package kr.co.service;

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


}
