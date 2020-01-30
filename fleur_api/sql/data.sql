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

TRUNCATE `fleurs`;
INSERT INTO `fleurs` (`id`, `n_latin`, `n_fr`, `length`, `color`, `nectar`, `pollen`, `bloom_start`, `bloom_end`, `localisation`, `position`, `photo`, `created_at`, `updated_at`) VALUES
(21,	'Acer campestris',	'Erable champêtre',	1500,	'vert clair',	3,	5,	4,	5,	'Collection historique',	'ok',	'',	NULL,	'2020-01-30 10:13:27'),
(28,	'Acer pseudoplatanus',	'Érable sycomore',	2500,	'Jaunâtre',	2,	2,	5,	5,	'Forêt',	'',	'Acer pseudoplatanus.jpg',	'2020-01-23 22:17:08',	'2020-01-30 10:12:23'),
(29,	'Alnus glutinosa',	'Aulne glutineux',	2500,	'Jaune',	1,	2,	3,	4,	'Étang',	'',	'Alnus glutinosa.jpg',	'2020-01-23 22:18:22',	'2020-01-30 10:12:16'),
(30,	'Aquilegia vulgaris',	'Ancolie',	50,	'Bleu',	2,	3,	5,	6,	'Collection historique',	'',	'',	'2020-01-24 07:07:32',	'2020-01-24 15:15:11'),
(31,	'Asclépias syriaca',	'Herbe à la ouate',	150,	'Mauve',	3,	1,	6,	8,	'Collection ornementale',	'',	'',	'2020-01-24 07:09:11',	'2020-01-24 15:15:23'),
(32,	'Berberis vulgaris',	'Épine vinette',	200,	'Jaune',	2,	1,	6,	7,	'Secteur aboretum Chine',	'',	'',	'2020-01-24 07:10:52',	'2020-01-24 15:15:52'),
(33,	'Borago officinalis',	'Bourrache officinalis',	50,	'Bleu tendre',	3,	2,	6,	8,	'Collection historique',	'',	'',	'2020-01-24 07:12:35',	'2020-01-24 15:15:58'),
(37,	'Brassica arvensis',	'Moutarde des champs',	60,	'Jaune',	3,	1,	6,	8,	'Collection historique',	'',	'',	'2020-01-24 15:17:07',	'2020-01-24 15:17:56'),
(38,	'Calluna vulgaris',	'Bruyère commune callune',	30,	'Blanc et Rose',	2,	1,	8,	8,	'Secteur terre de bruyère',	NULL,	'',	'2020-01-24 15:19:16',	NULL),
(39,	'Corylus colurna',	'Noisetier de Bysance',	1015,	'Jaune',	0,	1,	2,	3,	'Secteur arboretum Europe',	'',	'corylus colurna.jpg',	'2020-01-24 15:19:58',	'2020-01-30 10:11:41'),
(40,	'Cotoneaster horizontalis',	'Cotoneaster',	0,	'Violet, Jaune, Blanc',	1,	2,	2,	3,	'Pelouses',	'',	'cotoneaster_horizontalis.jpg',	'2020-01-24 15:26:23',	'2020-01-30 10:11:23'),
(41,	'Dalhia variabilis',	'Dalhia CV',	100,	'Toutes les couleurs',	0,	2,	6,	9,	'Collection de dahlias',	NULL,	'',	'2020-01-24 15:27:16',	NULL),
(42,	'Epilobium angustifolium',	'Epilobe en épis',	200,	'Rose',	3,	2,	7,	4,	'Ruisseau',	NULL,	'',	'2020-01-24 15:27:57',	NULL),
(43,	'Fagopyrum esculentum',	'Blé noir',	100,	'Blanc',	2,	1,	6,	8,	'Collection historique',	'',	'Fagopyrum esculentum.jpeg',	'2020-01-24 15:29:08',	'2020-01-30 10:10:41'),
(44,	'Fraxinus ornus',	'Frêne à fleurs',	1000,	'Blanc',	1,	2,	5,	6,	'Secteur arboretum Europ',	'',	'Fraxinus ornus.jpg',	'2020-01-24 15:29:53',	'2020-01-30 10:10:35'),
(45,	'Gleditsia triacanthos',	'Févier',	2000,	'Vert et Jaune',	2,	0,	6,	7,	'Arboretum secteur Amérique du nord',	'',	'gleditsia triacanthos.jpg',	'2020-01-24 15:31:42',	'2020-01-30 10:10:29'),
(46,	'Hedera helix',	'Lierre',	0,	'Vert tendre',	3,	3,	5,	6,	'Forêt',	'',	'Hedera-helix.jpg',	'2020-01-24 15:32:44',	'2020-01-30 10:10:19'),
(47,	'Lavandula officinalis',	'Lavande vraie',	25,	'Bleu lilas',	3,	1,	7,	8,	'Potager',	'',	'lavande officinale.jpg',	'2020-01-24 15:34:20',	'2020-01-30 10:10:11'),
(48,	'Loncera tartarica',	'Chèvrefeuille',	300,	'Blanc',	2,	2,	5,	6,	'Collection historique',	'',	'lonicera tartarica.jpg',	'2020-01-24 15:34:58',	'2020-01-30 10:09:57'),
(49,	'Médicago sativa',	'Luzerne cultivée',	50,	'Mauve',	3,	1,	6,	8,	'Collection historique',	'',	'Medicago sativa.jpg',	'2020-01-24 15:36:40',	'2020-01-30 10:09:45'),
(50,	'Phacelia tanacetifolia',	'Phacelie à feuilles de tanaisie',	50,	'Bleu clair',	3,	2,	7,	9,	'Potager écologique',	NULL,	'',	'2020-01-24 15:37:34',	NULL),
(51,	'Prunus avium',	'Merisier',	1015,	'Blanc',	2,	3,	4,	5,	'Forêt',	'',	'Prunus avium.jpeg',	'2020-01-24 15:38:15',	'2020-01-30 10:09:22'),
(52,	'Prunus spinosa',	'Prunellier',	340,	'Blanc',	2,	2,	4,	5,	'Roseraie',	'',	'Prunus spinosa.jpg',	'2020-01-24 15:38:54',	'2020-01-30 10:09:16'),
(53,	'Pyracantha coccinéa',	'Buisson ardent',	230,	'Blanc',	2,	3,	6,	7,	'Roseraie',	'',	'Pyracantha coccinea.jpg',	'2020-01-24 15:39:34',	'2020-01-30 10:09:07'),
(54,	'Robinia pseudoacacia',	'Robinier faux acacia',	2000,	'Blanc',	3,	2,	6,	6,	'Étang pavillon d\'accueil',	'',	'Robinia pseudoacacia.jpg',	'2020-01-24 15:40:37',	'2020-01-30 10:09:01'),
(55,	'Rudbeckia laciniata',	'Rudbeckia lacinié',	150,	'Jaune',	0,	3,	7,	8,	'Collection historique ornementale',	'',	'Robinia pseudoacacia.jpg',	'2020-01-24 15:41:49',	'2020-01-30 10:08:54'),
(56,	'Salix capréa',	'Saule marsault',	700,	'Jaune et vert',	2,	3,	3,	4,	'Ruisseau',	'',	'salix caprea.jpg',	'2020-01-24 15:43:11',	'2020-01-30 10:08:41'),
(57,	'Solidago virgaurea',	'Verge d\'or',	150,	'Jaune',	2,	2,	8,	10,	'Collection historique',	'',	'Solidago virgaurea.jpg',	'2020-01-24 15:48:52',	'2020-01-30 10:08:35'),
(58,	'Sophora japonica',	'Sophora du japon',	1520,	'Blanc crème',	3,	1,	8,	9,	'',	'',	'sophora japonica.jpg',	'2020-01-24 15:49:26',	'2020-01-30 10:08:28'),
(59,	'Taraxacum officinalis',	'Pissenlit',	10,	'Jaune',	3,	3,	4,	7,	'Pelouse prairie',	'',	'taraxacum officinale.jpg',	'2020-01-24 15:50:22',	'2020-01-30 10:08:22'),
(60,	'Thymus vulgaris',	'Thym',	20,	'Mauve',	3,	0,	6,	8,	'Jardin écologique, Potager',	'',	'thymus vulgaris.JPG',	'2020-01-24 15:50:57',	'2020-01-30 09:50:57'),
(61,	'Tilia henryana',	'Tilleul de Henry',	1200,	'Jaunâtre',	3,	2,	9,	9,	'Étang pavillon d\'accueil',	'',	'Tilia henryana.jpg',	'2020-01-24 15:52:43',	'2020-01-30 09:50:25'),
(62,	'Tilia platyphillos',	'Tilleul à larges feuilles',	2000,	'Jaunâtre',	3,	2,	6,	6,	'Parcelle Emile Gallé',	'',	'Tilia platyphyllos.jpg',	'2020-01-24 15:53:26',	'2020-01-30 09:37:35'),
(63,	'Trifolium repens',	'Trèfle blanc',	20,	'Blanc',	3,	2,	5,	9,	'Pelouse',	'',	'trifolium repens.jpg',	'2020-01-24 15:54:16',	'2020-01-30 09:35:52'),
(64,	'Vinca minor',	'Petite pervenche',	30,	'Bleu',	2,	0,	3,	4,	'Arboretum',	'',	'Vinca minor.jpg',	'2020-01-24 15:54:45',	'2020-01-28 08:21:17');

-- 2020-01-30 10:33:21
