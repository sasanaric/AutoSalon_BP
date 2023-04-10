package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;

public class Model
{
    private int id;
    private String naziv;

    public Model(int id, String naziv) {
        this.id = id;
        this.naziv = naziv;
    }

    public static int getIdModel(String model)
    {
        String query = "SELECT idModel FROM model WHERE nazivModela=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,model);
            rs = ps.executeQuery();
            if(rs.next())
            {
                int idModel = rs.getInt("idModel");
                return idModel;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(ps != null){
                try{
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ConnectionPool.getInstance().checkIn(c);
        }
        return 0;
    }
    public static ArrayList<String> getListaModela(int idProizvodjac)
    {
        ArrayList<String> modeli = new ArrayList<>();
        String query = "SELECT nazivModela FROM model WHERE idProizvodjac="+idProizvodjac;
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            while(rs.next())
            {
                String naziv = rs.getString("nazivModela");
                modeli.add(naziv);
            }
            return modeli;
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
        return modeli;
    }
    public static double getCijenaModela(String model)
    {
        String query = "SELECT cijenaModela FROM model WHERE nazivModela=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,model);
            rs = ps.executeQuery();
            if(rs.next())
            {
                double cijena = rs.getDouble("cijenaModela");
                return cijena;
            }
        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(ps != null){
                try{
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ConnectionPool.getInstance().checkIn(c);
        }
        return 0;
    }
}
