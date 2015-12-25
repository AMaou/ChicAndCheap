<?php
namespace ChicAndCheap\Domain;

class Lignecommande
{
    private $commande;
    
    private $articles = array();
    
    private $quantite;

    
    public function getLignes() {
        return $this->$lignesCmd;
    }
    public function setLignes(array(Lignecommande) $lignes) {
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