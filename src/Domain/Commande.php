<?php
namespace ChicAndCheap\Domain;

class Commande
{
    private $numero;
    
    private $visiteur;
    
    private $lignesCmd = array();
    
    private $dateCmd;
    
    public function getDate() {
        return $this->numero;
    }
    public function setDate($date) {
        $this->date = $date;
    }
    
    public function getLignes() {
        return $this->$lignesCmd;
    }
    public function setLignes(array() $lignes) {
        $this->$lignesCmd = $lignes;
    }
    
    public function getNumero() {
        return $this->numero;
    }
    public function setNumero($numero) {
        $this->numero = $numero;
    }
    
     
    public function getVisiteur() {
        return $this->visiteur;
    }

    public function setVisiteur(Visiteur $unVisiteur) {
        $this->visiteur = $unVisiteur;
    }
    
}