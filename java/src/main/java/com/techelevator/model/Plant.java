package com.techelevator.model;

public class Plant {
    private int plantId;
    private String plantName;
    private String scientificName;
    private String plantType;
    private String plantImage;

    public Plant(int plantId, String plantName, String scientificName, String plantType, String plantImage) {
        this.plantId = plantId;
        this.plantName = plantName;
        this.scientificName = scientificName;
        this.plantType = plantType;
        this.plantImage = plantImage;
    }

    public Plant(){

    }

    public String getPlantImage() {
        return plantImage;
    }

    public void setPlantImage(String plantImage) {
        this.plantImage = plantImage;
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
