/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TiendaRopa.demo.service.impl;

import TiendaRopa.demo.dao.FacturaDao;
import TiendaRopa.demo.domain.Factura;
import TiendaRopa.demo.service.FacturaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FacturaServiceImpl implements FacturaService {

    @Autowired
    private FacturaDao facturaDao;

    @Override
    @Transactional(readOnly = true)
    public List<Factura> getFacturas() {
        var lista = facturaDao.findAll();
        return lista;
    }
}