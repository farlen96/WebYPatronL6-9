/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package TiendaRopa.demo.dao;

import TiendaRopa.demo.domain.Factura;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FacturaDao extends JpaRepository<Factura, Long> {

}
