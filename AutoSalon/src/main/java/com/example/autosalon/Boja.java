package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;

import java.sql.*;
import java.util.ArrayList;

public class Boja
{
    private int id;
    private String boja;

    public Boja(int id, String boja) {
        this.id = id;
        this.boja = boja;
    }

    public static ArrayList<String> getListaBoja()
    {
        ArrayList<String> listaBoja = new ArrayList<>();
        String query = "SELECT bojaAuta FROM bojaAuta";
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            while(rs.next())
            {
                String naziv = rs.getString("bojaAuta");
                listaBoja.add(naziv);
            }
            return listaBoja;
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
        return listaBoja;
    }
    public static int getIdBoja(String bojaAuta)
    {
        String query = "SELECT idBojaAuta FROM bojaAuta WHERE bojaAuta=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,bojaAuta);
            rs = ps.executeQuery();
            if(rs.next())
            {
                int idBoja = rs.getInt("idBojaAuta");
                return idBoja;
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
