/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package agenda.datos;
import agenda.datos.logica.Cita;
import java.sql.*;
/**
 *
 * @author PROFESIONAL
 */
public class DBCitas {
    DBConexion cn;
    public DBCitas(){
    cn=new  DBConexion();
    }
public Cita getCitaById(int id){
        Cita data = new Cita();
        try{
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                                                "SELECT cit_id, " +
                                                " con_id, " +
                                                " Sitio, " +
                                                " Fecha, " +
                                                " Hora," +
                                                " Motivo " +
                                                " FROM citas " + 
                                                " where cit_id = ? ");

            pstm.setInt(1, id);
            ResultSet res = pstm.executeQuery();
            int i = 0;
            DBContactos dbc = new DBContactos();
            if(res.next()){
                data = new Cita();
                data.setId(res.getInt("cit_id"));
                data.setContacto(dbc.getContactoById(res.getInt("con_id")));
                data.setLugar(res.getString("Sitio"));
                data.setFecha(res.getString("Fecha"));
                data.setHora(res.getString("Hora"));
                data.setAsunto(res.getString("Motivo"));
            }
            res.close(); 
            
            
        }catch(SQLException e){
            System.out.println(e);
        }
        return data;
    }
    /** trae todos los registros de la tabla citas */
     public Cita[] getCitas(){
        int registros = 0;

        try{
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                                     "SELECT count(1) as cont" +
                                     " FROM citas ");
            
            ResultSet res = pstm.executeQuery();

            res.next();
            registros = res.getInt("cont");
            res.close(); 
            
            
        }catch(SQLException e){
            System.out.println(e);
        }
        Cita[] data = new Cita[registros];
        try{
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                                      "SELECT cit_id, " +
                                      " con_id, " +
                                      " Sitio, " +
                                      " Fecha, " +
                                      " Hora," +
                                      " Motivo " +
                                      " FROM citas " + 
                                      " ORDER BY Fecha desc, " +
                                      " Hora desc ");

            ResultSet res = pstm.executeQuery();
            int i = 0;
            DBContactos dbc = new DBContactos();
            while(res.next()){
                data[i] = new Cita();
                data[i].setId(res.getInt("cit_id"));
                data[i].setContacto(dbc.getContactoById(res.getInt("con_id")));
                data[i].setLugar(res.getString("Sitio"));
                data[i].setFecha(res.getString("Fecha"));
                data[i].setHora(res.getString("Hora"));
                data[i].setAsunto(res.getString("Motivo"));
                i++;
            }
            res.close(); 
            
            
        }catch(SQLException e){
            System.out.println(e);
        }
        return data;
    }
     
    public int insertarCita(Cita c){
        int resultado = 0;//no hubo errores de validacion
        try{
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                                   "insert into citas (con_id," +
                                   " Sitio," +
                                   " Fecha," +
                                   " Hora," +
                                   " Motivo) " +
                                   " values(?,?,?,?,?)");
            pstm.setInt(1, c.getContacto().getId());
            pstm.setString(2, c.getLugar());
            pstm.setString(3, c.getFecha());
            pstm.setString(4, c.getHora());
            pstm.setString(5, c.getAsunto());
            pstm.executeUpdate();

            pstm = cn.getConexion().prepareStatement("select last_insert_id()");
            ResultSet res = pstm.executeQuery();
            res.next();
            resultado = res.getInt(1);
            res.close();
        }catch(SQLException e){
            System.out.println(e);
        }
        return resultado;
    }
    
    public int actualizarCita(Cita c){
        int resultado = 0;
        try{
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                                       "update citas " +
                                       " set con_id = ?, " +
                                       " Sitio = ?," +
                                       " Fecha = ?," +
                                       " Hora = ?," +
                                       " Motivo = ? " +
                                       " where cit_id = ?");
            pstm.setInt(1, c.getContacto().getId());
            pstm.setString(2, c.getLugar());
            pstm.setString(3, c.getFecha());
            pstm.setString(4, c.getHora());
            pstm.setString(5, c.getAsunto());
            pstm.setInt(6, c.getId());

            resultado = pstm.executeUpdate();

        }catch(SQLException e){
            System.out.println(e);
        }
        return resultado;
    }
    
    public int borrarCita(Cita c){
        int resultado = 0;
        try{
            PreparedStatement pstm = cn.getConexion().prepareStatement(
                                  "delete from citas " +
                                  " where cit_id = ?");
            
            pstm.setInt(1, c.getId());

            resultado = pstm.executeUpdate();
                    
        }catch(SQLException e){
            System.out.println(e);
        }

        
        return resultado;
    }

}      