package com.techelevator.model;

public class Plant {
    private int plantId;
    private String plantName;
    private String scientificName;
    private String plantType;
    private String plantZone;
    private String plantDescription;
    private String waterLevel;
    private String lightLevel;
    private String plantCareSteps;
    private String plantImage1;
    private String plantImage2;
    private String plantImage3;

    public Plant(int plantId, String plantName, String scientificName, String plantType, String plantImage1,
                 String plantImage2, String plantImage3, String plantZone, String plantDescription, String waterLevel,
                 String lightLevel, String plantCareSteps) {
        this.plantId = plantId;
        this.plantName = plantName;
        this.scientificName = scientificName;
        this.plantType = plantType;
        this.plantImage1 = plantImage1;
        this.plantImage2 = plantImage2;
        this.plantImage3 = plantImage3;
        this.plantZone = plantZone;
        this.plantDescription = plantDescription;
        this.waterLevel = waterLevel;
        this.lightLevel = lightLevel;
        this.plantCareSteps = plantCareSteps;
    }

    public Plant(){

    }

    public String getPlantImage1() {
        return plantImage1;
    }

    public void setPlantImage1(String plantImage1) {
        this.plantImage1 = plantImage1;
    }

    public String getPlantImage2() {
        return plantImage2;
    }

    public void setPlantImage2(String plantImage2) {
        this.plantImage2 = plantImage2;
    }

    public String getPlantImage3() {
        return plantImage3;
    }

    public void setPlantImage3(String plantImage3) {
        this.plantImage3 = plantImage3;
    }

    public String getPlantZone() {
        return plantZone;
    }

    public void setPlantZone(String plantZone) {
        this.plantZone = plantZone;
    }

    public String getPlantDescription() {
        return plantDescription;
    }

    public void setPlantDescription(String plantDescription) {
        this.plantDescription = plantDescription;
    }

    public String getWaterLevel() {
        return waterLevel;
    }

    public void setWaterLevel(String waterLevel) {
        this.waterLevel = waterLevel;
    }

    public String getLightLevel() {
        return lightLevel;
    }

    public void setLightLevel(String lightLevel) {
        this.lightLevel = lightLevel;
    }

    public String getPlantCareSteps() {
        return plantCareSteps;
    }

    public void setPlantCareSteps(String plantCareSteps) {
        this.plantCareSteps = plantCareSteps;
    }

    public int getPlantId() {
        return plantId;
    }

    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }

    public String getPlantType() {
        return plantType;
    }

    public void setPlantType(String plantType) {
        this.plantType = plantType;
    }

    public String getPlantName() {
        return plantName;
    }

    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }
}
