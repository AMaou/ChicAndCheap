<?php

namespace ChicAndCheap\DAO;


use ChicAndCheap\Domain\LigneCommande;

class LigneCommandeDAO extends DAO
{

    private $commandeDAO;
    private $articleDAO;

    public function setCommandeDAO(commandeDAO $CommandeDAO) {
        $this->commandeDAO = $commandeDAO;
    }
    
    public function ArticleDAO(articleDAO $articleDAO) {
        $this->articleDAO = $articleDAO;
    }
/**
     * Renvoie la liste de tous les articles, triées par libellé
     *
     * @return array La liste d
     */
    public function findAll() {
        $sql = "select * from lignecommande order by numerocommande";
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
    public function find($code) {
        $sql = "select * from article where CODEART=?";
        $row = $this->getDb()->fetchAssoc($sql, array($code));

        if ($row)
            return $this->buildDomainObject($row);
        else
            throw new \Exception("Aucun article trouvé" . $libelleArt);
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