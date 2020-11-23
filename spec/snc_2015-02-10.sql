# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# H�te: 37.187.17.74 (MySQL 5.5.35)
# Base de donn�es: snc
# Temps de g�n�ration: 2015-02-10 19:48:32 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table ged
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ged`;

CREATE TABLE `ged` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idprojet` bigint(20) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `contentType` varchar(255) DEFAULT NULL,
  `dcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ged` WRITE;
/*!40000 ALTER TABLE `ged` DISABLE KEYS */;

INSERT INTO `ged` (`id`, `idprojet`, `fileName`, `contentType`, `dcreate`, `description`, `ordre`, `owner`)
VALUES
	(55,131,'Montgeron Crosne BV le 13 11 1984.pdf','application/pdf','2015-02-04 17:40:40',NULL,55,'jfduval'),
	(56,135,NULL,'application/octet-stream','2015-02-05 11:45:00',NULL,56,'cdelacroix'),
	(58,135,'201400695-Maisons-Alfort-Autorisation de Travaux.pdf','application/pdf','2015-02-05 11:50:31',NULL,58,'cdelacroix'),
	(59,135,'DEPLIANT_MA_EXE.pdf','application/pdf','2015-02-05 11:51:57',NULL,59,'cdelacroix');

/*!40000 ALTER TABLE `ged` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `classe` varchar(255) DEFAULT NULL,
  `idobj` bigint(20) NOT NULL,
  `typeobj` varchar(255) DEFAULT NULL,
  `nomobj` varchar(255) DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `coment` varchar(255) DEFAULT NULL,
  `tolist` varchar(255) DEFAULT NULL,
  `fromhost` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;

INSERT INTO `log` (`id`, `dcreate`, `classe`, `idobj`, `typeobj`, `nomobj`, `creator`, `action`, `status`, `coment`, `tolist`, `fromhost`)
VALUES
	(1,'2014-12-28 21:55:06','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(2,'2014-12-28 21:57:06','SYSTEM',0,'SYSTEM','LOGIN','elmos','logout','success','L\'utilisateur <b>elmos</b> s\'est deconnecté','','78.231.155.15'),
	(3,'2014-12-30 18:18:35','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','88.160.6.34'),
	(4,'2014-12-30 19:42:32','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','88.160.6.34'),
	(5,'2014-12-30 20:47:50','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(6,'2014-12-30 20:48:20','SYSTEM',0,'SYSTEM','LOGIN','elmos','logout','success','L\'utilisateur <b>elmos</b> s\'est deconnecté','','78.231.155.15'),
	(7,'2015-01-05 09:53:41','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.210.1'),
	(8,'2015-01-05 10:52:16','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.208.3'),
	(9,'2015-01-05 10:52:55','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.210.1'),
	(10,'2015-01-05 10:53:51','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br>Création du nouveau projet<br>','99CCFF','171.16.210.1'),
	(11,'2015-01-05 10:54:02','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br> Lancement de la phase <b>AVP </b><br>','99CCFF','171.16.210.1'),
	(12,'2015-01-05 10:54:02','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br> Lancement de la phase <b>APO </b><br>','99CCFF','171.16.210.1'),
	(13,'2015-01-05 10:54:03','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br> Lancement de la phase <b>PRO </b><br>','99CCFF','171.16.210.1'),
	(14,'2015-01-05 10:54:04','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br> Desactivation de la phase APO<br>','99CCFF','171.16.210.1'),
	(15,'2015-01-05 10:54:46','EVENT',131,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Montgeron (91)</a>','bkhobunthien','log','success','<br>Création du nouveau projet<br>','CA85FF','171.16.210.1'),
	(16,'2015-01-05 10:54:48','EVENT',131,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Montgeron (91)</a>','bkhobunthien','log','success','<br> Lancement de la phase <b>AVP </b><br>','CA85FF','171.16.210.1'),
	(17,'2015-01-05 10:54:49','EVENT',131,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Montgeron (91)</a>','bkhobunthien','log','success','<br> Lancement de la phase <b>PRO </b><br>','CA85FF','171.16.210.1'),
	(18,'2015-01-05 10:55:22','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br>Création du nouveau projet<br>','FF99A0','171.16.210.1'),
	(19,'2015-01-05 10:58:12','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br> La tache  <b>Tache 5 : Phase Dossier de Consultation des Entreprises</b> (N°:189) est achevée<br>','FF99A0','171.16.210.1'),
	(20,'2015-01-05 10:58:29','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br> la phase DCE est <b> achevée  </b><br>','FF99A0','171.16.210.1'),
	(21,'2015-01-05 10:58:40','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br> La tache  <b>Tache 7 : Phase réalisation du projet</b> (N°:191) a été supprimée<br>','FF99A0','171.16.210.1'),
	(22,'2015-01-05 10:58:44','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br> La tache  <b>Tache 6 : Phase passation des marchés</b> (N°:190) est achevée<br>','FF99A0','171.16.210.1'),
	(23,'2015-01-05 10:58:46','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br> la phase Marches est <b> achevée  </b><br>','FF99A0','171.16.210.1'),
	(24,'2015-01-05 11:11:41','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','jfduval','log','success','<br> La tache  <b>Commandes Lot 31</b> (N°:219) a été ajoutée<br>','FF99A0','171.16.208.3'),
	(25,'2015-01-05 12:08:17','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(26,'2015-01-05 15:22:47','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(27,'2015-01-05 15:37:18','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','jfduval','log','success','<br> La tache  <b>Participation réunion de lancement</b> (N°:220) a été ajoutée<br>','FF99A0','171.16.210.17'),
	(28,'2015-01-05 17:14:26','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(29,'2015-01-05 17:16:30','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','jfduval','log','success','<br> La tache  <b>Communication riverains</b> (N°:221) a été ajoutée<br>','FF99A0','171.16.210.17'),
	(30,'2015-01-05 17:16:57','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','jfduval','log','success','<br> La tache  <b>Présentation à l\'exploitant</b> (N°:222) a été ajoutée<br>','FF99A0','171.16.210.17'),
	(31,'2015-01-05 17:31:08','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.210.1'),
	(32,'2015-01-05 17:32:10','EVENT',132,'User',' <a class=libelle_programme>SDA</a> | <a class=libelle_phase> G.de Combs-la-Ville (77)</a>','bkhobunthien','log','success','<br>@<a class=\'libelle_user\'>Duval Jean-François</a> : <pre>Phase test lancée?</pre><br>','666699','171.16.210.1'),
	(33,'2015-01-05 18:07:21','SYSTEM',0,'SYSTEM','LOGIN','jfduval','logout','success','L\'utilisateur <b>jfduval</b> s\'est deconnecté','','171.16.210.17'),
	(34,'2015-01-06 09:31:20','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(35,'2015-01-06 10:06:43','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(36,'2015-01-06 11:13:04','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(37,'2015-01-06 14:27:37','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.17'),
	(38,'2015-01-07 16:44:29','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.2'),
	(39,'2015-01-08 10:42:33','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.2'),
	(40,'2015-01-15 22:40:09','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(41,'2015-01-22 10:18:42','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.2'),
	(42,'2015-01-22 10:33:43','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','logout','success','L\'utilisateur <b>bkhobunthien</b> s\'est deconnecté','','171.16.208.2'),
	(43,'2015-01-24 09:26:59','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','80.215.193.149'),
	(44,'2015-01-24 17:51:15','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','80.215.227.143'),
	(45,'2015-01-25 11:07:48','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(46,'2015-01-25 11:08:41','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(47,'2015-01-25 12:35:12','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','82.227.103.5'),
	(48,'2015-01-25 12:35:21','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','82.227.103.5'),
	(49,'2015-01-25 18:29:48','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(50,'2015-01-25 18:30:07','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','elmos','log','success','<br> La tache  <b>Présentation à l\'exploitant</b> (N°:222) est achevée<br>','FF99A0','78.231.155.15'),
	(51,'2015-01-25 18:30:15','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','elmos','log','success','<br> La tache  <b>Communication riverains</b> (N°:221) est achevée<br>','FF99A0','78.231.155.15'),
	(52,'2015-01-25 18:30:23','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','elmos','log','success','<br> La tache  <b>Participation réunion de lancement</b> (N°:220) a été bloquée<br>','FF99A0','78.231.155.15'),
	(53,'2015-01-25 18:30:41','SYSTEM',0,'SYSTEM','LOGIN','elmos','logout','success','L\'utilisateur <b>elmos</b> s\'est deconnecté','','78.231.155.15'),
	(54,'2015-01-25 19:22:44','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(55,'2015-01-26 09:11:25','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.2'),
	(56,'2015-01-26 10:01:36','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','82.227.103.5'),
	(57,'2015-01-26 14:49:52','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.4'),
	(58,'2015-01-26 14:53:44','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br> La tache  <b>Acquisition des levés topo et réseaux</b> (N°:130) est achevée<br>','99CCFF','171.16.208.4'),
	(59,'2015-01-26 14:53:55','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','bkhobunthien','log','success','<br> La tache  <b>Remise du plan d\'aménagement</b> (N°:131) est achevée<br>','99CCFF','171.16.208.4'),
	(60,'2015-01-26 21:25:51','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(61,'2015-01-27 09:17:09','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','80.215.133.169'),
	(62,'2015-01-27 09:17:40','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','80.215.133.169'),
	(63,'2015-01-27 09:18:00','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','82.227.103.5'),
	(64,'2015-01-27 11:18:53','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','82.227.103.5'),
	(65,'2015-01-27 11:19:52','SYSTEM',0,'SYSTEM','LOGIN','elmos','logout','success','L\'utilisateur <b>elmos</b> s\'est deconnecté','','82.227.103.5'),
	(66,'2015-01-27 11:20:42','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','82.227.103.5'),
	(67,'2015-01-27 11:21:27','SYSTEM',0,'SYSTEM','LOGIN','elmos','logout','success','L\'utilisateur <b>elmos</b> s\'est deconnecté','','82.227.103.5'),
	(68,'2015-01-27 20:36:37','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(69,'2015-01-29 20:12:07','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(70,'2015-02-01 21:04:27','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','37.165.18.216'),
	(71,'2015-02-03 22:11:00','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(72,'2015-02-04 10:27:04','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','37.160.3.141'),
	(73,'2015-02-04 11:21:17','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','37.160.198.113'),
	(74,'2015-02-04 13:04:23','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','80.215.199.2'),
	(75,'2015-02-04 13:04:45','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','37.163.131.25'),
	(76,'2015-02-04 16:58:31','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.250.53.181'),
	(77,'2015-02-04 17:12:18','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.2'),
	(78,'2015-02-04 17:15:28','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.2'),
	(79,'2015-02-04 17:15:57','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','jfduval','log','success','<br> La tache  <b>Participation réunion de lancement</b> (N¡:220) est achevee<br>','FF99A0','171.16.210.2'),
	(80,'2015-02-04 17:26:04','SYSTEM',0,'SYSTEM','LOGIN','jnhelmer','login','success','L\'utilisateur <b>jnhelmer</b> s\'est connecté','','171.16.208.4'),
	(81,'2015-02-04 17:29:28','EVENT',132,'User',' <a class=libelle_programme>SDA</a> | <a class=libelle_phase> G.de Combs-la-Ville (77)</a>','jnhelmer','log','success','<br>@<a class=\'libelle_user\'>Duval Jean-François</a> : <pre>Ca va?</pre>','666699','171.16.208.4'),
	(82,'2015-02-04 17:33:14','SYSTEM',0,'SYSTEM','LOGIN','jnhelmer','login','success','L\'utilisateur <b>jnhelmer</b> s\'est connecté','','171.16.208.4'),
	(83,'2015-02-04 17:36:01','EVENT',131,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Montgeron (91)</a>','jnhelmer','log','success','<br> La tache  <b>diagnostic sonorisation</b> (N¡:223) a ete ajoutee<br>','CA85FF','171.16.208.4'),
	(84,'2015-02-04 17:36:27','EVENT',130,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Brunoy (91)</a>','jnhelmer','log','success','<br> La tache  <b>diagnostic sonorisation</b> (N¡:224) a ete ajoutee<br>','99CCFF','171.16.208.4'),
	(85,'2015-02-04 17:38:50','EVENT',133,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br>Creation du nouveau projet<br>','30FF61','171.16.208.4'),
	(86,'2015-02-04 17:39:33','EVENT',131,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Montgeron (91)</a>','jfduval','log','success','<br>Mise a jour projet<br>','CA85FF','171.16.210.2'),
	(87,'2015-02-04 17:44:00','EVENT',133,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br>Suppression du projet<br>','30FF61','171.16.208.4'),
	(88,'2015-02-04 17:44:35','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br>Creation du nouveau projet<br>','33FF55','171.16.208.4'),
	(89,'2015-02-04 17:44:45','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> Lancement de la phase <b>PRO </b><br>','33FF55','171.16.208.4'),
	(90,'2015-02-04 17:44:45','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> Lancement de la phase <b>APO </b><br>','33FF55','171.16.208.4'),
	(91,'2015-02-04 17:44:46','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> Desactivation de la phase PRO<br>','33FF55','171.16.208.4'),
	(92,'2015-02-04 17:44:47','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> Desactivation de la phase APO<br>','33FF55','171.16.208.4'),
	(93,'2015-02-04 17:45:12','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Courrier de notification de lancement dossier à MOE</b> (N¡:433) a ete supprimee<br>','33FF55','171.16.208.4'),
	(94,'2015-02-04 17:45:14','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Réunion de Lancement communication</b> (N¡:434) a ete supprimee<br>','33FF55','171.16.208.4'),
	(95,'2015-02-04 17:45:17','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Réception et avis sur DCE minute</b> (N¡:435) a ete supprimee<br>','33FF55','171.16.208.4'),
	(96,'2015-02-04 17:45:20','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Réception DCE définitif</b> (N¡:436) a ete supprimee<br>','33FF55','171.16.208.4'),
	(97,'2015-02-04 17:45:23','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Mise à jour outils comptables (comptes et lots GEREMI)</b> (N¡:432) est achevee<br>','33FF55','171.16.208.4'),
	(98,'2015-02-04 17:45:25','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> la phase DCE est <b> achevee  </b><br>','33FF55','171.16.208.4'),
	(99,'2015-02-04 17:45:34','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Envoi DCE aux achats</b> (N¡:438) a ete supprimee<br>','33FF55','171.16.208.4'),
	(100,'2015-02-04 17:45:36','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Validation liste des entreprises à consulter</b> (N¡:439) a ete supprimee<br>','33FF55','171.16.208.4'),
	(101,'2015-02-04 17:45:39','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Passage en comité d\'engagement avant attribution des marchés</b> (N¡:440) a ete supprimee<br>','33FF55','171.16.208.4'),
	(102,'2015-02-04 17:45:41','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Signature de(s) commande(s)</b> (N¡:441) a ete supprimee<br>','33FF55','171.16.208.4'),
	(103,'2015-02-04 17:45:45','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> La tache  <b>Validation Note de présentation stratégie marché</b> (N¡:437) est achevee<br>','33FF55','171.16.208.4'),
	(104,'2015-02-04 17:45:48','EVENT',134,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Yerres (91)</a>','jnhelmer','log','success','<br> la phase Marches est <b> achevee  </b><br>','33FF55','171.16.208.4'),
	(105,'2015-02-04 17:47:02','SYSTEM',0,'SYSTEM','LOGIN','jnhelmer','logout','success','L\'utilisateur <b>jnhelmer</b> s\'est deconnecté','','171.16.208.4'),
	(106,'2015-02-04 18:20:10','SYSTEM',0,'SYSTEM','LOGIN','jfduval','logout','success','L\'utilisateur <b>jfduval</b> s\'est deconnecté','','171.16.210.2'),
	(107,'2015-02-05 11:34:29','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.2'),
	(108,'2015-02-05 11:36:31','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','login','success','L\'utilisateur <b>cdelacroix</b> s\'est connecté','','171.16.208.3'),
	(109,'2015-02-05 11:38:10','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br>Creation du nouveau projet<br>','57FFA5','171.16.208.3'),
	(110,'2015-02-05 11:40:46','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Courrier de notification de lancement dossier à MOE</b> (N¡:560) a ete supprimee<br>','57FFA5','171.16.208.3'),
	(111,'2015-02-05 11:40:50','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Réunion de Lancement communication</b> (N¡:561) a ete supprimee<br>','57FFA5','171.16.208.3'),
	(112,'2015-02-05 11:40:53','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Réception et avis sur DCE minute</b> (N¡:562) a ete supprimee<br>','57FFA5','171.16.208.3'),
	(113,'2015-02-05 11:40:55','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Réception DCE définitif</b> (N¡:563) a ete supprimee<br>','57FFA5','171.16.208.3'),
	(114,'2015-02-05 11:40:59','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Mise à jour outils comptables (comptes et lots GEREMI)</b> (N¡:559) est achevee<br>','57FFA5','171.16.208.3'),
	(115,'2015-02-05 11:41:31','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> la phase DCE est <b> achevee  </b><br>','57FFA5','171.16.208.2'),
	(116,'2015-02-05 11:41:39','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> La tache  <b>Envoi DCE aux achats</b> (N¡:565) a ete supprimee<br>','57FFA5','171.16.208.2'),
	(117,'2015-02-05 11:41:41','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> La tache  <b>Validation liste des entreprises à consulter</b> (N¡:566) a ete supprimee<br>','57FFA5','171.16.208.2'),
	(118,'2015-02-05 11:41:43','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> La tache  <b>Passage en comité d\'engagement avant attribution des marchés</b> (N¡:567) a ete supprimee<br>','57FFA5','171.16.208.2'),
	(119,'2015-02-05 11:41:46','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> La tache  <b>Signature de(s) commande(s)</b> (N¡:568) a ete supprimee<br>','57FFA5','171.16.208.2'),
	(120,'2015-02-05 11:41:49','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> La tache  <b>Validation Note de présentation stratégie marché</b> (N¡:564) est achevee<br>','57FFA5','171.16.208.2'),
	(121,'2015-02-05 11:41:51','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','bkhobunthien','log','success','<br> la phase Marches est <b> achevee  </b><br>','57FFA5','171.16.208.2'),
	(122,'2015-02-05 11:43:30','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Courrier de notification de lancement de phase à MOE</b> (N¡:570) est achevee<br>','57FFA5','171.16.208.3'),
	(123,'2015-02-05 11:48:57','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Affichage réglementaire (PC ou DP+AT)</b> (N¡:572) est achevee<br>','57FFA5','171.16.208.3'),
	(124,'2015-02-05 11:49:05','EVENT',135,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br> La tache  <b>Déploiement communication</b> (N¡:571) est achevee<br>','57FFA5','171.16.208.3'),
	(125,'2015-02-05 12:02:25','EVENT',135,'User',' <a class=libelle_programme>SDA</a> | <a class=libelle_phase> G.de Maisons-Alfort Alfortville (94)</a>','cdelacroix','log','success','<br>@<a class=\'libelle_user\'>Tous</a> : <pre>Ca marche? </pre>','666699','171.16.208.3'),
	(126,'2015-02-05 12:03:13','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','logout','success','L\'utilisateur <b>cdelacroix</b> s\'est deconnecté','','171.16.208.3'),
	(127,'2015-02-05 12:03:19','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','login','success','L\'utilisateur <b>cdelacroix</b> s\'est connecté','','171.16.208.3'),
	(128,'2015-02-05 13:29:02','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(129,'2015-02-05 13:53:46','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(132,'2015-02-05 14:07:57','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','login','success','L\'utilisateur <b>cdelacroix</b> s\'est connecté','','171.16.208.3'),
	(133,'2015-02-05 14:34:45','SYSTEM',0,'SYSTEM','LOGIN','jfduval','login','success','L\'utilisateur <b>jfduval</b> s\'est connecté','','171.16.210.2'),
	(134,'2015-02-05 15:25:53','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','login','success','L\'utilisateur <b>cdelacroix</b> s\'est connecté','','171.16.208.3'),
	(135,'2015-02-05 15:26:45','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','logout','success','L\'utilisateur <b>cdelacroix</b> s\'est deconnecté','','171.16.208.3'),
	(136,'2015-02-05 15:26:51','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','login','success','L\'utilisateur <b>cdelacroix</b> s\'est connecté','','171.16.208.3'),
	(137,'2015-02-05 15:28:06','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','logout','success','L\'utilisateur <b>cdelacroix</b> s\'est deconnecté','','171.16.208.3'),
	(138,'2015-02-05 15:28:18','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','login','success','L\'utilisateur <b>cdelacroix</b> s\'est connecté','','171.16.208.2'),
	(139,'2015-02-05 15:30:28','SYSTEM',0,'SYSTEM','LOGIN','cdelacroix','logout','success','L\'utilisateur <b>cdelacroix</b> s\'est deconnecté','','171.16.208.2'),
	(140,'2015-02-05 15:34:29','EVENT',132,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G.de Combs-la-Ville (77)</a>','jfduval','log','success','<br> La tache  <b>Organisation d\'un petit déjeuner</b> (N°:607) a été ajoutée<br>','FF99A0','171.16.210.2'),
	(141,'2015-02-06 14:42:25','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(142,'2015-02-06 16:00:36','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(143,'2015-02-06 17:49:53','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(144,'2015-02-06 19:07:37','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.250.118.121'),
	(146,'2015-02-06 19:55:35','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15'),
	(147,'2015-02-06 19:58:19','SYSTEM',0,'SYSTEM','LOGIN','elmos','logout','success','L\'utilisateur <b>elmos</b> s\'est deconnecté','','78.231.155.15'),
	(148,'2015-02-06 20:10:05','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.250.118.121'),
	(149,'2015-02-07 16:13:29','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.250.109.137'),
	(150,'2015-02-09 08:52:12','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.250.1.210'),
	(151,'2015-02-09 10:28:37','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.2'),
	(152,'2015-02-09 10:32:48','EVENT',136,'Gare','<a class=\'libelle_programme\'>SDA</a> | <a class=\'libelle_phase\'>G. Le Mée (77)</a>','bkhobunthien','log','success','<br>Création du nouveau projet<br>','BB80FF','171.16.208.2'),
	(153,'2015-02-10 15:48:23','SYSTEM',0,'SYSTEM','LOGIN','bkhobunthien','login','success','L\'utilisateur <b>bkhobunthien</b> s\'est connecté','','171.16.208.2'),
	(154,'2015-02-10 20:42:56','SYSTEM',0,'SYSTEM','LOGIN','elmos','login','success','L\'utilisateur <b>elmos</b> s\'est connecté','','78.231.155.15');

/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table objet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objet`;

CREATE TABLE `objet` (
  `idref` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordre` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) DEFAULT NULL,
  `idresponsable` bigint(20) DEFAULT '0',
  PRIMARY KEY (`idref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `objet` WRITE;
/*!40000 ALTER TABLE `objet` DISABLE KEYS */;

INSERT INTO `objet` (`idref`, `ordre`, `nom`, `description`, `categorie`, `idresponsable`)
VALUES
	(1,1,'SDA','Schema Directeur d Accessibilitee','PROGRAMME',0),
	(2,2,'Impaqt','Programme de mise a  niveau des Gares','PROGRAMME',0),
	(3,3,'GPPT','Grand Plan des Petits Travaux','PROGRAMME',0),
	(4,4,'G.de Paris Gare de Lyon (75)','','GARE',0),
	(5,5,'G.de Créteil Pompadour (94)','','GARE',0),
	(6,6,'G.de Yerres (91)','','GARE',0),
	(7,7,'G.de Combs-la-Ville (77)','','GARE',0),
	(8,8,'G.de Stade de France (93)','','GARE',0),
	(10,10,'G.de Melun (77)','','GARE',0),
	(11,11,'G.de Savigny le Temple (77)','','GARE',0),
	(12,12,'G. Le Mée (77)','','GARE',0),
	(13,13,'G.de Lieusaint Moissy (77)','','GARE',0),
	(16,16,'G.de Goussainville (95)','','GARE',0),
	(17,17,'G.de Montereau (45)','','GARE',0),
	(18,18,'G.de Vert de Maison (94)','','GARE',0),
	(19,19,'G.de Maisons-Alfort Alfortville (94)','','GARE',0),
	(20,20,'G.Villeneuve St Georges (94)','','GARE',0),
	(24,24,'CONDUCTEUR','Utilisation','PROFILE',0),
	(25,25,'CONTRIBUTEUR','Utilisation','PROFILE',0),
	(26,26,'DIRECTEUR PROJET','Utilisation','PROFILE',0),
	(27,27,'DIRECTEUR LIGNE','Utilisation','PROFILE',0),
	(28,28,'full','Administration','PROFILE',0),
	(33,33,'UploadPath','/opt/apache-tomcat-7.0.39/data','UTIL',0),
	(36,36,'G.de Brunoy (91)','','GARE',0),
	(37,37,'G.de Montgeron (91)','','GARE',0);

/*!40000 ALTER TABLE `objet` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table phase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phase`;

CREATE TABLE `phase` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idprojet` bigint(20) NOT NULL,
  `idref` bigint(20) NOT NULL,
  `ordre` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `obligatoire` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dstart` timestamp NULL DEFAULT NULL,
  `dfin` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `phase` WRITE;
/*!40000 ALTER TABLE `phase` DISABLE KEYS */;

INSERT INTO `phase` (`id`, `idprojet`, `idref`, `ordre`, `nom`, `description`, `obligatoire`, `active`, `status`, `dstart`, `dfin`)
VALUES
	(29,130,1,1,'EP','Phase d\'Etude Préliminaire','no','no','to_be_started',NULL,NULL),
	(30,130,2,2,'AVP','Phase Avant-Projet','no','yes','in_progress','2015-01-26 14:53:44',NULL),
	(31,130,3,3,'APO','Phase Avant-Projet / Projet','no','no','to_be_started',NULL,NULL),
	(32,130,4,4,'PRO','Phase Projet','no','yes','to_be_started',NULL,NULL),
	(33,130,5,5,'DCE','Phase Dossier de Consultation des Entreprises','yes','yes','to_be_started',NULL,NULL),
	(34,130,6,6,'Marches','Phase passation des marchés','yes','yes','to_be_started',NULL,NULL),
	(35,130,7,7,'REA','Phase réalisation du projet','yes','yes','to_be_started',NULL,NULL),
	(36,131,1,1,'EP','Phase d\'Etude Préliminaire','no','no','to_be_started',NULL,NULL),
	(37,131,2,2,'AVP','Phase Avant-Projet','no','yes','in_progress_init',NULL,NULL),
	(38,131,3,3,'APO','Phase Avant-Projet / Projet','no','no','to_be_started',NULL,NULL),
	(39,131,4,4,'PRO','Phase Projet','no','yes','to_be_started',NULL,NULL),
	(40,131,5,5,'DCE','Phase Dossier de Consultation des Entreprises','yes','yes','to_be_started',NULL,NULL),
	(41,131,6,6,'Marches','Phase passation des marchés','yes','yes','to_be_started',NULL,NULL),
	(42,131,7,7,'REA','Phase réalisation du projet','yes','yes','to_be_started',NULL,NULL),
	(43,132,1,1,'EP','Phase d\'Etude Préliminaire','no','no','to_be_started',NULL,NULL),
	(44,132,2,2,'AVP','Phase Avant-Projet','no','no','to_be_started',NULL,NULL),
	(45,132,3,3,'APO','Phase Avant-Projet / Projet','no','no','to_be_started',NULL,NULL),
	(46,132,4,4,'PRO','Phase Projet','no','no','to_be_started',NULL,NULL),
	(47,132,5,5,'DCE','Phase Dossier de Consultation des Entreprises','yes','yes','completed','2015-01-05 10:58:12','2015-01-05 10:58:29'),
	(48,132,6,6,'Marches','Phase passation des marchés','yes','yes','completed','2015-01-05 10:58:44','2015-01-05 10:58:46'),
	(49,132,7,7,'REA','Phase réalisation du projet','yes','yes','in_progress','2015-01-25 18:30:07',NULL),
	(57,134,1,1,'EP','Phase d\'Etude Préliminaire','no','no','to_be_started',NULL,NULL),
	(58,134,2,2,'AVP','Phase Avant-Projet','no','no','to_be_started',NULL,NULL),
	(59,134,3,3,'APO','Phase Avant-Projet / Projet','no','no','to_be_started',NULL,NULL),
	(60,134,4,4,'PRO','Phase Projet','no','no','to_be_started',NULL,NULL),
	(61,134,5,5,'DCE','Phase Dossier de Consultation des Entreprises','yes','yes','completed','2015-02-04 17:45:23','2015-02-04 17:45:25'),
	(62,134,6,6,'Marches','Phase passation des marchés','yes','yes','completed','2015-02-04 17:45:45','2015-02-04 17:45:48'),
	(63,134,7,7,'REA','Phase réalisation du projet','yes','yes','in_progress_init',NULL,NULL),
	(64,135,1,1,'EP','Phase d\'Etude Préliminaire','no','no','to_be_started',NULL,NULL),
	(65,135,2,2,'AVP','Phase Avant-Projet','no','no','to_be_started',NULL,NULL),
	(66,135,3,3,'APO','Phase Avant-Projet / Projet','no','no','to_be_started',NULL,NULL),
	(67,135,4,4,'PRO','Phase Projet','no','no','to_be_started',NULL,NULL),
	(68,135,5,5,'DCE','Phase Dossier de Consultation des Entreprises','yes','yes','completed','2015-02-05 11:40:59','2015-02-05 11:41:31'),
	(69,135,6,6,'Marches','Phase passation des marchés','yes','yes','completed','2015-02-05 11:41:49','2015-02-05 11:41:51'),
	(70,135,7,7,'REA','Phase réalisation du projet','yes','yes','in_progress','2015-02-05 11:43:30',NULL),
	(71,136,1,1,'EP','Phase d\'Etude Préliminaire','no','no','to_be_started',NULL,NULL),
	(72,136,2,2,'AVP','Phase Avant-Projet','no','no','to_be_started',NULL,NULL),
	(73,136,3,3,'APO','Phase Avant-Projet / Projet','no','no','to_be_started',NULL,NULL),
	(74,136,4,4,'PRO','Phase Projet','no','no','to_be_started',NULL,NULL),
	(75,136,5,5,'DCE','Phase Dossier de Consultation des Entreprises','no','no','to_be_started',NULL,NULL),
	(76,136,6,6,'Marches','Phase passation des marchés','no','no','to_be_started',NULL,NULL),
	(77,136,7,7,'REA','Phase réalisation du projet','yes','yes','in_progress_init',NULL,NULL);

/*!40000 ALTER TABLE `phase` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table projet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projet`;

CREATE TABLE `projet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idref` bigint(20) NOT NULL,
  `idprogramme` bigint(20) NOT NULL,
  `idgare` bigint(20) NOT NULL,
  `iddp` bigint(20) DEFAULT NULL,
  `idcp` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `couleur` varchar(255) DEFAULT NULL,
  `codebudget` varchar(255) DEFAULT NULL,
  `dstart` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dfinprev` date DEFAULT NULL,
  `dfin` timestamp NULL DEFAULT NULL,
  `phaseencours` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `projet` WRITE;
/*!40000 ALTER TABLE `projet` DISABLE KEYS */;

INSERT INTO `projet` (`id`, `idref`, `idprogramme`, `idgare`, `iddp`, `idcp`, `status`, `couleur`, `codebudget`, `dstart`, `dfinprev`, `dfin`, `phaseencours`)
VALUES
	(130,1,1,36,28,27,'in_progress','99CCFF','','2015-01-05 10:54:02','2020-01-01',NULL,'AVP'),
	(131,1,1,37,28,27,'in_progress','CA85FF','','2015-01-05 10:54:48','2020-01-01',NULL,'AVP'),
	(132,1,1,7,28,27,'in_progress','FF99A0','','2015-01-05 10:58:46','2016-07-01',NULL,'REA'),
	(134,1,1,6,30,27,'in_progress','33FF55','','2015-02-04 17:45:48','2015-12-31',NULL,'REA'),
	(135,1,1,19,28,29,'in_progress','57FFA5','J90122','2015-02-05 11:41:51','2015-09-30',NULL,'REA'),
	(136,1,1,12,30,31,'in_progress','BB80FF','','2015-02-09 10:32:48','2018-02-20',NULL,'REA');

/*!40000 ALTER TABLE `projet` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table refphase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `refphase`;

CREATE TABLE `refphase` (
  `idref` bigint(20) NOT NULL AUTO_INCREMENT,
  `idrefprojet` bigint(20) NOT NULL,
  `ordre` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `obligatoire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `refphase` WRITE;
/*!40000 ALTER TABLE `refphase` DISABLE KEYS */;

INSERT INTO `refphase` (`idref`, `idrefprojet`, `ordre`, `nom`, `description`, `obligatoire`)
VALUES
	(1,1,1,'EP','Phase d\'Etude Préliminaire','no'),
	(2,1,2,'AVP','Phase Avant-Projet','no'),
	(3,1,3,'APO','Phase Avant-Projet / Projet','no'),
	(4,1,4,'PRO','Phase Projet','no'),
	(5,1,5,'DCE','Phase Dossier de Consultation des Entreprises','no'),
	(6,1,6,'Marches','Phase passation des marchés','no'),
	(7,1,7,'REA','Phase réalisation du projet','yes');

/*!40000 ALTER TABLE `refphase` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table refprojet
# ------------------------------------------------------------

DROP TABLE IF EXISTS `refprojet`;

CREATE TABLE `refprojet` (
  `idref` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordre` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table reftache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reftache`;

CREATE TABLE `reftache` (
  `idref` bigint(20) NOT NULL AUTO_INCREMENT,
  `idrefphase` bigint(20) NOT NULL,
  `ordre` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `obligatoire` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idref`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `reftache` WRITE;
/*!40000 ALTER TABLE `reftache` DISABLE KEYS */;

INSERT INTO `reftache` (`idref`, `idrefphase`, `ordre`, `nom`, `description`, `obligatoire`)
VALUES
	(1,1,1,'Mise en place outils comptables (comptes et lots GEREMI)','','yes'),
	(2,1,2,'Offre puis courrier de notification de lancement de phase à MOE','','yes'),
	(3,1,3,'Recensement des projets connexes','','yes'),
	(4,1,4,'Diagnostics de la gare (éclairage, sono, amiante et plomb, puissance)','','yes'),
	(5,1,5,'Comité financeur STIF/RIF','','yes'),
	(6,1,6,'Réception EP minute','','yes'),
	(7,1,7,'Etoilage EP minute à ELT+Maintenance+Equipements','','yes'),
	(8,1,8,'Réception EP définitive','','yes'),
	(9,1,9,'2me Comité Financeur','','yes'),
	(10,1,10,'Passage en comité d\'engagement','','yes'),
	(11,1,11,'Présentation en mairie','','yes'),
	(12,1,12,'Courrier validation EP définitive (avec remarques ELT/MOA pour AVP ou APO)','','yes'),
	(13,2,1,'Mise en place outils comptables (comptes et lots GEREMI)','','yes'),
	(14,2,2,'Offre puis courrier de notification de lancement de phase à MOE','','yes'),
	(15,2,3,'Transmission du programme détaillé validé ELT à MOE','','yes'),
	(16,2,4,'Consultation et contractualisation pour CSPS','','yes'),
	(17,2,5,'Consultation et contractualisation pour CT','','yes'),
	(18,2,6,'Acquisitions de données d\'entrée','','yes'),
	(19,2,7,'Réception et avis sur plan aménagement','','yes'),
	(20,2,8,'Réception et avis sur plan POG/POQ','','yes'),
	(21,2,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','','yes'),
	(22,2,10,'Réception AVP minute','','yes'),
	(23,2,11,'Obtenir avis CT sur AVP minute','','yes'),
	(24,2,12,'Obtenir avis CSPS sur AVP minute','','yes'),
	(25,2,13,'Etoilage AVP minute à ELT (+COSI)+Maintenance+Equipements','','yes'),
	(26,2,14,'Obtenir avis IGSI sur AVP minute','','yes'),
	(27,2,15,'Note avis sur AVP minute à MOE','','yes'),
	(28,2,16,'Réception AVP définitif','','yes'),
	(29,2,17,'Etoilage AVP définitif à ELT + CT + CSPS','','yes'),
	(30,2,18,'Préparation de la stratégie marchés','','yes'),
	(31,2,19,'Passage en comité d\'engagement','','yes'),
	(32,2,20,'Courrier validation AVP définitif (avec remarques ELT/CT/MOA pour PRO)','','yes'),
	(33,3,1,'Mise en place outils comptables (comptes et lots GEREMI)','','yes'),
	(34,3,2,'Offre puis courrier de notification de lancement de phase à MOE','','yes'),
	(35,3,3,'Transmission du programme détaillé validé ELT à MOE','','yes'),
	(36,3,4,'Consultation et contractualisation pour CSPS','','yes'),
	(37,3,5,'Consultation et contractualisation pour CT','','yes'),
	(38,3,6,'Acquisitions de données d\'entrée','','yes'),
	(39,3,7,'Réception et avis sur plan aménagement','','yes'),
	(40,3,8,'Réception et avis sur plan POG/POQ','','yes'),
	(41,3,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','','yes'),
	(42,3,10,'Lancement dossier PC','','yes'),
	(43,3,11,'Avis IGSI sur PC','','yes'),
	(44,3,12,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','','yes'),
	(45,3,13,'Réception APO minute','','yes'),
	(46,3,14,'Obtenir avis CT sur APO minute','','yes'),
	(47,3,15,'Obtenir avis CSPS sur APO minute','','yes'),
	(48,3,16,'Etoilage APO minute à ELT (+COSI)+Maintenance+Equipements','','yes'),
	(49,3,17,'Retour dossier PC','','yes'),
	(50,3,18,'Note avis sur APO minute à MOE','','yes'),
	(51,3,19,'Réception APO définitif','','yes'),
	(52,3,20,'Etoilage APO définitif à ELT + CT + CSPS','','yes'),
	(53,3,21,'Réception Rapport Initial du CT (RICT)','','yes'),
	(54,3,22,'Réception PGC du CSPS','','yes'),
	(55,3,23,'Stratégie marchés','','yes'),
	(56,3,24,'Passage en comité d\'engagement','','yes'),
	(57,3,25,'Courrier validation APO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','','yes'),
	(58,4,1,'Mise en place outils comptables (comptes et lots GEREMI)','','yes'),
	(59,4,2,'Offre puis courrier de notification de lancement de phase à MOE','','yes'),
	(60,4,3,'Transmission du programme détaillé validé ELT à MOE','','yes'),
	(61,4,4,'Vérification marché CSPS + CT','','yes'),
	(62,4,5,'Réception et avis sur plan aménagement','','yes'),
	(63,4,6,'Réception et avis sur plan POG/POQ','','yes'),
	(64,4,7,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','','yes'),
	(65,4,8,'Lancement dossier PC','','yes'),
	(66,4,9,'Avis IGSI sur PC','','yes'),
	(67,4,10,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','','yes'),
	(68,4,11,'Réception PRO minute','','yes'),
	(69,4,12,'Obtenir avis CT sur PRO minute','','yes'),
	(70,4,13,'Obtenir avis CSPS sur PRO minute','','yes'),
	(71,4,14,'Etoilage PRO minute à ELT (+COSI)+Maintenance+Equipements','','yes'),
	(72,4,15,'Retour dossier PC','','yes'),
	(73,4,16,'Note avis sur PRO minute à MOE','','yes'),
	(74,4,17,'Réception PRO définitif','','yes'),
	(75,4,18,'Etoilage PRO définitif à ELT + CT + CSPS','','yes'),
	(76,4,19,'Réception Rapport Initial du CT (RICT)','','yes'),
	(77,4,20,'Réception PGC du CSPS','','yes'),
	(78,4,21,'Finalisation de la stratégie marchés','','yes'),
	(79,4,22,'Passage en comité d\'engagement','','yes'),
	(80,4,23,'Courrier validation PRO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','','yes'),
	(81,5,1,'Mise à jour outils comptables (comptes et lots GEREMI)','','yes'),
	(82,5,2,'Courrier de notification de lancement dossier à MOE','','yes'),
	(83,5,3,'Réunion de Lancement communication','','yes'),
	(84,5,4,'Réception et avis sur DCE minute','','yes'),
	(85,5,5,'Réception DCE définitif','','yes'),
	(86,6,1,'Validation Note de présentation stratégie marché','','yes'),
	(87,6,2,'Envoi DCE aux achats','','yes'),
	(88,6,3,'Validation liste des entreprises à consulter','','yes'),
	(89,6,4,'Passage en comité d\'engagement avant attribution des marchés','','yes'),
	(90,6,5,'Signature de(s) commande(s)','','yes'),
	(91,7,1,'Mise à jours outils comptables (comptes et lots GEREMI)','','yes'),
	(92,7,2,'Courrier de notification de lancement de phase à MOE','','yes'),
	(93,7,3,'Déploiement communication','','yes'),
	(94,7,4,'Affichage réglementaire (PC ou DP+AT)','','yes'),
	(95,7,5,'Préparation panneau de chantier avec TN COM','','yes'),
	(96,7,6,'Alerter Patrimoine et Maintenance pour entrée en REA','','yes'),
	(97,7,7,'Déclaration ouverture de chantier','','yes'),
	(98,7,8,'Réalisation des ICP par le CSPS avant travaux','','yes'),
	(99,7,9,'Faire déclaration CRAMIF/OPPBTP/Inspection du travail','','yes'),
	(100,7,10,'En fin de travaux, réception docs (VIEL, RVRAT,) par CT','','yes'),
	(101,7,11,'Réception des travaux','','yes'),
	(102,7,12,'Réception DOE','','yes'),
	(103,7,13,'Décompte final pour les marchés','','yes'),
	(104,7,14,'Déclaration de fin de chantier','','yes'),
	(105,7,15,'Remise à l\'exploitant + maintenance','','yes');

/*!40000 ALTER TABLE `reftache` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table tache
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tache`;

CREATE TABLE `tache` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idphase` bigint(20) NOT NULL,
  `idref` bigint(20) NOT NULL,
  `ordre` bigint(20) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `idresponsable` bigint(20) DEFAULT NULL,
  `visibilite` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dstart` timestamp NULL DEFAULT NULL,
  `dfinprev` timestamp NULL DEFAULT NULL,
  `dfin` timestamp NULL DEFAULT NULL,
  `dstartprev` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tache` WRITE;
/*!40000 ALTER TABLE `tache` DISABLE KEYS */;

INSERT INTO `tache` (`id`, `idphase`, `idref`, `ordre`, `nom`, `description`, `idresponsable`, `visibilite`, `status`, `dstart`, `dfinprev`, `dfin`, `dstartprev`)
VALUES
	(126,29,1,1,'Tache 1 : Phase d\'étude Préliminaire','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(127,33,2,1,'Tache 5 : Phase Dossier de Consultation des Entreprises','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(128,34,3,2,'Tache 6 : Phase passation des marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(129,34,4,1,'Tache 7 : Phase réalisation du projet','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(130,30,5,1,'Acquisition des levés topo et réseaux','',NULL,'yes','completed','2015-01-26 14:53:44',NULL,'2015-01-26 14:53:44',NULL),
	(131,30,6,2,'Remise du plan d\'aménagement','',NULL,'yes','completed','2015-01-26 14:53:55','2015-03-31 00:00:00','2015-01-26 14:53:55',NULL),
	(132,30,7,3,'Validation du plan d\'aménagement ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(133,30,8,4,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(134,30,9,5,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(135,30,10,6,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(136,30,11,7,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(137,31,12,1,'Acquisition des levés topo et réseaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(138,31,13,2,'Remise du plan d\'aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(139,31,14,3,'Validation du plan d\'aménagement ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(140,31,15,4,'Remise du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(141,31,16,5,'Validation du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(142,31,17,6,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(143,31,18,7,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(144,31,19,8,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(145,31,20,9,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(146,32,21,1,'Remise du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(147,32,22,2,'Validation du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(148,32,23,3,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(149,32,24,4,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(150,32,25,5,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(151,32,26,6,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(157,36,1,1,'Tache 1 : Phase d\'étude Préliminaire','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(158,40,2,1,'Tache 5 : Phase Dossier de Consultation des Entreprises','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(159,41,3,2,'Tache 6 : Phase passation des marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(160,41,4,1,'Tache 7 : Phase réalisation du projet','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(161,37,5,1,'Acquisition des levés topo et réseaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(162,37,6,2,'Remise du plan d\'aménagement','',NULL,'yes','to_be_started',NULL,'2015-03-31 00:00:00',NULL,NULL),
	(163,37,7,3,'Validation du plan d\'aménagement ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(164,37,8,4,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(165,37,9,5,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(166,37,10,6,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(167,37,11,7,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(168,38,12,1,'Acquisition des levés topo et réseaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(169,38,13,2,'Remise du plan d\'aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(170,38,14,3,'Validation du plan d\'aménagement ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(171,38,15,4,'Remise du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(172,38,16,5,'Validation du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(173,38,17,6,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(174,38,18,7,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(175,38,19,8,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(176,38,20,9,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(177,39,21,1,'Remise du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(178,39,22,2,'Validation du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(179,39,23,3,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(180,39,24,4,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(181,39,25,5,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(182,39,26,6,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(188,43,1,1,'Tache 1 : Phase d\'étude Préliminaire','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(189,47,2,1,'Tache 5 : Phase Dossier de Consultation des Entreprises','',NULL,'yes','completed','2015-01-05 10:58:12',NULL,'2015-01-05 10:58:12',NULL),
	(190,48,3,2,'Tache 6 : Phase passation des marchés','',NULL,'yes','completed','2015-01-05 10:58:44',NULL,'2015-01-05 10:58:44',NULL),
	(192,44,5,1,'Acquisition des levés topo et réseaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(193,44,6,2,'Remise du plan d\'aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(194,44,7,3,'Validation du plan d\'aménagement ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(195,44,8,4,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(196,44,9,5,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(197,44,10,6,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(198,44,11,7,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(199,45,12,1,'Acquisition des levés topo et réseaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(200,45,13,2,'Remise du plan d\'aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(201,45,14,3,'Validation du plan d\'aménagement ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(202,45,15,4,'Remise du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(203,45,16,5,'Validation du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(204,45,17,6,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(205,45,18,7,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(206,45,19,8,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(207,45,20,9,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(208,46,21,1,'Remise du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(209,46,22,2,'Validation du PAIG/PAQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(210,46,23,3,'Remise du livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(211,46,24,4,'Avis sur le livrable minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(212,46,25,5,'Remise du livrable définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(213,46,26,6,'Préparation passage en instance d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(219,49,0,219,'Commandes Lot 31',NULL,26,'yes','to_be_started',NULL,'2015-03-01 00:00:00',NULL,NULL),
	(220,49,0,220,'Participation réunion de lancement',NULL,26,'yes','completed','2015-01-25 18:30:23','2015-02-01 00:00:00','2015-02-04 17:15:57',NULL),
	(221,49,0,221,'Communication riverains',NULL,26,'yes','completed','2015-01-25 18:30:15','2015-02-01 00:00:00','2015-01-25 18:30:15',NULL),
	(222,49,0,222,'Présentation à l\'exploitant',NULL,26,'yes','completed','2015-01-25 18:30:07','2015-03-01 00:00:00','2015-01-25 18:30:07',NULL),
	(223,37,0,223,'diagnostic sonorisation',NULL,24,'yes','to_be_started',NULL,'2015-02-27 00:00:00',NULL,NULL),
	(224,30,0,224,'diagnostic sonorisation',NULL,24,'yes','to_be_started',NULL,'2015-02-27 00:00:00',NULL,NULL),
	(352,57,1,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(353,57,2,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(354,57,3,3,'Recensement des projets connexes','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(355,57,4,4,'Diagnostics de la gare (éclairage, sono, amiante et plomb, puissance)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(356,57,5,5,'Comité financeur STIF/RIF','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(357,57,6,6,'Réception EP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(358,57,7,7,'Etoilage EP minute à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(359,57,8,8,'Réception EP définitive','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(360,57,9,9,'2me Comité Financeur','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(361,57,10,10,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(362,57,11,11,'Présentation en mairie','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(363,57,12,12,'Courrier validation EP définitive (avec remarques ELT/MOA pour AVP ou APO)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(364,58,13,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(365,58,14,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(366,58,15,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(367,58,16,4,'Consultation et contractualisation pour CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(368,58,17,5,'Consultation et contractualisation pour CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(369,58,18,6,'Acquisitions de données d\'entrée','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(370,58,19,7,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(371,58,20,8,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(372,58,21,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(373,58,22,10,'Réception AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(374,58,23,11,'Obtenir avis CT sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(375,58,24,12,'Obtenir avis CSPS sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(376,58,25,13,'Etoilage AVP minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(377,58,26,14,'Obtenir avis IGSI sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(378,58,27,15,'Note avis sur AVP minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(379,58,28,16,'Réception AVP définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(380,58,29,17,'Etoilage AVP définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(381,58,30,18,'Préparation de la stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(382,58,31,19,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(383,58,32,20,'Courrier validation AVP définitif (avec remarques ELT/CT/MOA pour PRO)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(384,59,33,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(385,59,34,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(386,59,35,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(387,59,36,4,'Consultation et contractualisation pour CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(388,59,37,5,'Consultation et contractualisation pour CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(389,59,38,6,'Acquisitions de données d\'entrée','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(390,59,39,7,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(391,59,40,8,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(392,59,41,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(393,59,42,10,'Lancement dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(394,59,43,11,'Avis IGSI sur PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(395,59,44,12,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(396,59,45,13,'Réception APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(397,59,46,14,'Obtenir avis CT sur APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(398,59,47,15,'Obtenir avis CSPS sur APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(399,59,48,16,'Etoilage APO minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(400,59,49,17,'Retour dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(401,59,50,18,'Note avis sur APO minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(402,59,51,19,'Réception APO définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(403,59,52,20,'Etoilage APO définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(404,59,53,21,'Réception Rapport Initial du CT (RICT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(405,59,54,22,'Réception PGC du CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(406,59,55,23,'Stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(407,59,56,24,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(408,59,57,25,'Courrier validation APO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(409,60,58,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(410,60,59,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(411,60,60,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(412,60,61,4,'Vérification marché CSPS + CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(413,60,62,5,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(414,60,63,6,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(415,60,64,7,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(416,60,65,8,'Lancement dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(417,60,66,9,'Avis IGSI sur PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(418,60,67,10,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(419,60,68,11,'Réception PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(420,60,69,12,'Obtenir avis CT sur PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(421,60,70,13,'Obtenir avis CSPS sur PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(422,60,71,14,'Etoilage PRO minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(423,60,72,15,'Retour dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(424,60,73,16,'Note avis sur PRO minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(425,60,74,17,'Réception PRO définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(426,60,75,18,'Etoilage PRO définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(427,60,76,19,'Réception Rapport Initial du CT (RICT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(428,60,77,20,'Réception PGC du CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(429,60,78,21,'Finalisation de la stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(430,60,79,22,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(431,60,80,23,'Courrier validation PRO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(432,61,81,1,'Mise à jour outils comptables (comptes et lots GEREMI)','',NULL,'yes','completed','2015-02-04 17:45:23',NULL,'2015-02-04 17:45:23',NULL),
	(437,62,86,1,'Validation Note de présentation stratégie marché','',NULL,'yes','completed','2015-02-04 17:45:45',NULL,'2015-02-04 17:45:45',NULL),
	(442,63,91,1,'Mise à jours outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(443,63,92,2,'Courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(444,63,93,3,'Déploiement communication','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(445,63,94,4,'Affichage réglementaire (PC ou DP+AT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(446,63,95,5,'Préparation panneau de chantier avec TN COM','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(447,63,96,6,'Alerter Patrimoine et Maintenance pour entrée en REA','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(448,63,97,7,'Déclaration ouverture de chantier','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(449,63,98,8,'Réalisation des ICP par le CSPS avant travaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(450,63,99,9,'Faire déclaration CRAMIF/OPPBTP/Inspection du travail','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(451,63,100,10,'En fin de travaux, réception docs (VIEL, RVRAT,) par CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(452,63,101,11,'Réception des travaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(453,63,102,12,'Réception DOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(454,63,103,13,'Décompte final pour les marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(455,63,104,14,'Déclaration de fin de chantier','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(456,63,105,15,'Remise à l\'exploitant + maintenance','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(479,64,1,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(480,64,2,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(481,64,3,3,'Recensement des projets connexes','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(482,64,4,4,'Diagnostics de la gare (éclairage, sono, amiante et plomb, puissance)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(483,64,5,5,'Comité financeur STIF/RIF','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(484,64,6,6,'Réception EP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(485,64,7,7,'Etoilage EP minute à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(486,64,8,8,'Réception EP définitive','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(487,64,9,9,'2me Comité Financeur','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(488,64,10,10,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(489,64,11,11,'Présentation en mairie','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(490,64,12,12,'Courrier validation EP définitive (avec remarques ELT/MOA pour AVP ou APO)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(491,65,13,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(492,65,14,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(493,65,15,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(494,65,16,4,'Consultation et contractualisation pour CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(495,65,17,5,'Consultation et contractualisation pour CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(496,65,18,6,'Acquisitions de données d\'entrée','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(497,65,19,7,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(498,65,20,8,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(499,65,21,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(500,65,22,10,'Réception AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(501,65,23,11,'Obtenir avis CT sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(502,65,24,12,'Obtenir avis CSPS sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(503,65,25,13,'Etoilage AVP minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(504,65,26,14,'Obtenir avis IGSI sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(505,65,27,15,'Note avis sur AVP minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(506,65,28,16,'Réception AVP définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(507,65,29,17,'Etoilage AVP définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(508,65,30,18,'Préparation de la stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(509,65,31,19,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(510,65,32,20,'Courrier validation AVP définitif (avec remarques ELT/CT/MOA pour PRO)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(511,66,33,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(512,66,34,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(513,66,35,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(514,66,36,4,'Consultation et contractualisation pour CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(515,66,37,5,'Consultation et contractualisation pour CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(516,66,38,6,'Acquisitions de données d\'entrée','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(517,66,39,7,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(518,66,40,8,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(519,66,41,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(520,66,42,10,'Lancement dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(521,66,43,11,'Avis IGSI sur PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(522,66,44,12,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(523,66,45,13,'Réception APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(524,66,46,14,'Obtenir avis CT sur APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(525,66,47,15,'Obtenir avis CSPS sur APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(526,66,48,16,'Etoilage APO minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(527,66,49,17,'Retour dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(528,66,50,18,'Note avis sur APO minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(529,66,51,19,'Réception APO définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(530,66,52,20,'Etoilage APO définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(531,66,53,21,'Réception Rapport Initial du CT (RICT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(532,66,54,22,'Réception PGC du CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(533,66,55,23,'Stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(534,66,56,24,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(535,66,57,25,'Courrier validation APO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(536,67,58,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(537,67,59,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(538,67,60,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(539,67,61,4,'Vérification marché CSPS + CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(540,67,62,5,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(541,67,63,6,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(542,67,64,7,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(543,67,65,8,'Lancement dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(544,67,66,9,'Avis IGSI sur PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(545,67,67,10,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(546,67,68,11,'Réception PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(547,67,69,12,'Obtenir avis CT sur PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(548,67,70,13,'Obtenir avis CSPS sur PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(549,67,71,14,'Etoilage PRO minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(550,67,72,15,'Retour dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(551,67,73,16,'Note avis sur PRO minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(552,67,74,17,'Réception PRO définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(553,67,75,18,'Etoilage PRO définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(554,67,76,19,'Réception Rapport Initial du CT (RICT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(555,67,77,20,'Réception PGC du CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(556,67,78,21,'Finalisation de la stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(557,67,79,22,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(558,67,80,23,'Courrier validation PRO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(559,68,81,1,'Mise à jour outils comptables (comptes et lots GEREMI)','',NULL,'yes','completed','2015-02-05 11:40:59',NULL,'2015-02-05 11:40:59',NULL),
	(564,69,86,1,'Validation Note de présentation stratégie marché','',NULL,'yes','completed','2015-02-05 11:41:49',NULL,'2015-02-05 11:41:49',NULL),
	(569,70,91,1,'Mise à jours outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(570,70,92,2,'Courrier de notification de lancement de phase à MOE','',NULL,'yes','completed','2015-02-05 11:43:30','2015-02-05 00:00:00','2015-02-05 11:43:30',NULL),
	(571,70,93,3,'Déploiement communication','',NULL,'yes','completed','2015-02-05 11:49:04','2015-02-05 00:00:00','2015-02-05 11:49:04',NULL),
	(572,70,94,4,'Affichage réglementaire (PC ou DP+AT)','',NULL,'yes','completed','2015-02-05 11:48:56',NULL,'2015-02-05 11:48:56',NULL),
	(573,70,95,5,'Préparation panneau de chantier avec TN COM','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(574,70,96,6,'Alerter Patrimoine et Maintenance pour entrée en REA','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(575,70,97,7,'Déclaration ouverture de chantier','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(576,70,98,8,'Réalisation des ICP par le CSPS avant travaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(577,70,99,9,'Faire déclaration CRAMIF/OPPBTP/Inspection du travail','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(578,70,100,10,'En fin de travaux, réception docs (VIEL, RVRAT,) par CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(579,70,101,11,'Réception des travaux','',NULL,'yes','to_be_started',NULL,'2015-09-30 00:00:00',NULL,NULL),
	(580,70,102,12,'Réception DOE','',NULL,'yes','to_be_started',NULL,'2015-09-30 00:00:00',NULL,NULL),
	(581,70,103,13,'Décompte final pour les marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(582,70,104,14,'Déclaration de fin de chantier','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(583,70,105,15,'Remise à l\'exploitant + maintenance','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(607,49,0,607,'Organisation d\'un petit déjeuner',NULL,30,'yes','to_be_started',NULL,'2015-03-01 00:00:00',NULL,NULL),
	(608,71,1,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(609,71,2,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(610,71,3,3,'Recensement des projets connexes','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(611,71,4,4,'Diagnostics de la gare (éclairage, sono, amiante et plomb, puissance)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(612,71,5,5,'Comité financeur STIF/RIF','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(613,71,6,6,'Réception EP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(614,71,7,7,'Etoilage EP minute à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(615,71,8,8,'Réception EP définitive','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(616,71,9,9,'2me Comité Financeur','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(617,71,10,10,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(618,71,11,11,'Présentation en mairie','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(619,71,12,12,'Courrier validation EP définitive (avec remarques ELT/MOA pour AVP ou APO)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(620,72,13,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(621,72,14,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(622,72,15,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(623,72,16,4,'Consultation et contractualisation pour CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(624,72,17,5,'Consultation et contractualisation pour CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(625,72,18,6,'Acquisitions de données d\'entrée','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(626,72,19,7,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(627,72,20,8,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(628,72,21,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(629,72,22,10,'Réception AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(630,72,23,11,'Obtenir avis CT sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(631,72,24,12,'Obtenir avis CSPS sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(632,72,25,13,'Etoilage AVP minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(633,72,26,14,'Obtenir avis IGSI sur AVP minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(634,72,27,15,'Note avis sur AVP minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(635,72,28,16,'Réception AVP définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(636,72,29,17,'Etoilage AVP définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(637,72,30,18,'Préparation de la stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(638,72,31,19,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(639,72,32,20,'Courrier validation AVP définitif (avec remarques ELT/CT/MOA pour PRO)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(640,73,33,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(641,73,34,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(642,73,35,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(643,73,36,4,'Consultation et contractualisation pour CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(644,73,37,5,'Consultation et contractualisation pour CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(645,73,38,6,'Acquisitions de données d\'entrée','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(646,73,39,7,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(647,73,40,8,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(648,73,41,9,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(649,73,42,10,'Lancement dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(650,73,43,11,'Avis IGSI sur PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(651,73,44,12,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(652,73,45,13,'Réception APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(653,73,46,14,'Obtenir avis CT sur APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(654,73,47,15,'Obtenir avis CSPS sur APO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(655,73,48,16,'Etoilage APO minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(656,73,49,17,'Retour dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(657,73,50,18,'Note avis sur APO minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(658,73,51,19,'Réception APO définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(659,73,52,20,'Etoilage APO définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(660,73,53,21,'Réception Rapport Initial du CT (RICT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(661,73,54,22,'Réception PGC du CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(662,73,55,23,'Stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(663,73,56,24,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(664,73,57,25,'Courrier validation APO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(665,74,58,1,'Mise en place outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(666,74,59,2,'Offre puis courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(667,74,60,3,'Transmission du programme détaillé validé ELT à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(668,74,61,4,'Vérification marché CSPS + CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(669,74,62,5,'Réception et avis sur plan aménagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(670,74,63,6,'Réception et avis sur plan POG/POQ','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(671,74,64,7,'Etoilage plan aménagement + POG/POQ à ELT+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(672,74,65,8,'Lancement dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(673,74,66,9,'Avis IGSI sur PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(674,74,67,10,'Présentation et envoi PC en mairie, gestion base travaux et procédure admin','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(675,74,68,11,'Réception PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(676,74,69,12,'Obtenir avis CT sur PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(677,74,70,13,'Obtenir avis CSPS sur PRO minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(678,74,71,14,'Etoilage PRO minute à ELT (+COSI)+Maintenance+Equipements','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(679,74,72,15,'Retour dossier PC','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(680,74,73,16,'Note avis sur PRO minute à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(681,74,74,17,'Réception PRO définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(682,74,75,18,'Etoilage PRO définitif à ELT + CT + CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(683,74,76,19,'Réception Rapport Initial du CT (RICT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(684,74,77,20,'Réception PGC du CSPS','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(685,74,78,21,'Finalisation de la stratégie marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(686,74,79,22,'Passage en comité d\'engagement','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(687,74,80,23,'Courrier validation PRO définitif (avec remarques PC/ELT/CT/MOA pour DCE)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(688,75,81,1,'Mise à jour outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(689,75,82,2,'Courrier de notification de lancement dossier à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(690,75,83,3,'Réunion de Lancement communication','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(691,75,84,4,'Réception et avis sur DCE minute','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(692,75,85,5,'Réception DCE définitif','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(693,76,86,1,'Validation Note de présentation stratégie marché','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(694,76,87,2,'Envoi DCE aux achats','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(695,76,88,3,'Validation liste des entreprises à consulter','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(696,76,89,4,'Passage en comité d\'engagement avant attribution des marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(697,76,90,5,'Signature de(s) commande(s)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(698,77,91,1,'Mise à jours outils comptables (comptes et lots GEREMI)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(699,77,92,2,'Courrier de notification de lancement de phase à MOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(700,77,93,3,'Déploiement communication','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(701,77,94,4,'Affichage réglementaire (PC ou DP+AT)','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(702,77,95,5,'Préparation panneau de chantier avec TN COM','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(703,77,96,6,'Alerter Patrimoine et Maintenance pour entrée en REA','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(704,77,97,7,'Déclaration ouverture de chantier','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(705,77,98,8,'Réalisation des ICP par le CSPS avant travaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(706,77,99,9,'Faire déclaration CRAMIF/OPPBTP/Inspection du travail','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(707,77,100,10,'En fin de travaux, réception docs (VIEL, RVRAT,) par CT','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(708,77,101,11,'Réception des travaux','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(709,77,102,12,'Réception DOE','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(710,77,103,13,'Décompte final pour les marchés','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(711,77,104,14,'Déclaration de fin de chantier','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL),
	(712,77,105,15,'Remise à l\'exploitant + maintenance','',NULL,'yes','to_be_started',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `tache` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table todo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `todo`;

CREATE TABLE `todo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idobj` bigint(20) DEFAULT NULL,
  `typeobj` varchar(255) DEFAULT NULL,
  `dcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `owner` varchar(255) DEFAULT NULL,
  `progress` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `dendprev` timestamp NULL DEFAULT NULL,
  `dend` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `todo` WRITE;
/*!40000 ALTER TABLE `todo` DISABLE KEYS */;

INSERT INTO `todo` (`id`, `idobj`, `typeobj`, `dcreate`, `description`, `ordre`, `owner`, `progress`, `status`, `dendprev`, `dend`)
VALUES
	(33,132,'G.de Combs-la-Ville (77)','2015-01-05 17:20:32','Envoyer les CdA Lot 31 à MOEG',NULL,'27',NULL,'in_progress','2015-03-01 00:00:00',NULL),
	(34,135,'G.de Maisons-Alfort Alfortville (94)','2015-02-05 12:01:55','Test',NULL,'24',NULL,'in_progress','2015-06-15 00:00:00',NULL),
	(35,135,'G.de Maisons-Alfort Alfortville (94)','2015-02-05 12:02:21','Test 02',NULL,'24',NULL,'in_progress','2015-02-20 00:00:00',NULL),
	(36,132,'G.de Combs-la-Ville (77)','2015-02-05 14:37:01','location d\'un barnum pour le petit déjeuner',NULL,'27',NULL,'in_progress','2015-02-09 00:00:00',NULL);

/*!40000 ALTER TABLE `todo` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `objet` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `dcreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `login_uniq` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `nom`, `prenom`, `profile`, `objet`, `email`, `login`, `password`, `active`, `dcreate`)
VALUES
	(1,'elmos','elmos','full','ADMIN','mail@tmail.com','elmos','woHeTlZ4XJQ=','yes','2014-02-07 22:14:23'),
	(17,' Xavier','Melissa','DIRECTEUR PROJET','USER',' Xavier.Melissa@sncf.com','melissa','XE8vHR70afA=','no','2014-02-08 00:08:54'),
	(18,'admin','admin','full','ADMIN','mail@mail.com','admin','XE8vHR70afA=','yes','2014-02-21 22:19:07'),
	(24,'Khobunthien','Bruce','full','ADMIN','bruce.khobunthien@sncf.fr','bkhobunthien','Huug+Dy6tDbiSQjSE0ZFsw==','yes','2014-12-04 10:01:29'),
	(25,'Smith2','John','CONDUCTEUR','USER','jsmith2@sncf.com','jsmith2','9gVA+1k0kj0=','no','2014-12-25 23:40:40'),
	(26,'Martin','Jean','CONTRIBUTEUR','USER','jmartin@sncf.fr','jmartin','9gVA+1k0kj0=','no','2014-12-28 10:04:18'),
	(27,'Duval','Jean-François','CONDUCTEUR','USER','jean-francois.duval@sncf.fr','jfduval','qqWMe7tZN8M26LE+X2eAqg==','yes','2015-01-05 09:56:10'),
	(28,'Helmer','Jean-Nicolas','DIRECTEUR PROJET','USER','jean-nicolas.helmer@sncf.fr','jnhelmer','1CrgZEq+bwU=','no','2015-01-05 09:57:28'),
	(29,'Delacroix','Celia','CONDUCTEUR','USER','ext.parvis.celia.delacroix@sncf.fr','cdelacroix','IFT5VobAJ3hVCt9bFrVz3g==','no','2015-01-26 14:51:52'),
	(30,'Jean-Nicolas','Helmer','DIRECTEUR PROJET','USER','jean-nicolas.helmer@sncf.fr','jnhelmer','1CrgZEq+bwU=','yes','2015-02-04 17:23:58'),
	(31,'Delacroix','Celia','CONDUCTEUR','USER','ext.parvis.celia.delacroix@sncf.fr','cdelacroix','pyb++qo30bY=','yes','2015-02-05 11:35:56');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table userpass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userpass`;

CREATE TABLE `userpass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
