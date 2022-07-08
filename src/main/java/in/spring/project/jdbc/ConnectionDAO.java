//데이터베이스 연결 확인

package in.spring.project.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ConnectionDAO {
/** * Slf4j Logger */
private static final Logger logger = LoggerFactory.getLogger(ConnectionDAO.class);

	
	@Autowired
	DataSource dataSource;
	
	public void connect() {
		Connection connection = null;
		try {
			connection = dataSource.getConnection();
			logger.info(connection + " 데이터 베이스와 연결완료");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
