

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.foot.board.vo.CommentVO;
import kr.co.foot.mymap.MymapVO;

@RunWith(SpringJUnit4ClassRunner.class) // JUnit으로 실시간 테스트 할거야
// @ContextConfiguration(locations={"classpath:config/spring/spring-mvc.xml"})//xml
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/config/applicationContext.xml" }) // xml
public class DBTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;// spring-mvc.xml Bean에서 설정

	/*@Test*/
	public void 로그인한당() {
		CommentVO vo = new CommentVO();
	
		System.out.println(vo);
		List<CommentVO> list = sqlSessionTemplate.selectList("kr.co.foot.board.CommentDAO.selectComment");
		System.out.println(list);
	}
	
	@Test
	public void 리스트부른당() {
		String pageSize = "5";
		HashMap<String, Object> search = new HashMap<String, Object>();
		search.put("start", 0);
		search.put("pageSize", 5);
		search.put("searchtext", "");
		
		List<MymapVO> mymapList = sqlSessionTemplate.selectList("kr.co.foot.mymap.MymapDAO.selectMymapList2", search);
		System.out.println(mymapList);
	}
	
}
