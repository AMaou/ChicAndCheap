

create table ARTICLE
(
   CODEART                        char(8)                        not null,
   CODECAT                        char(5)                        not null,
   CODECOULEUR                    char(10)                       not null,
   LIBELLEART                     varchar(20),
   DESCRIPTION                    longtext,
   IMAGE                          longblob,
   TAILLE                         char(5),
   primary key (CODEART)
)
type = InnoDB;
create index CORRESPOND_FK on ARTICLE
(
   CODECOULEUR
);

create index CATEGORISER_FK on ARTICLE
(
   CODECAT
);


create table CATEGORIEARTICLECLIENT
(
   CODECAT                        char(5)                        not null,
   LIBELLECAT                     varchar(15),
   primary key (CODECAT)
)
type = InnoDB;

create table CLIENT
(
   CODECLI                        char(10)                       not null,
   NOMCLI                         char(30)                       not null,
   PRENOMCLI                      char(30)                       not null,
   ADRESSE                        longtext                       not null,
   CODEPOSTAL                     numeric(5,0)                   not null,
   VILLE                          char(256)                      not null,
   LOGIN                          char(10)                       not null,
   PWD                            char(50)                       not null,
   SALT                           char(50)                       not null,
   ROLE                           char(50),
   primary key (CODECLI)
)
type = InnoDB;

create table COMMANDE
(
   NUMEROCOMMANDE                 char(256)                      not null,
   CODECLI                        char(10)                       not null,
   primary key (NUMEROCOMMANDE)
)
type = InnoDB;

create index CONCERNE_FK on COMMANDE
(
   CODECLI
);

create table COULEUR
(
   CODECOULEUR                    char(10)                       not null,
   LIBELLECOULEUR                 varchar(20),
   primary key (CODECOULEUR)
)
type = InnoDB;


create table LIGNECOMMANDE
(
   NUMEROCOMMANDE                 char(256)                      not null,
   CODEART                        char(8)                        not null,
   QTE                            numeric(8,0),
   primary key (NUMEROCOMMANDE, CODEART)
)
type = InnoDB;

create index LIGNECOMMANDE_FK on LIGNECOMMANDE
(
   NUMEROCOMMANDE
);


create index LIGNECOMMANDE2_FK on LIGNECOMMANDE
(
   CODEART
);

alter table ARTICLE add constraint FK_CATEGORISER foreign key (CODECAT)
      references CATEGORIEARTICLECLIENT (CODECAT) on delete restrict on update restrict;

alter table ARTICLE add constraint FK_CORRESPOND foreign key (CODECOULEUR)
      references COULEUR (CODECOULEUR) on delete restrict on update restrict;

alter table COMMANDE add constraint FK_CONCERNE foreign key (CODECLI)
      references CLIENT (CODECLI) on delete restrict on update restrict;

alter table LIGNECOMMANDE add constraint FK_LIGNECOMMANDE foreign key (NUMEROCOMMANDE)
      references COMMANDE (NUMEROCOMMANDE) on delete restrict on update restrict;

alter table LIGNECOMMANDE add constraint FK_LIGNECOMMANDE2 foreign key (CODEART)
      references ARTICLE (CODEART) on delete restrict on update restrict;



