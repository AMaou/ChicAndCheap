<?php

namespace ChicAndCheap\DAO;


use ChicAndCheap\Domain\Article;

class CommandeDAO extends DAO
{

    private $visiteurDAO;

    public function setVisiteurDAO(VisiteurDAO $visiteurDAO) {
        $this->visiteurDAO = $visiteurDAO;
    }
/**
     * Renvoie la liste de tous les articles, triées par libellé
     *
     * @return array La liste d
     */
    public function findAll() {
        $sql = "select * from Commande order by NUMEROCOMMANDE";
        $result = $this->getDb()->fetchAll($sql);
        
        // Convertit les résultats de requête en tableau d'objets du domaine
        $articles = array();
        foreach ($result as $row) {
            $articleLib = $row['LIBELLEART'];
            $articles[$articleLib] = $this->buildDomainObject($row);
        }
        return $articles;
    }

    /**
     * Renvoie une categorie à partir de son identifiant
     *
     * @param integer $id L'identifiant de la categorie
     *
     * @return \GSB\Domaine\Categorie|Lève un exception si aucune categorie ne correspond
     */
    public function find($id) {
        $sql = "select * from article where id_visiteur=?";
        $row = $this->getDb()->fetchAssoc($sql, array($id));

        if ($row)
            return $this->buildDomainObject($row);
        else
            throw new \Exception("Aucun article trouvé");
    }
  protected function buildDomainObject($row) {
        $article = new Article();
        $article->setCode($row['CODEART']);
        $article->setLibelle($row['LIBELLEART']);
        $article->setTaille($row['TAILLE']);
        $article->setPrix($row['Prix']);
        $article->setDescription($row['DESCRIPTION']);
    
        if (array_key_exists('CodeType', $row)) {
            // Trouve et définit le type associé
            $typearticleId = $row['CodeType'];
            $typearticle = $this->typearticleDAO->find($typearticleId);
            $article->setTypearticle($typearticle);
        }
      
        if (array_key_exists('CODECOULEUR', $row)) {
            // Trouve et définit le type associé
            $coueleurarticleID = $row['CODECOULEUR'];
            $couleurarticle = $this->couleurarticleDAO->find($coueleurarticleID);
            $article->setCouleurarticle($couleurarticle);
        }
   
        return $article;
    }
     
}