-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1:3306
-- Tid vid skapande: 15 apr 2021 kl 20:22
-- Serverversion: 5.7.31
-- PHP-version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `user`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `fullname`) VALUES
(1, 'oskand01@gmail.com', 'admin', 'Oskar Andersson'),
(2, 'gclemerson0@yandex.ru', 'lmaD8tese1', 'Gianina Clemerson'),
(3, 'splaskitt1@blogger.com', 'S7lgnAnaX', 'Stephine Plaskitt'),
(4, 'ztapenden2@symantec.com', 'UtxvMO1P', 'Zia Tapenden'),
(5, 'cgamil3@yale.edu', 'sGyc5e', 'Cosme Gamil'),
(6, 'gfrankis4@dell.com', '49ntkNlquIoT', 'Gnni Frankis'),
(7, 'amuckersie5@utexas.edu', 'LOda6BIyE', 'Alic Muckersie'),
(8, 'bglading6@webs.com', 'rrySvMIxlq6', 'Betta Glading'),
(9, 'ablasli7@creativecommons.org', 'pBcEfyP87qD', 'Alair Blasli'),
(10, 'gkelinge8@1und1.de', 'NSOaLUPFuMkq', 'Ginger Kelinge'),
(11, 'kakister9@aboutads.info', '0y3Iutbpe', 'Kain Akister'),
(12, 'zborrisa@walmart.com', 'wAgfEQ0', 'Zorine Borris'),
(13, 'tgarwellb@comsenz.com', 'ZajFYog3Gke', 'Tades Garwell'),
(14, 'etenmanc@dedecms.com', 'nZhMv9', 'Edwin Tenman'),
(15, 'bkidbyd@stumbleupon.com', 'tobQdNRtjSql', 'Bernardine Kidby'),
(16, 'kharlowe@youku.com', 'QBJfZtSpo', 'Kristy Harlow'),
(17, 'jbetkef@noaa.gov', 'FADPpmvvN', 'Jeddy Betke'),
(18, 'mtheodoreg@dagondesign.com', 'RmHL2X8ZUBy', 'Maxwell Theodore'),
(19, 'cellereyh@pcworld.com', '58Ngm160U3C', 'Christophorus Ellerey'),
(20, 'aspringtorpi@4shared.com', 'TN3Cmn', 'Arri Springtorp'),
(21, 'rarnalj@scribd.com', 'ocT1sqMH', 'Rea Arnal'),
(22, 'pstealfoxk@163.com', '8ekVNwTw3T', 'Percival Stealfox'),
(23, 'kotoweyl@cbsnews.com', 'C9zjjFvE', 'Konstantin O\'Towey'),
(24, 'ewoodhamm@stanford.edu', 'ipU1uVNwQTx', 'Emmerich Woodham'),
(25, 'lmarcqn@hhs.gov', 'zmL7Oeh', 'Levon Marcq'),
(26, 'wcassedyo@auda.org.au', 'e0WZ9ElA', 'Wendel Cassedy'),
(27, 'kgaskampp@wikipedia.org', '1vCs4UhrhA4', 'Kay Gaskamp'),
(28, 'vfortq@upenn.edu', 'cAZJJl', 'Vincents Fort'),
(29, 'hpaller@cloudflare.com', 'QTefjTEW0', 'Hirsch Palle'),
(30, 'mcosanss@google.cn', 'C84QyA', 'Murdoch Cosans'),
(31, 'jbromaget@ftc.gov', 'i6GzeS', 'Jermain Bromage'),
(32, 'aodennehyu@yellowbook.com', 'h5pTeWnEHZkT', 'Anna-diane O\'Dennehy'),
(33, 'gmacgilmartinv@google.de', 'IXOu9zz2kn', 'Giffard MacGilmartin'),
(34, 'phulksw@eventbrite.com', 'PPZUrqu', 'Pinchas Hulks'),
(35, 'stuerx@java.com', 'zHOdpX7U', 'Sarina Tuer'),
(36, 'tdoldeny@hc360.com', 'i4s3hWaqJpe', 'Tate Dolden'),
(37, 'mjakucewiczz@tripod.com', 'BKLLJfSbX', 'Matthiew Jakucewicz'),
(38, 'mjonsson10@ucla.edu', 'JuDRRjY', 'Margalo Jonsson'),
(39, 'aebbin11@admin.ch', 'WhxTm4A', 'Alonso Ebbin'),
(40, 'mpeers12@earthlink.net', 'PS5WgJGNdSpx', 'Matthieu Peers'),
(41, 'tclampett13@bing.com', 'mOKFOSDWN', 'Terrill Clampett'),
(42, 'pwoodyer14@indiatimes.com', 'xIgsQfzRKgW', 'Pepito Woodyer'),
(43, 'esegrave15@sphinn.com', '5onTjwzG', 'Eyde Segrave'),
(44, 'cmcquilkin16@economist.com', 'k8xFBg5yl', 'Celle McQuilkin'),
(45, 'wmariyushkin17@patch.com', 'QL1GeBHgx', 'Welsh Mariyushkin'),
(46, 'jantoni18@cargocollective.com', 'hQlkqSzsQJ', 'Jess Antoni'),
(47, 'gsrawley19@seesaa.net', 'vl8B7Ep4j', 'Gibb Srawley'),
(48, 'aelis1a@wordpress.org', 'FIpSXcQ2DaEb', 'Aldrich Elis'),
(49, 'kmuggeridge1b@zdnet.com', '92lbVSA4Ex', 'Kania Muggeridge'),
(50, 'mrammell1c@boston.com', 'JhxwLwev', 'Marcelia Rammell');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
