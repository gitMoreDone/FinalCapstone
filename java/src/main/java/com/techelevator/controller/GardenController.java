package com.techelevator.controller;


import com.techelevator.dao.GardenDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.GardenPlant;
import com.techelevator.model.Plant;
import com.techelevator.model.User;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class GardenController {
    @Autowired GardenDao gardenDao;
    @Autowired UserDao userDao;

//    @ResponseStatus(HttpStatus.OK)
//    @RequestMapping(path = "/garden", method = RequestMethod.GET)
//    public List<Plant> retrieveFromGardenPlants(Principal principal) {
//        List<Plant> plantList;
//        String userName= principal.getName();
//        User accountUser=userDao.getUserByUsername(userName);
//        int userId=accountUser.getId();
//        try {
//            plantList = gardenDao.getGarden(userId);
//        } catch (DaoException e) {
//            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
//        }
//        return plantList;
//    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/garden", method = RequestMethod.POST)
    public int addPlantToGarden(@Valid @RequestBody Plant plant, Principal principal) {
        String userName= principal.getName();
        User accountUser=userDao.getUserByUsername(userName);
        int userId=accountUser.getId();
        return gardenDao.addPlantToGarden(plant, userId);
    }
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path="/garden/{plantId}", method = RequestMethod.DELETE)
    public void deletePlant(@Valid @PathVariable int plantId, Principal principal) {
        String userName= principal.getName();
        User accountUser=userDao.getUserByUsername(userName);
        int userId=accountUser.getId();
        gardenDao.deletePlant(plantId, userId);
    }


    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/garden", method = RequestMethod.GET)
    public List<GardenPlant> getPlantInGarden(Principal principal){
        List<GardenPlant> plantList;
        String userName= principal.getName();
        User accountUser=userDao.getUserByUsername(userName);
        int userId=accountUser.getId();
        try {
            plantList = gardenDao.getGardenPlants(userId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return plantList;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/garden", method = RequestMethod.PUT)
    public GardenPlant updatePlantInGarden(@RequestBody GardenPlant gardenPlant){
        GardenPlant updatedGardenPlant;
        try{
            updatedGardenPlant = gardenDao.updateGardenPlant(gardenPlant);
        }catch(DaoException e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
        return updatedGardenPlant;
    }

}
