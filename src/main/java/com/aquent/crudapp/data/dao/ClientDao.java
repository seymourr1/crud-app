package com.aquent.crudapp.data.dao;

import com.aquent.crudapp.domain.Client;

import java.util.List;

public interface ClientDao {
    List<Client> listClients();

    Integer createClient(Client client);

    Client readClient(Integer id);

    void updateClient(Client client);

    void deleteClient(Integer id);


}
