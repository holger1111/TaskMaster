-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Sep 2025 um 14:06
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `taskmaster`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aktivitäten`
--

CREATE TABLE `aktivitäten` (
  `AktivitätID` int(11) NOT NULL,
  `TeilnehmerAktivID` int(11) NOT NULL,
  `TeilnehmerPassivID` int(11) DEFAULT NULL,
  `ProjektID` int(11) DEFAULT NULL,
  `ListeID` int(11) DEFAULT NULL,
  `FeldID` int(11) DEFAULT NULL,
  `Datum` date NOT NULL,
  `Uhrzeit` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beobachtung_felder`
--

CREATE TABLE `beobachtung_felder` (
  `NutzerID` int(11) NOT NULL,
  `FeldID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beobachtung_projekte`
--

CREATE TABLE `beobachtung_projekte` (
  `NutzerID` int(11) NOT NULL,
  `ProjektID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `e_mail_adresse`
--

CREATE TABLE `e_mail_adresse` (
  `MailID` int(11) NOT NULL,
  `EMailAdresse` varchar(255) NOT NULL,
  `AltEMailAdresse` varchar(255) DEFAULT NULL,
  `SichtbarkeitID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `feld`
--

CREATE TABLE `feld` (
  `FeldID` int(11) NOT NULL,
  `ListeID` int(11) NOT NULL,
  `TeilnehmerFeldID` int(11) DEFAULT NULL,
  `Feldname` varchar(255) NOT NULL,
  `Datum` date DEFAULT NULL,
  `Kommentar` text DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kollegen`
--

CREATE TABLE `kollegen` (
  `AktiverNutzerID` int(11) NOT NULL,
  `PassiverNutzerID` int(11) NOT NULL,
  `StatusFavoritID` int(11) NOT NULL,
  `StatusKollegeID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `liste`
--

CREATE TABLE `liste` (
  `ListeID` int(11) NOT NULL,
  `ProjektID` int(11) NOT NULL,
  `Listenname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mobil_nummer`
--

CREATE TABLE `mobil_nummer` (
  `MobilID` int(11) NOT NULL,
  `MobilNummer` varchar(50) NOT NULL,
  `SichtbarkeitID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `name`
--

CREATE TABLE `name` (
  `NameID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `SichtbarkeitID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer`
--

CREATE TABLE `nutzer` (
  `NutzerID` int(11) NOT NULL,
  `Benutzername` varchar(100) NOT NULL,
  `AnzeigeName` varchar(100) NOT NULL,
  `Passwort` varchar(255) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `SichtbarkeitID` int(11) NOT NULL,
  `MailID` int(11) NOT NULL,
  `MobilID` int(11) DEFAULT NULL,
  `StandortID` int(11) DEFAULT NULL,
  `NameID` int(11) DEFAULT NULL,
  `ProfilbildID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `profilbild`
--

CREATE TABLE `profilbild` (
  `ProfilbildID` int(11) NOT NULL,
  `Dateipfad` varchar(500) NOT NULL,
  `SichtbarkeitID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projekt`
--

CREATE TABLE `projekt` (
  `ProjektID` int(11) NOT NULL,
  `LeiterID` int(11) NOT NULL,
  `TeilnehmerProjektID` int(11) DEFAULT NULL,
  `Projektname` varchar(255) NOT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `SichtbarkeitID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sichtbarkeit`
--

CREATE TABLE `sichtbarkeit` (
  `SichtbarkeitID` int(11) NOT NULL,
  `Bezeichnung` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `sichtbarkeit`
--

INSERT INTO `sichtbarkeit` (`SichtbarkeitID`, `Bezeichnung`) VALUES
(1, 'Öffentlich'),
(2, 'Kollegen'),
(3, 'Privat');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `standort`
--

CREATE TABLE `standort` (
  `StandortID` int(11) NOT NULL,
  `Standort` varchar(255) NOT NULL,
  `SichtbarkeitID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `status`
--

CREATE TABLE `status` (
  `StatusID` int(11) NOT NULL,
  `Bezeichnung` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `status`
--

INSERT INTO `status` (`StatusID`, `Bezeichnung`) VALUES
(1, 'Fortschritt'),
(2, 'Bearbeitung'),
(3, 'Erledigt'),
(4, 'Wartend'),
(5, 'Abgebrochen'),
(6, 'Unbestimmt'),
(7, 'Verfügbar'),
(8, 'Beschäftigt'),
(9, 'Offline'),
(10, 'Abwesend'),
(11, 'Favorit'),
(12, 'nichtFavorit'),
(13, 'Kollege'),
(14, 'nichtKollege'),
(15, 'Angefragt'),
(16, 'Beobachtet'),
(17, 'nichtBeobachtet');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teilnehmer_feld`
--

CREATE TABLE `teilnehmer_feld` (
  `TeilnehmerFeldID` int(11) NOT NULL,
  `FeldID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teilnehmer_projekt`
--

CREATE TABLE `teilnehmer_projekt` (
  `TeilnehmerProjektID` int(11) NOT NULL,
  `ProjektID` int(11) NOT NULL,
  `NutzerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `aktivitäten`
--
ALTER TABLE `aktivitäten`
  ADD PRIMARY KEY (`AktivitätID`),
  ADD KEY `TeilnehmerAktivID` (`TeilnehmerAktivID`),
  ADD KEY `TeilnehmerPassivID` (`TeilnehmerPassivID`),
  ADD KEY `ProjektID` (`ProjektID`),
  ADD KEY `ListeID` (`ListeID`),
  ADD KEY `FeldID` (`FeldID`);

--
-- Indizes für die Tabelle `beobachtung_felder`
--
ALTER TABLE `beobachtung_felder`
  ADD PRIMARY KEY (`NutzerID`,`FeldID`),
  ADD KEY `FeldID` (`FeldID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indizes für die Tabelle `beobachtung_projekte`
--
ALTER TABLE `beobachtung_projekte`
  ADD PRIMARY KEY (`NutzerID`,`ProjektID`),
  ADD KEY `ProjektID` (`ProjektID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indizes für die Tabelle `e_mail_adresse`
--
ALTER TABLE `e_mail_adresse`
  ADD PRIMARY KEY (`MailID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `feld`
--
ALTER TABLE `feld`
  ADD PRIMARY KEY (`FeldID`),
  ADD KEY `ListeID` (`ListeID`),
  ADD KEY `TeilnehmerFeldID` (`TeilnehmerFeldID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indizes für die Tabelle `kollegen`
--
ALTER TABLE `kollegen`
  ADD PRIMARY KEY (`AktiverNutzerID`,`PassiverNutzerID`),
  ADD KEY `PassiverNutzerID` (`PassiverNutzerID`),
  ADD KEY `StatusFavoritID` (`StatusFavoritID`),
  ADD KEY `StatusKollegeID` (`StatusKollegeID`);

--
-- Indizes für die Tabelle `liste`
--
ALTER TABLE `liste`
  ADD PRIMARY KEY (`ListeID`),
  ADD KEY `ProjektID` (`ProjektID`);

--
-- Indizes für die Tabelle `mobil_nummer`
--
ALTER TABLE `mobil_nummer`
  ADD PRIMARY KEY (`MobilID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `name`
--
ALTER TABLE `name`
  ADD PRIMARY KEY (`NameID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `nutzer`
--
ALTER TABLE `nutzer`
  ADD PRIMARY KEY (`NutzerID`),
  ADD KEY `StatusID` (`StatusID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`),
  ADD KEY `fk_nutzer_name` (`NameID`),
  ADD KEY `fk_nutzer_mail` (`MailID`),
  ADD KEY `fk_nutzer_mobil` (`MobilID`),
  ADD KEY `fk_nutzer_profilbild` (`ProfilbildID`),
  ADD KEY `fk_nutzer_standort` (`StandortID`);

--
-- Indizes für die Tabelle `profilbild`
--
ALTER TABLE `profilbild`
  ADD PRIMARY KEY (`ProfilbildID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `projekt`
--
ALTER TABLE `projekt`
  ADD PRIMARY KEY (`ProjektID`),
  ADD KEY `LeiterID` (`LeiterID`),
  ADD KEY `TeilnehmerProjektID` (`TeilnehmerProjektID`),
  ADD KEY `StatusID` (`StatusID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `sichtbarkeit`
--
ALTER TABLE `sichtbarkeit`
  ADD PRIMARY KEY (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `standort`
--
ALTER TABLE `standort`
  ADD PRIMARY KEY (`StandortID`),
  ADD KEY `SichtbarkeitID` (`SichtbarkeitID`);

--
-- Indizes für die Tabelle `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indizes für die Tabelle `teilnehmer_feld`
--
ALTER TABLE `teilnehmer_feld`
  ADD PRIMARY KEY (`TeilnehmerFeldID`),
  ADD KEY `FeldID` (`FeldID`),
  ADD KEY `StatusID` (`StatusID`);

--
-- Indizes für die Tabelle `teilnehmer_projekt`
--
ALTER TABLE `teilnehmer_projekt`
  ADD PRIMARY KEY (`TeilnehmerProjektID`),
  ADD KEY `ProjektID` (`ProjektID`),
  ADD KEY `NutzerID` (`NutzerID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `aktivitäten`
--
ALTER TABLE `aktivitäten`
  MODIFY `AktivitätID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `e_mail_adresse`
--
ALTER TABLE `e_mail_adresse`
  MODIFY `MailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `feld`
--
ALTER TABLE `feld`
  MODIFY `FeldID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `liste`
--
ALTER TABLE `liste`
  MODIFY `ListeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `mobil_nummer`
--
ALTER TABLE `mobil_nummer`
  MODIFY `MobilID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `name`
--
ALTER TABLE `name`
  MODIFY `NameID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `nutzer`
--
ALTER TABLE `nutzer`
  MODIFY `NutzerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `profilbild`
--
ALTER TABLE `profilbild`
  MODIFY `ProfilbildID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `projekt`
--
ALTER TABLE `projekt`
  MODIFY `ProjektID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sichtbarkeit`
--
ALTER TABLE `sichtbarkeit`
  MODIFY `SichtbarkeitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `standort`
--
ALTER TABLE `standort`
  MODIFY `StandortID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `status`
--
ALTER TABLE `status`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `aktivitäten`
--
ALTER TABLE `aktivitäten`
  ADD CONSTRAINT `aktivitäten_ibfk_1` FOREIGN KEY (`TeilnehmerAktivID`) REFERENCES `teilnehmer` (`TeilnehmerID`),
  ADD CONSTRAINT `aktivitäten_ibfk_2` FOREIGN KEY (`TeilnehmerPassivID`) REFERENCES `teilnehmer` (`TeilnehmerID`),
  ADD CONSTRAINT `aktivitäten_ibfk_3` FOREIGN KEY (`ProjektID`) REFERENCES `projekt` (`ProjektID`),
  ADD CONSTRAINT `aktivitäten_ibfk_4` FOREIGN KEY (`ListeID`) REFERENCES `liste` (`ListeID`),
  ADD CONSTRAINT `aktivitäten_ibfk_5` FOREIGN KEY (`FeldID`) REFERENCES `feld` (`FeldID`);

--
-- Constraints der Tabelle `beobachtung_felder`
--
ALTER TABLE `beobachtung_felder`
  ADD CONSTRAINT `beobachtung_felder_ibfk_1` FOREIGN KEY (`NutzerID`) REFERENCES `nutzer` (`NutzerID`),
  ADD CONSTRAINT `beobachtung_felder_ibfk_2` FOREIGN KEY (`FeldID`) REFERENCES `feld` (`FeldID`),
  ADD CONSTRAINT `beobachtung_felder_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`);

--
-- Constraints der Tabelle `beobachtung_projekte`
--
ALTER TABLE `beobachtung_projekte`
  ADD CONSTRAINT `beobachtung_projekte_ibfk_1` FOREIGN KEY (`NutzerID`) REFERENCES `nutzer` (`NutzerID`),
  ADD CONSTRAINT `beobachtung_projekte_ibfk_2` FOREIGN KEY (`ProjektID`) REFERENCES `projekt` (`ProjektID`),
  ADD CONSTRAINT `beobachtung_projekte_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`);

--
-- Constraints der Tabelle `e_mail_adresse`
--
ALTER TABLE `e_mail_adresse`
  ADD CONSTRAINT `e_mail_adresse_ibfk_2` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`);

--
-- Constraints der Tabelle `feld`
--
ALTER TABLE `feld`
  ADD CONSTRAINT `feld_ibfk_1` FOREIGN KEY (`ListeID`) REFERENCES `liste` (`ListeID`),
  ADD CONSTRAINT `feld_ibfk_2` FOREIGN KEY (`TeilnehmerFeldID`) REFERENCES `teilnehmer_feld` (`TeilnehmerFeldID`),
  ADD CONSTRAINT `feld_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`);

--
-- Constraints der Tabelle `kollegen`
--
ALTER TABLE `kollegen`
  ADD CONSTRAINT `kollegen_ibfk_1` FOREIGN KEY (`AktiverNutzerID`) REFERENCES `nutzer` (`NutzerID`),
  ADD CONSTRAINT `kollegen_ibfk_2` FOREIGN KEY (`PassiverNutzerID`) REFERENCES `nutzer` (`NutzerID`),
  ADD CONSTRAINT `kollegen_ibfk_3` FOREIGN KEY (`StatusFavoritID`) REFERENCES `status` (`StatusID`),
  ADD CONSTRAINT `kollegen_ibfk_4` FOREIGN KEY (`StatusKollegeID`) REFERENCES `status` (`StatusID`);

--
-- Constraints der Tabelle `liste`
--
ALTER TABLE `liste`
  ADD CONSTRAINT `liste_ibfk_1` FOREIGN KEY (`ProjektID`) REFERENCES `projekt` (`ProjektID`);

--
-- Constraints der Tabelle `mobil_nummer`
--
ALTER TABLE `mobil_nummer`
  ADD CONSTRAINT `mobil_nummer_ibfk_2` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`);

--
-- Constraints der Tabelle `name`
--
ALTER TABLE `name`
  ADD CONSTRAINT `name_ibfk_2` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`);

--
-- Constraints der Tabelle `nutzer`
--
ALTER TABLE `nutzer`
  ADD CONSTRAINT `fk_nutzer_mail` FOREIGN KEY (`MailID`) REFERENCES `e_mail_adresse` (`MailID`),
  ADD CONSTRAINT `fk_nutzer_mobil` FOREIGN KEY (`MobilID`) REFERENCES `mobil_nummer` (`MobilID`),
  ADD CONSTRAINT `fk_nutzer_name` FOREIGN KEY (`NameID`) REFERENCES `name` (`NameID`),
  ADD CONSTRAINT `fk_nutzer_profilbild` FOREIGN KEY (`ProfilbildID`) REFERENCES `profilbild` (`ProfilbildID`),
  ADD CONSTRAINT `fk_nutzer_standort` FOREIGN KEY (`StandortID`) REFERENCES `standort` (`StandortID`),
  ADD CONSTRAINT `nutzer_ibfk_1` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`),
  ADD CONSTRAINT `nutzer_ibfk_2` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`),
  ADD CONSTRAINT `nutzer_ibfk_3` FOREIGN KEY (`MailID`) REFERENCES `mail` (`MailID`),
  ADD CONSTRAINT `nutzer_ibfk_4` FOREIGN KEY (`MobilID`) REFERENCES `mobil` (`MobilID`),
  ADD CONSTRAINT `nutzer_ibfk_5` FOREIGN KEY (`StandortID`) REFERENCES `standort` (`StandortID`),
  ADD CONSTRAINT `nutzer_ibfk_6` FOREIGN KEY (`NameID`) REFERENCES `name` (`NameID`),
  ADD CONSTRAINT `nutzer_ibfk_7` FOREIGN KEY (`ProfilbildID`) REFERENCES `profilbild` (`ProfilbildID`);

--
-- Constraints der Tabelle `profilbild`
--
ALTER TABLE `profilbild`
  ADD CONSTRAINT `profilbild_ibfk_2` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`);

--
-- Constraints der Tabelle `projekt`
--
ALTER TABLE `projekt`
  ADD CONSTRAINT `projekt_ibfk_1` FOREIGN KEY (`LeiterID`) REFERENCES `nutzer` (`NutzerID`),
  ADD CONSTRAINT `projekt_ibfk_2` FOREIGN KEY (`TeilnehmerProjektID`) REFERENCES `teilnehmer_projekt` (`TeilnehmerProjektID`),
  ADD CONSTRAINT `projekt_ibfk_3` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`),
  ADD CONSTRAINT `projekt_ibfk_4` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`);

--
-- Constraints der Tabelle `standort`
--
ALTER TABLE `standort`
  ADD CONSTRAINT `standort_ibfk_2` FOREIGN KEY (`SichtbarkeitID`) REFERENCES `sichtbarkeit` (`SichtbarkeitID`);

--
-- Constraints der Tabelle `teilnehmer_feld`
--
ALTER TABLE `teilnehmer_feld`
  ADD CONSTRAINT `teilnehmer_feld_ibfk_1` FOREIGN KEY (`FeldID`) REFERENCES `feld` (`FeldID`),
  ADD CONSTRAINT `teilnehmer_feld_ibfk_2` FOREIGN KEY (`StatusID`) REFERENCES `status` (`StatusID`);

--
-- Constraints der Tabelle `teilnehmer_projekt`
--
ALTER TABLE `teilnehmer_projekt`
  ADD CONSTRAINT `teilnehmer_projekt_ibfk_1` FOREIGN KEY (`ProjektID`) REFERENCES `projekt` (`ProjektID`),
  ADD CONSTRAINT `teilnehmer_projekt_ibfk_2` FOREIGN KEY (`NutzerID`) REFERENCES `nutzer` (`NutzerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
