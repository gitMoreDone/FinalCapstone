package com.techelevator.controller;

import com.techelevator.dao.PlantDao;
import com.techelevator.dao.UserDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Plant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
public class PlantController {

    @Autowired
    private PlantDao plantDao;

    @RequestMapping(path = "/plants", method = RequestMethod.GET)
    public List<Plant> retrievePlants() {
        List<Plant> plantList = new ArrayList<>();
        try{
            plantList = plantDao.getPlants();
        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return plantList;
    }
}
