package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class ListaNarudzbiController implements Initializable
{
    @FXML
    private TableView<Narudzba> narudzbaTableView;
    @FXML
    private TableColumn<Narudzba,Integer> idAutomobilColumn;
    @FXML
    private TableColumn<Narudzba,Integer> idNarudzbaColumn;
    @FXML
    private TableColumn<Narudzba,String> datumNarudzbeColumn;
    @FXML
    private TableColumn<Narudzba,String> datumDolaskaColumn;
    @FXML
    private TableColumn<Narudzba,String> proizvodjacColumn;
    @FXML
    private TableColumn<Narudzba,String> modelColumn;
    @FXML
    private TableColumn<Narudzba,String> opremaColumn;
    @FXML
    private TableColumn<Narudzba,String> tipColumn;
    @FXML
    private TableColumn<Narudzba,String> motorColumn;
    @FXML
    private TableColumn<Narudzba,String> bojaColumn;
    @FXML
    private TableColumn<Narudzba,Integer> cijenaColumn;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        idAutomobilColumn.setCellValueFactory(new PropertyValueFactory<>("idAutomobil"));
        idNarudzbaColumn.setCellValueFactory(new PropertyValueFactory<>("idNarudzba"));
        datumNarudzbeColumn.setCellValueFactory(new PropertyValueFactory<>("datumNarudzbe"));
        datumDolaskaColumn.setCellValueFactory(new PropertyValueFactory<>("datumDolaska"));
        proizvodjacColumn.setCellValueFactory(new PropertyValueFactory<>("proizvodjac"));
        modelColumn.setCellValueFactory(new PropertyValueFactory<>("model"));
        tipColumn.setCellValueFactory(new PropertyValueFactory<>("tip"));
        motorColumn.setCellValueFactory(new PropertyValueFactory<>("motor"));
        opremaColumn.setCellValueFactory(new PropertyValueFactory<>("oprema"));
        bojaColumn.setCellValueFactory(new PropertyValueFactory<>("boja"));
        cijenaColumn.setCellValueFactory(new PropertyValueFactory<>("cijena"));
        String query = "SELECT * FROM narudzba_automobil";
        Connection c = null;
        Statement s = null;
        ResultSet rs = null;

        try{
            c = ConnectionPool.getInstance().checkOut();
            s = c.createStatement();
            rs = s.executeQuery(query);
            while(rs.next())
            {
                int idAutomobil = rs.getInt(1);
                int idNarudzba = rs.getInt(2);
                String datumNarudzbe = String.valueOf(rs.getDate(3));
                String datumDolaska = String.valueOf(rs.getDate(4));
                String proizvodjac = rs.getString(5);
                String model = rs.getString(6);
                String tip = rs.getString(7);
                String motor = rs.getString(8);
                String oprema = rs.getString(9);
                String boja = rs.getString(10);
                Integer cijena = rs.getInt(11);
                Narudzba n = new Narudzba(idAutomobil,idNarudzba,datumNarudzbe,datumDolaska,proizvodjac,model,tip,motor,oprema,boja,cijena);
//                System.out.println(n);
                narudzbaTableView.getItems().add(n);
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
    }
}
