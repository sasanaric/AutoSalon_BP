module com.example.autosalon {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.autosalon to javafx.fxml;
    exports com.example.autosalon;
}