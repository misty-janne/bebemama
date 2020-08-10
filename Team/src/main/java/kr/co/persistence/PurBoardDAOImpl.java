package kr.co.persistence;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
import kr.co.domain.PageTo;
import kr.co.domain.PurBoardDTO;

@Repository
public class PurBoardDAOImpl implements PurBoardDAO {

	@Inject
	private SqlSession session;
	
	private final String NS = "p.u.r";
	
	@Override
	public PurBoardDTO insert(PurBoardDTO pDto) {
		//pno 값 불러오기
		Integer pno = session.selectOne(NS+".getPno");
		if (pno != null) {
//				└null이 아닌경우가 많이 때문에 속도개선을 위해서
			pno += 1;
		} else {
			pno = 1;
		}		
		pDto.setPno(pno);
		
		//송장번호 만들기
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String code = sdf.format(d);
		
		pDto.setDeliveryCode(98745+code);
		
		session.insert(NS+".insert", pDto);

		return pDto;
		
	}

	@Override
	public List<PurBoardDTO> list() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".list");
	}

	@Override
	public PageTo<PurBoardDTO> list(PageTo<PurBoardDTO> to) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());
		List<PurBoardDTO> list = session.selectList(NS+".list", null, rowBounds);
		
		to.setList(list);
		
		Integer amount = session.selectOne(NS+".getAmount");
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}
		
		return to;		
	}

	@Override
	public PageTo<PurBoardDTO> mylist(PageTo<PurBoardDTO> to, String id) {
		RowBounds rowBounds = new RowBounds(to.getStartNum()-1, to.getPerPage());
		List<PurBoardDTO> list = session.selectList(NS+".mylist", id, rowBounds);
		
		to.setList(list);
		
		Integer amount = session.selectOne(NS+".getAmount");
		if (amount != null) {
			to.setAmount(amount);
		} else {
			to.setAmount(0);
		}
		
		return to;		
	}

	@Override
	public void delete(int pno) {
		session.delete(NS+".delete", pno);
		
	}

	

}
