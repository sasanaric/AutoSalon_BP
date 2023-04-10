package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;

public class Tip {
    private int id;
    private String naziv;

    public Tip(int id, String naziv) {
        this.id = id;
        this.naziv = naziv;
    }
    public static ArrayList<String> getListaTipova(int idModel)
    {
        ArrayList<String> tipovi = new ArrayList<>();
        String queryIDTip = "SELECT idTip FROM tipovimodela WHERE idModel="+idModel;
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(queryIDTip);
            while(rs.next())
            {
                int idTip = rs.getInt("idTip");
                String tipAutomobila = getTipAutomobila(idTip);
                tipovi.add(tipAutomobila);
            }
            return tipovi;
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
        return tipovi;
    }
    public static String getTipAutomobila(int idTip)
    {
        String query = "SELECT tipAutomobila FROM tip WHERE idTip="+idTip;
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            if(rs.next())
            {
                String tipAutomobila = rs.getString("tipAutomobila");
                return tipAutomobila;
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
            if(s != null){
                try{
                    s.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            ConnectionPool.getInstance().checkIn(c);
        }
        return null;
    }
    public static int getIdTip(String tipAutomobila)
    {
        String query = "SELECT idTip FROM tip WHERE tipAutomobila=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,tipAutomobila);
            rs = ps.executeQuery();
            if(rs.next())
            {
                int idTip = rs.getInt("idTip");
                return idTip;
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
