drop table if exists categorie_genre; 

create table categorie_genre (
  codeGenre VARCHAR(3),
  libelleGenre VARCHAR(10),
  CONSTRAINT pk_catGenre PRIMARY KEY(CodeGenre)
  );

                                                                                        