package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.GardenPlant;
import com.techelevator.model.Plant;
import com.techelevator.model.User;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcGardenDao implements GardenDao {

    @Autowired
    private JdbcPlantDao plantDao;
    private JdbcTemplate jdbcTemplate;

    public JdbcGardenDao(JdbcTemplate jdbcTemplate) {
        if(plantDao==null){
            plantDao=new JdbcPlantDao(jdbcTemplate);
        }
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Plant> getGarden(int userId) {
        List<Plant> plantList = new ArrayList<>();
        String sql="select p.plant_id, plant_name, scientific_name, plant_type, plant_zone, plant_description, " +
                "water_level, light_level, plant_care, plant_image_1, plant_image_2, plant_image_3, sow_type, " +
                "difficulty_level, plant_maturity, g.plant_qty from plants p " +
                "inner join garden g on p.plant_id = g.plant_id " +
                "inner join users u on g.user_id = u.user_id " +
                "where u.user_id = ?";
        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()){
                Plant plant = plantDao.mapRowToPlant(results);
                plantList.add(plant);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new DataAccessResourceFailureException("Unable to connect to server or database", e);
        }
        return plantList;
    }
    @Override
    public int addPlantToGarden(Plant updatePlant, int userId) {
        String sql = "INSERT INTO garden (plant_id, user_id) " +
                "VALUES (?, ?) RETURNING garden_id;";
        try {
            return jdbcTemplate.queryForObject(sql, int.class,updatePlant.getPlantId(),userId );

        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
    }
    @Override
    public void deletePlant(int plantId, int userId) {
        String sql = "DELETE FROM garden WHERE plant_id = ? and user_id = ?;";
        try {
            jdbcTemplate.update(sql, plantId, userId);
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

    }
    @Override
    public List<GardenPlant> getGardenPlants(int userId) {
        List<GardenPlant> gardenPlants= new ArrayList<>();
        String sql="SELECT garden_id,user_id,plant_id,plant_qty,notes "+
                    "FROM garden "+
                    "WHERE user_id = ?";
        try{
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
            while (results.next()){
                GardenPlant gardenPlant = mapRowToGardenPlant(results);
                gardenPlants.add(gardenPlant);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new DataAccessResourceFailureException("Unable to connect to server or database", e);
        }
        return gardenPlants;
    }

    @Override
    public GardenPlant getGardenPlantById(int id) {
        GardenPlant gardenPlant=null;
        String sql= "SELECT garden_id, user_id,plant_id,plant_qty,notes " +
                "FROM garden " +
                "WHERE garden_id=? ";
        try{
            SqlRowSet result = jdbcTemplate.queryForRowSet(sql,id);
            if (result.next()){
                gardenPlant = mapRowToGardenPlant(result);
            }
        } catch (CannotGetJdbcConnectionException e){
            throw new DataAccessResourceFailureException("Unable to connect to server or database", e);
        }

        return gardenPlant;
    }

    @Override
    public GardenPlant updateGardenPlant(GardenPlant gardenPlant) {
        String sql = "UPDATE garden " +
                "SET notes = ?, " +
                "plant_qty = ? " +
                "WHERE garden_id = ? ";
        try{
            System.out.println(gardenPlant.getNotes()+" "+gardenPlant.getQuantity()
                    +" "+gardenPlant.getGardenId());
            jdbcTemplate.update(sql,gardenPlant.getNotes(),gardenPlant.getQuantity(),gardenPlant.getGardenId());
            return getGardenPlantById(gardenPlant.getGardenId());
        } catch (CannotGetJdbcConnectionException e){
            throw new DataAccessResourceFailureException("Unable to connect to server or database", e);
        }
    }
    private GardenPlant mapRowToGardenPlant(SqlRowSet rowSet){
        GardenPlant gardenPlant=new GardenPlant();
        gardenPlant.setGardenId(rowSet.getInt("garden_id"));
        gardenPlant.setUserId(rowSet.getInt("user_id"));
        gardenPlant.setPlant(plantDao.getPlantDetails(rowSet.getInt("plant_id")));
        gardenPlant.setQuantity(rowSet.getInt("plant_qty"));
        gardenPlant.setNotes(rowSet.getString("notes"));
        return gardenPlant;
    }

}
//garden_id SERIAL,
//plant_id int NOT NULL,
//user_id int NOT NULL,
//plant_qty int DEFAULT 1 NOT NULL,
//notes text NULL,