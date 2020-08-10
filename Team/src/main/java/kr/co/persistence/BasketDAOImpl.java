package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BasketDTO;
import kr.co.domain.PageTo;
import kr.co.domain.PurBoardDTO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	
	@Inject
	private SqlSession session;
	
	private final String NS = "b.a.s";

	@Override
	public void insert(BasketDTO bsDto) {

		//bsno 값 불러오기
		Integer bsno = session.selectOne(NS+".getBsno");
		if (bsno != null) {
			bsno += 1;
		} else {
			bsno = 1;
		}
		bsDto.setBsno(bsno);
		
		session.insert(NS+".insert", bsDto);
		
	}

	@Override
	public PageTo<BasketDTO> mylist(PageTo<BasketDTO> to, String id) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());
		List<BasketDTO> list = session.selectList(NS+".mylist", id, rowBounds);
		
		to.setList(list);
		
		Integer amount = session.selectOne(NS+".getAmount");
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}
		
		return to;		
	}

}
