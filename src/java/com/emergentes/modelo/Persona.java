
package com.emergentes.modelo;


public class Persona {
    private int ID;
    private String NAME;
    private String APELLIDO;
    private int EDAD;
    public Persona(){
        this.ID=0;
        this.NAME="";
        this.APELLIDO="";
        this.EDAD=0;
    }    

    public int getId() {
        return ID;
    }

    public void setId(int id) {
        this.ID = id;
    }

    public String getNombres() {
        return NAME;
    }

    public void setNombres(String nombre) {
        this.NAME = nombre;
    }

    public String getApellidos() {
        return APELLIDO;
    }

    public void setApellidos(String apellidos) {
        this.APELLIDO = apellidos;
    }

    public int getEdad() {
        return EDAD;
    }

    public void setEdad(int edad) {
        this.EDAD = edad;
    }
    
}
