package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;

public class Proizvodjac {

    private int id;
    private String naziv;

    public Proizvodjac(int id, String naziv) {
        this.id = id;
        this.naziv = naziv;
    }

    public int getId() {return id;}

    public void setId(int id) {this.id = id;}

    public String getNaziv() {return naziv;}

    public void setNaziv(String naziv) {this.naziv = naziv;}

    @Override
    public String toString() {return naziv;}
    public static int getIdProizvodjac(String proizvodjac)
    {
        String query = "SELECT idProizvodjac FROM proizvodjac WHERE nazivProizvodjaca=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,proizvodjac);
            rs = ps.executeQuery();
            if(rs.next())
            {
                int idProizvodjac = rs.getInt("idProizvodjac");
                return idProizvodjac;
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
    public static ArrayList<String> getListaProizvodjaci()
    {
        ArrayList<String> proizvodjaci = new ArrayList<>();
        String query = "SELECT nazivProizvodjaca FROM proizvodjac";
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            while(rs.next())
            {
                String naziv = rs.getString("nazivProizvodjaca");
                proizvodjaci.add(naziv);
            }
            return proizvodjaci;
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
        return proizvodjaci;
    }
}
