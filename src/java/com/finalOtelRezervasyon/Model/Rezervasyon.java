/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finalOtelRezervasyon.Model;

import java.io.Serializable;

public class Rezervasyon implements Serializable{
    private String Id;
    private String odaid;
    private String userId;
    private String olusturulmaTarihi;
    private String baslangicTarihi;
    private String bitisTarihi;
    private String toplamTutar;
    private String durum;
  public Rezervasyon(String Id,String odaid,String userId,String olusturulmaTarihi,String baslangicTarihi,String bitisTarihi,String toplamTutar,String durum){
  this.Id =Id;
  this.odaid =odaid;
  this.userId =userId;
  this.olusturulmaTarihi =olusturulmaTarihi;
  this.baslangicTarihi =baslangicTarihi;
  this.bitisTarihi =bitisTarihi;
  this.toplamTutar =toplamTutar;
  this.durum =durum;
  }
    public void setId(String Id) {
        this.Id = Id;
    }

    public void setOdaid(String odaid) {
        this.odaid = odaid;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setOlusturulmaTarihi(String olusturulmaTarihi) {
        this.olusturulmaTarihi = olusturulmaTarihi;
    }

    public void setBaslangicTarihi(String baslangicTarihi) {
        this.baslangicTarihi = baslangicTarihi;
    }

    public void setBitisTarihi(String bitisTarihi) {
        this.bitisTarihi = bitisTarihi;
    }

    public void setToplamTutar(String toplamTutar) {
        this.toplamTutar = toplamTutar;
    }

    public void setDurum(String durum) {
        this.durum = durum;
    }

    public String getId() {
        return Id;
    }

    public String getOdaid() {
        return odaid;
    }

    public String getUserId() {
        return userId;
    }

    public String getOlusturulmaTarihi() {
        return olusturulmaTarihi;
    }

    public String getBaslangicTarihi() {
        return baslangicTarihi;
    }

    public String getBitisTarihi() {
        return bitisTarihi;
    }

    public String getToplamTutar() {
        return toplamTutar;
    }

    public String getDurum() {
        return durum;
    }

    public Rezervasyon(){}

   
    
}
