package com.aquent.crudapp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Client {

    private Integer clientId;


    @NotNull
    @Size(min = 1, max = 50, message = "Company name is required")
    private String clientName;

    @NotNull
    @Size(min = 1, max = 50, message = "Company URI is required")
    private String clientURI;

    //Need to account for different phone inputs
    @NotNull
    @Size(min = 10, max = 25, message = "Please enter a phone number")
    private String clientPhone;

    @NotNull
    @Size(min = 1, max = 50, message = "Please enter a street address")
    private String clientStreetAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "Please enter a city")
    private String clientCity;

    @NotNull
    @Size(min = 1, max = 2, message = "Please enter a valid state abbreviation")
    private String clientState;

    @NotNull
    @Size(min = 5, max = 5, message = "Zip code is required with length 5")
    private String clientZip;

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }


    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getClientURI() {
        return clientURI;
    }

    public void setClientURI(String clientURI) {
        this.clientURI = clientURI;
    }

    public String getClientPhone() {
        return clientPhone;
    }

    public void setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone;
    }

    public String getClientStreetAddress() {
        return clientStreetAddress;
    }

    public void setClientStreetAddress(String clientStreetAddress) {
        this.clientStreetAddress = clientStreetAddress;
    }

    public String getClientCity() {
        return clientCity;
    }

    public void setClientCity(String clientCity) {
        this.clientCity = clientCity;
    }

    public String getClientState() {
        return clientState;
    }

    public void setClientState(String clientState) {
        this.clientState = clientState;
    }

    public String getClientZip() {
        return clientZip;
    }

    public void setClientZip(String clientZip) {
        this.clientZip = clientZip;
    }
}
