package com.aquent.crudapp.data.dao.jdbc;


import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.domain.Client;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.transform.Result;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class ClientJdbcDao implements ClientDao {

    private static final String SQL_LIST_CLIENT = "SELECT * FROM client ORDER BY client_name, client_id";
    private static final String SQL_READ_CLIENT = "SELECT * FROM client WHERE client_id = :clientId";
    private static final String SQL_DELETE_CLIENT = "DELETE FROM client WHERE client_id = :clientId";
    private static final String SQL_UPDATE_CLIENT = "UPDATE client SET (client_name, client_uri, client_phone, client_street_address, client_city, client_state, client_zip)" +
            "= (:clientName, :clientURI, :clientPhone, :clientStreetAddress, :clientCity, :clientState, :clientZip)" +
            " WHERE client_id = :clientId";
    private static final String SQL_CREATE_CLIENT = "INSERT INTO client (client_name, client_uri, client_phone, client_street_address, client_city, client_state, client_zip)" +
            " VALUES (:clientName, :clientURI, :clientPhone, :clientStreetAddress, :clientCity, :clientState, :clientZip)";

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }


    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> listClients() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_CLIENT, new ClientRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createClient(Client client) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CLIENT, new BeanPropertySqlParameterSource(client), keyHolder);
        return keyHolder.getKey().intValue();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer clientId) {
        return namedParameterJdbcTemplate.queryForObject(SQL_READ_CLIENT, Collections.singletonMap("clientId", clientId), new ClientRowMapper());
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateClient(Client client) {
        namedParameterJdbcTemplate.update(SQL_UPDATE_CLIENT, new BeanPropertySqlParameterSource(client));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer clientId) {
        namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT, Collections.singletonMap("clientId", clientId));
    }

    private static final class ClientRowMapper implements RowMapper<Client> {

        public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
            Client client = new Client();
            client.setClientId(rs.getInt("client_id"));
            client.setClientName(rs.getString("client_name"));
            client.setClientURI(rs.getString("client_uri"));
            client.setClientPhone(rs.getString("client_phone"));
            client.setClientStreetAddress(rs.getString("client_street_address"));
            client.setClientCity(rs.getString("client_city"));
            client.setClientState(rs.getString("client_state"));
            client.setClientZip(rs.getString("client_zip"));
            return client;
        }
    }
}
