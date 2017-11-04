package com.aquent.crudapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.service.ClientService;
@Controller
@RequestMapping("client")

public class ClientController {
    public static final String COMMAND_DELETE = "Delete";

    @Autowired
    private ClientService clientService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("client/list");
        mav.addObject("clients", clientService.listClients());
        return mav;
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mav = new ModelAndView("client/create");
        mav.addObject("client", new Client());
        mav.addObject("errors", new ArrayList<String>());
        return mav;
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public ModelAndView create(Client client) {
        List<String> errors = clientService.validateClient(client);
        if(errors.isEmpty()) {
            clientService.createClient(client);
            return new ModelAndView("redirect:/client/list");
        }
        else {
            ModelAndView mav = new ModelAndView("client/create");
            mav.addObject("client", client);
            mav.addObject("errors", errors);
            return mav;
        }
    }

    @RequestMapping(value = "edit/{clientId}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/edit");
        mav.addObject("client", clientService.readClient(clientId));
        mav.addObject("errors", new ArrayList<String>());
        return mav;
    }

    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public ModelAndView edit(Client client) {
        List<String> errors = clientService.validateClient(client);
        if(errors.isEmpty()) {
            clientService.updateClient(client);
            return new ModelAndView("redirect:/client/list");
        }
        else {
            ModelAndView mav = new ModelAndView("client/edit");
            mav.addObject("client", client);
            mav.addObject("errors", errors);
            return mav;
        }
    }

    @RequestMapping(value = "delete/{clientId}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Integer clientId) {
        ModelAndView mav = new ModelAndView("client/delete");
        mav.addObject("client", clientService.readClient(clientId));
        return mav;
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(@RequestParam String command, @RequestParam Integer clientId) {
        if(COMMAND_DELETE.equals(command)) {
            clientService.deleteClient(clientId);
        }
        return "redirect:/client/list";
    }
}
