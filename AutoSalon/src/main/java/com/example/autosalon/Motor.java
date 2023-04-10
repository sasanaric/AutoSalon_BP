package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;

public class Motor {

    private int id;
    private String naziv;

    public Motor(int id, String naziv) {
        this.id = id;
        this.naziv = naziv;
    }

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public String getNaziv() {return naziv;}

    public void setNaziv(String naziv) {this.naziv = naziv;}

    @Override
    public String toString() {return naziv;}
    public static ArrayList<String> getListaMotora(int idModel)
    {
        ArrayList<String> motori = new ArrayList<>();
        String queryIDMotor = "SELECT idMotor FROM motoriModela WHERE idModel="+idModel;
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(queryIDMotor);
            while(rs.next())
            {
                int idMotor = rs.getInt("idMotor");
                String tipMotora = getTipMotora(idMotor);
                motori.add(tipMotora);
            }
            return motori;
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
        return motori;
    }
    public static String getTipMotora(int idMotor)
    {
        String query = "SELECT tipMotora FROM motor WHERE idMotor="+idMotor;
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            if(rs.next())
            {
                String tipMotora = rs.getString("tipMotora");
                return tipMotora;
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
    public static int getIdMotor(String tipMotora)
    {
        String query = "SELECT idMotor FROM motor WHERE tipMotora=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,tipMotora);
            rs = ps.executeQuery();
            if(rs.next())
            {
                int idMotor = rs.getInt("idMotor");
                return idMotor;
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
