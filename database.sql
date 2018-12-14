-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.19 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour meme_generator
CREATE DATABASE IF NOT EXISTS `meme_generator` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `meme_generator`;

-- Export de la structure de la table meme_generator. images
CREATE TABLE IF NOT EXISTS `images` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` longtext NOT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table meme_generator.images : ~0 rows (environ)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Export de la structure de la table meme_generator. memes
CREATE TABLE IF NOT EXISTS `memes` (
  `id_meme` int(11) NOT NULL AUTO_INCREMENT,
  `meme_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_meme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table meme_generator.memes : ~0 rows (environ)
/*!40000 ALTER TABLE `memes` DISABLE KEYS */;
/*!40000 ALTER TABLE `memes` ENABLE KEYS */;

-- Export de la structure de la table meme_generator. meme_tag
CREATE TABLE IF NOT EXISTS `meme_tag` (
  `id_meme` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  PRIMARY KEY (`id_meme`,`id_tag`),
  KEY `FK_TagToMemeTag` (`id_tag`),
  CONSTRAINT `FK_MemeToMemeTag` FOREIGN KEY (`id_meme`) REFERENCES `memes` (`id_meme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_TagToMemeTag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id_tag`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table meme_generator.meme_tag : ~0 rows (environ)
/*!40000 ALTER TABLE `meme_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `meme_tag` ENABLE KEYS */;

-- Export de la structure de la table meme_generator. tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table meme_generator.tags : ~0 rows (environ)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;

-- Export de la structure de la table meme_generator. users
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table meme_generator.users : ~0 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
