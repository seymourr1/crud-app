package com.aquent.crudapp.service;

import com.aquent.crudapp.domain.Client;

import java.util.List;

public interface ClientService {

    List<Client> listClients();

    List<Client> listChildPersons(Integer clientId);

    List<Client> listOfClients();

    Integer createClient (Client client);  //returns new client ID

    Client readClient(Integer id);

    void updateClient(Client client);

    void deleteClient(Integer id);

    List<String> validateClient(Client client);
}
