-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.33 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de la table echargement_db. agent_douane
CREATE TABLE IF NOT EXISTS `agent_douane` (
  `agent_douane_id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_douane_date_creation` timestamp NULL DEFAULT NULL,
  `agent_douane_matricule` varchar(50) DEFAULT NULL,
  `agent_douane_nom_prenoms` varchar(50) DEFAULT NULL,
  `agent_douane_date_naiss` date DEFAULT NULL,
  `agent_douane_lieu_naiss` varchar(50) DEFAULT NULL,
  `agent_douane_date_ambauche` date DEFAULT NULL,
  `agent_douane_user` varchar(25) DEFAULT NULL,
  `agent_douane_date_modification` datetime NOT NULL,
  `agent_douane_date_suppression` datetime NOT NULL,
  `agent_douane_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`agent_douane_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.agent_douane : 2 rows
/*!40000 ALTER TABLE `agent_douane` DISABLE KEYS */;
INSERT INTO `agent_douane` (`agent_douane_id`, `agent_douane_date_creation`, `agent_douane_matricule`, `agent_douane_nom_prenoms`, `agent_douane_date_naiss`, `agent_douane_lieu_naiss`, `agent_douane_date_ambauche`, `agent_douane_user`, `agent_douane_date_modification`, `agent_douane_date_suppression`, `agent_douane_statut`) VALUES
	(1, '2023-04-04 11:04:16', 'a345567', 'koffi konan antoine', '2023-04-02', 'bangolo', '2023-04-17', 'koi', '2023-04-25 11:04:16', '2023-04-25 11:04:16', 'valide'),
	(2, '2023-04-19 11:04:16', 'a6670e', 'yapo ange bernard', '2023-04-04', 'bouake', '2023-04-02', 'albert', '2023-04-25 11:04:16', '2023-04-25 11:04:16', 'valide');
/*!40000 ALTER TABLE `agent_douane` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. autreimage
CREATE TABLE IF NOT EXISTS `autreimage` (
  `autreimage_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `produit_id` int(11) NOT NULL,
  `autreimage_photo` varchar(255) NOT NULL,
  `autreimage_date_creation` datetime NOT NULL,
  `autreimage_statut` enum('valide','desactive') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`autreimage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.autreimage : 1 rows
/*!40000 ALTER TABLE `autreimage` DISABLE KEYS */;
INSERT INTO `autreimage` (`autreimage_id`, `user_id`, `produit_id`, `autreimage_photo`, `autreimage_date_creation`, `autreimage_statut`) VALUES
	(31, 1, 7, 'produit_7_1620917105_1_avatar.jpg', '2021-05-13 14:45:05', 'valide');
/*!40000 ALTER TABLE `autreimage` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. bureau_sortie
CREATE TABLE IF NOT EXISTS `bureau_sortie` (
  `bureau_sortie_id` int(11) NOT NULL AUTO_INCREMENT,
  `bureau_sortie_date_creation` timestamp NULL DEFAULT NULL,
  `bureau_sortie_libelle` varchar(100) DEFAULT NULL,
  `bureau_sortie_user` varchar(50) DEFAULT NULL,
  `bureau_sortie_date_modification` datetime DEFAULT NULL,
  `bureau_sortie_date_suppression` datetime DEFAULT NULL,
  `bureau_sortie_statut` enum('brouillon','valide','supprime') DEFAULT 'valide',
  PRIMARY KEY (`bureau_sortie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.bureau_sortie : 1 rows
/*!40000 ALTER TABLE `bureau_sortie` DISABLE KEYS */;
INSERT INTO `bureau_sortie` (`bureau_sortie_id`, `bureau_sortie_date_creation`, `bureau_sortie_libelle`, `bureau_sortie_user`, `bureau_sortie_date_modification`, `bureau_sortie_date_suppression`, `bureau_sortie_statut`) VALUES
	(1, '2023-05-03 01:04:41', 'BUREAU 1', '', NULL, NULL, 'valide');
/*!40000 ALTER TABLE `bureau_sortie` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `categorie_id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id_parent` int(11) DEFAULT '0',
  `categorie_nom` varchar(255) NOT NULL,
  `categorie_date_creation` datetime DEFAULT NULL,
  `categorie_date_modification` datetime DEFAULT NULL,
  `categorie_date_suppression` datetime DEFAULT NULL,
  `categorie_statut` enum('brouillon','valide','supprime') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`categorie_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.categorie : 5 rows
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` (`categorie_id`, `categorie_id_parent`, `categorie_nom`, `categorie_date_creation`, `categorie_date_modification`, `categorie_date_suppression`, `categorie_statut`) VALUES
	(1, NULL, 'fruits', '2021-07-26 17:13:49', NULL, NULL, 'valide'),
	(2, NULL, 'plats africains', '2021-07-26 17:14:12', NULL, NULL, 'valide'),
	(3, 2, 'plats ivoiriens', '2021-07-26 17:14:23', NULL, NULL, 'valide'),
	(4, NULL, 'fruits', '2021-07-26 17:36:26', NULL, '2021-07-26 17:36:46', 'supprime'),
	(5, 1, 'legume', '2023-04-19 09:13:33', NULL, NULL, 'valide');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. chargement
CREATE TABLE IF NOT EXISTS `chargement` (
  `chargement_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `moyen_transport_id` int(11) NOT NULL,
  `chargement_date_creation` timestamp NULL DEFAULT NULL,
  `chargement_date` date DEFAULT NULL,
  `chargement_date_fin` date DEFAULT NULL,
  `chargement_lieu` varchar(100) DEFAULT NULL,
  `chargement_numero` varchar(100) DEFAULT NULL,
  `chargement_numero_ldc` varchar(100) DEFAULT NULL,
  `chargement_fichier_numerique_ldc` varchar(100) DEFAULT NULL,
  `chargement_user` varchar(50) DEFAULT NULL,
  `chargement_date_modification` datetime NOT NULL,
  `chargement_date_suppression` datetime NOT NULL,
  `chargement_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`chargement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.chargement : 0 rows
/*!40000 ALTER TABLE `chargement` DISABLE KEYS */;
/*!40000 ALTER TABLE `chargement` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `commande_id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `commande_montant_ht` double NOT NULL,
  `commande_montant_ttc` double NOT NULL,
  `commande_date_creation` datetime NOT NULL,
  `commande_statut_livraison` enum('non livree','livree') NOT NULL DEFAULT 'non livree',
  `commande_statut` enum('brouillon','valide','supprime') NOT NULL DEFAULT 'brouillon',
  PRIMARY KEY (`commande_id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.commande : 1 rows
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` (`commande_id`, `utilisateur_id`, `commande_montant_ht`, `commande_montant_ttc`, `commande_date_creation`, `commande_statut_livraison`, `commande_statut`) VALUES
	(30, 1, 50000, 100000, '0000-00-00 00:00:00', 'non livree', 'brouillon');
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. conteneur
CREATE TABLE IF NOT EXISTS `conteneur` (
  `conteneur_id` int(11) NOT NULL,
  `conteneur_date_creation` timestamp NULL DEFAULT NULL,
  `conteneur_numero` varchar(100) DEFAULT NULL,
  `conteneur_user` varchar(50) DEFAULT NULL,
  `conteneur_date_modification` datetime NOT NULL,
  `conteneur_date_suppression` datetime NOT NULL,
  `conteneur_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`conteneur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.conteneur : 1 rows
/*!40000 ALTER TABLE `conteneur` DISABLE KEYS */;
INSERT INTO `conteneur` (`conteneur_id`, `conteneur_date_creation`, `conteneur_numero`, `conteneur_user`, `conteneur_date_modification`, `conteneur_date_suppression`, `conteneur_statut`) VALUES
	(1, '2023-05-03 02:14:15', 'CTN001', NULL, '2023-05-03 02:14:23', '2023-05-03 02:14:23', 'valide');
/*!40000 ALTER TABLE `conteneur` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. cotation_declaration
CREATE TABLE IF NOT EXISTS `cotation_declaration` (
  `agent_douane_id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `cotation_declaration_date` date DEFAULT NULL,
  `cotation_declaration_date_modification` datetime NOT NULL,
  `cotation_declaration_date_suppression` datetime NOT NULL,
  `cotation_declaration_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`agent_douane_id`,`declaration_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.cotation_declaration : 0 rows
/*!40000 ALTER TABLE `cotation_declaration` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotation_declaration` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. cotation_declaration_effectif
CREATE TABLE IF NOT EXISTS `cotation_declaration_effectif` (
  `role_id` int(11) NOT NULL,
  `agent_douane_id` int(11) NOT NULL,
  `chargement_id` int(11) NOT NULL,
  `detail_chargement_id` int(11) NOT NULL,
  `cotation_declaration_effectif_date` date DEFAULT NULL,
  `cotation_declaration_effectif_date_modification` datetime NOT NULL,
  `cotation_declaration_effectif_date_suppression` datetime NOT NULL,
  `cotation_declaration_effectif_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`chargement_id`,`role_id`,`agent_douane_id`,`detail_chargement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.cotation_declaration_effectif : 0 rows
/*!40000 ALTER TABLE `cotation_declaration_effectif` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotation_declaration_effectif` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. cotation_empotage
CREATE TABLE IF NOT EXISTS `cotation_empotage` (
  `role_id` int(11) NOT NULL,
  `agent_douane_id` int(11) NOT NULL,
  `empotage_id` int(11) NOT NULL,
  `cotation_empotage_date` date DEFAULT NULL,
  `cotation_empotage_date_modification` datetime NOT NULL,
  `cotation_empotage_date_suppression` datetime NOT NULL,
  `cotation_empotage_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`role_id`,`agent_douane_id`,`empotage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.cotation_empotage : 0 rows
/*!40000 ALTER TABLE `cotation_empotage` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotation_empotage` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. declarant
CREATE TABLE IF NOT EXISTS `declarant` (
  `declarant_id` int(11) NOT NULL AUTO_INCREMENT,
  `declarant_date_creation` timestamp NULL DEFAULT NULL,
  `declarant_nom` varchar(50) DEFAULT NULL,
  `declarant_adresse` varchar(50) DEFAULT NULL,
  `declarant_tel` varchar(25) DEFAULT NULL,
  `declarant_mail` varchar(25) DEFAULT NULL,
  `declarant_user` varchar(25) DEFAULT NULL,
  `declarant_date_modification` datetime NOT NULL,
  `declarant_date_suppression` datetime NOT NULL,
  `declarant_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`declarant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.declarant : 2 rows
/*!40000 ALTER TABLE `declarant` DISABLE KEYS */;
INSERT INTO `declarant` (`declarant_id`, `declarant_date_creation`, `declarant_nom`, `declarant_adresse`, `declarant_tel`, `declarant_mail`, `declarant_user`, `declarant_date_modification`, `declarant_date_suppression`, `declarant_statut`) VALUES
	(1, '2023-04-25 10:40:58', 'declarant-01', 'bp 234 abidjan 01', '08066543', '01977654', 'ben', '2023-04-25 10:40:58', '2023-04-25 10:40:58', 'valide'),
	(2, '2023-04-18 10:40:58', 'declarant-2', '02 bp 34488 ferke 02', '0255664432', '0133557799', 'kra', '2023-04-25 10:40:58', '2023-04-25 10:40:58', 'valide');
/*!40000 ALTER TABLE `declarant` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. declaration
CREATE TABLE IF NOT EXISTS `declaration` (
  `declaration_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `declarant_id` int(11) NOT NULL,
  `expediteur_id` int(11) NOT NULL,
  `bureau_sortie_id` int(11) NOT NULL,
  `regime_id` int(11) NOT NULL,
  `moyen_transport_id` int(11) NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `declaration_date_creation` timestamp NULL DEFAULT NULL,
  `declaration_date` date DEFAULT NULL,
  `declaration_date_fin` date DEFAULT NULL,
  `declaration_date_prise_compte` date DEFAULT NULL,
  `declaration_numero` varchar(50) DEFAULT NULL,
  `declaration_user` varchar(25) DEFAULT NULL,
  `declaration_date_modification` datetime NOT NULL,
  `declaration_date_suppression` datetime NOT NULL,
  `declaration_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`declaration_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.declaration : 2 rows
/*!40000 ALTER TABLE `declaration` DISABLE KEYS */;
INSERT INTO `declaration` (`declaration_id`, `user_id`, `declarant_id`, `expediteur_id`, `bureau_sortie_id`, `regime_id`, `moyen_transport_id`, `destinataire_id`, `pays_id`, `declaration_date_creation`, `declaration_date`, `declaration_date_fin`, `declaration_date_prise_compte`, `declaration_numero`, `declaration_user`, `declaration_date_modification`, `declaration_date_suppression`, `declaration_statut`) VALUES
	(1, 1, 1, 1, 1, 1, 1, 1, 1, '2023-05-03 00:25:25', '2023-05-03', '2023-05-03', '2023-05-03', 'decla-01', 'digui', '2023-04-25 10:28:03', '2023-04-25 10:28:03', 'valide'),
	(2, 2, 2, 2, 2, 2, 2, 2, 2, '2023-05-03 00:25:26', '2023-05-03', '2023-05-03', '2023-05-03', 'decla-2', 'abodou', '2023-04-25 10:28:03', '2023-04-25 10:28:03', 'valide');
/*!40000 ALTER TABLE `declaration` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. destinataire
CREATE TABLE IF NOT EXISTS `destinataire` (
  `destinataire_id` int(11) NOT NULL AUTO_INCREMENT,
  `destinataire_date_creation` timestamp NULL DEFAULT NULL,
  `destinataire_nom` varchar(50) DEFAULT NULL,
  `destinataire_adresse` varchar(50) DEFAULT NULL,
  `destinataire_tel` varchar(25) DEFAULT NULL,
  `destinataire_mail` varchar(25) DEFAULT NULL,
  `destinataire_user` varchar(25) DEFAULT NULL,
  `destinataire_date_modification` datetime NOT NULL,
  `destinataire_date_suppression` datetime NOT NULL,
  `destinataire_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`destinataire_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.destinataire : 2 rows
/*!40000 ALTER TABLE `destinataire` DISABLE KEYS */;
INSERT INTO `destinataire` (`destinataire_id`, `destinataire_date_creation`, `destinataire_nom`, `destinataire_adresse`, `destinataire_tel`, `destinataire_mail`, `destinataire_user`, `destinataire_date_modification`, `destinataire_date_suppression`, `destinataire_statut`) VALUES
	(1, '2023-04-03 10:59:20', 'destinataire-01', 'bp 34466 agboville ', '0525668899', '@yahoo.fr', 'car', '2023-04-25 10:59:20', '2023-04-25 10:59:20', 'valide'),
	(2, '2023-04-19 10:59:20', 'destinataire-02', '01 bp 334466 bigerville 01', '04566773', '@gmail.com', 'youl', '2023-04-25 10:59:20', '2023-04-25 10:59:20', 'valide');
/*!40000 ALTER TABLE `destinataire` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. detail_chargement
CREATE TABLE IF NOT EXISTS `detail_chargement` (
  `detail_chargement_id` int(11) NOT NULL,
  `chargement_id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `marchandise_id` int(11) NOT NULL,
  `conteneur_id` int(11) NOT NULL,
  `detail_declaration_id` int(11) NOT NULL,
  `detail_chargement_date_creation` timestamp NULL DEFAULT NULL,
  `detail_chargement_marchandise_code` varchar(100) DEFAULT NULL,
  `detail_chargement_libelle` varchar(100) DEFAULT NULL,
  `detail_chargement_immatriculation` varchar(100) DEFAULT NULL,
  `detail_chargement_numero_chassis` varchar(100) DEFAULT NULL,
  `detail_chargement_quantite` float DEFAULT NULL,
  `detail_chargement_poids_net` float DEFAULT NULL,
  `detail_chargement_poids_brut` float DEFAULT NULL,
  `detail_chargement_valeur` decimal(10,0) DEFAULT NULL,
  `detail_chargement_user` varchar(50) DEFAULT NULL,
  `detail_chargement_date_modification` datetime NOT NULL,
  `detail_chargement_date_suppression` datetime NOT NULL,
  `detail_chargement_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`chargement_id`,`detail_chargement_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.detail_chargement : 0 rows
/*!40000 ALTER TABLE `detail_chargement` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_chargement` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. detail_declaration
CREATE TABLE IF NOT EXISTS `detail_declaration` (
  `detail_declaration_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `declaration_id` int(11) NOT NULL,
  `marchandise_id` int(11) NOT NULL,
  `conteneur_id` int(11) NOT NULL,
  `detail_declaration_date_creation` timestamp NULL DEFAULT NULL,
  `detail_declaration_marchandise_code` varchar(100) DEFAULT NULL,
  `detail_declaration_marchandise_libelle` varchar(100) DEFAULT NULL,
  `detail_declaration_quantite` float DEFAULT NULL,
  `detail_declaration_poids_net` float DEFAULT NULL,
  `detail_declaration_poids_brut` float DEFAULT NULL,
  `detail_declaration_valeur` decimal(10,0) DEFAULT NULL,
  `detail_declaration_user` varchar(50) DEFAULT NULL,
  `detail_declaration_quantite_chargee` float DEFAULT NULL,
  `detail_declaration_quantite_restante` float DEFAULT NULL,
  `detail_declaration_poids_net_charge` float DEFAULT NULL,
  `detail_declaration_poids_net_restant` float DEFAULT NULL,
  `detail_declaration_poids_brut_charge` float DEFAULT NULL,
  `detail_declaration_poids_brut_restant` float DEFAULT NULL,
  `detail_declaration_date_modification` datetime DEFAULT NULL,
  `detail_declaration_date_suppression` datetime DEFAULT NULL,
  `detail_declaration_statut` enum('brouillon','valide','supprime') DEFAULT 'valide',
  PRIMARY KEY (`declaration_id`,`marchandise_id`,`conteneur_id`,`detail_declaration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.detail_declaration : 4 rows
/*!40000 ALTER TABLE `detail_declaration` DISABLE KEYS */;
INSERT INTO `detail_declaration` (`detail_declaration_id`, `user_id`, `declaration_id`, `marchandise_id`, `conteneur_id`, `detail_declaration_date_creation`, `detail_declaration_marchandise_code`, `detail_declaration_marchandise_libelle`, `detail_declaration_quantite`, `detail_declaration_poids_net`, `detail_declaration_poids_brut`, `detail_declaration_valeur`, `detail_declaration_user`, `detail_declaration_quantite_chargee`, `detail_declaration_quantite_restante`, `detail_declaration_poids_net_charge`, `detail_declaration_poids_net_restant`, `detail_declaration_poids_brut_charge`, `detail_declaration_poids_brut_restant`, `detail_declaration_date_modification`, `detail_declaration_date_suppression`, `detail_declaration_statut`) VALUES
	(1, 1, 1, 1, 0, '2023-05-03 01:59:38', NULL, NULL, 14000, NULL, NULL, 15000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-03 01:59:38', '2023-05-03 01:59:38', 'brouillon'),
	(2, 1, 1, 1, 0, '2023-05-03 02:00:55', NULL, NULL, 5, NULL, NULL, 45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'valide'),
	(1, 1, 1, 2, 0, '2023-05-03 02:18:40', NULL, NULL, 2, 2, NULL, 10000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'valide'),
	(1, 1, 1, 2, 1, '2023-05-03 02:20:59', NULL, NULL, 3000, 15000, NULL, 750000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'valide');
/*!40000 ALTER TABLE `detail_declaration` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. detail_empotage
CREATE TABLE IF NOT EXISTS `detail_empotage` (
  `marchandise_id` int(11) NOT NULL,
  `empotage_id` int(11) NOT NULL,
  `conteneur_id` int(11) NOT NULL,
  `detail_empotage_date_creation` timestamp NULL DEFAULT NULL,
  `detail_empotage_marchandise_code` varchar(100) DEFAULT NULL,
  `detail_empotage_marchandise_libelle` varchar(100) DEFAULT NULL,
  `detail_empotage_quantite` float DEFAULT NULL,
  `detail_empotage_poids_net` float DEFAULT NULL,
  `detail_empotage_poids_brut` float DEFAULT NULL,
  `detail_empotage_valeur` decimal(10,0) DEFAULT NULL,
  `detail_date_modification` datetime NOT NULL,
  `detail_date_suppression` datetime NOT NULL,
  `detail_statut` enum('brouillon','valide','supprime') NOT NULL,
  `detail_empotage_user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`marchandise_id`,`empotage_id`,`conteneur_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.detail_empotage : 0 rows
/*!40000 ALTER TABLE `detail_empotage` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_empotage` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. dim_commune
CREATE TABLE IF NOT EXISTS `dim_commune` (
  `commune_id` int(11) NOT NULL AUTO_INCREMENT,
  `bureau_id` int(11) DEFAULT NULL,
  `commune_libelle` varchar(16) DEFAULT NULL,
  `commune_statut` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`commune_id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.dim_commune : 10 rows
/*!40000 ALTER TABLE `dim_commune` DISABLE KEYS */;
INSERT INTO `dim_commune` (`commune_id`, `bureau_id`, `commune_libelle`, `commune_statut`) VALUES
	(1, 5, 'abobo', 'valide'),
	(2, 5, 'adjame', 'valide'),
	(3, 5, 'attecoube', 'valide'),
	(4, 3, 'cocody', 'valide'),
	(5, 1, 'marcory', 'valide'),
	(6, 2, 'koumassi', 'valide'),
	(7, 1, 'treichville', 'valide'),
	(8, 3, 'plateau', 'supprime'),
	(9, 2, 'port bouet', 'valide'),
	(10, 4, 'yopougon', 'valide');
/*!40000 ALTER TABLE `dim_commune` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. dim_course
CREATE TABLE IF NOT EXISTS `dim_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) DEFAULT NULL,
  `nature_course` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `date_retrait` datetime DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `commune_id_retrait` int(11) DEFAULT NULL,
  `commune_id_livraison` int(11) DEFAULT NULL,
  `frais_livraison` int(11) DEFAULT NULL,
  `statut` enum('valide','brouillon','supprime') NOT NULL DEFAULT 'brouillon',
  `statut_livraison` enum('livree','non livree') NOT NULL DEFAULT 'non livree',
  `date_creation` datetime DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.dim_course : 0 rows
/*!40000 ALTER TABLE `dim_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `dim_course` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. dim_frais_livraison
CREATE TABLE IF NOT EXISTS `dim_frais_livraison` (
  `frais_livraison_id` int(11) NOT NULL AUTO_INCREMENT,
  `commune_id_retrait` int(11) NOT NULL,
  `commune_id_livraison` int(11) NOT NULL,
  `frais_livraison_montant` int(11) NOT NULL,
  `frais_livraison_date_creation` datetime DEFAULT NULL,
  `frais_livraison_date_suppression` datetime DEFAULT NULL,
  `frais_livraison_statut` enum('valide','supprime','cloture') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`frais_livraison_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.dim_frais_livraison : 26 rows
/*!40000 ALTER TABLE `dim_frais_livraison` DISABLE KEYS */;
INSERT INTO `dim_frais_livraison` (`frais_livraison_id`, `commune_id_retrait`, `commune_id_livraison`, `frais_livraison_montant`, `frais_livraison_date_creation`, `frais_livraison_date_suppression`, `frais_livraison_statut`) VALUES
	(1, 1, 2, 1000, '2021-07-24 22:58:12', '2021-07-25 07:32:42', 'supprime'),
	(2, 1, 3, 1500, '2021-07-24 22:58:11', NULL, 'valide'),
	(3, 1, 4, 2000, '2021-07-24 22:58:10', '2021-07-25 07:32:46', 'supprime'),
	(4, 1, 5, 1000, '2021-07-24 22:58:09', '2021-07-25 07:32:18', 'supprime'),
	(5, 2, 1, 1000, '2021-07-24 22:57:56', '2021-07-25 07:32:24', 'supprime'),
	(6, 2, 3, 1000, '2021-07-24 22:57:57', '2021-07-25 07:32:27', 'supprime'),
	(7, 2, 4, 1000, '2021-07-24 22:57:59', '2021-07-25 07:32:35', 'supprime'),
	(8, 2, 5, 1000, '2021-07-24 22:58:01', '2021-07-25 07:32:31', 'supprime'),
	(9, 4, 1, 1000, '2021-07-24 22:58:00', '2021-07-25 07:31:55', 'supprime'),
	(10, 4, 2, 1000, '2021-07-24 22:57:36', '2021-07-25 07:31:59', 'supprime'),
	(11, 4, 3, 1500, '2021-07-24 22:58:04', '2021-07-25 07:32:02', 'supprime'),
	(12, 4, 5, 1500, '2021-07-24 22:58:03', '2021-07-25 07:32:05', 'supprime'),
	(13, 5, 1, 1000, '2021-07-24 22:58:06', '2021-07-25 07:30:07', 'supprime'),
	(14, 5, 2, 1000, '2021-07-24 22:58:05', '2021-07-25 07:30:13', 'supprime'),
	(15, 5, 3, 3000, '2021-07-24 22:58:07', '2021-07-25 07:31:24', 'supprime'),
	(16, 5, 4, 1000, '2021-07-24 22:58:08', '2021-07-25 07:31:27', 'supprime'),
	(17, 1, 1, 5, '2021-07-24 23:29:43', '2021-07-25 07:37:29', 'supprime'),
	(18, 2, 2, 5650000, '2021-07-24 23:30:08', '2021-07-25 07:32:38', 'supprime'),
	(19, 4, 4, 1500, '2021-07-24 23:31:00', '2021-07-25 07:32:09', 'supprime'),
	(20, 3, 5, 2500, '2021-07-25 07:37:21', '2021-07-26 18:03:47', 'supprime'),
	(21, 2, 3, 1500, '2021-07-25 15:06:39', '2021-07-26 13:30:41', 'supprime'),
	(22, 2, 4, 5, '2021-07-26 11:13:15', '2021-07-26 13:28:05', 'supprime'),
	(23, 3, 5, 1, '2021-07-26 11:27:01', '2021-07-26 13:27:50', 'supprime'),
	(24, 6, 5, 5, '2021-07-26 11:43:51', '2021-07-26 13:27:46', 'supprime'),
	(25, 3, 1, 1, '2021-07-26 11:47:03', '2021-07-26 13:27:54', 'supprime'),
	(26, 1, 2, 5000, '2023-04-17 09:51:09', NULL, 'valide');
/*!40000 ALTER TABLE `dim_frais_livraison` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. empotage
CREATE TABLE IF NOT EXISTS `empotage` (
  `empotage_id` int(11) NOT NULL AUTO_INCREMENT,
  `pays_id` int(11) NOT NULL,
  `declarant_id` int(11) NOT NULL,
  `empotage_date_creation` timestamp NULL DEFAULT NULL,
  `empotage_date` date DEFAULT NULL,
  `empotage_date_depot` date DEFAULT NULL,
  `empotage_numero` varchar(50) DEFAULT NULL,
  `empotage_bl_bm` varchar(50) DEFAULT NULL,
  `empotage_user` varchar(25) DEFAULT NULL,
  `empotage_date_modification` datetime NOT NULL,
  `empotage_date_suppression` datetime NOT NULL,
  `empotage_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`empotage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.empotage : 2 rows
/*!40000 ALTER TABLE `empotage` DISABLE KEYS */;
INSERT INTO `empotage` (`empotage_id`, `pays_id`, `declarant_id`, `empotage_date_creation`, `empotage_date`, `empotage_date_depot`, `empotage_numero`, `empotage_bl_bm`, `empotage_user`, `empotage_date_modification`, `empotage_date_suppression`, `empotage_statut`) VALUES
	(1, 1, 1, NULL, NULL, NULL, 'empotage-01', 'bl-bm-01', 'kenzo', '2023-04-25 10:35:33', '2023-04-25 10:35:33', 'valide'),
	(2, 2, 2, NULL, NULL, NULL, 'empotage-02', 'bl-bm-02', 'dav', '2023-04-25 10:35:33', '2023-04-25 10:35:33', 'valide');
/*!40000 ALTER TABLE `empotage` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. entree_sortie
CREATE TABLE IF NOT EXISTS `entree_sortie` (
  `entree_sortie_id` int(11) NOT NULL,
  `entree_sortie_date_creation` timestamp NULL DEFAULT NULL,
  `entree_sortie_libelle` varchar(100) DEFAULT NULL,
  `entree_sortie_user` varchar(50) DEFAULT NULL,
  `entree_sortie_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`entree_sortie_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.entree_sortie : 0 rows
/*!40000 ALTER TABLE `entree_sortie` DISABLE KEYS */;
/*!40000 ALTER TABLE `entree_sortie` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. expediteur
CREATE TABLE IF NOT EXISTS `expediteur` (
  `expediteur_id` int(11) NOT NULL AUTO_INCREMENT,
  `expediteur_date_creation` timestamp NULL DEFAULT NULL,
  `expediteur_nom` varchar(50) DEFAULT NULL,
  `expediteur_adresse` varchar(50) DEFAULT NULL,
  `expediteur_tel` varchar(25) DEFAULT NULL,
  `expediteur_mail` varchar(25) DEFAULT NULL,
  `expediteur_user` varchar(25) DEFAULT NULL,
  `expediteur_date_modification` datetime NOT NULL,
  `expediteur_date_suppression` datetime NOT NULL,
  `expediteur_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`expediteur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.expediteur : 2 rows
/*!40000 ALTER TABLE `expediteur` DISABLE KEYS */;
INSERT INTO `expediteur` (`expediteur_id`, `expediteur_date_creation`, `expediteur_nom`, `expediteur_adresse`, `expediteur_tel`, `expediteur_mail`, `expediteur_user`, `expediteur_date_modification`, `expediteur_date_suppression`, `expediteur_statut`) VALUES
	(1, '2023-04-25 10:46:43', 'exportateur-01', '04 bp 3366 daloa 04', '010755443321', '@yahoo.fr', 'denver', '2023-04-25 10:46:42', '2023-04-25 10:46:42', 'valide'),
	(2, '2023-04-03 10:46:43', 'expediteur-02', 'bp 33448 abidjan 02', '075544332214', '@gmail.com', 'ali', '2023-04-25 10:46:42', '2023-04-25 10:46:42', 'valide');
/*!40000 ALTER TABLE `expediteur` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. fonction
CREATE TABLE IF NOT EXISTS `fonction` (
  `fonction_id` int(11) NOT NULL,
  `fonction_nom` datetime NOT NULL,
  `fonction_date_creation` datetime NOT NULL,
  `fonction_date_modification` datetime NOT NULL,
  `fonction_date_suppression` datetime NOT NULL,
  PRIMARY KEY (`fonction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.fonction : ~0 rows (environ)
/*!40000 ALTER TABLE `fonction` DISABLE KEYS */;
/*!40000 ALTER TABLE `fonction` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. kw_administrateur
CREATE TABLE IF NOT EXISTS `kw_administrateur` (
  `kw_administrateur_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kw_administrateur_login` varchar(255) NOT NULL,
  `kw_administrateur_pass` varchar(255) NOT NULL,
  `kw_administrateur_email` varchar(50) NOT NULL,
  `kw_administrateur_rang` int(11) NOT NULL,
  `kw_administrateur_statut` enum('active','desactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`kw_administrateur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='enregistre les administrateurs du site';

-- Listage des données de la table echargement_db.kw_administrateur : 1 rows
/*!40000 ALTER TABLE `kw_administrateur` DISABLE KEYS */;
INSERT INTO `kw_administrateur` (`kw_administrateur_id`, `kw_administrateur_login`, `kw_administrateur_pass`, `kw_administrateur_email`, `kw_administrateur_rang`, `kw_administrateur_statut`) VALUES
	(10, 'admin', 'fece6adde0ec8c975e2b5ec91fce57ab1852fca4', 'admin@gmail.com', 1, 'active');
/*!40000 ALTER TABLE `kw_administrateur` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. marchandise
CREATE TABLE IF NOT EXISTS `marchandise` (
  `marchandise_id` int(11) NOT NULL AUTO_INCREMENT,
  `marchandise_date_creation` timestamp NULL DEFAULT NULL,
  `marchandise_code_valorisation` varchar(100) DEFAULT NULL,
  `marchandise_libelle` varchar(100) DEFAULT NULL,
  `marchandise_valeur` decimal(8,2) DEFAULT NULL,
  `marchandise_user` varchar(50) DEFAULT NULL,
  `marchandise_date_modification` datetime DEFAULT NULL,
  `marchandise_date_suppression` datetime DEFAULT NULL,
  `marchandise_statut` enum('brouillon','valide','supprime') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`marchandise_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.marchandise : 2 rows
/*!40000 ALTER TABLE `marchandise` DISABLE KEYS */;
INSERT INTO `marchandise` (`marchandise_id`, `marchandise_date_creation`, `marchandise_code_valorisation`, `marchandise_libelle`, `marchandise_valeur`, `marchandise_user`, `marchandise_date_modification`, `marchandise_date_suppression`, `marchandise_statut`) VALUES
	(1, '2023-05-03 01:42:18', 'M0001', 'ORDINATEURS', NULL, NULL, NULL, NULL, 'valide'),
	(2, '2023-05-03 01:44:04', 'M0002', 'DISQUES DURS', NULL, NULL, NULL, NULL, 'valide');
/*!40000 ALTER TABLE `marchandise` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table echargement_db.migrations : ~0 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. moyen_transport
CREATE TABLE IF NOT EXISTS `moyen_transport` (
  `moyen_transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `moyen_transport_date_creation` timestamp NULL DEFAULT NULL,
  `moyen_transport_libelle` varchar(100) DEFAULT NULL,
  `moyen_transport_user` varchar(50) DEFAULT NULL,
  `moyen_transport_date_modification` datetime DEFAULT NULL,
  `moyen_transport_date_suppression` datetime DEFAULT NULL,
  `moyen_transport_statut` enum('brouillon','valide','supprime') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`moyen_transport_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.moyen_transport : 1 rows
/*!40000 ALTER TABLE `moyen_transport` DISABLE KEYS */;
INSERT INTO `moyen_transport` (`moyen_transport_id`, `moyen_transport_date_creation`, `moyen_transport_libelle`, `moyen_transport_user`, `moyen_transport_date_modification`, `moyen_transport_date_suppression`, `moyen_transport_statut`) VALUES
	(1, '2023-05-03 01:06:55', 'BATEAU', NULL, NULL, NULL, 'valide');
/*!40000 ALTER TABLE `moyen_transport` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. panier
CREATE TABLE IF NOT EXISTS `panier` (
  `panier_id` int(11) NOT NULL AUTO_INCREMENT,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `panier_produit_pu` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `panier_quantite` int(11) NOT NULL,
  `panier_statut` enum('brouillon','valide','supprime') NOT NULL DEFAULT 'brouillon',
  PRIMARY KEY (`panier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.panier : 0 rows
/*!40000 ALTER TABLE `panier` DISABLE KEYS */;
/*!40000 ALTER TABLE `panier` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. pays
CREATE TABLE IF NOT EXISTS `pays` (
  `pays_id` int(11) NOT NULL AUTO_INCREMENT,
  `pays_date_creation` timestamp NULL DEFAULT NULL,
  `pays_nom` varchar(50) DEFAULT NULL,
  `pays_user` varchar(25) DEFAULT NULL,
  `pays_date_modification` datetime NOT NULL,
  `pays_date_suppression` datetime NOT NULL,
  `pays_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`pays_id`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.pays : 208 rows
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` (`pays_id`, `pays_date_creation`, `pays_nom`, `pays_user`, `pays_date_modification`, `pays_date_suppression`, `pays_statut`) VALUES
	(1, NULL, 'afghanistan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(2, NULL, 'afrique du sud', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(3, NULL, 'albanie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(4, NULL, 'algerie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(5, NULL, 'allemagne', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(6, NULL, 'andorre', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(7, NULL, 'angola', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(8, NULL, 'antigua-et-barbuda', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(9, NULL, 'arabiesaoudite', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(10, NULL, 'argentine', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(11, NULL, 'armenie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(12, NULL, 'aruba', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(13, NULL, 'australie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(14, NULL, 'autriche', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(15, NULL, 'azerbaïdjan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(16, NULL, 'bahamas', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(17, NULL, 'bahreïn', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(18, NULL, 'bangladesh', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(19, NULL, 'barbade', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(20, NULL, 'belgique', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(21, NULL, 'belize', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(22, NULL, 'benin', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(23, NULL, 'bhoutan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(24, NULL, 'bielorussie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(25, NULL, 'bolivie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(26, NULL, 'bosnie-herzegovine', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(27, NULL, 'botswana', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(28, NULL, 'bresil', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(29, NULL, 'brunei', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(30, NULL, 'bulgarie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(31, NULL, 'burkina faso', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(32, NULL, 'burundi', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(33, NULL, 'caïmans(iles)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(34, NULL, 'cambodge', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(35, NULL, 'cameroun', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(36, NULL, 'canada', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(37, NULL, 'cap-vert', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(38, NULL, 'centrafrique', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(39, NULL, 'chili', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(40, NULL, 'chine', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(41, NULL, 'chine-hongkong', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(42, NULL, 'chine-macao', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(43, NULL, 'chypre', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(44, NULL, 'colombie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(45, NULL, 'comores', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(46, NULL, 'congo', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(47, NULL, 'congo(rdc)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(48, NULL, 'coree du nord', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(49, NULL, 'coree du sud', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(50, NULL, 'costa rica', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(51, NULL, 'cote d\'ivoire', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(52, NULL, 'croatie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(53, NULL, 'cuba', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(54, NULL, 'curaçao', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(55, NULL, 'danemark', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(56, NULL, 'djibouti', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(57, NULL, 'dominicaine(republique)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(58, NULL, 'dominique', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(59, NULL, 'égypte', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(60, NULL, 'émirats arabes unis', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(61, NULL, 'équateur', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(62, NULL, 'érythree', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(63, NULL, 'espagne', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(64, NULL, 'estonie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(65, NULL, 'états-unis', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(66, NULL, 'éthiopie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(67, NULL, 'fidji', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(68, NULL, 'finlande', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(69, NULL, 'france', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(70, NULL, 'gabon', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(71, NULL, 'gambie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(72, NULL, 'georgie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(73, NULL, 'ghana', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(74, NULL, 'grece', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(75, NULL, 'grenade', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(76, NULL, 'guadeloupe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(77, NULL, 'guam', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(78, NULL, 'guatemala', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(79, NULL, 'guinee', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(80, NULL, 'guineee quatoriale', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(81, NULL, 'guinee-bissau', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(82, NULL, 'guyana', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(83, NULL, 'guyane(française)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(84, NULL, 'haïti', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(85, NULL, 'honduras', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(86, NULL, 'hongrie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(87, NULL, 'inde', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(88, NULL, 'indonesie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(89, NULL, 'irak', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(90, NULL, 'iran', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(91, NULL, 'irlande', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(92, NULL, 'islande', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(93, NULL, 'israël', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(94, NULL, 'italie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(95, NULL, 'jamaïque', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(96, NULL, 'japon', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(97, NULL, 'jordanie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(98, NULL, 'kazakhstan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(99, NULL, 'kenya', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(100, NULL, 'kirghizistan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(101, NULL, 'kosovo', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(102, NULL, 'koweït', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(103, NULL, 'laos', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(104, NULL, 'lesotho', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(105, NULL, 'lettonie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(106, NULL, 'liban', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(107, NULL, 'liberia', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(108, NULL, 'libye', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(109, NULL, 'liechtenstein', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(110, NULL, 'lituanie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(111, NULL, 'luxembourg', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(112, NULL, 'macedoine', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(113, NULL, 'madagascar', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(114, NULL, 'malaisie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(115, NULL, 'malawi', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(116, NULL, 'maldives', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(117, NULL, 'mali', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(118, NULL, 'malte', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(119, NULL, 'maroc', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(120, NULL, 'marshall(îles)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(121, NULL, 'martinique', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(122, NULL, 'maurice', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(123, NULL, 'mauritanie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(124, NULL, 'mayotte', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(125, NULL, 'mexique', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(126, NULL, 'micronesie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(127, NULL, 'moldavie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(128, NULL, 'monaco', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(129, NULL, 'mongolie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(130, NULL, 'montenegro', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(131, NULL, 'mozambique', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(132, NULL, 'myanmar(birmanie)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(133, NULL, 'namibie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(134, NULL, 'nepal', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(135, NULL, 'nicaragua', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(136, NULL, 'niger', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(137, NULL, 'nigeria', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(138, NULL, 'norvege', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(139, NULL, 'nouvelle-caledonie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(140, NULL, 'nouvelle-zelande', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(141, NULL, 'oman', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(142, NULL, 'ouganda', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(143, NULL, 'ouzbekistan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(144, NULL, 'pakistan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(145, NULL, 'palau', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(146, NULL, 'palestine', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(147, NULL, 'panama', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(148, NULL, 'papouasie-nouvelle-guinee', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(149, NULL, 'paraguay', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(150, NULL, 'pays-bas', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(151, NULL, 'perou', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(152, NULL, 'philippines', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(153, NULL, 'pologne', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(154, NULL, 'polynesie française', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(155, NULL, 'portorico', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(156, NULL, 'portugal', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(157, NULL, 'qatar', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(158, NULL, 'reunion', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(159, NULL, 'roumanie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(160, NULL, 'royaume-uni', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(161, NULL, 'russie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(162, NULL, 'rwanda', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(163, NULL, 'sahara occidental', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(164, NULL, 'sainte lucie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(165, NULL, 'saint-marin', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(166, NULL, 'salomon(îles)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(167, NULL, 'salvador', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(168, NULL, 'samoa occidentales', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(169, NULL, 'saotome-et-principe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(170, NULL, 'senegal', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(171, NULL, 'serbie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(172, NULL, 'seychelles', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(173, NULL, 'sierra leone', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(174, NULL, 'singapour', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(175, NULL, 'slovaquie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(176, NULL, 'slovenie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(177, NULL, 'somalie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(178, NULL, 'soudan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(179, NULL, 'srilanka', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(180, NULL, 'stkitts-et-nevis', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(181, NULL, 'stvincent-et-les-grenadines', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(182, NULL, 'suede', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(183, NULL, 'suisse', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(184, NULL, 'surinam', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(185, NULL, 'swaziland', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(186, NULL, 'syrie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(187, NULL, 'tadjikistan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(188, NULL, 'taïwan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(189, NULL, 'tanzanie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(190, NULL, 'tchad', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(191, NULL, 'tcheque(republique)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(192, NULL, 'thaïlande', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(193, NULL, 'timor-est', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(194, NULL, 'togo', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(195, NULL, 'tonga', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(196, NULL, 'trinite-et-tobago', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(197, NULL, 'tunisie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(198, NULL, 'turkmenistan', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(199, NULL, 'turquie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(200, NULL, 'ukraine', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(201, NULL, 'uruguay', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(202, NULL, 'vanuatu', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(203, NULL, 'venezuela', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(204, NULL, 'vierges(îles)', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(205, NULL, 'vietnam', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(206, NULL, 'yemen', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(207, NULL, 'zambie', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon'),
	(208, NULL, 'zimbabwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'brouillon');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. plomb
CREATE TABLE IF NOT EXISTS `plomb` (
  `plomb_id` int(11) NOT NULL,
  `conteneur_id` int(11) NOT NULL,
  `plomb_date_creation` timestamp NULL DEFAULT NULL,
  `plomb_numero` varchar(100) DEFAULT NULL,
  `plomb_user` varchar(50) DEFAULT NULL,
  `plomb_date_modification` datetime NOT NULL,
  `plomb_date_suppression` datetime NOT NULL,
  `plomb_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`plomb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.plomb : 0 rows
/*!40000 ALTER TABLE `plomb` DISABLE KEYS */;
/*!40000 ALTER TABLE `plomb` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. poste
CREATE TABLE IF NOT EXISTS `poste` (
  `poste_id` int(11) NOT NULL,
  `poste_date_creation` timestamp NULL DEFAULT NULL,
  `poste_libelle` varchar(100) DEFAULT NULL,
  `poste_user` varchar(50) DEFAULT NULL,
  `poste_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`poste_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.poste : 0 rows
/*!40000 ALTER TABLE `poste` DISABLE KEYS */;
/*!40000 ALTER TABLE `poste` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `produit_id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_id` int(11) NOT NULL,
  `produit_nom` varchar(255) NOT NULL,
  `produit_photo` varchar(255) DEFAULT NULL,
  `produit_description` longtext,
  `produit_prix` int(11) NOT NULL,
  `produit_stock` int(11) DEFAULT NULL,
  `produit_date_creation` datetime DEFAULT NULL,
  `produit_date_modification` datetime DEFAULT NULL,
  `produit_date_suppression` datetime DEFAULT NULL,
  `produit_statut` enum('valide','desactive','supprime') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`produit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.produit : 18 rows
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` (`produit_id`, `categorie_id`, `produit_nom`, `produit_photo`, `produit_description`, `produit_prix`, `produit_stock`, `produit_date_creation`, `produit_date_modification`, `produit_date_suppression`, `produit_statut`) VALUES
	(1, 3, 'sandwitch au poulet', 'https://images.anaca3.com/wp-content/uploads/2018/01/recette-sandwich-minceur-poulet-crudites-et-sauce-blanche-maison-702x336.jpg', 'sandwitch au poulet', 2500, NULL, '2021-01-22 22:00:00', '2021-05-13 15:28:41', '2021-06-21 16:46:15', 'supprime'),
	(2, 4, 'poulet yassa', 'https://img.cuisineaz.com/610x610/2016-04-28/i96651-poulet-yassa.jpg', 'poulet yassa', 1500, NULL, '2021-01-22 22:00:00', '2021-05-13 00:09:58', '2021-06-21 16:46:05', 'supprime'),
	(3, 3, 'tchep au poisson', 'https://static.independent.co.uk/2021/03/12/11/three-ways-with-tofu-120321.jpg?width=640&auto=webp&quality=75', 'techp au poisson', 1000, NULL, '2021-01-22 22:00:00', '2021-05-13 00:18:18', '2021-07-26 13:10:31', 'supprime'),
	(4, 3, 'foutou banane', 'https://www.linfodrome.com/media/article/images/thumb/58208-eccefc92bbbd118902c8d382dac78b64_xl.webp', 'foutou banane', 1000, NULL, '2021-01-22 22:00:00', '2021-05-13 00:10:25', '2021-06-23 11:06:08', 'supprime'),
	(5, 3, 'garba', 'https://institutionci.com/wp-content/uploads/2020/08/image-8.jpeg', 'garba choco', 700, NULL, '2021-01-22 22:00:00', '2021-05-13 15:29:02', '2021-06-21 16:47:45', 'supprime'),
	(6, 4, 'jus de fruits', '', 'jus de fruits', 200, NULL, '2021-01-22 22:00:00', '2021-05-13 10:20:05', '2021-06-21 16:47:45', 'supprime'),
	(7, 3, 'foutou banane', '', 'foutou banane', 1000, NULL, '2021-01-22 22:00:00', '2021-05-13 15:04:03', '2023-04-13 23:57:41', 'supprime'),
	(13, 3, 'attieke poisson fume', 'produit_1620613957_1_anniversaire2021.png', 'apf', 1000, NULL, '2021-01-22 22:00:00', '2021-05-13 15:18:51', '2023-04-13 23:57:44', 'supprime'),
	(12, 3, 'porc au four', 'produit_1620598005_1_banner-bg__.jpg', 'lkjlkj', 500, NULL, '2021-01-22 22:00:00', '2021-05-13 00:54:45', '2021-05-12 21:01:18', 'valide'),
	(14, 3, 'soupe de poisson', 'produit_1620614431_1_anniversaire2021.png', 'soupe de poisson', 1000, NULL, '2021-01-22 22:00:00', '2021-05-13 10:22:50', '2021-06-28 12:43:39', 'supprime'),
	(16, 3, 'riz sauce graine', 'produit_1624290093_2_fb_img_1622746520606.jpg', 'c\'est un bon plat ivoirien', 100, NULL, '2021-06-21 15:41:33', NULL, '2021-06-24 16:40:23', 'supprime'),
	(17, 4, 'nobis ratione commod', 'produit_1624446352_2_fb_img_1622746540730.jpg', 'optio dolor veniam', 19, NULL, '2021-06-23 11:05:52', NULL, '2021-06-23 11:06:02', 'supprime'),
	(18, 3, 'placeat dolore volu', 'produit_1624446871_2_fb_img_1622746544041.jpg', 'qui dolorum sit ist', 36, NULL, '2021-06-23 11:14:31', '2021-06-23 13:34:22', '2021-06-28 12:43:32', 'supprime'),
	(19, 3, 'est dolore labore po', 'produit_1624537255_2_201128710_489382722358453_2881320922932180477_n.jpg', 'reprehenderit natus', 88, NULL, '2021-06-24 12:20:55', NULL, '2021-06-28 12:43:26', 'supprime'),
	(20, 3, 'impedit laborum aut', 'produit_1624888259_2_balloons-1903002_1920.png', 'natus dolore ut sed', 70, NULL, '2021-06-28 13:50:59', NULL, NULL, 'valide'),
	(21, 3, 'ut explicabo rerum', 'produit_1625042583_2_fb_img_1622746520606.jpg', 'dolores incidunt la', 83, NULL, '2021-06-30 08:43:03', NULL, NULL, 'valide'),
	(22, 4, 'est exercitation vo', 'produit_1625214462_2_fb_img_1622746540730.jpg', 'fuga est architecto', 28, NULL, '2021-07-02 08:27:42', NULL, NULL, 'valide'),
	(23, 4, 'test produit', 'produit_1681428187_2_télécharger.jpg', 'desc produit', 10000, NULL, '2023-04-13 23:23:07', NULL, NULL, 'valide');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. regime
CREATE TABLE IF NOT EXISTS `regime` (
  `regime_id` int(11) NOT NULL AUTO_INCREMENT,
  `regime_date_creation` timestamp NULL DEFAULT NULL,
  `regime_libelle` varchar(100) DEFAULT NULL,
  `regime_user` varchar(50) DEFAULT NULL,
  `regime_date_modification` datetime DEFAULT NULL,
  `regime_date_suppression` datetime DEFAULT NULL,
  `regime_statut` enum('brouillon','valide','supprime') DEFAULT 'valide',
  PRIMARY KEY (`regime_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.regime : 1 rows
/*!40000 ALTER TABLE `regime` DISABLE KEYS */;
INSERT INTO `regime` (`regime_id`, `regime_date_creation`, `regime_libelle`, `regime_user`, `regime_date_modification`, `regime_date_suppression`, `regime_statut`) VALUES
	(1, '2023-05-03 01:06:02', 'Régime 1', NULL, NULL, NULL, 'valide');
/*!40000 ALTER TABLE `regime` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. reunion
CREATE TABLE IF NOT EXISTS `reunion` (
  `reunion_id` int(11) NOT NULL AUTO_INCREMENT,
  `reunion_ordre_jour` varchar(255) NOT NULL,
  `reunion_pv` text NOT NULL,
  `reunion_date_creation` datetime NOT NULL,
  `reunion_date_modification` datetime NOT NULL,
  `reunion_date_suppression` datetime NOT NULL,
  `reunion_statut` enum('valide','desactive','supprime') NOT NULL DEFAULT 'valide',
  PRIMARY KEY (`reunion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.reunion : ~0 rows (environ)
/*!40000 ALTER TABLE `reunion` DISABLE KEYS */;
INSERT INTO `reunion` (`reunion_id`, `reunion_ordre_jour`, `reunion_pv`, `reunion_date_creation`, `reunion_date_modification`, `reunion_date_suppression`, `reunion_statut`) VALUES
	(1, 'réunion', 'réunion', '2021-07-07 15:55:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'valide');
/*!40000 ALTER TABLE `reunion` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. role
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(11) NOT NULL,
  `role_date_creation` timestamp NULL DEFAULT NULL,
  `role_libelle` varchar(100) DEFAULT NULL,
  `role_user` varchar(50) DEFAULT NULL,
  `role_date_modification` datetime NOT NULL,
  `role_date_suppression` datetime NOT NULL,
  `role_statut` enum('brouillon','valide','supprime') NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.role : 0 rows
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. society
CREATE TABLE IF NOT EXISTS `society` (
  `society_id` int(11) NOT NULL,
  `society_nom` varchar(255) NOT NULL,
  `society_date_creation` datetime NOT NULL,
  `society_date_modification` datetime NOT NULL,
  `society_date_suppression` datetime NOT NULL,
  PRIMARY KEY (`society_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.society : ~0 rows (environ)
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
/*!40000 ALTER TABLE `society` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_action
CREATE TABLE IF NOT EXISTS `tb_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_creation` int(11) NOT NULL DEFAULT '0',
  `user_id_suppression` int(11) NOT NULL DEFAULT '0',
  `action_code` varchar(50) NOT NULL DEFAULT '0',
  `action_libelle` varchar(255) DEFAULT NULL,
  `action_date_creation` datetime DEFAULT NULL,
  `action_statut` enum('valide','supprime') DEFAULT 'valide',
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.tb_action : 0 rows
/*!40000 ALTER TABLE `tb_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_action` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_autorisation
CREATE TABLE IF NOT EXISTS `tb_autorisation` (
  `autorisation_id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `autorisation_date_creation` datetime DEFAULT NULL,
  `autorisation_statut` enum('valide','desactive') DEFAULT 'valide',
  PRIMARY KEY (`autorisation_id`),
  UNIQUE KEY `index 1` (`action_id`,`profil_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.tb_autorisation : 0 rows
/*!40000 ALTER TABLE `tb_autorisation` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_autorisation` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_participants
CREATE TABLE IF NOT EXISTS `tb_participants` (
  `participant_id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_nom` varchar(255) NOT NULL,
  `participant_contact` int(11) NOT NULL,
  `participant_email` varchar(255) NOT NULL,
  `participant_fonction` varchar(200) NOT NULL,
  `participant_society` varchar(200) NOT NULL,
  `participant_date_creation` datetime DEFAULT NULL,
  `participant_date_modification` datetime DEFAULT NULL,
  `participant_date_suppression` datetime DEFAULT NULL,
  `participant_statut` enum('valide','desactive','supprime') DEFAULT 'valide',
  PRIMARY KEY (`participant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.tb_participants : ~9 rows (environ)
/*!40000 ALTER TABLE `tb_participants` DISABLE KEYS */;
INSERT INTO `tb_participants` (`participant_id`, `participant_nom`, `participant_contact`, `participant_email`, `participant_fonction`, `participant_society`, `participant_date_creation`, `participant_date_modification`, `participant_date_suppression`, `participant_statut`) VALUES
	(1, 'boussou', 78607985, 'juste@gmail.com', 'informaticien', 'burida', '2021-06-29 17:48:29', '2021-06-29 17:48:30', '2021-07-02 08:30:30', 'supprime'),
	(2, 'kouakou', 44455669, 'jahofecyna@mailinator.com', 'tempor dolorum aliqu', 'deleniti voluptatem', NULL, NULL, '2021-07-02 08:30:43', 'supprime'),
	(3, 'bile', 77979797, 'xovivozyhy@mailinator.com', 'doloremque obcaecati', 'culpa sed consequat', NULL, NULL, '2021-07-02 08:30:47', 'supprime'),
	(4, 'soro', 32644696, 'cufa@mailinator.com', 'totam ad minim quaer', 'ut ipsa repudiandae', NULL, NULL, '2021-07-02 08:30:51', 'supprime'),
	(5, 'kouassi', 12455333, 'muki@mailinator.com', 'rem unde veritatis f', 'aut velit officia a', '2021-07-02 08:21:45', '2021-07-02 08:31:17', NULL, 'valide'),
	(6, 'bette', 78789655, 'mabyzymyza@mailinator.com', 'enim et aut quis deb', 'eligendi exercitatio', '2021-07-02 08:22:15', NULL, '2021-07-02 08:31:01', 'supprime'),
	(7, 'bolo', 78946142, 'fyhemecaf@mailinator.com', 'possimus aperiam in', 'in eligendi placeat', '2021-07-02 08:26:17', NULL, '2021-07-02 08:30:56', 'supprime'),
	(8, 'kone seydou', 41420214, 'krak225@gmail.com', 'dg', 'burida', '2021-07-07 14:01:44', NULL, NULL, 'valide'),
	(9, 'kone seydou', 0, 'krak225@gmail.com', 'dg', 'burida', '2021-07-13 10:59:39', NULL, NULL, 'valide');
/*!40000 ALTER TABLE `tb_participants` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_password_resets
CREATE TABLE IF NOT EXISTS `tb_password_resets` (
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table echargement_db.tb_password_resets : 0 rows
/*!40000 ALTER TABLE `tb_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_password_resets` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_profil
CREATE TABLE IF NOT EXISTS `tb_profil` (
  `profil_id` int(11) NOT NULL AUTO_INCREMENT,
  `profil_libelle` varchar(50) DEFAULT NULL,
  `profil_statut` enum('valide','brouillon') DEFAULT 'valide',
  PRIMARY KEY (`profil_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.tb_profil : 5 rows
/*!40000 ALTER TABLE `tb_profil` DISABLE KEYS */;
INSERT INTO `tb_profil` (`profil_id`, `profil_libelle`, `profil_statut`) VALUES
	(1, 'ADMINISTRATEUR', 'valide'),
	(2, 'ENTREE POSTE 1', 'valide'),
	(3, 'SORTIE POSTE 1', 'valide'),
	(4, 'ENTREE POSTE 2', 'valide'),
	(5, 'SORTIE POSTE 2', 'valide');
/*!40000 ALTER TABLE `tb_profil` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_request
CREATE TABLE IF NOT EXISTS `tb_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `request_url` varchar(255) DEFAULT NULL,
  `request_querystring` varchar(255) DEFAULT NULL,
  `request_statut` enum('bon','faux','brouillon') DEFAULT 'brouillon',
  PRIMARY KEY (`request_id`)
) ENGINE=MyISAM AUTO_INCREMENT=979 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.tb_request : 978 rows
/*!40000 ALTER TABLE `tb_request` DISABLE KEYS */;
INSERT INTO `tb_request` (`request_id`, `request_url`, `request_querystring`, `request_statut`) VALUES
	(1, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(2, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(3, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(4, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(5, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(6, 'http://webapp.test/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(7, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(8, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(9, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(10, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(11, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(12, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(13, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(14, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(15, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(16, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(17, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(18, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(19, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(20, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(21, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(22, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(23, 'http://webapp.test/password/eventually.ogg', 'password/eventually.ogg', 'brouillon'),
	(24, 'http://webapp.test/password/eventually.mp3', 'password/eventually.mp3', 'brouillon'),
	(25, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(26, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(27, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(28, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(29, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(30, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(31, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(32, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(33, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(34, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(35, 'http://webapp.test/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(36, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(37, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(38, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(39, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(40, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(41, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(42, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(43, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(44, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(45, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(46, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(47, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(48, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(49, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(50, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(51, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(52, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(53, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(54, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(55, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(56, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(57, 'http://webapp.test/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(58, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(59, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(60, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(61, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(62, 'http://webapp.test/presence', 'presence', 'brouillon'),
	(63, 'http://webapp.test/presence', 'presence', 'brouillon'),
	(64, 'http://webapp.test/participant', 'participant', 'brouillon'),
	(65, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(66, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(67, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(68, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(69, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(70, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(71, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(72, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(73, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(74, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(75, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(76, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(77, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(78, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(79, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(80, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(81, 'http://webapp.test/list-participant', 'list-participant', 'brouillon'),
	(82, 'http://webapp.test/list-participant', 'list-participant', 'brouillon'),
	(83, 'http://webapp.test/participants.list-participant', 'participants.list-participant', 'brouillon'),
	(84, 'http://webapp.test/participants.list-participant', 'participants.list-participant', 'brouillon'),
	(85, 'http://webapp.test/participants.list-participant', 'participants.list-participant', 'brouillon'),
	(86, 'http://webapp.test/participants.list-participant', 'participants.list-participant', 'brouillon'),
	(87, 'http://webapp.test/participants.list-participant', 'participants.list-participant', 'brouillon'),
	(88, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(89, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(90, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(91, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(92, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(93, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(94, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(95, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(96, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(97, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(98, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(99, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(100, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(101, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(102, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(103, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(104, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(105, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(106, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(107, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(108, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(109, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(110, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(111, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(112, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(113, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(114, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(115, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(116, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(117, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(118, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(119, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(120, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(121, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(122, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(123, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(124, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(125, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(126, 'http://webapp.test/particpants/1', 'particpants/1', 'brouillon'),
	(127, 'http://webapp.test/particpants/1', 'particpants/1', 'brouillon'),
	(128, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(129, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(130, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(131, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(132, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(133, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(134, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(135, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(136, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(137, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(138, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(139, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(140, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(141, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(142, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(143, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(144, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(145, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(146, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(147, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(148, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(149, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(150, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(151, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(152, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(153, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(154, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(155, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(156, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(157, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(158, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(159, 'http://webapp.test/participant/5', 'participant/5', 'brouillon'),
	(160, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(161, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(162, 'http://webapp.test/participant/1', 'participant/1', 'brouillon'),
	(163, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(164, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(165, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(166, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(167, 'http://webapp.test/participant.show/1', 'participant.show/1', 'brouillon'),
	(168, 'http://webapp.test/participant.show/1', 'participant.show/1', 'brouillon'),
	(169, 'http://webapp.test/participant.show/1', 'participant.show/1', 'brouillon'),
	(170, 'http://webapp.test/participants.index', 'participants.index', 'brouillon'),
	(171, 'http://webapp.test/participants.index', 'participants.index', 'brouillon'),
	(172, 'http://webapp.test/participants.index', 'participants.index', 'brouillon'),
	(173, 'http://webapp.test/participants.listparticipant', 'participants.listparticipant', 'brouillon'),
	(174, 'http://webapp.test/participants.listparticipant', 'participants.listparticipant', 'brouillon'),
	(175, 'http://webapp.test/participants.listparticipant', 'participants.listparticipant', 'brouillon'),
	(176, 'http://webapp.test/participants.listparticipant', 'participants.listparticipant', 'brouillon'),
	(177, 'http://webapp.test/participants.listparticipant', 'participants.listparticipant', 'brouillon'),
	(178, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(179, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(180, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(181, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(182, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(183, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(184, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(185, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(186, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(187, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(188, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(189, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(190, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(191, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(192, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(193, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(194, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(195, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(196, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(197, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(198, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(199, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(200, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(201, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(202, 'http://webapp.test/participants.listparticipant', 'participants.listparticipant', 'brouillon'),
	(203, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(204, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(205, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(206, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(207, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(208, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(209, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(210, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(211, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(212, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(213, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(214, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(215, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(216, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(217, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(218, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(219, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(220, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(221, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(222, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(223, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(224, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(225, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(226, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(227, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(228, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(229, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(230, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(231, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(232, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(233, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(234, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(235, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(236, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(237, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(238, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(239, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(240, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(241, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(242, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(243, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(244, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(245, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(246, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(247, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(248, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(249, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(250, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(251, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(252, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(253, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(254, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(255, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(256, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(257, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(258, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(259, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(260, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(261, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(262, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(263, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(264, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(265, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(266, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(267, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(268, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(269, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(270, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(271, 'http://webapp.test/admin', 'admin', 'brouillon'),
	(272, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(273, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(274, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(275, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(276, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(277, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(278, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(279, 'http://webapp.test/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(280, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(281, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(282, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(283, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(284, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(285, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(286, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(287, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(288, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(289, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(290, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(291, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(292, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(293, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(294, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(295, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(296, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(297, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(298, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(299, 'http://webapp.test/images/produits/produit_1620614431_1_anniversaire2021.png', 'images/produits/produit_1620614431_1_anniversaire2021.png', 'brouillon'),
	(300, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(301, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(302, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(303, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(304, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(305, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(306, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(307, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(308, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(309, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(310, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(311, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(312, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(313, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(314, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(315, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(316, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(317, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(318, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(319, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(320, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(321, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(322, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(323, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(324, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(325, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(326, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(327, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(328, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(329, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(330, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(331, 'http://webapp.test/participants.participants', 'participants.participants', 'brouillon'),
	(332, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(333, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(334, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(335, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(336, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(337, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(338, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(339, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(340, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(341, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(342, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(343, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(344, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(345, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(346, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(347, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(348, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(349, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(350, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(351, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(352, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(353, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(354, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(355, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(356, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(357, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(358, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(359, 'http://webapp.test/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(360, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(361, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(362, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(363, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(364, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(365, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(366, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(367, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(368, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(369, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(370, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(371, 'http://webapp.test/css/select2.png', 'css/select2.png', 'brouillon'),
	(372, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(373, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(374, 'http://webapp.test/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(375, 'http://webapp.test/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(376, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(377, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(378, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(379, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(380, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(381, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(382, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(383, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(384, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(385, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(386, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(387, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(388, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(389, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(390, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(391, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(392, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(393, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(394, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(395, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(396, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(397, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(398, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(399, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(400, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(401, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(402, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(403, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(404, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(405, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(406, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(407, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(408, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(409, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(410, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(411, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(412, 'http://webapp.test/participants.reunion', 'participants.reunion', 'brouillon'),
	(413, 'http://localhost/webapp', 'webapp', 'brouillon'),
	(414, 'http://localhost/webapp/public/participants.reunion', 'participants.reunion', 'brouillon'),
	(415, 'http://localhost/webapp/public/participants.reunion', 'participants.reunion', 'brouillon'),
	(416, 'http://localhost/webapp/public/participants.reunion', 'participants.reunion', 'brouillon'),
	(417, 'http://localhost/webapp/public/participants.reunion', 'participants.reunion', 'brouillon'),
	(418, 'http://ecommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(419, 'http://ecommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(420, 'http://ecommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(421, 'http://ecommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(422, 'http://ecommerce-admin.com/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(423, 'http://ecommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(424, 'http://ecommerce-admin.com/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(425, 'http://ecommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(426, 'http://ecommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(427, 'http://ecommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(428, 'http://ecommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(429, 'http://ecommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(430, 'http://ecommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(431, 'http://ecommerce-admin.com/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(432, 'http://ecommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(433, 'http://ecommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(434, 'http://ecommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(435, 'http://ecommerce-admin.com/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(436, 'http://ecommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(437, 'http://ecommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(438, 'http://ecommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(439, 'http://ecommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(440, 'http://ecommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(441, 'http://ecommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(442, 'http://ecommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(443, 'http://ecommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(444, 'http://ecommerce-admin.com/images/produits/produit_1620613957_1_anniversaire2021.png', 'images/produits/produit_1620613957_1_anniversaire2021.png', 'brouillon'),
	(445, 'http://ecommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(446, 'http://localhost/dipdip.fr/ecommerce-admin/login', 'dipdip.fr/ecommerce-admin/login', 'brouillon'),
	(447, 'http://dipdip.fr.com/ecommerce-admin', 'ecommerce-admin', 'brouillon'),
	(448, 'http://dipcommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(449, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(450, 'http://dipcommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(451, 'http://dipcommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(452, 'http://dipcommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(453, 'http://dipcommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(454, 'http://dipcommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(455, 'http://dipcommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(456, 'http://dipcommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(457, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(458, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(459, 'http://dipcommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(460, 'http://dipcommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(461, 'http://dipcommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(462, 'http://dipcommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(463, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(464, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(465, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(466, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(467, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(468, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(469, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(470, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(471, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(472, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(473, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(474, 'http://dipcommerce-admin.com/setcommandelivree', 'setcommandelivree', 'brouillon'),
	(475, 'http://dipcommerce-admin.com/setcommandelivree', 'setcommandelivree', 'brouillon'),
	(476, 'http://dipcommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(477, 'http://dipcommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(478, 'http://dipcommerce-admin.com/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(479, 'http://dipcommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(480, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(481, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(482, 'http://dipcommerce-admin.com/setcommandelivree', 'setcommandelivree', 'brouillon'),
	(483, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(484, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(485, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(486, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(487, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(488, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(489, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(490, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(491, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(492, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(493, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(494, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(495, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(496, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(497, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(498, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(499, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(500, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(501, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(502, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(503, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(504, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(505, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(506, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(507, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(508, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(509, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(510, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(511, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(512, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(513, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(514, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(515, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(516, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(517, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(518, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(519, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(520, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(521, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(522, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(523, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(524, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(525, 'http://dipcommerce-admin.com/supprimer_categorie', 'supprimer_categorie', 'brouillon'),
	(526, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(527, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(528, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(529, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(530, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(531, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(532, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(533, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(534, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(535, 'http://dipcommerce-admin.com/supprimer_categorie', 'supprimer_categorie', 'brouillon'),
	(536, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(537, 'http://dipcommerce-admin.com/supprimer_categorie', 'supprimer_categorie', 'brouillon'),
	(538, 'http://dipcommerce-admin.com/supprimer_categorie', 'supprimer_categorie', 'brouillon'),
	(539, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(540, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(541, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(542, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(543, 'http://dipcommerce-admin.com/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(544, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(545, 'http://dipcommerce-admin.com/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(546, 'http://dipcommerce-admin.com/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(547, 'http://dipcommerce-admin.com/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(548, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(549, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(550, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(551, 'http://dipcommerce-admin.com/css/select2.png', 'css/select2.png', 'brouillon'),
	(552, 'http://127.0.0.1:8000/public', 'public', 'brouillon'),
	(553, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(554, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(555, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(556, 'http://127.0.0.1:8000/helloshop-admin/public/js/datatables/lang/french.json', 'helloshop-admin/public/js/datatables/lang/french.json', 'brouillon'),
	(557, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(558, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(559, 'http://127.0.0.1:8000/helloshop-admin/public/supprimer_produit', 'helloshop-admin/public/supprimer_produit', 'brouillon'),
	(560, 'http://127.0.0.1:8000/images/produits/produit_7_1620917105_1_avatar.jpg', 'images/produits/produit_7_1620917105_1_avatar.jpg', 'brouillon'),
	(561, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(562, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(563, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(564, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(565, 'http://127.0.0.1:8000/helloshop-admin/public/js/datatables/lang/french.json', 'helloshop-admin/public/js/datatables/lang/french.json', 'brouillon'),
	(566, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(567, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(568, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(569, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(570, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(571, 'http://127.0.0.1:8000/helloshop-admin/public/js/datatables/lang/french.json', 'helloshop-admin/public/js/datatables/lang/french.json', 'brouillon'),
	(572, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(573, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(574, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(575, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(576, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(577, 'http://127.0.0.1:8000/helloshop-admin/public/js/datatables/lang/french.json', 'helloshop-admin/public/js/datatables/lang/french.json', 'brouillon'),
	(578, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(579, 'http://127.0.0.1:8000/helloshop-admin/public/js/datatables/lang/french.json', 'helloshop-admin/public/js/datatables/lang/french.json', 'brouillon'),
	(580, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(581, 'http://127.0.0.1:8000/public/js/datatables/lang/french.json', 'public/js/datatables/lang/french.json', 'brouillon'),
	(582, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(583, 'http://127.0.0.1:8000/public/js/datatables/lang/french.json', 'public/js/datatables/lang/french.json', 'brouillon'),
	(584, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(585, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(586, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(587, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(588, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(589, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(590, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(591, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(592, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(593, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(594, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(595, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(596, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(597, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(598, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(599, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(600, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(601, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(602, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(603, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(604, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(605, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(606, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(607, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(608, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(609, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(610, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(611, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(612, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(613, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(614, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(615, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(616, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(617, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(618, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(619, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(620, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(621, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(622, 'http://127.0.0.1:8000/password/eventually.ogg', 'password/eventually.ogg', 'brouillon'),
	(623, 'http://127.0.0.1:8000/password/eventually.mp3', 'password/eventually.mp3', 'brouillon'),
	(624, 'http://127.0.0.1:8000/utilisateur/2/eventually.ogg', 'utilisateur/2/eventually.ogg', 'brouillon'),
	(625, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(626, 'http://127.0.0.1:8000/utilisateur/2/eventually.mp3', 'utilisateur/2/eventually.mp3', 'brouillon'),
	(627, 'http://127.0.0.1:8000/utilisateur/1/eventually.ogg', 'utilisateur/1/eventually.ogg', 'brouillon'),
	(628, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(629, 'http://127.0.0.1:8000/utilisateur/1/eventually.mp3', 'utilisateur/1/eventually.mp3', 'brouillon'),
	(630, 'http://127.0.0.1:8000/utilisateur/1/modifier', 'utilisateur/1/modifier', 'brouillon'),
	(631, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(632, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(633, 'http://127.0.0.1:8000/utilisateur/1/modifier', 'utilisateur/1/modifier', 'brouillon'),
	(634, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(635, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(636, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(637, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(638, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(639, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(640, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(641, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(642, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(643, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(644, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(645, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(646, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(647, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(648, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(649, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(650, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(651, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(652, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(653, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(654, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(655, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(656, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(657, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(658, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(659, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(660, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(661, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(662, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(663, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(664, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(665, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(666, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(667, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(668, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(669, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(670, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(671, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(672, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(673, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(674, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(675, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(676, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(677, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(678, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(679, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(680, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(681, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(682, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(683, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(684, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(685, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(686, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(687, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(688, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(689, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(690, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(691, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(692, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(693, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(694, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(695, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(696, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(697, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(698, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(699, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(700, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(701, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(702, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(703, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(704, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(705, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(706, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(707, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(708, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(709, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(710, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(711, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(712, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(713, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(714, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(715, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(716, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(717, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(718, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(719, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(720, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(721, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(722, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(723, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(724, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(725, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(726, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(727, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(728, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(729, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(730, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(731, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(732, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(733, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(734, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(735, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(736, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(737, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(738, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(739, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(740, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(741, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(742, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(743, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(744, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(745, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(746, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(747, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(748, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(749, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(750, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(751, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(752, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(753, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(754, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(755, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(756, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(757, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(758, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(759, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(760, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(761, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(762, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(763, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(764, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(765, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(766, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(767, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(768, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(769, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(770, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(771, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(772, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(773, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(774, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(775, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(776, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(777, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(778, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(779, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(780, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(781, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(782, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(783, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(784, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(785, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(786, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(787, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(788, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(789, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(790, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(791, 'http://127.0.0.1:8000/agents_douane', 'agents_douane', 'brouillon'),
	(792, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(793, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(794, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(795, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(796, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(797, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(798, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(799, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(800, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(801, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(802, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(803, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(804, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(805, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(806, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(807, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(808, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(809, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(810, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(811, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(812, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(813, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(814, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(815, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(816, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(817, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(818, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(819, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(820, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(821, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(822, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(823, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(824, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(825, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(826, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(827, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(828, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(829, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(830, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(831, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(832, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(833, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(834, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(835, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(836, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(837, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(838, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(839, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(840, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(841, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(842, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(843, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(844, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(845, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(846, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(847, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(848, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(849, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(850, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(851, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(852, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(853, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(854, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(855, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(856, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(857, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(858, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(859, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(860, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(861, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(862, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(863, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(864, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(865, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(866, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(867, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(868, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(869, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(870, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(871, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(872, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(873, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(874, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(875, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(876, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(877, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(878, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(879, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(880, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(881, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(882, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(883, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(884, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(885, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(886, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(887, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(888, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(889, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(890, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(891, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(892, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(893, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(894, 'http://127.0.0.1:8000/images/vehicules', 'images/vehicules', 'brouillon'),
	(895, 'http://127.0.0.1:8000/images/declarants', 'images/declarants', 'brouillon'),
	(896, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(897, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(898, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(899, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(900, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(901, 'http://127.0.0.1:8000/vehicule', 'vehicule', 'brouillon'),
	(902, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(903, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(904, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(905, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(906, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(907, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(908, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(909, 'http://127.0.0.1:8000/modifier_produit/12', 'modifier_produit/12', 'brouillon'),
	(910, 'http://127.0.0.1:8000/images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'images/produits/produit_1625214462_2_fb_img_1622746540730.jpg', 'brouillon'),
	(911, 'http://127.0.0.1:8000/images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'images/produits/produit_1625042583_2_fb_img_1622746520606.jpg', 'brouillon'),
	(912, 'http://127.0.0.1:8000/images/produits/produit_1620598005_1_banner-bg__.jpg', 'images/produits/produit_1620598005_1_banner-bg__.jpg', 'brouillon'),
	(913, 'http://127.0.0.1:8000/images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'images/produits/produit_1624888259_2_balloons-1903002_1920.png', 'brouillon'),
	(914, 'http://127.0.0.1:8000/css/select2x2.png', 'css/select2x2.png', 'brouillon'),
	(915, 'http://127.0.0.1:8000/password/eventually.ogg', 'password/eventually.ogg', 'brouillon'),
	(916, 'http://127.0.0.1:8000/password/eventually.mp3', 'password/eventually.mp3', 'brouillon'),
	(917, 'http://127.0.0.1:8000/modifier_vehicule/undefined', 'modifier_vehicule/undefined', 'brouillon'),
	(918, 'http://127.0.0.1:8000/modifier_vehicule/undefined', 'modifier_vehicule/undefined', 'brouillon'),
	(919, 'http://127.0.0.1:8000/modifier_vehicule/undefined', 'modifier_vehicule/undefined', 'brouillon'),
	(920, 'http://127.0.0.1:8000/modifier_vehicule/undefined', 'modifier_vehicule/undefined', 'brouillon'),
	(921, 'http://127.0.0.1:8000/modifier_vehicule/undefined', 'modifier_vehicule/undefined', 'brouillon'),
	(922, 'http://127.0.0.1:8000/sortie_vehicule/undefined', 'sortie_vehicule/undefined', 'brouillon'),
	(923, 'http://127.0.0.1:8000/sortie_vehicule/undefined', 'sortie_vehicule/undefined', 'brouillon'),
	(924, 'http://127.0.0.1:8000/sortie_vehicule/undefined', 'sortie_vehicule/undefined', 'brouillon'),
	(925, 'http://127.0.0.1:8000/sortie_vehicule/3', 'sortie_vehicule/3', 'brouillon'),
	(926, 'http://127.0.0.1:8000/sortie_vehicule/3', 'sortie_vehicule/3', 'brouillon'),
	(927, 'http://127.0.0.1:8000/sortie_vehicule/3', 'sortie_vehicule/3', 'brouillon'),
	(928, 'http://127.0.0.1:8000/sortie_vehicule/3', 'sortie_vehicule/3', 'brouillon'),
	(929, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(930, 'http://127.0.0.1:8000/images/declarations', 'images/declarations', 'brouillon'),
	(931, 'http://127.0.0.1:8000/images/declarations', 'images/declarations', 'brouillon'),
	(932, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(933, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(934, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(935, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(936, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(937, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(938, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(939, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(940, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(941, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(942, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(943, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(944, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(945, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(946, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(947, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(948, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(949, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(950, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(951, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(952, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(953, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(954, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(955, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(956, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(957, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(958, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(959, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(960, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(961, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(962, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(963, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(964, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(965, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(966, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(967, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(968, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(969, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(970, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(971, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(972, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(973, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(974, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(975, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(976, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon'),
	(977, 'http://127.0.0.1:8000/css/select2-spinner.gif', 'css/select2-spinner.gif', 'brouillon'),
	(978, 'http://127.0.0.1:8000/css/select2.png', 'css/select2.png', 'brouillon');
/*!40000 ALTER TABLE `tb_request` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_reunion_participant
CREATE TABLE IF NOT EXISTS `tb_reunion_participant` (
  `reunion_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  `signature_participant` longtext NOT NULL,
  KEY `reunion_id` (`reunion_id`),
  KEY `participant_id` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.tb_reunion_participant : ~2 rows (environ)
/*!40000 ALTER TABLE `tb_reunion_participant` DISABLE KEYS */;
INSERT INTO `tb_reunion_participant` (`reunion_id`, `participant_id`, `signature_participant`) VALUES
	(1, 1, 'juste'),
	(2, 3, 'israel');
/*!40000 ALTER TABLE `tb_reunion_participant` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_service
CREATE TABLE IF NOT EXISTS `tb_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `direction_id` int(11) DEFAULT '0',
  `service_nom` varchar(255) DEFAULT NULL,
  `service_libelle_imputation` varchar(255) DEFAULT NULL,
  `service_numero_ordre_imputation_dg` int(11) DEFAULT NULL,
  `service_statut_autorisation_imputation_dg` enum('autorise','non autorise') DEFAULT 'non autorise',
  `service_statut` enum('brouillon','valide','supprime') DEFAULT 'valide',
  PRIMARY KEY (`service_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ex : bureau urbain, antenne de san pédro, siège, etc.';

-- Listage des données de la table echargement_db.tb_service : 0 rows
/*!40000 ALTER TABLE `tb_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_service` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_users
CREATE TABLE IF NOT EXISTS `tb_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profil_id` int(11) NOT NULL DEFAULT '2',
  `service_id` int(10) unsigned NOT NULL DEFAULT '0',
  `categorie_personnel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_personnel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `equipe_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bureauid` int(10) unsigned NOT NULL DEFAULT '0',
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenoms` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `civilite` enum('m.','mme','mlle') COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `telephone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matricule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_derniere_connexion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_derniere_connexion` datetime DEFAULT NULL,
  `statut_connexion` enum('connecte','deconnecte') COLLATE utf8_unicode_ci DEFAULT 'deconnecte',
  `statut_signature` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statut` enum('VALIDE','SUPPRIME') COLLATE utf8_unicode_ci DEFAULT 'VALIDE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table echargement_db.tb_users : 3 rows
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` (`id`, `profil_id`, `service_id`, `categorie_personnel_id`, `type_personnel_id`, `equipe_id`, `bureauid`, `nom`, `prenoms`, `civilite`, `date_naissance`, `telephone`, `matricule`, `photo`, `adresse_email`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `ip_derniere_connexion`, `date_derniere_connexion`, `statut_connexion`, `statut_signature`, `statut`) VALUES
	(2, 3, 1, 4, 1, 0, 0, 'DIGUI', 'BERENGER', 'm.', '2020-06-06', '0778607985', NULL, 'ph2_1624290376317img_20210607_164641.jpg', '', 'berenger', '$2y$10$tkKteQYut.uykNHXMxZKs.tDPVeTFW1W7Qb6RfV3DovfNDctfogJC', 'PQZwaZ9Vn3DmibjZaYgastIRkOtuzEPMQEkUnTPOCviDhSCZ10AL83qp1t0z', '2021-03-09 22:00:00', '2023-05-01 23:56:33', '127.0.0.1', '2023-05-01 23:56:33', 'connecte', NULL, 'VALIDE'),
	(1, 4, 1, 1, 1, 0, 0, 'KOUASSI', 'RICHMOND', 'm.', '2020-06-06', '0708031746', NULL, 'ph1_1620901561048ph4_1615373851975135160607_10164592007005223_8140133135769055267_o.jpg', '', 'richmond', '$2y$10$tkKteQYut.uykNHXMxZKs.tDPVeTFW1W7Qb6RfV3DovfNDctfogJC', 'zHhlbuJdOwU9FIebnn7ZRqewIE50pSBcPZ8J6935CbY5kxA5u3vUBszOtuk7', '2021-03-09 22:00:00', '2023-05-02 23:21:58', '127.0.0.1', '2023-05-02 23:21:58', 'connecte', NULL, 'VALIDE'),
	(3, 5, 1, 1, 1, 0, 0, 'YAO', 'VALENTIN', NULL, '2023-05-01', '0707090196', NULL, NULL, '', 'valentin', '$2y$10$tkKteQYut.uykNHXMxZKs.tDPVeTFW1W7Qb6RfV3DovfNDctfogJC', 'aRUROQAlZCufTNWVkjAUEWEBQ68AhcaJE6hkyqVgnqFkCNH833v7tZCspkEA', '2023-05-01 23:12:35', '2023-05-01 23:15:33', '127.0.0.1', '2023-05-01 23:15:33', 'connecte', NULL, 'VALIDE');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. tb_users_rich*
CREATE TABLE IF NOT EXISTS `tb_users_rich*` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `profil_id` int(11) NOT NULL DEFAULT '2',
  `service_id` int(10) unsigned NOT NULL DEFAULT '0',
  `categorie_personnel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `type_personnel_id` int(10) unsigned NOT NULL DEFAULT '0',
  `equipe_id` int(10) unsigned NOT NULL DEFAULT '0',
  `bureauid` int(10) unsigned NOT NULL DEFAULT '0',
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prenoms` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `civilite` enum('m.','mme','mlle') COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `telephone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matricule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `ip_derniere_connexion` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_derniere_connexion` datetime DEFAULT NULL,
  `statut_connexion` enum('connecte','deconnecte') COLLATE utf8_unicode_ci DEFAULT 'deconnecte',
  `statut_signature` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statut` enum('VALIDE','SUPPRIME') COLLATE utf8_unicode_ci DEFAULT 'VALIDE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Listage des données de la table echargement_db.tb_users_rich* : 5 rows
/*!40000 ALTER TABLE `tb_users_rich*` DISABLE KEYS */;
INSERT INTO `tb_users_rich*` (`id`, `profil_id`, `service_id`, `categorie_personnel_id`, `type_personnel_id`, `equipe_id`, `bureauid`, `nom`, `prenoms`, `civilite`, `date_naissance`, `telephone`, `matricule`, `photo`, `adresse_email`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `ip_derniere_connexion`, `date_derniere_connexion`, `statut_connexion`, `statut_signature`, `statut`) VALUES
	(2, 1, 1, 4, 1, 0, 0, 'digui', 'berenger', 'm.', '2020-06-06', '0778607985', NULL, 'ph2_1624290376317img_20210607_164641.jpg', '', 'berenger', '$2y$10$fzhxfwi.ut.fpelsy9fk1eitums4ovpfpd.aqaqtd43x8zpzqamg2', 'ZxkBlJLzrXYD9wnYxWWuSEK6aLGwvr91EhxPZCTUH2yufwPTduyUBNESckrv', '2021-03-09 23:00:00', '2023-04-25 19:25:05', '127.0.0.1', '2023-04-25 21:25:05', 'connecte', NULL, 'VALIDE'),
	(1, 2, 1, 1, 1, 0, 0, 'ENTRE', 'POSTE 1', 'm.', '2020-06-06', '0708031746', NULL, 'ph1_1620901561048ph4_1615373851975135160607_10164592007005223_8140133135769055267_o.jpg', '', 'entree1', '$2y$10$fzhxfwi.ut.fpelsy9fk1eitums4ovpfpd.aqaqtd43x8zpzqamg2E', 'i6gm3uc9fzpk30q2pjh6uoltnznaibu6ljjyh5hbuxxjc5bzrw7rl1nal1z7', '2021-03-09 23:00:00', '2021-07-26 15:12:12', '127.0.0.1', '2021-07-26 17:12:12', 'connecte', NULL, 'VALIDE'),
	(3, 3, 1, 1, 1, 0, 0, 'ENTREE 2', '', 'm.', '2020-06-06', '0708031746', NULL, 'ph1_1620901561048ph4_1615373851975135160607_10164592007005223_8140133135769055267_o.jpg', '', 'entree2', '$2y$10$fzhxfwi.ut.fpelsy9fk1eitums4ovpfpd.aqaqtd43x8zpzqamg2E', 'i6gm3uc9fzpk30q2pjh6uoltnznaibu6ljjyh5hbuxxjc5bzrw7rl1nal1z7', '2021-03-09 23:00:00', '2021-07-26 15:12:12', '127.0.0.1', '2021-07-26 17:12:12', 'connecte', NULL, 'VALIDE'),
	(4, 4, 1, 1, 1, 0, 0, 'SORTIE 1', '', 'm.', '2020-06-06', '0708031746', NULL, 'ph1_1620901561048ph4_1615373851975135160607_10164592007005223_8140133135769055267_o.jpg', '', 'sortie1', '$2y$10$fzhxfwi.ut.fpelsy9fk1eitums4ovpfpd.aqaqtd43x8zpzqamg2E', 'i6gm3uc9fzpk30q2pjh6uoltnznaibu6ljjyh5hbuxxjc5bzrw7rl1nal1z7', '2021-03-09 23:00:00', '2021-07-26 15:12:12', '127.0.0.1', '2021-07-26 17:12:12', 'connecte', NULL, 'VALIDE'),
	(5, 5, 1, 1, 1, 0, 0, 'SORTIE 2', '', 'm.', '2020-06-06', '0708031746', NULL, 'ph1_1620901561048ph4_1615373851975135160607_10164592007005223_8140133135769055267_o.jpg', '', 'sortie2', '$2y$10$fzhxfwi.ut.fpelsy9fk1eitums4ovpfpd.aqaqtd43x8zpzqamg2E', 'i6gm3uc9fzpk30q2pjh6uoltnznaibu6ljjyh5hbuxxjc5bzrw7rl1nal1z7', '2021-03-09 23:00:00', '2021-07-26 15:12:12', '127.0.0.1', '2021-07-26 17:12:12', 'connecte', NULL, 'VALIDE');
/*!40000 ALTER TABLE `tb_users_rich*` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_nom` varchar(50) DEFAULT NULL,
  `utilisateur_prenoms` varchar(50) DEFAULT NULL,
  `utilisateur_telephone` varchar(50) DEFAULT NULL,
  `utilisateur_login` varchar(50) DEFAULT NULL,
  `utilisateur_password` varchar(50) DEFAULT NULL,
  `utilisateur_statut` enum('brouillon','valide','supprime') DEFAULT 'valide',
  PRIMARY KEY (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Listage des données de la table echargement_db.utilisateur : ~0 rows (environ)
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`utilisateur_id`, `utilisateur_nom`, `utilisateur_prenoms`, `utilisateur_telephone`, `utilisateur_login`, `utilisateur_password`, `utilisateur_statut`) VALUES
	(1, NULL, NULL, '0708031746', 'edgard', NULL, NULL);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;

-- Listage de la structure de la table echargement_db. vehicule
CREATE TABLE IF NOT EXISTS `vehicule` (
  `entree_sortie_id` int(11) DEFAULT NULL,
  `poste_id` int(11) DEFAULT NULL,
  `vehicule_id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicule_code` varchar(50) DEFAULT NULL,
  `vehicule_marque` varchar(50) DEFAULT NULL,
  `vehicule_numero_chassis` varchar(50) DEFAULT NULL,
  `vehicule_numero_ldc` varchar(50) DEFAULT NULL,
  `vehicule_immatriculation1` varchar(50) DEFAULT NULL,
  `vehicule_immatriculation2` varchar(50) DEFAULT NULL,
  `vehicule_numero_declaration` varchar(50) DEFAULT NULL,
  `vehicule_nom_conducteur` varchar(50) DEFAULT NULL,
  `vehicule_date_creation_entree1` timestamp NULL DEFAULT NULL,
  `vehicule_date_creation_entree2` timestamp NULL DEFAULT NULL,
  `vehicule_date_creation_sortie1` timestamp NULL DEFAULT NULL,
  `vehicule_date_creation_sortie2` timestamp NULL DEFAULT NULL,
  `vehicule_date_entree1` timestamp NULL DEFAULT NULL,
  `vehicule_heure_entree1` timestamp NULL DEFAULT NULL,
  `vehicule_date_entree2` timestamp NULL DEFAULT NULL,
  `vehicule_heure_entree2` timestamp NULL DEFAULT NULL,
  `vehicule_date_sortie1` timestamp NULL DEFAULT NULL,
  `vehicule_heure_sortie1` timestamp NULL DEFAULT NULL,
  `vehicule_date_sortie2` timestamp NULL DEFAULT NULL,
  `vehicule_heure_sortie2` timestamp NULL DEFAULT NULL,
  `vehicule_date_suppression` timestamp NULL DEFAULT NULL,
  `vehicule_user_entree1` varchar(25) DEFAULT NULL,
  `vehicule_user_entree2` varchar(25) DEFAULT NULL,
  `vehicule_user_sortie1` varchar(25) DEFAULT NULL,
  `vehicule_user_sortie2` varchar(25) DEFAULT NULL,
  `vehicule_statut` enum('brouillon','valide','supprime') DEFAULT NULL,
  `vehicule_statuts` enum('entree1','entree2','sortie1','sortie2') DEFAULT NULL,
  PRIMARY KEY (`vehicule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Listage des données de la table echargement_db.vehicule : 5 rows
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` (`entree_sortie_id`, `poste_id`, `vehicule_id`, `vehicule_code`, `vehicule_marque`, `vehicule_numero_chassis`, `vehicule_numero_ldc`, `vehicule_immatriculation1`, `vehicule_immatriculation2`, `vehicule_numero_declaration`, `vehicule_nom_conducteur`, `vehicule_date_creation_entree1`, `vehicule_date_creation_entree2`, `vehicule_date_creation_sortie1`, `vehicule_date_creation_sortie2`, `vehicule_date_entree1`, `vehicule_heure_entree1`, `vehicule_date_entree2`, `vehicule_heure_entree2`, `vehicule_date_sortie1`, `vehicule_heure_sortie1`, `vehicule_date_sortie2`, `vehicule_heure_sortie2`, `vehicule_date_suppression`, `vehicule_user_entree1`, `vehicule_user_entree2`, `vehicule_user_sortie1`, `vehicule_user_sortie2`, `vehicule_statut`, `vehicule_statuts`) VALUES
	(1, 1, 1, 'code 01', 'marque 01', 'chassis 01', 'ldc 01', 'imma 01', 'imma 02', 'decla 01', 'cond koffi', '2023-04-02 14:58:01', '2023-04-03 14:58:01', '2023-04-05 14:58:01', '2023-04-07 14:58:01', '2023-04-20 14:58:01', '2023-04-20 14:58:01', '2023-04-12 14:58:01', '2023-04-12 14:58:01', '2023-04-11 14:58:01', '2023-04-10 14:58:01', '2023-04-09 14:58:01', '2023-04-20 14:58:01', '2023-04-19 14:58:01', 'bernard', 'robert', 'vincent', 'guy', 'valide', 'entree1'),
	(2, 2, 2, 'code 2', 'marque 2', 'chassis 2', 'ldc 2', 'imma 2', 'imma 3', 'decla 2', 'cond konate', '0000-00-00 00:00:00', '2023-04-25 21:55:14', '2023-04-06 22:00:00', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'valide', 'entree2'),
	(NULL, NULL, 3, NULL, 'MERCEDES', 'CHASSIS87', 'LDC23', '3432FRO1', '4532LL01', 'DECLA03', NULL, '2023-04-25 20:23:36', '2023-05-02 23:22:29', '2023-05-01 23:56:57', '2023-05-01 23:52:27', NULL, NULL, '2023-05-02 00:00:00', NULL, '2023-04-03 00:00:00', NULL, '2023-04-05 00:00:00', NULL, NULL, '2', NULL, NULL, NULL, 'valide', 'entree1'),
	(NULL, NULL, 4, NULL, 'MERCEDES', 'CHASSIS87', 'LDC23', '3432FRO1', '4532LL01', 'DECLA03', NULL, '2023-04-25 20:24:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, NULL, 'valide', 'entree1'),
	(NULL, NULL, 5, NULL, 'dfdf', 'df', 'df', 'df', 'df', 'df', NULL, '2023-05-02 23:50:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 'valide', '');
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
