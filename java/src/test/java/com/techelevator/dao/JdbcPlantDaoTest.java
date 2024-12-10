package com.techelevator.dao;
import com.techelevator.model.Plant;
import com.techelevator.dao.PlantDao;
import org.springframework.jdbc.core.JdbcTemplate;
import org.junit.jupiter.api.BeforeEach;

public class JdbcPlantDaoTest extends BaseDaoTest{
    protected static final Plant plant_1 = new Plant();
    protected static final Plant plant_2 = new Plant();
    protected static final Plant plant_3 = new Plant();


    private JdbcPlantDao sut;

    @BeforeEach
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new JdbcPlantDao(jdbcTemplate);
    }
}
