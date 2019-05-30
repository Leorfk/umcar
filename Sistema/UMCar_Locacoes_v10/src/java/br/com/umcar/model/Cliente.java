
package br.com.umcar.model;

import java.util.logging.Logger;


public class Cliente {
    
    private int id;
    private String nome;
    private String cpf;
    private String telRes;
    private String telCel;
    private String email;

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public String getCpf() {
        return cpf;
    }

    public String getTelRes() {
        return telRes;
    }

    public String getTelCel() {
        return telCel;
    }

    public String getEmail() {
        return email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public void setTelRes(String telRes) {
        this.telRes = telRes;
    }

    public void setTelCel(String telCel) {
        this.telCel = telCel;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Cliente() {
    }

    public Cliente(int id) {
        this.id = id;
    }
       
    public Cliente(int id, String nome) {
        this.id = id;
        this.nome = nome;
    }
    
    public Cliente(int id, String nome, String cpf) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
    }
                
    public Cliente(int id, String nome, String cpf, String telRes, String telCel, String email) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.telRes = telRes;
        this.telCel = telCel;
        this.email = email;
    }

    public Cliente(String nome, String cpf, String telRes, String telCel, String email) {
        this.nome = nome;
        this.cpf = cpf;
        this.telRes = telRes;
        this.telCel = telCel;
        this.email = email;
    }

   
}
