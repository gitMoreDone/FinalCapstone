package com.techelevator.dao;

import com.techelevator.model.Plant;

import java.security.Principal;
import java.util.List;

public interface GardenDao {

    List<Plant> getGarden(int userId);

    Plant updateGarden(Plant updatePlant);

    void deletePlant(int plantId, int userId);
}
