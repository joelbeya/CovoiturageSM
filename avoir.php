CREATE TABLE UTILISATEUR(
  ID_UTILISATEUR INTEGER(10) primary key,
  NOM VARCHAR(20),
  PRENOM VARCHAR(20),
  AGE INTEGER(2),
  SEXE CHECK (SEXE IN (HOMME, FEMME)),
  MAIL VARCHAR(50),
  MDP VARCHAR(30),
  ETAT BOOLEAN,
  NOTE INTEGER(2)
)


CREATE TABLE VOITURE(
  ID_VOITURE INTEGER(10) primary key,
  NB_PLACES INTEGER(2),
  ID_PROPRIETAIRE INTEGER(10),
  CONSTRAINT FK_PROP_VOI foreign key(ID_PROPRIETAIRE) references UTILISATEUR(ID_UTILISATEUR)
)

CREATE TABLE AVIS(
  ID_CONDUCTEUR INTEGER(10),
  ID_PASSAGER INTEGER(10),
  COMMENTAIRE TEXT,
  CONSTRAINT FK_CONDUCTEUR foreign key(ID_CONDUCTEUR) references UTILISATEUR(ID_UTILISATEUR),
  CONSTRAINT FK_PASSAGER foreign key(ID_PASSAGER) references UTILISATEUR(ID_UTILISATEUR)
)

CREATE TABLE TRAJET(
  ID_TRAJET INTEGER(10) primary key,
  TYPE BOOLEAN,
  VILLE_DEP VARCHAR(20),
  ADRESSE_DEPART VARCHAR(100),
  VILLE_ARR VARCHAR(20),
  ADRESSE_ARR VARCHAR(100),
  PRIX FLOAT(5,2),
  DATE_DEP DATE,
  DISPONIBLE BOOLEAN,
  ID_VOITURE INTEGER(10),
  CONSTRAINT FK_VOITURE foreign key(ID_VOITURE) references VOITURE(ID_UTILISATEUR)
)

CREATE TABLE FAIT_TRAJET(
  ID_TRAJET INTEGER(10),
  ID_PASSAGER INTEGER(10),
  CONSTRAINT FK_TRAJET foreign key(ID_TRAJET) references TRAJET(ID_TRAJET),