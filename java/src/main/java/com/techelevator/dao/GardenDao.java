package com.techelevator.dao;

import com.techelevator.model.Plant;

import java.security.Principal;
import java.util.List;

public interface GardenDao {

    List<Plant> getGarden(int userId);

    int addPlantToGarden(Plant updatePlant, int userId);

    void deletePlant(int plantId, int userId);

}
