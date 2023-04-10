package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;

public class Oprema
{
    private int id;
    private String nivoOpreme;

    public Oprema(int id, String nivoOpreme) {
        this.id = id;
        this.nivoOpreme = nivoOpreme;
    }
    public static ArrayList<String> getListaOprema()
    {
        ArrayList<String> listaOprema = new ArrayList<>();
        String query = "SELECT nivoOpreme FROM oprema";
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            while(rs.next())
            {
                String naziv = rs.getString("nivoOpreme");
                listaOprema.add(naziv);
            }
            return listaOprema;
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
        return listaOprema;
    }
    public static int getIdOprema(String oprema)
    {
        String query = "SELECT idOprema FROM oprema WHERE nivoOpreme=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,oprema);
            rs = ps.executeQuery();
            if(rs.next())
            {
                int idOprema = rs.getInt("idOprema");
                return idOprema;
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
    public static double getProcenat(String oprema)
    {
        String query = "SELECT procenat FROM oprema WHERE nivoOpreme=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,oprema);
            rs = ps.executeQuery();
            if(rs.next())
            {
                double procenat = rs.getDouble("procenat");
                return procenat;
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
