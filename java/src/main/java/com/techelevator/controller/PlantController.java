package com.techelevator.controller;

import com.techelevator.dao.PlantDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Plant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@CrossOrigin
public class PlantController {

    @Autowired
    private PlantDao plantDao;

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/plants", method = RequestMethod.GET)
    public List<Plant> retrievePlants() {
        List<Plant> plantList;
        try {
            plantList = plantDao.getPlants();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return plantList;
    }

    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(path = "/plants/{plantId}", method = RequestMethod.GET)
    public Plant retrievePlant(@PathVariable int plantId) {
        try {
            return plantDao.getPlantDetails(plantId);
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
    }
}
