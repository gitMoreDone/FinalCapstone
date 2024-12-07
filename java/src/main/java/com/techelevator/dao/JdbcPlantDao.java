package com.techelevator.dao;


import com.techelevator.model.Plant;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPlantDao implements PlantDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcPlantDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Plant> getPlants() {
        List<Plant> plantList = new ArrayList<>();
        String sql = "SELECT plant_id, plant_name, scientific_name, plant_type, plant_zone, plant_description, " +
                "water_level, light_level, plant_care, plant_image_1, plant_image_2, plant_image_3, sow_type, " +
                "difficulty_level, plant_maturity FROM plants";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Plant plant = mapRowToPlant(results);
                plantList.add(plant);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DataAccessResourceFailureException("Unable to connect to server or database", e);
        }
        return plantList;
    }

    @Override
    public Plant getPlantDetails(int plantId) {
        Plant plant = null;
        String sql = "SELECT plant_id, plant_name, scientific_name, plant_type, plant_zone, plant_description, " +
                "water_level, light_level, plant_care, plant_image_1, plant_image_2, plant_image_3, sow_type, " +
                "difficulty_level, plant_maturity FROM plants " +
                "WHERE plant_id = ?";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, plantId);
            if (results.next()) {
                plant = mapRowToPlant(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DataAccessResourceFailureException("Unable to connect to server or database", e);
        }
        return plant;
    }

    Plant mapRowToPlant(SqlRowSet results) {
        Plant plant = new Plant();
        plant.setPlantId(results.getInt("plant_id"));
        plant.setPlantName(results.getString("plant_name"));
        plant.setScientificName(results.getString("scientific_name"));
        plant.setPlantType(results.getString("plant_type"));
        plant.setPlantZone(results.getString("plant_zone"));
        plant.setPlantDescription(results.getString("plant_description"));
        plant.setWaterLevel(results.getString("water_level"));
        plant.setLightLevel(results.getString("light_level"));
        plant.setPlantCareSteps(results.getString("plant_care"));
        plant.setPantMaturity(results.getString("plant_maturity"));
        plant.setSowType(results.getString("sow_type"));
        plant.setDifficultyLevel(results.getInt("difficulty_level"));
        plant.setPlantImage1(results.getString("plant_image_1"));
        plant.setPlantImage2(results.getString("plant_image_2"));
        plant.setPlantImage3(results.getString("plant_image_3"));
        return plant;
    }
}
