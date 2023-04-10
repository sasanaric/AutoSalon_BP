package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;

public class Automobil {

    public static void napraviAutomobil(int idModel,int idTip,int idMotor,int idOprema,int idBojaAuta,double cijena)
    {
        String query ="INSERT INTO automobil VALUES (default, ?, ?, ?, ?, ?, ?)";
        Connection c = null;
        PreparedStatement ps = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setInt(1, idModel);
            ps.setInt(2, idTip);
            ps.setInt(3, idMotor);
            ps.setInt(4, idOprema);
            ps.setInt(5, idBojaAuta);
            ps.setDouble(6, cijena);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(ps != null){
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                ConnectionPool.getInstance().checkIn(c);
            }
        }
    }
    public static void napraviNarudzbu(int idAutomobil, double cijena)
    {
        String query ="INSERT INTO narudzba VALUES (default, ?, default, default, default, default, default,default,?)";
        Connection c = null;
        PreparedStatement ps = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setInt(1, idAutomobil);
            ps.setDouble(2,cijena);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(ps != null){
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                ConnectionPool.getInstance().checkIn(c);
            }
        }
    }
    public static Integer getZadnjiAutomobilID(){
        String query = "SELECT MAX(idAutomobil) FROM automobil";

        Integer id = null;
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            if(rs.next()){
                id = rs.getInt(1);
                return id;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(s != null){
                try {
                    s.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(rs != null){
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ConnectionPool.getInstance().checkIn(c);
        }
        return id;
    }
}
