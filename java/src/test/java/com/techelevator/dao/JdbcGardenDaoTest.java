package com.techelevator.dao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.junit.jupiter.api.BeforeEach;
public class JdbcGardenDaoTest extends BaseDaoTest{

    private JdbcGardenDao sut;

    @BeforeEach
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new JdbcGardenDao(jdbcTemplate);
    }
}
