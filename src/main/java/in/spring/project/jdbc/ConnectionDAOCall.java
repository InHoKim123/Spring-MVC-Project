package in.spring.project.jdbc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class ConnectionDAOCall {


private static final Logger logger = LoggerFactory.getLogger(ConnectionDAOCall.class);

public static void main(String[] args) {

	ApplicationContext applicationContext = new GenericXmlApplicationContext(
			"file:src/main/webapp/WEB-INF/spring/root-context.xml");

	logger.info("정보", applicationContext);

	ConnectionDAO connectionDAO = (ConnectionDAO) applicationContext.getBean("connectionDAO");

	logger.info("" + connectionDAO.toString());
	connectionDAO.connect();
}

}
