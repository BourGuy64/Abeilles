-- Adminer 4.7.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `fleurs`;
CREATE TABLE `fleurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_latin` varchar(50) DEFAULT NULL,
  `n_fr` varchar(50) DEFAULT NULL,
  `length` int(11) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `nectar` int(11) DEFAULT NULL,
  `pollen` int(11) DEFAULT NULL,
  `bloom_start` date DEFAULT NULL,
  `bloom_end` date DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fleurs` (`id`, `n_latin`, `n_fr`, `length`, `color`, `nectar`, `pollen`, `bloom_start`, `bloom_end`, `localisation`, `position`, `photo`, `created_at`, `updated_at`) VALUES
(21,	'Acer campestris',	'Erable champêtre',	15,	'vert clair',	3,	5,	'2019-05-31',	'2019-07-01',	'Collection historique',	'ok',	'/public/img/',	NULL,	'2020-01-23 00:00:00'),
(28,	'Acer pseudoplatanus',	'Érable sycomore',	25,	'Jaunâtre',	2,	2,	'2020-05-01',	'2020-05-31',	'Forêt',	NULL,	'',	'2020-01-23 22:17:08',	NULL),
(29,	'Alnus flutinosa',	'Aulne flutineux',	25,	'Jaune',	1,	2,	'2020-03-01',	NULL,	'Étang',	NULL,	'',	'2020-01-23 22:18:22',	NULL);

-- 2020-01-23 22:25:22
