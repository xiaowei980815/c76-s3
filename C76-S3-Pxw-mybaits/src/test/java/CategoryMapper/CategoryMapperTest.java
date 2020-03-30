package CategoryMapper;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.TransactionIsolationLevel;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;

import com.yc.springmvc.bean.Category;

public class CategoryMapperTest {
	private SqlSession session;

	@Before
	public void before() throws IOException {
		String resource = "mybatis.xml";
		// 读入配置文件
		InputStream inputStream = Resources.getResourceAsStream(resource);
		// 创建绘画工厂
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		session = sqlSessionFactory.openSession();

	}

	@After
	public void after() {
		session.close();
	}
	
	
	@Test
	public void testSelectAll() throws IOException {
		List<com.yc.mybatis.bean.Category> list =session.selectList("com.yc.mybatis.dao.CategoryMapper.selectAll");
		for(com.yc.mybatis.bean.Category c:list){
			System.out.println(c);
		}
		
		session.close();
	}
}
