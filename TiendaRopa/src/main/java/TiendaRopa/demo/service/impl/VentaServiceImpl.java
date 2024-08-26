/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package TiendaRopa.demo.service.impl;

import TiendaRopa.demo.dao.VentaDao;
import TiendaRopa.demo.domain.Venta;
import TiendaRopa.demo.service.VentaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VentaServiceImpl implements VentaService {

    @Autowired
    private VentaDao ventaDao;

    @Override
    @Transactional(readOnly = true)
    public List<Venta> getVentas() {
        var lista = ventaDao.findAll();
        return lista;
    }
}