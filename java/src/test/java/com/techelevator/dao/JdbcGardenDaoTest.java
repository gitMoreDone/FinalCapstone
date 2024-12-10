package com.techelevator.dao;

import com.techelevator.model.GardenPlant;
import com.techelevator.model.Plant;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.Assert;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class JdbcGardenDaoTest extends BaseDaoTest{
    protected static final GardenPlant gardenPlant_1 = new GardenPlant();
    protected static final GardenPlant gardenPlant_2 = new GardenPlant();
    protected static final GardenPlant GardenPlant_3 = new GardenPlant();


    private JdbcGardenDao sut;
    private GardenDao gardenDao;
    private PlantDao plantDao;

    @BeforeEach
    public void setup() {
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        sut = new JdbcGardenDao(jdbcTemplate);
        plantDao=new JdbcPlantDao(jdbcTemplate);
    }
    @Test
    public void deletePlantFromGarden()
    {
        sut.deletePlant(3,1);
        GardenPlant nullPlant  =  sut.getGardenPlantById(3);
        assertNull(nullPlant);
    }
    @Test
    public void addPlantToGarden()
    {
        Plant newPlantObject = plantDao.getPlantDetails(4);



        sut.addPlantToGarden(newPlantObject,2);

        List<GardenPlant> retrievedPlant = sut.getGardenPlants(2);
        assertEquals(1,retrievedPlant.size());

    }
        }


