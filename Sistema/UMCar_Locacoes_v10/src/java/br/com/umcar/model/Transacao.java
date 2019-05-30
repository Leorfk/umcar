/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.umcar.model;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;


public class Transacao {
    private int id;
    private int numero;
    private Date data;
    private Time hora;
    private Cliente cliente;
    private Automovel automovel;
    private String observacao;
    private double total;
    private String situacao;

    public int getId() {
        return id;
    }

    public int getNumero() {
        return numero;
    }

    public Date getData() {
        return data;
    }

    public Time getHora() {
        return hora;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public Automovel getAutomovel() {
        return automovel;
    }

    public String getObservacao() {
        return observacao;
    }

    public double getTotal() {
        return total;
    }
    
    public String getSituacao() {
        return situacao;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public void setAutomovel(Automovel automovel) {
        this.automovel = automovel;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public Transacao() {
    }

    public Transacao(int numero, Date data, Time hora, Cliente cliente, Automovel automovel, String observacao, double total, String situacao) {
        this.numero = numero;
        this.data = data;
        this.hora = hora;
        this.cliente = cliente;
        this.automovel = automovel;
        this.observacao = observacao;
        this.total = total;
        this.situacao = situacao;
    }

    public Transacao(int id, int numero, Date data, Time hora, Cliente cliente, Automovel automovel, String observacao, double total, String situacao) {
        this.id = id;
        this.numero = numero;
        this.data = data;
        this.hora = hora;
        this.cliente = cliente;
        this.automovel = automovel;
        this.observacao = observacao;
        this.total = total;
        this.situacao = situacao;
    }

    
}
