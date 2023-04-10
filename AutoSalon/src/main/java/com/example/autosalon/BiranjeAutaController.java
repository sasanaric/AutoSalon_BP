package com.example.autosalon;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.net.URL;
import java.util.ResourceBundle;

public class BiranjeAutaController implements Initializable{
    @FXML
    public AnchorPane anchorPane;
    @FXML
    public ComboBox <String> proizvodjacComboBox;
    @FXML
    public ComboBox <String> modelComboBox;
    @FXML
    public ComboBox <String>tipComboBox;
    @FXML
    public ComboBox <String>motorComboBox;
    @FXML
    public ComboBox <String>opremaComboBox;
    @FXML
    public ComboBox <String>bojaComboBox;
    @FXML
    public Button naruciButton;
    @FXML
    public TextField cijenaTextField;

//    @FXML
//    public void initialize(){
//        anchorPane = new AnchorPane();
//        System.out.println("BIRANJEAUTACONTROLLER");
//        proizvodjacComboBox = new ComboBox<>();
//        proizvodjacComboBox.getItems().addAll(
//                "Audi","BMW"
//        );
//
//        modelComboBox = new ComboBox<>();
//        modelComboBox.getItems().add("206");
//        modelComboBox.getItems().add("A4");
//        modelComboBox.getItems().add("Octavia");
//    }
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        cijenaTextField.setText("0.0");
        proizvodjacComboBox.getItems().addAll(Proizvodjac.getListaProizvodjaci());
        opremaComboBox.getItems().addAll(Oprema.getListaOprema());
        bojaComboBox.getItems().addAll(Boja.getListaBoja());
        proizvodjacComboBox.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String stariProizvodjac ,String proizvodjac) {
//                System.out.println(proizvodjac);
                modelComboBox.getItems().clear();
                modelComboBox.getItems().addAll(Model.getListaModela(Proizvodjac.getIdProizvodjac(proizvodjac)));
            }
        });
        modelComboBox.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String stariModel ,String model) {
//                System.out.println(model);
                tipComboBox.getItems().clear();
                tipComboBox.getItems().addAll(Tip.getListaTipova(Model.getIdModel(model)));
            }
        });
        modelComboBox.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String stariModel ,String model) {
//                System.out.println(model);
                motorComboBox.getItems().clear();
                motorComboBox.getItems().addAll(Motor.getListaMotora(Model.getIdModel(model)));
            }
        });
        modelComboBox.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String stariModel ,String model) {
                double cijenaModela = Model.getCijenaModela(model);
//                System.out.println("OPREMA = "+opremaComboBox.getSelectionModel().getSelectedItem());
                double procenat = Oprema.getProcenat(opremaComboBox.getSelectionModel().getSelectedItem());
                double cijena = cijenaModela + cijenaModela*procenat;
                cijenaTextField.setText(String.valueOf(cijena));
            }
        });
        opremaComboBox.getSelectionModel().selectedItemProperty().addListener(new ChangeListener<String>() {
            @Override
            public void changed(ObservableValue<? extends String> observableValue, String staraOprema ,String oprema) {
                double procenat = Oprema.getProcenat(oprema);
                double cijenaModela = Model.getCijenaModela(modelComboBox.getSelectionModel().getSelectedItem());
                double cijena = cijenaModela + cijenaModela*procenat;
                cijenaTextField.setText(String.valueOf(cijena));
            }
        });

    }
    public void potvrda(ActionEvent event)
    {
        int idProizvodjac = Proizvodjac.getIdProizvodjac(proizvodjacComboBox.getSelectionModel().getSelectedItem());
        int idModel = Model.getIdModel(modelComboBox.getSelectionModel().getSelectedItem());
        int idTip = Tip.getIdTip(tipComboBox.getSelectionModel().getSelectedItem());
        int idMotor = Motor.getIdMotor(motorComboBox.getSelectionModel().getSelectedItem());
        int idOprema = Oprema.getIdOprema(opremaComboBox.getSelectionModel().getSelectedItem());
        int idBoja = Boja.getIdBoja(bojaComboBox.getSelectionModel().getSelectedItem());
        double cijena = Double.parseDouble(cijenaTextField.getText());
//        System.out.println(idProizvodjac+"-"+idModel+"-"+idTip+"-"+idMotor+"-"+idOprema+"-"+idBoja);
        if((idProizvodjac * idModel * idTip * idMotor * idOprema * idBoja) == 0)
        {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("GRESKA");
            alert.setHeaderText("Nisu odabrana sva polja!");
            alert.showAndWait();
        }
        else
        {
            Alert alert = new Alert(Alert.AlertType.CONFIRMATION);
            alert.setTitle("POTVRDA NARUDZBE");
            alert.setHeaderText("Da li zelite naruciti automobil?");
            if(alert.showAndWait().get() == ButtonType.OK)
            {
                Automobil.napraviAutomobil(idModel,idTip,idMotor,idOprema,idBoja,cijena);
//                System.out.println("Zadnji IDAutomobil je "+Automobil.getZadnjiAutomobilID());
                Automobil.napraviNarudzbu(Automobil.getZadnjiAutomobilID(),cijena);
            }
        }

    }
    @FXML
    public void prikazListeNarudzbi(ActionEvent event)
    {
        try{
            Stage stage = new Stage();
            stage.initModality(Modality.APPLICATION_MODAL);
            FXMLLoader loader = new FXMLLoader(getClass().getResource("listaNarudzbi.fxml"));
            Parent root = loader.load();
            Scene scene = new Scene(root);
            stage.setTitle("Lista Narudzbi");
            stage.setScene(scene);
            stage.show();
        }catch (Exception e){}
    }
}
