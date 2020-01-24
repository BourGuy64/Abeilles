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
  `bloom_start` int(11) DEFAULT NULL,
  `bloom_end` int(11) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fleurs` (`id`, `n_latin`, `n_fr`, `length`, `color`, `nectar`, `pollen`, `bloom_start`, `bloom_end`, `localisation`, `position`, `photo`, `created_at`, `updated_at`) VALUES
(1,	'Acer campestris',	'Erable champêtre',	1500,	'vert clair',	3,	5,	4,	5,	'Collection historique',	'ok',	'/public/img/',	NULL,	'2020-01-24 15:14:36'),
(2,	'Acer pseudoplatanus',	'Érable sycomore',	2500,	'Jaunâtre',	2,	2,	5,	5,	'Forêt',	'',	'',	'2020-01-23 22:17:08',	'2020-01-24 15:14:48'),
(3,	'Alnus glutinosa',	'Aulne glutineux',	2500,	'Jaune',	1,	2,	3,	4,	'Étang',	'',	'',	'2020-01-23 22:18:22',	'2020-01-24 15:14:58'),
(4,	'Aquilegia vulgaris',	'Ancolie',	50,	'Bleu',	2,	3,	5,	6,	'Collection historique',	'',	'',	'2020-01-24 07:07:32',	'2020-01-24 15:15:11'),
(5,	'Asclépias syriaca',	'Herbe à la ouate',	150,	'Mauve',	3,	1,	6,	8,	'Collection ornementale',	'',	'',	'2020-01-24 07:09:11',	'2020-01-24 15:15:23'),
(6,	'Berberis vulgaris',	'Épine vinette',	200,	'Jaune',	2,	1,	6,	7,	'Secteur aboretum Chine',	'',	'',	'2020-01-24 07:10:52',	'2020-01-24 15:15:52'),
(7,	'Borago officinalis',	'Bourrache officinalis',	50,	'Bleu tendre',	3,	2,	6,	8,	'Collection historique',	'',	'',	'2020-01-24 07:12:35',	'2020-01-24 15:15:58'),
(8,	'Brassica arvensis',	'Moutarde des champs',	60,	'Jaune',	3,	1,	6,	8,	'Collection historique',	'',	'',	'2020-01-24 15:17:07',	'2020-01-24 15:17:56'),
(9,	'Calluna vulgaris',	'Bruyère commune callune',	30,	'Blanc et Rose',	2,	1,	8,	8,	'Secteur terre de bruyère',	NULL,	'',	'2020-01-24 15:19:16',	NULL),
(10,	'Corylus colurna',	'Noisetier de Bysance',	1015,	'Jaune',	0,	1,	2,	3,	'Secteur arboretum Europe',	NULL,	'',	'2020-01-24 15:19:58',	NULL),
(11,	'Cotoneaster horizontalis',	'Cotoneaster',	0,	'Violet, Jaune, Blanc',	1,	2,	2,	3,	'Pelouses',	NULL,	'',	'2020-01-24 15:26:23',	NULL),
(12,	'Dalhia variabilis',	'Dalhia CV',	100,	'Toutes les couleurs',	0,	2,	6,	9,	'Collection de dahlias',	NULL,	'',	'2020-01-24 15:27:16',	NULL),
(13,	'Epilobium angustifolium',	'Epilobe en épis',	200,	'Rose',	3,	2,	7,	4,	'Ruisseau',	NULL,	'',	'2020-01-24 15:27:57',	NULL),
(14,	'Fagopyrum esculentum',	'Blé noir',	100,	'Blanc',	2,	1,	6,	8,	'Collection historique',	NULL,	'',	'2020-01-24 15:29:08',	NULL),
(15,	'Fraxinus ornus',	'Frêne à fleurs',	1000,	'Blanc',	1,	2,	5,	6,	'Secteur arboretum Europ',	NULL,	'',	'2020-01-24 15:29:53',	NULL),
(16,	'Gleditsia triacanthos',	'Févier',	2000,	'Vert et Jaune',	2,	0,	6,	7,	'Arboretum secteur Amérique du nord',	NULL,	'',	'2020-01-24 15:31:42',	NULL),
(17,	'Hedera helix',	'Lierre',	0,	'Vert tendre',	3,	3,	5,	6,	'Forêt',	NULL,	'',	'2020-01-24 15:32:44',	NULL),
(18,	'Lavandula officinalis',	'Lavande vraie',	25,	'Bleu lilas',	3,	1,	7,	8,	'Potager',	NULL,	'',	'2020-01-24 15:34:20',	NULL),
(19,	'Loncera tartarica',	'Chèvrefeuille',	300,	'Blanc',	2,	2,	5,	6,	'Collection historique',	NULL,	'',	'2020-01-24 15:34:58',	NULL),
(20,	'Médicago sativa',	'Luzerne cultivée',	50,	'Mauve',	3,	1,	6,	8,	'Collection historique',	NULL,	'',	'2020-01-24 15:36:40',	NULL),
(21,	'Phacelia tanacetifolia',	'Phacelie à feuilles de tanaisie',	50,	'Bleu clair',	3,	2,	7,	9,	'Potager écologique',	NULL,	'',	'2020-01-24 15:37:34',	NULL),
(22,	'Prunus avium',	'Merisier',	1015,	'Blanc',	2,	3,	4,	5,	'Forêt',	NULL,	'',	'2020-01-24 15:38:15',	NULL),
(23,	'Prunus spinosa',	'Prunellier',	340,	'Blanc',	2,	2,	4,	5,	'Roseraie',	NULL,	'',	'2020-01-24 15:38:54',	NULL),
(24,	'Pyracantha coccinéa',	'Buisson ardent',	230,	'Blanc',	2,	3,	6,	7,	'Roseraie',	NULL,	'',	'2020-01-24 15:39:34',	NULL),
(25,	'Robinia pseudoacacia',	'Robinier faux acacia',	2000,	'Blanc',	3,	2,	6,	6,	'Étang pavillon d\'accueil',	NULL,	'',	'2020-01-24 15:40:37',	NULL),
(26,	'Rudbeckia laciniata',	'Rudbeckia lacinié',	150,	'Jaune',	0,	3,	7,	8,	'Collection historique ornementale',	NULL,	'',	'2020-01-24 15:41:49',	NULL),
(27,	'Salix capréa',	'Saule marsault',	700,	'Jaune et vert',	2,	3,	3,	4,	'Ruisseau',	NULL,	'',	'2020-01-24 15:43:11',	NULL),
(28,	'Solidago virgaurea',	'Verge d\'or',	150,	'Jaune',	2,	2,	8,	10,	'Collection historique',	NULL,	'',	'2020-01-24 15:48:52',	NULL),
(29,	'Sophora japonica',	'Sophora du japon',	1520,	'Blanc crème',	3,	1,	8,	9,	'',	NULL,	'',	'2020-01-24 15:49:26',	NULL),
(30,	'Earaxacum officinalis',	'Pissenlit',	10,	'Jaune',	3,	3,	4,	7,	'Pelouse prairie',	NULL,	'',	'2020-01-24 15:50:22',	NULL),
(31,	'Thymus vulgaris',	'Thym',	20,	'Mauve',	3,	0,	6,	8,	'Jardin écologique, Potager',	NULL,	'',	'2020-01-24 15:50:57',	NULL),
(32,	'Tilia henryana',	'Tilleul de Henry',	1200,	'Jaunâtre',	3,	2,	9,	9,	'Étang pavillon d\'accueil',	NULL,	'',	'2020-01-24 15:52:43',	NULL),
(33,	'Tilia platyphillos',	'Tilleul à larges feuilles',	2000,	'Jaunâtre',	3,	2,	6,	6,	'Parcelle Emile Gallé',	NULL,	'',	'2020-01-24 15:53:26',	NULL),
(34,	'Trifolium repens',	'Trèfle blanc',	20,	'Blanc',	3,	2,	5,	9,	'Pelouse',	NULL,	'',	'2020-01-24 15:54:16',	NULL),
(35,	'Vinca minor',	'Petite pervenche',	30,	'Bleu',	2,	0,	3,	4,	'Arboretum',	NULL,	'',	'2020-01-24 15:54:45',	NULL);

-- 2020-01-24 15:57:39
