-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1:3306
-- Tid vid skapande: 15 apr 2021 kl 20:20
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
-- Databas: `message`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tag` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `message`
--

INSERT INTO `message` (`messageId`, `userName`, `message`, `datetime`, `tag`) VALUES
(31, 'Oskar Andersson', 'Hej', '2021-04-14 13:52:36', '#test'),
(32, 'Oskar Andersson', 'lakflkafjakfja', '2021-04-14 13:54:44', '#asdadsadsa'),
(19, 'Oskar Andersson', 'Hej, jag heter Oskar.', '2021-04-12 13:37:12', '#beMyFriend'),
(23, 'Percival Stealfox', 'En lavin i Åre? Knappast, men uppe i bergsmassivet är nog den sanna informationen, om lavinen hade hamnat i Åre som ni skriver, så hade nog många döda blivit av eller ..?', '2021-04-12 15:49:38', '#fakenews'),
(24, 'Christophorus Ellerey', 'För en vecka sen skrev jag här, att det är p.g.a maffian som vaccineringen i Italien är katastrof..de styr \"prioriteringen\". Först nu skriver ni om det. Ni släppte aldrig fram mitt inlägg då. Är ni sena på bollen AB ?', '2021-04-12 15:51:22', '#corona'),
(21, 'Oskar Andersson', 'ÄR det här en fråga för mig?', '2021-04-12 13:46:58', ''),
(22, 'Oskar Andersson', 'Varför kommer min fråga aldrig upp här? Har ställt samma fråga hela tiden i 2 veckors tid nu. Varför kör man inte pararellt med Pifzer och Moderna nu när AZ vaccinet är stoppad för under 65 år inom fas2, jag jobba inom vård och omsorg. Tacksam för svar.', '2021-04-12 14:12:32', '#corona');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
