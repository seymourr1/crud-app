package com.aquent.crudapp.data.dao;

import com.aquent.crudapp.domain.Client;

import java.util.List;

public interface ClientDao {
    List<Client> listClients(); //Display all Clients

    List<Client> listChildPersons(Integer clientId);  //Display persons associated to a given client

    List<Client> listAllClients(); //for choosing a client to associate to

    Integer createClient(Client client); //Create

    Client readClient(Integer id);  //Read

    void updateClient(Client client); //Update

    void deleteClient(Integer id); //Delete
}
