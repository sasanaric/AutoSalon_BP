package com.example.autosalon;

public class Narudzba
{
    private int idAutomobil;
    private int idNarudzba;
    private String datumNarudzbe;
    private String datumDolaska;
    private String proizvodjac;
    private String model;
    private String oprema;
    private String tip;
    private String motor;
    private String boja;
    private int cijena;

    public Narudzba(int idAutomobil, int idNarudzba, String datumNarudzbe, String datumDolaska,
                    String proizvodjac, String model, String tip, String motor, String oprema, String boja, int cijena) {
        this.idAutomobil = idAutomobil;
        this.idNarudzba = idNarudzba;
        this.datumNarudzbe = datumNarudzbe;
        this.datumDolaska = datumDolaska;
        this.proizvodjac = proizvodjac;
        this.model = model;
        this.tip = tip;
        this.motor = motor;
        this.oprema = oprema;
        this.boja = boja;
        this.cijena = cijena;
    }

    @Override
    public String toString() {
        return "Narudzba{" +
                "idAutomobil=" + idAutomobil +
                ", idNarudzba=" + idNarudzba +
                ", datumNarudzbe='" + datumNarudzbe + '\'' +
                ", datumDolaska='" + datumDolaska + '\'' +
                ", proizvodjac='" + proizvodjac + '\'' +
                ", model='" + model + '\'' +
                ", oprema='" + oprema + '\'' +
                ", tip='" + tip + '\'' +
                ", motor='" + motor + '\'' +
                ", boja='" + boja + '\'' +
                ", cijena=" + cijena +
                '}';
    }

    public int getIdAutomobil() {
        return idAutomobil;
    }

    public int getIdNarudzba() {
        return idNarudzba;
    }

    public String getDatumNarudzbe() {
        return datumNarudzbe;
    }

    public String getDatumDolaska() {
        return datumDolaska;
    }

    public String getProizvodjac() {
        return proizvodjac;
    }

    public String getModel() {
        return model;
    }

    public String getTip() {
        return tip;
    }

    public String getMotor() {
        return motor;
    }

    public String getOprema() {
        return oprema;
    }

    public String getBoja() {
        return boja;
    }

    public int getCijena() {
        return cijena;
    }
}
