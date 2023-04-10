package com.example.autosalon;

import com.example.autosalon.BP.ConnectionPool;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class LoginController implements Initializable {
    @FXML
    public FXMLLoader loader;
    @FXML
    public TextField salonTextField;
    @FXML
    public PasswordField passwordField;
    @FXML
    public Button loginButton;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

    }
    public void login(ActionEvent event)
    {
        String salon = salonTextField.getText();
        String lozinka = passwordField.getText();
        if(!lozinka.equals(getLozinkaSalona(salon)))
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setHeaderText("Greska pri logovanju");
            alert.showAndWait();
        }
        else
        {
            try {
                Stage stage = (Stage) loginButton.getScene().getWindow();
                stage.close();
                Stage primaryStage = new Stage();
                Parent root = FXMLLoader.load(getClass().getResource("biranjeAuta.fxml"));
                Scene scene = new Scene(root);
                primaryStage.setTitle("AutoSalon");
                primaryStage.setScene(scene);
                primaryStage.show();
            }catch (Exception e){}
        }
//        System.out.println(salon);
//        System.out.println(lozinka);
    }
    public static String getLozinkaSalona(String salon)
    {
        String query = "SELECT lozinka FROM salon WHERE nazivSalona=?";
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            c = ConnectionPool.getInstance().checkOut();
            ps = c.prepareStatement(query);
            ps.setString(1,salon);
            rs = ps.executeQuery();
            if(rs.next())
            {
                String lozinka = rs.getString("lozinka");
                return lozinka;
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
        return null;
    }
}
