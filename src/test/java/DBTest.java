

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.foot.board.vo.CommentVO;

@RunWith(SpringJUnit4ClassRunner.class) // JUnit���� �ǽð� �׽�Ʈ �Ұž�
// @ContextConfiguration(locations={"classpath:config/spring/spring-mvc.xml"})//xml
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/config/applicationContext.xml" }) // xml
public class DBTest {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;// spring-mvc.xml Bean���� ����

	@Test
	public void �α����Ѵ�() {
		CommentVO vo = new CommentVO();
	
		System.out.println(vo);
		List<CommentVO> list = sqlSessionTemplate.selectList("kr.co.foot.board.CommentDAO.selectComment");
		System.out.println(list);
	}
	
}
