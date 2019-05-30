package br.com.umcar.model;

import java.util.List;


public class Automovel
{
    private int idAutomovel;
    private int placa;
    private String marca;
    private String modelo;
    private String chassi;
    private String observacoes;
    private int portas;
    private int passageiros;
    private String tipoAutomovel;
    private String cor;
    private double valorVenda;
    private String status;

    public int getIdAutomovel() {
        return idAutomovel;
    }

    public int getPlaca() {
        return placa;
    }

    public String getMarca() {
        return marca;
    }

    public String getModelo() {
        return modelo;
    }

    public String getChassi() {
        return chassi;
    }

    public String getObservacoes() {
        return observacoes;
    }

    public int getPortas() {
        return portas;
    }

    public int getPassageiros() {
        return passageiros;
    }

    public String getTipoAutomovel() {
        return tipoAutomovel;
    }

    public String getCor() {
        return cor;
    }

    public double getValorVenda() {
        return valorVenda;
    }

    public String getStatus() {
        return status;
    }

    public void setIdAutomovel(int idAutomovel) {
        this.idAutomovel = idAutomovel;
    }

    public void setPlaca(int placa) {
        this.placa = placa;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setChassi(String chassi) {
        this.chassi = chassi;
    }

    public void setObservacoes(String observacoes) {
        this.observacoes = observacoes;
    }

    public void setPortas(int portas) {
        this.portas = portas;
    }

    public void setPassageiros(int passageiros) {
        this.passageiros = passageiros;
    }

    public void setTipoAutomovel(String tipoAutomovel) {
        this.tipoAutomovel = tipoAutomovel;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public void setValorVenda(double valorVenda) {
        this.valorVenda = valorVenda;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Automovel() {
    }
    
    public Automovel(int id) {
        this.idAutomovel = id;
    }

    public Automovel(int idAutomovel, int placa, String marca, String modelo) {
        this.idAutomovel = idAutomovel;
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
    }
      
    public Automovel(int idAutomovel, int placa, String marca, String modelo, String chassi, String observacoes, int portas, int passageiros, String tipoAutomovel, String cor, double valorVenda, String status) {
        this.idAutomovel = idAutomovel;
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.chassi = chassi;
        this.observacoes = observacoes;
        this.portas = portas;
        this.passageiros = passageiros;
        this.tipoAutomovel = tipoAutomovel;
        this.cor = cor;
        this.valorVenda = valorVenda;
        this.status = status;
    }

    public Automovel(int placa, String marca, String modelo, String chassi, String observacoes, int portas, int passageiros, String tipoAutomovel, String cor, double valorVenda, String status) {
        this.placa = placa;
        this.marca = marca;
        this.modelo = modelo;
        this.chassi = chassi;
        this.observacoes = observacoes;
        this.portas = portas;
        this.passageiros = passageiros;
        this.tipoAutomovel = tipoAutomovel;
        this.cor = cor;
        this.valorVenda = valorVenda;
        this.status = status;
    }

    
}
