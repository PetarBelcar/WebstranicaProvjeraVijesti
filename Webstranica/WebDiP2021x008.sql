-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2022 at 11:56 AM
-- Server version: 5.5.62-0+deb8u1
-- PHP Version: 7.2.25-1+0~20191128.32+debian8~1.gbp108445

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WebDiP2021x008`
--

-- --------------------------------------------------------

--
-- Table structure for table `Autor`
--

CREATE TABLE `Autor` (
  `Korisnik_id` int(11) NOT NULL,
  `Vijest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Autor`
--

INSERT INTO `Autor` (`Korisnik_id`, `Vijest_id`) VALUES
(7, 1),
(9, 2),
(9, 3),
(9, 4),
(6, 5),
(7, 6),
(7, 7),
(9, 8),
(9, 9),
(6, 10);

-- --------------------------------------------------------

--
-- Table structure for table `AutorKategorije`
--

CREATE TABLE `AutorKategorije` (
  `IdAdministratora` int(11) NOT NULL,
  `idKategorijeVijesti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `AutorKategorije`
--

INSERT INTO `AutorKategorije` (`IdAdministratora`, `idKategorijeVijesti`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `BlokiraniKorisnik`
--

CREATE TABLE `BlokiraniKorisnik` (
  `idBlokiranogKorisnika` int(11) NOT NULL,
  `idModeratora` int(11) NOT NULL,
  `idKategorijeVijesti` int(11) NOT NULL,
  `razlog` text COLLATE utf8_bin NOT NULL,
  `datumvrijemeDoIstekaBlokiranja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `BlokiraniKorisnik`
--

INSERT INTO `BlokiraniKorisnik` (`idBlokiranogKorisnika`, `idModeratora`, `idKategorijeVijesti`, `razlog`, `datumvrijemeDoIstekaBlokiranja`) VALUES
(4, 3, 1, '', NULL),
(4, 3, 2, '', '2022-06-04 23:00:00'),
(4, 3, 3, '', NULL),
(4, 3, 4, '', NULL),
(4, 3, 5, '', NULL),
(4, 3, 6, '', NULL),
(4, 3, 7, '', NULL),
(4, 3, 8, '', NULL),
(4, 3, 9, '', NULL),
(4, 3, 10, '', NULL),
(4, 21, 2, 'Test', '2022-06-05 23:00:00'),
(13, 21, 2, 'Test', NULL),
(24, 21, 3, 'Test', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Cookie`
--

CREATE TABLE `Cookie` (
  `id` int(11) NOT NULL,
  `naziv` varchar(45) COLLATE utf8_bin NOT NULL,
  `opis` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Cookie`
--

INSERT INTO `Cookie` (`id`, `naziv`, `opis`) VALUES
(1, 'Zapamčivanje odabrane periode', 'Sustav pamti od kojeg do kojeg datuma su selektirane vijesti'),
(2, 'Zapamčivanje odabira kategorije vijesti', 'Sustav pamti koju je kategoriju vijesti korisnik izabrao pri predavanje zadnje vijesti'),
(3, 'Zapamčivanje termina kojeg je pretraživao', 'Sustav pamti koji string je korisnik zadnji unjeo kod pretraživanja naslova svojih predanih vijesti');

-- --------------------------------------------------------

--
-- Table structure for table `Cookie_has_Korisnik`
--

CREATE TABLE `Cookie_has_Korisnik` (
  `Cookie_id` int(11) NOT NULL,
  `Korisnik_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Cookie_has_Korisnik`
--

INSERT INTO `Cookie_has_Korisnik` (`Cookie_id`, `Korisnik_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(2, 2),
(3, 2),
(1, 3),
(2, 3),
(3, 3),
(1, 4),
(2, 4),
(3, 4),
(1, 5),
(2, 5),
(3, 5),
(1, 6),
(2, 6),
(3, 6),
(1, 7),
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Dnevnik`
--

CREATE TABLE `Dnevnik` (
  `id` int(11) NOT NULL,
  `idKornisnika` int(11) NOT NULL,
  `idVrstaRadnje` int(11) NOT NULL,
  `datumvrijemeDnevnika` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Dnevnik`
--

INSERT INTO `Dnevnik` (`id`, `idKornisnika`, `idVrstaRadnje`, `datumvrijemeDnevnika`) VALUES
(1, 1, 6, '2022-04-01 09:03:49'),
(2, 2, 5, '2022-04-08 18:17:33'),
(3, 4, 4, '2022-04-05 03:44:22'),
(4, 3, 4, '2022-04-01 08:45:13'),
(5, 7, 1, '2022-03-29 05:09:27'),
(6, 8, 3, '2022-03-23 07:31:27'),
(7, 6, 4, '2022-03-28 05:24:45'),
(8, 9, 1, '2022-03-16 13:17:16'),
(9, 1, 6, '2022-04-07 06:34:24'),
(10, 5, 2, '2022-04-03 16:21:33'),
(11, 5, 5, '2022-05-04 00:00:00'),
(12, 9, 5, '2022-05-06 00:00:00'),
(13, 19, 4, '2022-05-20 00:00:00'),
(14, 10, 5, '2022-06-28 00:00:00'),
(15, 20, 2, '2022-04-20 00:00:00'),
(16, 23, 4, '2022-05-23 00:00:00'),
(17, 7, 5, '2022-06-20 00:00:00'),
(18, 2, 6, '2022-05-17 00:00:00'),
(19, 20, 1, '2022-05-27 00:00:00'),
(20, 24, 2, '2022-05-10 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `DZ4_Kolacici`
--

CREATE TABLE `DZ4_Kolacici` (
  `id` int(11) NOT NULL,
  `Naziv` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `DZ4_Kolacici`
--

INSERT INTO `DZ4_Kolacici` (`id`, `Naziv`) VALUES
(1, 'Nuzni kolacici'),
(2, 'Marketinski kolacici'),
(3, 'Analiticki kolacici');

-- --------------------------------------------------------

--
-- Table structure for table `DZ4_Kolacici_has_DZ4_Korisnici`
--

CREATE TABLE `DZ4_Kolacici_has_DZ4_Korisnici` (
  `DZ4_Kolacici_id` int(11) NOT NULL,
  `DZ4_Korisnici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `DZ4_Kolacici_has_DZ4_Korisnici`
--

INSERT INTO `DZ4_Kolacici_has_DZ4_Korisnici` (`DZ4_Kolacici_id`, `DZ4_Korisnici_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(3, 2),
(1, 3),
(1, 4),
(2, 4),
(3, 4),
(1, 9),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `DZ4_Korisnici`
--

CREATE TABLE `DZ4_Korisnici` (
  `id` int(11) NOT NULL,
  `korisnickoIme` varchar(45) COLLATE utf8_bin NOT NULL,
  `lozinka` varchar(45) COLLATE utf8_bin NOT NULL,
  `DZ4_VrstaKorisnika_id` int(11) NOT NULL,
  `imePrezime` varchar(45) COLLATE utf8_bin NOT NULL,
  `datumRodenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `DZ4_Korisnici`
--

INSERT INTO `DZ4_Korisnici` (`id`, `korisnickoIme`, `lozinka`, `DZ4_VrstaKorisnika_id`, `imePrezime`, `datumRodenja`) VALUES
(1, 'pbelcar', 'pbelcar', 1, 'Petar Belcar', '2022-05-03'),
(2, 'ppero', 'ppero', 1, 'ppero', '2022-05-02'),
(3, 'mmarko', 'mmarko', 1, 'mmarko', '2022-05-05'),
(4, 'aadmin', 'aadmin', 3, 'Admin', '0000-00-00'),
(9, 'vvoditelj', 'vvoditelj', 2, 'Voditelj', '2022-03-16'),
(10, 'vvoditelj2', 'vvoditelj2', 2, 'Voditelj 2', '2022-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `DZ4_Obrazac`
--

CREATE TABLE `DZ4_Obrazac` (
  `id` int(11) NOT NULL,
  `putanja` varchar(200) COLLATE utf8_bin NOT NULL,
  `kategorija` varchar(5) COLLATE utf8_bin NOT NULL,
  `datumVrijeme` datetime NOT NULL,
  `opis` varchar(255) COLLATE utf8_bin NOT NULL,
  `boja` varchar(7) COLLATE utf8_bin NOT NULL,
  `velicina` float NOT NULL,
  `mjesec` int(11) NOT NULL,
  `telefon` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `DZ4_VrstaKorisnika`
--

CREATE TABLE `DZ4_VrstaKorisnika` (
  `id` int(11) NOT NULL,
  `naziv` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `DZ4_VrstaKorisnika`
--

INSERT INTO `DZ4_VrstaKorisnika` (`id`, `naziv`) VALUES
(1, 'Registrirani korisnik'),
(2, 'Voditelj'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `KategorijaKorisnika`
--

CREATE TABLE `KategorijaKorisnika` (
  `id` int(11) NOT NULL,
  `Naziv` varchar(50) COLLATE utf8_bin NOT NULL,
  `Opis` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `KategorijaKorisnika`
--

INSERT INTO `KategorijaKorisnika` (`id`, `Naziv`, `Opis`) VALUES
(1, 'Administrator', 'Ima sva prava dostupna moderatorima, registriranim i ne registriranim korisnicima'),
(2, 'Recenzent', 'Imaju sva prava registriranih i neregistriranih korisnika'),
(3, 'Registrirani korisnik', 'Registrirani korisnik koji ima pravo objavljivanja vijesti ');

-- --------------------------------------------------------

--
-- Table structure for table `KategorijeVijesti`
--

CREATE TABLE `KategorijeVijesti` (
  `id` int(11) NOT NULL,
  `naziv` varchar(50) COLLATE utf8_bin NOT NULL,
  `opis` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `KategorijeVijesti`
--

INSERT INTO `KategorijeVijesti` (`id`, `naziv`, `opis`) VALUES
(1, 'Politika', 'Politika je kolektivna djelatnost usmjerena ka donošenju odluke o rješenju problema i izvršenju te odluke koja je obvezna za sve članove zajednice.'),
(2, 'Sport', 'Šport ili sport, naziv za fizičke aktivnosti koje čovjek izvodi iz natjecateljskih razloga.'),
(3, 'Vrijeme', 'Vrijeme je trenutno stanje atmosfere na nekom prostoru. Prosječan godišnji tijek vremena nekog područja čini klimu.'),
(4, 'Znanost', 'Znanost organiziran je sustav sveukupnog ljudskog znanja stečenog opažanjem procesa i pojava u prirodi i društvu, a obrađenog racionalnim, znanstveno prihvatljivim metodama.'),
(5, 'Nacionalna', 'Vijeti o događajima u Republici Hrvatskoj'),
(6, 'Regionalne', 'Vijesti o događajima koje zahvaćaju dijelove Republike Hrvatske.'),
(7, 'Tehnologija', 'Tehnologija je razvoj i primjena alata, strojeva, materijala i postupaka za izradu nekoga proizvoda ili obavljanje neke aktivnosti; također i znanost koja proučava primjenu znanja, vještine i organizacije u provedbi nekoga procesa. Tijekom povijesti razvila su se samostalna područja tehnologije, od kojih svako okuplja više srodnih postupaka proizvodnje.'),
(8, 'Religija', 'Religija je za većinu osoba organizirani sustav vjerovanja i bogoslužja koje stavljaju Boga u središte.'),
(9, 'Promet', 'Promet je gospodarska djelatnost tercijarnog sektora koja se bavi prijevozom robe i ljudi te prijenosom informacija s jednog mjesta na drugo.'),
(10, 'Giboni', 'Vijesti o porodici primata koji žive na drveću u Jugoistočnoj Aziji.');

-- --------------------------------------------------------

--
-- Table structure for table `Korisnik`
--

CREATE TABLE `Korisnik` (
  `id` int(11) NOT NULL,
  `korisnickoIme` varchar(100) COLLATE utf8_bin NOT NULL,
  `lozinka` varchar(100) COLLATE utf8_bin NOT NULL,
  `lozinkaSHA256` varchar(256) COLLATE utf8_bin NOT NULL,
  `email` varchar(200) COLLATE utf8_bin NOT NULL,
  `aktiviran` tinyint(4) NOT NULL,
  `datumRegistracije` datetime NOT NULL,
  `ime` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `prezime` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `loginFailCount` int(10) UNSIGNED DEFAULT NULL,
  `KategorijaKorisnika_id` int(11) DEFAULT NULL,
  `uvjetiKoristenja` tinyint(1) NOT NULL,
  `aktivacijskiKod` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Korisnik`
--

INSERT INTO `Korisnik` (`id`, `korisnickoIme`, `lozinka`, `lozinkaSHA256`, `email`, `aktiviran`, `datumRegistracije`, `ime`, `prezime`, `loginFailCount`, `KategorijaKorisnika_id`, `uvjetiKoristenja`, `aktivacijskiKod`) VALUES
(1, 'iIvic', 'iIvic', '70ed978a57d7e7d8e3b452f5fcf7530e3921c1565542e2d8a952070874c60293', 'iIvic@foi.hr', 1, '2021-04-01 00:00:00', 'Ivan', 'Ivic', 0, 1, 1, NULL),
(2, 'aAnic', 'aAnic', 'c8bd80f3da8b2ce9a1a47553568299d08099347dde1f5d756d8a33d9920c2b05', 'aanic@foi.hr', 1, '2021-09-21 00:00:00', 'Ana', 'Anic', 1, 1, 1, NULL),
(3, 'bBrankic', 'bBrankic', '00726f281ccef045afdad9873d1af1e7c1772720bf8410cd3873f140e00b68e5', 'bbrankic@foi.hr', 1, '2021-12-23 00:00:00', NULL, NULL, 0, 2, 1, NULL),
(4, 'dDarkic', 'dDarkic', '3bd97b1eebd0d8b5669c1e6a6834a97ee24734fefaa732a31a9eab81ff3dda78', 'ddarkic@foi.hr', 1, '2021-12-30 00:00:00', 'Darko', NULL, 0, 3, 1, NULL),
(5, 'eEvic', 'eEvic', 'b749fe7362f68a3591a8878fcd683d40d0857f3a77108516c62aa4e50ec46ad1', 'eevic@foi.hr', 1, '2022-01-06 00:00:00', NULL, 'Evic', 0, 2, 1, NULL),
(6, 'fFilipovic', 'fFilipovic', '621042780bdb6cd25909797c597979946fa3a0595f03fbfd5fe969d7e1016553', 'ffilipovic@foi.hr', 1, '2021-12-06 00:00:00', NULL, NULL, 2, 2, 1, NULL),
(7, 'gGrgic', 'gGrgic', 'd45c898236cb37222a0b2ecfed50c220304a03508299123d918c7547fa50177d', 'ggrgic@gmail.com', 1, '2022-01-12 00:00:00', 'Grga', 'Grgic', 0, 3, 1, NULL),
(8, 'zZlatkic', 'zZlatkic', '9a0f5e46a097415c0b4d12b2c2e76c3651552bbfcd4da2e61e2104eddfe56c6d', 'zzlatkic@gmail.com', 1, '2022-02-09 00:00:00', 'Zlatko', NULL, 0, 3, 1, NULL),
(9, 'ljLjubic', 'ljLjubic', '39e7295dcbfd05d8e17defe6fcc7f4762387a264bc9dd6ee66301760cd4283cd', 'ljljubic@foi.hr', 1, '2022-01-28 00:00:00', NULL, NULL, 1, 3, 1, NULL),
(10, 'mMarkic', 'mMarkic', '6a2f4cea8be6af38b083e7e5dcd84b0244647d660786795db064300cc66c9587', 'mmarkic@gmail.com', 0, '2022-04-05 00:00:00', NULL, NULL, 0, 3, 1, NULL),
(11, 'peroPeric', 'peroPeric123', 'df05a3aa9bd23e63277594ae257abcb19835bc2750a8696ed38c80c5517fc9a9', 'pero.peric@foi.hr', 0, '2022-06-02 05:41:35', 'Pero', 'Peric', 0, 3, 0, '623543'),
(13, 'pbelcar', '770300713', 'ce68e31273f2f60fba9f9ee487a08f1f0b9ebe3d94c24b0e4523cfa4067876c3', 'pbelcar@foi.hr', 1, '2022-06-02 06:16:34', 'Petar', 'Belcar', 0, 3, 1, '2047223207'),
(14, 'markoMarkovic', 'markovic123', '0c679f0a7ce023495de721e61b47a49e964ac55ff14f8e4956a0d16e0171a73b', 'mobemar764@about27.com', 1, '2022-06-02 06:17:09', '', '', 0, 3, 1, '537535573'),
(19, 'AnaAnic', 'aanic', 'fff86f79dd180530f2f5f08bc6551203aded22f8de3ed16e29cadbff9511af73', 'niyinof156@nifect.com', 1, '2022-06-02 06:40:56', NULL, NULL, 0, 3, 1, '445768829'),
(20, '246892', '123123123', '114c0b8beff09497cf639bd280cee225b2385455fccee914983b81023f3a8b8e', 'xodayiv407@lockaya.com', 1, '2022-06-02 06:46:25', NULL, NULL, 0, 3, 1, '790731446'),
(21, 'moderator123', 'moderator456', '4edd708ad64ca8264f8304c1bf601f64075049dee695318d8788a67ce987d54d', 'bilibi8085@dilanfa.com', 1, '2022-06-03 22:00:20', NULL, NULL, 0, 2, 1, '609591762'),
(22, 'moderato1234', 'ewtg4h5re', '7dad5e2df7aca36b385acd1cf71018f787461109d6d05af8e112c1df053b8036', 'cifegox178@game4hr.com', 1, '2022-06-05 10:07:51', 'Moderator 2', '2', 0, 2, 1, '621130926'),
(23, 'HU9r984js', 'dvoiu48', '5e88baa46708b0b0c0c5a20aa3ca5664b077ce039f3beb152a24cd6a10b686c3', 'sotaki2709@dilanfa.com', 1, '2022-06-05 15:25:55', 'Ime', NULL, 4, 3, 1, '1142517735'),
(24, 'i00(8e44y4', '09238gsd', 'ffb1de608f4cdce234a032d8f1581798031c280a816aa5a7362d5dcf78018d61', 'gapov12410@iconzap.com', 1, '2022-06-05 21:16:07', NULL, NULL, 0, 3, 1, '191643033'),
(25, 'Iufe83s', '44565646', 'b10b65b8f37567720e107aa2eda39cb308f6e3d13417c3f2addc3b1fa99b5e43', 'banala2346@iconzap.com', 1, '2022-06-06 13:40:15', 'Ime', NULL, 0, 3, 1, '769512265'),
(26, '(jfe9483h', '9suv(Zd4', 'c3e8b3f6d9d5ad051d8e45e250bb8abe5483d3c15fb209478a8bbd98d075807e', 'gowek94280@oceore.com', 1, '2022-06-06 13:43:49', NULL, 'Perzime', NULL, 3, 0, '1136542611'),
(27, 'ij8941', 'ij894', '921ca5b7d9e179ab8870338ad0e64471065ce7369793461ef5a9b251b2d71e0d', 'bixiwe9190@krunsea.com', 1, '2022-06-06 13:44:59', NULL, NULL, 0, 3, 1, '1048674994'),
(28, 'Ki9e3kso', '757010659', '9036151e0c53ca9e39b3bae51e32b589339c6b9f8ebd1a2428c94cecc40536b9', 'koxapa8407@nzaif.com', 1, '2022-06-06 10:55:29', NULL, NULL, 4, 3, 0, '805783870');

-- --------------------------------------------------------

--
-- Table structure for table `ModeratorKategorije`
--

CREATE TABLE `ModeratorKategorije` (
  `idModeratora` int(11) NOT NULL,
  `idKategorijeVijesti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ModeratorKategorije`
--

INSERT INTO `ModeratorKategorije` (`idModeratora`, `idKategorijeVijesti`) VALUES
(3, 1),
(21, 1),
(3, 2),
(21, 2),
(22, 2),
(3, 3),
(4, 3),
(21, 3),
(4, 4),
(21, 4),
(4, 5),
(21, 5),
(5, 6),
(21, 6),
(5, 7),
(21, 7),
(6, 8),
(21, 8),
(6, 9),
(21, 9),
(6, 10),
(21, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Pogreske`
--

CREATE TABLE `Pogreske` (
  `id` int(11) NOT NULL,
  `idRecenzije` int(11) NOT NULL,
  `pocetakGreske` int(11) DEFAULT NULL,
  `krajGreske` int(11) DEFAULT NULL,
  `opis` text COLLATE utf8_bin,
  `VrstaGreške_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Pogreske`
--

INSERT INTO `Pogreske` (`id`, `idRecenzije`, `pocetakGreske`, `krajGreske`, `opis`, `VrstaGreške_id`) VALUES
(1, 2, 0, 10, NULL, 2),
(2, 2, 25, 28, '', 2),
(3, 2, 0, 100, 'Podatak je dokazan kao lažan', 1),
(4, 2, 200, 250, NULL, 1),
(5, 2, 0, 0, 'Dobro bi došli materijali', 3),
(6, 5, 0, 20, NULL, 2),
(7, 5, 50, 55, NULL, 2),
(8, 5, 100, 150, NULL, 1),
(9, 5, 150, 200, 'Fali izvor za ovaj dio ', 4),
(10, 5, 0, 0, 'Dobro bi došli vidoe zapisi događaja.', 3),
(11, 27, 1, 20, 'Ovaj podatak je neistinit', 1),
(12, 27, 50, 60, '', 2),
(13, 27, 12, 13, '', 2),
(14, 27, NULL, NULL, 'Izvor vodi do krive web stranice', 4),
(15, 26, 250, 260, '', 2),
(16, 27, 12, 22, '', 2),
(17, 27, 53, 76, '', 2),
(18, 27, NULL, NULL, 'Video snimka bi dobro dosla', 3),
(19, 27, 78, 90, '', 1),
(20, 31, NULL, NULL, 'Izvor je krivi', 4),
(21, 31, 25, 35, '', 2),
(22, 34, NULL, NULL, 'Opis', 1),
(23, 34, NULL, NULL, 'Opis', 4),
(24, 34, 24, 86, '', 2),
(25, 37, 20, 30, '', 2),
(26, 37, NULL, NULL, 'Izvor nedovoljno detaljan', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ProsleVerzijeVjesti`
--

CREATE TABLE `ProsleVerzijeVjesti` (
  `idVjesti` int(11) NOT NULL,
  `naslov` varchar(200) COLLATE utf8_bin NOT NULL,
  `tekst` text COLLATE utf8_bin NOT NULL,
  `datumvrijemeIzmjene` datetime NOT NULL,
  `revizija` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ProsleVerzijeVjesti`
--

INSERT INTO `ProsleVerzijeVjesti` (`idVjesti`, `naslov`, `tekst`, `datumvrijemeIzmjene`, `revizija`) VALUES
(2, 'Ukrajina: Rusi su iz Černobila odveli 169 vojnika. Povećali su radijaciju i opljačkali elektranu', 'klearna elektrana u Černobilu, koja je oko mjesec dana bila pod kontrolom ruske vojske, opet je u rukama Ukrajinaca. No agresori su napravili štetu po mjestu na kojem je 1986. izbila najveća nuklearna katastrofa ikad.\r\n\r\n- Otišli su u Crvenu šumu i na cipelama donijeli radioaktivni materijal. Druga su mjesta ovdje u redu, ali radijacija se u ovoj prostoriji povećala jer su ovdje živjeli - govori ukrajinski vojnik Igor Ugolkov za CNN, koji je ušao u nuklearku.', '2022-04-10 00:00:00', 1),
(5, 'Vozili smo prvi auto na vodik u Hrvatskoj: Iz \'ispuha\' mu izlazi čista voda, ovo je budućnost', 'Električni auti su budućnost, htjeli mi to ili ne. Jer kroz 10 do 20 godina novih auta na benzin ili dizel više neće biti, bit će zabranjeni. To je jasan smjer Europske unije kojeg je još više osnažio rat u Ukrajini i velik rast cijena nafte i plina kao posljedica tog rata. No, ako ostanemo samo na električnim autima morat ćemo jako promijeniti svoj pristup vožnji i putovanju jer s električnim autima imamo velik problem malog dosega i dugog vremena putovanja. Ili možda nećemo, jer osim klasičnih električnih auta tu su i automobili na gorive ćelije (engleski Fuel Cell, a u Hrvatskoj se nazivaju još gorivne ćelije ili gorivni članci).  ', '2022-04-10 14:29:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Recenzija`
--

CREATE TABLE `Recenzija` (
  `idVjesti` int(11) NOT NULL,
  `idVrsteRecenzije` int(11) NOT NULL,
  `idAdministratora` int(11) DEFAULT NULL,
  `idModeratora` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `tag` text COLLATE utf8_bin,
  `komentar` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Recenzija`
--

INSERT INTO `Recenzija` (`idVjesti`, `idVrsteRecenzije`, `idAdministratora`, `idModeratora`, `id`, `tag`, `komentar`) VALUES
(1, 1, 1, 3, 1, 'NBA;USA', NULL),
(2, 4, 1, 5, 2, NULL, NULL),
(3, 2, 1, 6, 3, NULL, NULL),
(4, 1, 1, 5, 4, NULL, NULL),
(5, 4, 2, 5, 5, NULL, NULL),
(6, 1, 1, 6, 6, NULL, NULL),
(7, 1, 1, 6, 7, NULL, NULL),
(8, 1, 2, 4, 8, NULL, NULL),
(9, 1, 2, 5, 9, NULL, NULL),
(10, 1, 2, 4, 10, NULL, NULL),
(11, 1, 1, 4, 11, 'Nogomet;Nacionalno', 'Sve uredu'),
(12, 1, 1, 3, 12, 'f1;mick', NULL),
(13, 1, 1, 3, 13, NULL, NULL),
(14, 1, 1, 3, 14, NULL, NULL),
(15, 1, 1, 3, 15, NULL, NULL),
(16, 1, 1, 3, 16, NULL, NULL),
(17, 1, 1, 3, 17, NULL, NULL),
(18, 1, 1, 3, 18, NULL, NULL),
(19, 3, 1, 3, 19, NULL, NULL),
(20, 3, 1, 3, 20, NULL, NULL),
(21, 1, 1, 3, 21, NULL, NULL),
(26, 4, 1, 21, 23, NULL, NULL),
(29, 2, 1, 21, 26, 'elementarna nepogoda;zagorej;štete', 'Testno odbijanje'),
(30, 3, 1, 21, 27, '', ''),
(33, 2, 1, 21, 30, 'nogomet', 'Vijest nije ražumljiva'),
(34, 4, 1, 21, 31, 'tennis', 'Malo poraditi'),
(35, 3, 1, 21, 32, NULL, NULL),
(36, 3, 1, 21, 33, NULL, NULL),
(37, 2, 1, 21, 34, '', 'dosadan je'),
(38, 1, 1, 21, 35, '', ''),
(39, 2, 1, 21, 36, '', 'Vijest je duplikat'),
(40, 2, 1, 21, 37, '', 'Dosadan si'),
(41, 2, 1, 21, 38, '', 'DOsadan si'),
(42, 3, 1, 21, 39, NULL, NULL),
(43, 1, 1, 21, 40, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Sesija`
--

CREATE TABLE `Sesija` (
  `idKorisnika` int(11) NOT NULL,
  `datumvrijemLogina` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Sesija`
--

INSERT INTO `Sesija` (`idKorisnika`, `datumvrijemLogina`) VALUES
(1, '2022-04-12 00:00:00'),
(2, '2022-04-12 08:00:00'),
(3, '2022-04-11 14:18:00'),
(4, '2022-04-08 21:14:00'),
(5, '2022-04-06 02:00:00'),
(6, '2022-04-11 21:00:00'),
(7, '2022-04-14 00:00:00'),
(8, '2022-04-08 23:17:00'),
(9, '2022-04-06 23:00:00'),
(10, '2022-04-13 12:15:00');

-- --------------------------------------------------------

--
-- Table structure for table `StanjeRecenzije`
--

CREATE TABLE `StanjeRecenzije` (
  `id` int(11) NOT NULL,
  `nazivSTanja` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `StanjeRecenzije`
--

INSERT INTO `StanjeRecenzije` (`id`, `nazivSTanja`) VALUES
(1, 'Prihvaćeno'),
(2, 'Odbijeo'),
(3, 'Recenzija'),
(4, 'Ide na doradu');

-- --------------------------------------------------------

--
-- Table structure for table `VideoAudio`
--

CREATE TABLE `VideoAudio` (
  `id` int(11) NOT NULL,
  `idVjesti` int(11) NOT NULL,
  `link` text COLLATE utf8_bin NOT NULL,
  `alternativniText` text COLLATE utf8_bin NOT NULL,
  `opis` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `VideoAudio`
--

INSERT INTO `VideoAudio` (`id`, `idVjesti`, `link`, `alternativniText`, `opis`) VALUES
(1, 1, 'https://www.youtube.com/watch?v=c4FLiOsFyuo', 'NBA "LONGEST HAIL MARY SHOTS OF THE 2022 NBA REGULAR SEASON !" MOMENTS', 'Video za NBA vijest'),
(2, 1, 'https://www.youtube.com/watch?v=_VVzD7g8NNE', 'Los Angeles Lakers vs Denver Nuggets Full Game Highlights | April 10 | 2022 NBA Season', ''),
(3, 1, 'https://www.youtube.com/watch?v=jrKDq5gYRa8', 'The VERY BEST Regular Season Moments 2022 ! A Season to Remember ⭐', 'Video za NBA vijest'),
(4, 1, 'https://www.youtube.com/watch?v=y9Gh2RBYgW4', 'Final 15.5 WILD ENDING Lakers vs Nuggets ??', 'Video za NBA vijest'),
(5, 5, 'https://www.youtube.com/watch?v=N1vHCOD57Og', 'Ukrainian President Volodymyr Zelenskyy: The 60 Minutes Interview', 'Video za Ukrajina vijest'),
(6, 5, 'https://www.youtube.com/watch?v=MmCL1fzKbUg', 'Russian offensive on the horizon in Ukraine l GMA', ''),
(7, 5, 'https://www.youtube.com/watch?v=x56SxmqIwWo', 'Ex-CIA director predicts Putin\'s next moves in Ukraine', 'Video za Ukrajina vijest'),
(8, 8, 'https://www.youtube.com/watch?v=RQviBajfU08', 'The surprise switch in VW\'s F1 plans for Audi and Porsche', 'Video za F1 vijest'),
(9, 8, 'https://www.youtube.com/watch?v=dt8ANZIZ8Co', 'Race Highlights | 2022 Australian Grand Prix', 'Video za F1 vijest'),
(10, 8, 'https://www.youtube.com/watch?v=wIYPuzWCCSw', 'Race Highlights | 2022 Bahrain Grand Prix', '');

-- --------------------------------------------------------

--
-- Table structure for table `Vijest`
--

CREATE TABLE `Vijest` (
  `id` int(11) NOT NULL,
  `naslov` varchar(200) COLLATE utf8_bin NOT NULL,
  `tekst` text COLLATE utf8_bin NOT NULL,
  `datumvrijemeKreiranja` datetime NOT NULL,
  `revizija` int(11) NOT NULL,
  `slika` text COLLATE utf8_bin NOT NULL,
  `urlIzvora` text COLLATE utf8_bin,
  `idKategorijeVijesti` int(11) NOT NULL,
  `idKreator` int(11) NOT NULL,
  `brojPregleda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Vijest`
--

INSERT INTO `Vijest` (`id`, `naslov`, `tekst`, `datumvrijemeKreiranja`, `revizija`, `slika`, `urlIzvora`, `idKategorijeVijesti`, `idKreator`, `brojPregleda`) VALUES
(1, 'Poznati parovi play-offa: Još osam klubova ima drugu šansu', 'Sve četiri momčadi u Istočnoj konferenciji koje su bile u borbi za pozicije u \'play-in\' turniru ostarile su pobjede u zadnjim utakmicama osnovnog dijela sezone pa su se zadržali na mjestima na kojima su bili i uoči nedjeljnih dvoboja.\n\nTako će Brooklyn Netsi u noći s utorka na srijedu ugostiti Cleveland Cavalierse u utakmici za poziciju 7. nositelja. Poraženi iz tog dvoboja igrat će za poziciju 8. nositelja protiv pobjednika utakmice u kojoj će Atlanta Hawksi ugostiti Charlotte Hornetse u noći sa srijede na četvrtak.\n\nPosljednjeg dana osnovnog dijela sezone Brooklyn je u svom Barclays Centeru pobijedio Indiana Pacerse 134-126, Cleveland je pred svojim navijačima bio bolji od Milwaukee Bucksa sa 133-115, Charlotte Hornetsi su kao domaćini svladali Washington Wizardse sa 124-108, a Atlanta Hawksi su sa 130-114 slavili na gostovanju kod Houston Rocketsa.\n\nAktualni prvaci iz Milwaukeeja su u zadnjoj utakmici odmarali sve glavne igrače, Giannisa Antetokounmpa, Jruea Holidaya, Khrisa Middletona i Bobbyja Portisa, čime su praktično prepustili pobjedu Cavaliersima i time otvorili vrata Bostonu da pobjedom na gostovanju u Memphisu osvoji drugo mjesto u Istočnoj konferenciji. Bucksi ne mogu završiti niže od trećeg mjesta. Celticsi su slavili 139-110.\n\nPrvi je u Istočnoj konferenciji Miami Heat, broj 5 za doigravanje imaju Toronto Raptorsi, a broj 6 su Chicago Bullsi.\n\nU Zapadnoj konferenciji je već otprije poznato da će za poziciju 7. nositelja u doigravanju Minnesota Timberwolvesi biti domaćini Los Angeles Clippersima u noći s utorka na srijedu, večer poslije će New Orleans Pelicansi ugostiti San Antonio Spurse u dvoboju devete i desete momčadi.\n\nUtakmice za poziciju 8. nositelja u doigravanju na rasporedu su u noći s petka na subotu.\n\nPlay-off:\n\nIstočna konferencija:\n\nMiami – 8. nositelj,\n\nBoston – 7. nositelj (Brooklyn – Cleveland),\n\nMilwaukee – Chicago,\n\nPhiladelphia – Toronto.\n\nZapadna konferencija:\n\nPhoenix – 8. nositelj,\n\nMemphis – 7. nositelj (Minnesota – Clippers),\n\nGolden State – Denver,\n\nDallas – Utah.', '2022-04-11 11:00:00', 1, 'https://img.24sata.hr/7nhX8Jg9AaDF_IJQeBhxPZQCml4=/1243x700/smart/media/images/2022-15/2022-04-10t223902z-1597030636-mt1usatoday18058566-rtrmadp-3-nba-indiana-pacers-at-brooklyn-nets_PB5BzzT.jpg', 'https://www.24sata.hr/sport/poznati-parovi-play-in-turnira-828330', 2, 7, 13),
(2, 'Ukrajina: Rusi su iz Černobila odveli 169 vojnika. Povećali su radijaciju i opljačkali elektranu', 'Nuklearna elektrana u Černobilu, koja je oko mjesec dana bila pod kontrolom ruske vojske, opet je u rukama Ukrajinaca. No agresori su napravili štetu po mjestu na kojem je 1986. izbila najveća nuklearna katastrofa ikad.\n\n- Otišli su u Crvenu šumu i na cipelama donijeli radioaktivni materijal. Druga su mjesta ovdje u redu, ali radijacija se u ovoj prostoriji povećala jer su ovdje živjeli - govori ukrajinski vojnik Igor Ugolkov za CNN, koji je ušao u nuklearku.', '2022-04-11 04:23:46', 2, 'https://img.24sata.hr/7NyFM61IXpyUxbEuwpS2XfSrnUY=/1920x0/smart/media/images/2022-15/2022-04-07t235654z-768894096-rc2ait92rqw2-rtrmadp-3-ukraine-crisis-chernobyl.jpg', 'https://www.24sata.hr/news/ukrajina-rusi-su-iz-cernobila-odveli-169-vojnika-povecali-su-radijaciju-i-opljackali-elektranu-828476', 1, 9, 33),
(3, 'Hrvatska protjeruje 24 ljudi iz ruskog veleposlanstva, uručila i prosvjednu notu: Prekinite rat', 'Ruskoj strani ponovljen je poziv na hitan prekid vojnih aktivnosti i povlačenje ruskih postrojbi s cijelog teritorija Ukrajine, te hitno osiguravanje evakuacijskih puteva i dostave humanitarne pomoći', '2022-04-11 18:31:18', 1, 'https://img.24sata.hr/hk66VX_fB6aNmQ5bFnGowYECdqo=/1243x700/smart/media/images/2022-15/untitled-design-3.jpg', 'https://www.24sata.hr/news/hrvatska-protjeruje-24-ljudi-iz-ruskog-veleposlanstva-urucila-i-prosvjednu-notu-prekinite-rat-828435', 1, 9, 17),
(4, 'U Zagrebu 33 novozaraženih', 'U Zagrebu su u protekla 24 sata evidentirana 33 nova slučaja zaraze koronavirusom, ozdravile su 362 osobe, a u zagrebačkim je bolnicama umrlo četvero oboljelih od covida-19, izvijestio je u ponedjeljak Nastavni zavod za javno zdravstvo "Dr. Andrija Štampar".', '2022-04-11 10:27:12', 1, 'https://img.24sata.hr/P4tVfLR6He8_6GgW2SFsxjO0lO8=/1243x700/smart/media/images/2021-48/images-2021-47-pxl-151121-90664416.jpg', 'https://www.24sata.hr/news/u-zagrebu-33-novozarazenih-828524', 6, 9, 89),
(5, 'Vozili smo prvi auto na vodik u Hrvatskoj: Iz \'ispuha\' mu izlazi čista voda, ovo je budućnost', 'Električni auti su budućnost, htjeli mi to ili ne. Jer kroz 10 do 20 godina novih auta na benzin ili dizel više neće biti, bit će zabranjeni. To je jasan smjer Europske unije kojeg je još više osnažio rat u Ukrajini i velik rast cijena nafte i plina kao posljedica tog rata. No, ako ostanemo samo na električnim autima morat ćemo jako promijeniti svoj pristup vožnji i putovanju jer s električnim autima imamo velik problem malog dosega i dugog vremena putovanja. Ili možda nećemo, jer osim klasičnih električnih auta tu su i automobili na gorive ćelije (engleski Fuel Cell, a u Hrvatskoj se nazivaju još gorivne ćelije ili gorivni članci).  ', '2022-04-11 19:19:32', 2, 'https://img.24sata.hr/Xsc_Crvotrjtglc7R0oqlD14d2k=/1243x700/smart/media/images/2022-14/image00025_FjDkjov.jpeg', 'https://www.24sata.hr/tech/vozili-smo-prvi-auto-na-vodik-u-hrvatskoj-iz-ispuha-mu-izlazi-cista-voda-ovo-je-buducnost-827961', 7, 6, 76),
(6, 'Prva potpuno privatna posada sletjela na ISS, letjeli su 20 sati', 'Posada prve potpuno privatne misije koja je pristala na Međunarodnu svemirsku postaju (ISS) doputovala je u subotu nakon više od 20 sati leta, pokazuju snimke uživo američke svemirske agencije NASA-e.\r\n\r\nMisija Ax-1 poletjela je u petak s Cape Canaverala na Floridi u svemirskoj kapsuli Crew Dragon.', '2022-04-11 05:24:45', 1, 'https://img.24sata.hr/lzJDpA3AUJJOYcHpP6VIS2c1kwk=/1243x700/smart/media/images/2022-14/nasa-youtube.png', 'https://www.24sata.hr/tech/prva-potpuno-privatna-posada-sletjela-na-iss-letjeli-su-20-sati-828130', 7, 7, 86),
(7, 'Velolučka srednja škola je među 10 odabranih u projektu EU: \'Veseli nas entuzijazam učenika\'', 'Srednja škola u Veloj Luci koja broji oko 120 učenika jedna je od najaktivnijih u Hrvatskoj kada je riječ o EU projektima zbog čega je izabrana s još devet hrvatskih srednjih škola za sudjelovanje u projektu Europske godine mladih.\r\n\r\nRiječ je projektu pod nazivom “Budućnost Europe: Europska godina mladih” koji je pokrenuo europarlamentarac Predrag Fred Matić.\r\n\r\nU njemu sudjeluje više od 4300 hrvatskih srednjoškolaca, traje do kraja godine, a cilj je da mladi u svojim sredinama prepoznaju i istaknu ključne probleme te iznesu svoje prijedloge kako ih riješiti.\r\n\r\nUz školu u Veloj Luci, odabrane su i srednje škole iz Vukovara, Čakovca, Velike Gorice, Splita, Slavonskog Broda, Konjščine, Pule, Petrinje i s Krka.\r\n\r\nJedan od ključnih kriterija odabira bila je dosadašnja aktivnost škole u EU projektima, u čemu srednja škola iz Vele Luke, sa svojih oko 120 učenika i 28 nastavnika, prednjači.\r\n\r\nSudjelovanje u ovom projektu za malu je otočnu školu kao što je velolučka posebno značajno.\r\n\r\n“Ovaj projekt omogućit će da naši mladi, bez obzira na to što dolaze iz manje sredine, imaju priliku govoriti o svojim problemima i aktivno se uključiti u procese donošenja odluka na europskoj razini”, rekla je za Hinu ravnateljica Srednje škole Vela Luka Ofelija Dragojević.\r\n\r\nVelolučka škola, koja postoji od 1952. i obuhvaća gimnaziju i ekonomsku školu te trogodišnje škole za zanimanja kuhara i brodskog mehaničara, već nekoliko godina aktivno sudjeluje u EPAS programu.\r\n\r\nNadalje, prema formalnim kriterijima Europskog parlamenta škola je 2021. ponovno odabrana, već četvrtu godinu, za Školu ambasadora Europskog parlamenta, ističe ravnateljica.\r\n\r\n“Prije nešto više od mjesec dana kontaktirao nas je ured eurozastupnika Matića i ponudio nam sudjelovanje u ovom projektu. Naravno, rado smo pristali”, dodaje.\r\n\r\nMladi će u sklopu projekta Europska godina mladih raditi na temama iz područja obrazovanja, nezaposlenosti i položaja na tržištu, kulture, sporta, politike, ekologije, a bavit će se i problemima ranjivih skupina mladih.\r\n\r\nSvaka škola ima svoju temu, a velolučki će se srednjoškolci konkretno baviti kulturnim i sportskim aktivnostima za mlade. Sami će identificirati ključne probleme i o njima najprije raspravljati s pojedincima, organizacijama i institucijama u svojoj lokalnoj zajednici, a potom i s onima na europskoj razini.\r\n\r\nTako će dobiti priliku iznijeti specifične probleme s kojima se suočavaju mladi na otoku.\r\n\r\n“To su prije svega nedostatak kulturnih sadržaja, prometna izoliranost, manji broj sadržaja kojima bi mladi upotpunili slobodno vrijeme”, ističe ravnateljica velolučke srednje škole.\r\n\r\nVelolučka škola već je najavila da u sklopu ovog projekta planira surađivati s mladima s čitavog otoka, ne samo iz Vele Luke.\r\n\r\n“S obzirom na to da naša tema iziskuje komunikaciju s različitim udrugama, pozivamo sve zainteresirane udruge mladih (sportske, kulturne) na otoku na suradnju kako bismo detektirali i pokušali riješiti probleme”, poručili su iz škole u Veloj Luci.\r\n\r\nPRAVEDNIJI SUSTAV?\r\n', '2022-04-11 05:26:01', 1, 'https://img.24sata.hr/C6jbYmg6gRiE-1vnkG11AShvX0A=/1243x700/smart/media/images/2020-49/pxl-101220-31110136.jpg', 'https://www.24sata.hr/tech/velolucka-srednja-skola-je-medu-10-odabranih-u-projektu-eu-veseli-nas-entuzijazam-ucenika-828333', 6, 7, 90),
(8, 'Schumacher mlađi pod velikim pritiskom, K-Mag sve bolji, a on je već slupao milijun dolara', 'Kad se radi o svijetu Formule 1, a nosite prezime Schumacher, znate da su pred vama velika očekivanja. Otac Michael (53) je sedmerostruki svjetski prvak i legenda sporta, dok je Mick (23) drugu godinu pod okriljem američkog konstruktora HAAS-a, a nakon godine patnje na dnu grida, ima priliku za dokazivanje u, barem zasad, puno boljem bolidu.', '2022-04-11 08:36:09', 1, 'https://img.24sata.hr/MoewA6v7jdrplmg-vtk9bEKoZBw=/1243x700/smart/media/images/2022-13/untitled-design-7_zSgUlb1.jpg', 'https://www.24sata.hr/sport/schumacher-mladi-pod-velikim-pritiskom-k-mag-sve-bolji-a-on-je-vec-slupao-milijun-dolara-826737', 2, 9, 122),
(9, 'Što je s Hamiltonom? Ne ide na, ali ni izvan staze: Emocionalno se borim i mučim duže vrijeme', 'U Bahreinu uz puno sreće na trećem mjestu, a u Saudijskoj Arabiji katastrofa i 16. mjesto u kvalifikacijama te 10. mjesto na kraju utrke. Posljednji put kad je završio utrku izvan top 10 bilo je u Azerbajdžanu prošle godine na 15. mjestu nakon što se prekočio, a zatim moramo potegnuti još do 2013. kad je završio 12. u Španjolskoj. ', '2022-04-11 19:34:20', 1, 'https://img.24sata.hr/14RFDMtwmXiT4JAtSeR_s_lQjJE=/1243x700/smart/media/images/2022-13/untitled-design-2_ux4r3Eb.jpg', 'https://www.24sata.hr/sport/sto-je-s-hamiltonom-ne-ide-na-ali-ni-izvan-staze-emocionalno-se-borim-i-mucim-duze-vrijeme-826146', 2, 9, 89),
(10, 'Žestoki sudar u kvalifikacijama za VN Australije: Pa je li on normalan? Uništio mi je bolid!', 'Nakon fantastičnih utrka u Bahreinu i Saudijskoj Arabiji, karavana Formule 1 preselila se u Australiju. A već u kvalifikacijama došlo je do kaosa. Samo nekoliko minuta prije kraja prvog dijela organizatori su prekinuli kvalifikacije za VN Australije nakon žestokog sudara Lancea Strolla (Aston Martin) i Nicholasa Latifija (Williams). ', '2022-04-11 05:42:35', 1, 'https://img.24sata.hr/qXC54FB7yc-X4-D-JcLxTAjcdGM=/1243x700/smart/media/images/2022-14/1649485665-latifi-stroll-e1649485711974-1200x800_KT49gqy.png', 'https://www.24sata.hr/sport/zestok-sudar-u-kvalifikacijama-za-vn-australije-pa-je-li-on-normalan-unistio-mi-je-bolid-828038', 2, 6, 34),
(11, 'Daliću otpadaju napadači, stiže dinamovac: Luka? Nakon svega Hrvatska mu je najvažnija', ' Nakon svega što je napravio, njemu je najvažnija reprezentacija. Bit će na treningu s nama i u konkurenciji za utakmicu u Osijeku i u Parizu, otkrio je Dalić situaciju oko Luke Modrića\r\nKomentari 71\r\nfacebook\r\nmessenger\r\ntwitter\r\nwhatsapp\r\nkopiraj link\r\n\r\nU ponedjeljak se okuplja hrvatska reprezentacija. Tek što je završila klupska sezona, kreće Liga nacija. U 11 dana Hrvatska će odigrati četiri utakmice, pa je Zlatko Dalić na prvotni popis stavio 35 imena.\r\n\r\nNo taj je popis doživio manje promjene jer neki poput Perišića i Muse neće moći, a upitan je i Livaja.\r\nPirej: Trening hrvatske nogometne reprezentacije uo?i sutrašnje kvalifikacijske utakmice s Gr?kom\r\nFoto: Igor Kralj/PIXSELL\r\n\r\n- Čestitam Dan državnosti svim Hrvatima i Luki Modriću na petoj Ligi prvaka, to je sjajno, deset godina zaredom imamo pobjednika, to je fantastično za naš nogomet. Čestitke Hajduku na Kupu i reprezentativcima koji su osvojili trofeje u klubovima - započeo je Dalić pa detaljnije otkrio promjene na popisu:\r\n\r\n- Od prvog popisa otpao je Perišić zbog ozljede, žao mi je, on je bio u najboljoj formi od svih, sad je najvažnije da zaliječi ozljedu i bude spreman za SP. Imamo problem s Musom koji je bolestan i mislim da će i on otpasti i teško da će doći na okupljanje. I Livaja je bolestan, ali ćemo tijekom dana znati njegovo stanje. Pozvali smo Ivanušeca.\r\nEKSKLUZIVNO: MOJ PRVI INTERVJU Novi Mandžo postao \'vatreni\': Ostavio sam Njemačku zbog Hrvatske, tako mi je srce reklo!\r\nfiro: 07.05.2022 Fuvuball, football, 2.Bundesliga, season 2021/2022, FC Schalke 04 - FC St.Pauli Hamburg Igor Matanovic, whole figure, jubilation, cheers, after, his, goal, to, 0:2 Photo: Jvºrgen Fromme/DPA\r\nPREMIJER ČASTI LOJALNE Koliko zarađuje Dalić i koliko će u HNB-u primati Ćorić. Zašto je Filipović otišao na manju lovu?\r\n24sata\r\n\r\nReprezentacija prvu utakmicu igra 3. lipnja u Osijeku protiv Austrije, tri dana kasnije na Poljudu protiv Francuske, a nakon toga slijede dva susreta u gostima, 10. lipnja  Kopenhagenu protiv Danske te 13. lipnja u Parizu protiv Francuza.\r\n\r\n- Čekaju nas četiri utakmice, želimo isprobati sve igrače koje smo pozvali, cilj nam je rezultat i da izvučemo pouke i zaključke. Problem je što su neki sedam dana na godišnjem, a sad se vraćaju u reprezentaciju. Do SP-a je šest mjeseci i puno će se toga promijeniti. Ali ako gledamo aktualnu situaciju, osim Perišića svi su spremni. Neupitna je kvaliteta naših igrača, starijoj okosnici stižu mlađi. Nadam se da će oni koji imaju problema riješiti svoju situaciju. \r\nHrvatska izborila SP na prepunom Poljudu\r\nFoto: Sanjin Strukic/PIXSELL\r\n\r\nKakva je situacija s Modrićem?\r\n\r\n- Modrić dolazi sutra ili prekosutra, on je sam izrazio tu želju. Nakon svega što je napravio, njemu je najvažnija reprezentacija. Bit će na treningu s nama i u konkurenciji za utakmicu u Osijeku i u Parizu. Kako stvari stoje, ne znam hoćemo li zvati još koga. Probat ćemo sustav 4-3-3, kao i 4-2-3-1. Moramo u prve dvije utakmice biti maksimalno dobri i kvalitetni. Ako mladi riješe sve u Norveškoj, htjeli bismo da se i ti mladi priključe nama.\r\n\r\nImate li kakvu matematiku za Ligu nacija?\r\n\r\n- Pa ne bih o bodovima, bitna je svaka utakmica, idemo na sve pobjede, to je u našem mentalitetu. Cilj je da ostanemo u elitnoj skupini, ali zašto ne napraviti nešto više. Mislim da imamo kvalitetu za to. Želim da imamo točan uvid u stanje i formu igrača, to je prvi cilj uz rezultat - poručio je Dalić.\r\nSEDAM DANA PRIJE MAROKA Prijateljska uoči SP-a u Kataru: Evo protiv koga će Vatreni igrati\r\n26.03.2022., Katar, Doha - Prijateljski turnir na kojem nastupaju Katar, Bugarska, Slovenija i Hrvatska priprema je za nadolazece Svjetsko prvenstvo. Prijateljska nogometna utakmica na stadionu Education City, Hrvatska - Slovenija. Photo: Igor Kralj/PIXSELL\r\nULAGANJE U BUDUĆNOST Dalić pokreće biznis u rodnom Livnu: Izbornik osnovao tvrtku\r\n05.05.2022. Travnik - Humanitarna utakmica Hrvatskih protiv BiH nogometnih zvijezda. Photo: Armin Durgut/PIXSELL\r\nČESTITKE IZ SAVEZA Dalić: Luka je jedan od najvećih veznjaka u povijesti. Kustić: On je najveći hrvatski nogometaš\r\n14.11.2021., Split - Stadion Poljud, kvalifikacijska utakmica za odlazak na SP u Qataru izmedju reprezentacije Hrvatske i Rusije. Luka Modric, Zlatko Dalic Photo: Sanjin Strukic/PIXSELL\r\n\r\n- Motivacija? Motiv se zna čim si obukao hrvatski dres. To je najveći motiv i nikoga ne treba posebno motivirati. Četiri utakmice u 11 dana je previše, igrači su iscrpljeni. Razumijem i ono što će biti na treninzima, moramo dobro izbalansirati, da ne bude ozljeda. Vesele me puni stadioni u Osijeku, Splitu, ali morat ćemo puno raditi matematike oko igrača.', '2022-05-29 07:34:24', 1, 'https://img.24sata.hr/p8NtVCga1VfZoIv2wnFjlk0mEFE=/1243x700/smart/media/images/2022-22/pxl-160522-93488565_teEjy5Y.jpg', 'https://www.24sata.hr/sport/pratite-uzivo-okupljaju-se-vatreni-dalic-najavljuje-zestoki-pocetak-lige-nacija-838978', 2, 7, 18),
(12, 'Krš i lom u Monaku: Mick Schumacher prepolovio bolid', 'Danas se VN Monaka vozila u iznimno teškim uvjetima zbog kiše koja je pala neposredno uoči utrke.\r\n\r\nMoglo se i lagano pretpostaviti da će biti razbijenih bolida, a upravo se to dogodilo Micku Schumacheru (Haas).\r\n\r\n\r\nSin legendarnog vozača Formule 1 u 27. se krugu zabio u zaštitnu ogradu nakon što je uslijed proklizavanja izgubio kontrolu nad bolidom. \r\n\r\n\r\nIako nije jurio velikom brzinom, Haasov bolid doslovno se prepolovio! Utrka je prekinuta dok se ne počisti staza.\r\n\r\n\r\n\r\nA što se tiče borbe za vrh, priča je ista kao i tijekom cijele sezone. Ferrarri je vodio bordu s Red Bullom, a Sergio Perez slavio je uz veliki poguranac Ferrarijevog boksa.', '2022-06-02 03:00:00', 1, 'https://img.24sata.hr/YoRKF4NUP0ZC5DPJA2XEtipkv2Q=/1243x700/smart/media/images/2022-21/2022-05-29t150146z-346377946-up1ei5t15bun4-rtrmadp-3-motor-f1-monaco.jpg', 'https://www.24sata.hr/sport/foto-krs-i-lom-u-monaku-mick-schumacher-prepolovio-bolid-838885', 2, 13, 78),
(13, 'lavlje Pereza u Monaku, Ferrari promašio sa strategijom', 'Red Bullov vozač Sergio Perez slavio je na VN Monaka vremenom 1:56:30.265 i tako ostvario treću pobjedu u Formuli 1 nakon Bahreina (2020.) i Azerbejdžana (2021.).\r\n\r\nMeksikanac je završio utrku ispred Ferrarijevog Carlos Sainza (+1.154s), dok su iza njih završili momčadski kolege Max Verstappen (+1.491s), odnosno Charles Leclerc (+2.922s). Peti je završio Mercedesov George Russell (+11.968s)\r\n\r\nFerrarijev Monežanin Leclerc imao je najbrže vrijeme u kvalifikacijama, no pobjeda pred domaćim navijačima, iznimno važna u ukupnom poretku, izmakla mu je zbog nevjerojatne greške momčadi. Naime, Ferrari je pozvao oba vozača u isto vrijeme u boks zbog čega su nakon izlaska iz istog završili iza Red Bullovog dvojca.\r\n\r\nUtrka se zbog odgođenog početka i izlaska safety cara skratila na 64 od predviđenih 77 krugova, a Verstappen je boljim plasmanom povećao prednost u ukupnom poretku. Nizozemac sada ima 125 bodova, dok je Leclerc na 116. ', '2022-06-02 04:00:00', 1, 'https://img.24sata.hr/vqGAD7d-E93oWmrUV5R1Zh2QRwk=/1243x700/smart/media/images/2022-21/2022-05-29t161315z-105409159-up1ei5t1921ta-rtrmadp-3-motor-f1-monaco.jpg', 'https://www.24sata.hr/sport/video-slavlje-pereza-u-monaku-ferrari-promasio-sa-strategijom-838888', 2, 13, 56),
(14, 'Google i Indija pregovaraju o suradnji u projektu otvorene internetske trgovine ONDC', 'Krajem travnja Indija je pokrenula svoju Otvorenu mrežu za digitalnu trgovinu (ONDC) budući da vlada pokušava okončati dominaciju američkih tvrtki Amazon.com i Walmart na brzorastućem tržištu internetske trgovine.\r\n\r\nVlada procjenjuje da je indijsko tržište internetske trgovine vrijedilo više od 55 milijardi dolara bruto vrijednosti robe u 2021. te de će porasti na 350 milijardi dolara do kraja ovog desetljeća.\r\nVODI SE RASPRAVA Google će plaćati sadržaj 300 medijskih kuća Europske unije\r\n\r\nIzvršni direktor ONDC-a T Koshy rekao je da je Alphabetov Google jedna od mnogih tvrtki o kojima se raspravljalo za suradnju u projektu.\r\n\r\nGoogleovi pregovori prate uspjeh njegovog poslovanje s plaćanjima zbog vladine inicijative za financijske transakcije Unified Payments Interface, rekao je jedan od dva izvora Reutersa. Oba izvora su odbila biti imenovana.\r\n\r\nGoogleova internetska trgovina djeluje isključivo kao skup popisa koji su na mreži te sam ne izvršava nikakve narudžbe ili isporuke, za razliku od Amazona.\r\nRAVNOPRAVNOST NA TRŽIŠTU? Europska komisija pokrenula je istragu o Googleu i Facebooku\r\n\r\nGlasnogovornik Googlea odbio je komentirati pregovara li kompanija s vladom. No, rekao je kako su usmjereni poticanju malih i srednjih poduzeća da otkriju digitalno i mogućnosti plaćanja Google Payom.\r\n\r\nJedan od partnera projekta ONCD je i indijska financijsko tehnološka firma Paytm. Projekt ima za cilj okupiti 30 milijuna prodavača i 10 milijuna trgovaca na mreži te pokriti najmanje 100 gradova do kolovoza.', '2022-06-02 06:00:00', 1, 'https://img.24sata.hr/PocM-fwtLJ9Bx9U7dPIgXjv83oU=/1243x700/smart/media/images/2022-21/pxl-reu-260522-93718404.jpg', 'https://www.24sata.hr/tech/google-i-indija-pregovaraju-o-suradnji-u-projektu-otvorene-internetske-trgovine-ondc-838441', 7, 13, 58),
(15, 'Neuobičajeni spektakl na nebu: Moguća snažna kiša meteora u noći na utorak, trajat će satima', 'Snažna moguća kiša meteora moguća je u noći s ponedjeljak (30.5.) na utorak (31.5.), otkrio je Damir Šegon, koordinator Hrvatske meteorske mreže i dopredsjednik Hrvatskog astronomskog saveza.\r\n\r\nPred zoru 31. svibnja, postoji mogućnost da na nebu svjedočimo jednoj od rijetkih prirodnih pojava: pljusku meteora, ako nebo ne bude prekriveno oblacima. \r\n\r\nNaime, radi se o pojavi koja nastaje kada se Zemlja na svom putu oko Sunca sudari sa oblakom sitnih čestica - meteoroida - izbačenih sa kometa, u ovom slučaju sa kometa 73P/Schwassmann-Wachmann čija se jezgra godine 1995. raspala na nekoliko dijelova. \r\n\r\n- Za one koji se slučajno ili s namjerom probude nakon 2 sata u jutro 31.5. ovu pojavu mogu opažati bez ikakvih pomagala. Dovoljno je zakloniti se od okolnih izvora svjetlosti i iz mraka promatrati nebo - priopćili su iz Hrvatskog astronomskog saveza.\r\n\r\nRaspad jezgre 73P je pritom na svojoj orbiti ispred i za sobom ostavio puno meteoroida s kojima se Zemlja u najvećoj mjeri ima sudariti oko 7 sati prema srednjoeuropskom mjerenju vremena. Meteoroidi prilikom izgaranja u atmosferi uzrokuju nebesku pojavu koju nazivamo meteor ili zvijezda padalica.\r\nSJAJNI PRIZORI Pogledajte video meteora koji je obasjao nebo iznad Hrvatske\r\n24sata\r\n\r\nIako će u to vrijeme kod nas biti dan, ukupno trajanje ovog mogućeg nebeskog vatrometa zvijezda padalica procjenjuje se na nekoliko sati i moguće je da ćemo neke od tih meteora vidjeti i iz naših krajeva. \r\n\r\nBrojnost meteora je velika nepoznanica: moguće je da će meteoroidi biti previše sitni da bi se njima uzrokovani meteori vidjeli prostim okom, moguće je da će biti dovoljno velike mase da budu vidljivi. Procjene vodećih svjetskih stručnjaka na polju predviđanja ovakvih događaja slažu se u jednom, a to je da će se "nešto" dogoditi i variraju od običnim promatračima neprimjetne aktivnosti meteora pa sve do meteorskog pljuska od tisuće meteora na sat.\r\n\r\n- Moguće je da ćemo vidjeti jako puno zvijezda padalica, ali moguće je da se neće vidjeti ništa posebnog ni spektakularnog. Bilo kako bilo, ukoliko nekim slučajem u to vrijeme budete budni, bacite oko na nebo... možda ćete prisustvovati nečem nezaboravnom. Tau Heculids bi mogli iznenaditi ali i razočarati - zaključuju iz Hrvatskog astronomskog saveza.', '2022-06-02 06:08:00', 1, 'https://img.24sata.hr/AHdV-PqF6ukRgbe7uI5ls11Jct8=/1243x700/smart/media/images/2022-21/284933809-1426665277775572-7992083499773618367-n.jpeg', 'https://www.24sata.hr/tech/neuobicajeni-spektakl-na-nebu-moguca-snazna-kisa-meteora-u-noci-na-utorak-trajat-ce-satima-838792', 4, 13, 487),
(16, 'DeLorean otkrio prve detalje novog auta, ali za vremeplov ćete se morati sami pobrinuti', 'DeLorean je jedan od najslavnijih filmskih automobila u povijesti, a kompanija je danas otkrila na svojim stranicama prve detalje novog modela Alpha5.\r\n\r\nRadi se o elektičnom automobilu u kojem se vidi duh prošlosti automobila kojeg je proslavio Marty McFly. Kao i kod originala, tu su masivna vrata koja se podižu poput galebovih krila, no za razliku od prethodnika kod kojeg je u filmskoj verziji iza prednja dva sjedala bio samo kondenzator fluksa, ovdje će biti još dva sjedala. \r\n\r\nAlpha 5 je automobil koji će moći pojuriti za 2,99 sekundi do 100 km/h, a 4,35 sekundi trebat će mu za 88 milja na sat, odnosno brzinu koja je u filmovima bila potrebna za put kroz vrijeme.\r\n\r\nNo treba napomenuti i da ovaj DeLorean neće raditi originalna kompanija, već tvrtka iz Teksasa koja je kupila prava na ime i vlasnicima originalnog modela prodaje dijelove.\r\n\r\nAutomobil je dizajnirao studio ItalDesign Giorgetta Giugara koji je zaslužan iza prethodnika. Detalje o automobilu možete vidjeti i na stranici, nakon prijave, no više će otkriti u utorak, dok će auto potpunu premijeru imati u kolovozu.\r\n\r\n\r\nOčekuje se da bi trebao imati bateriju od 100 kWh, s dosegom od 480 km i maksimalnom brzinom od 250 km/h, prenosi Engadget.', '2022-06-02 04:05:00', 1, 'https://img.24sata.hr/5SvRYXXV6eBdmtiFgJUWBi8Xz9U=/1243x700/smart/media/images/2022-22/delorean4.jpg', 'https://www.24sata.hr/tech/delorean-otkrio-prve-detalje-novog-auta-ali-za-vremeplov-cete-se-morati-sami-pobrinuti-839097', 7, 13, 73),
(17, 'Peruanski arheolozi otkrili prolaze ispod 3000 godina starog hrama u Andama', 'Grupa arheologa otkrila je mrežu prolaza ispod više od 3000 godina starog hrama Chavin de Huantar u peruanskim Andama.\r\n\r\nHram, koji se nalazi u sjevernome dijelu središnjih Anda, nekoć je bio vjersko i administrativno središte stanovnika iz regije.\r\n\r\nProlazi su pronađeni ranije u svibnju. Sadrže elemente koji bi, kako se vjeruje, mogli biti izgrađeni ranije u odnosu na galerije s labirintima u hramu, smatra John Rick, arheolog sa Sveučilišta Stanford koji je sudjelovao u iskapanjima.\r\n\r\nNa 3200 metara nadmorske visine, tijekom višegodišnjih iskapanja otkriveno je najmanje 35 podzemnih prolaza. Svi su međusobno povezani, a izgrađeni su između 1200 i 200 godine prije nove ere u podnožju Anda.\r\n\r\n"Riječ je o novootkrivenom prolazu, no ovaj je drukčiji od ostalih. Drukčiji je oblik njegove konstrukcije. Posjeduje karakteristike ranijih perioda koje dosada nikad nismo otkrili u sličnim prolazima", kazao je Rick.\r\n\r\nHram Chavin de Huantar upisan je na popis UNESCO-ove svjetske kulturne baštine 1985. godine.', '2022-06-02 11:00:00', 1, 'https://img.24sata.hr/kFOZnZbIyo8QMb8-rJkEyYeOGrs=/1243x700/smart/media/images/2022-22/2022-05-30t170225z-235986976-rc2ofu9opoto-rtrmadp-3-peru-archaeology.jpg', 'https://www.24sata.hr/tech/peruanski-arheolozi-otkrili-prolaze-ispod-3000-godina-starog-hrama-u-andama-839172', 4, 13, 661),
(18, 'U Rimac uložili još 3,78 milijardi kuna: \'Zaposlit ćemo 700 ljudi u 2022. Planiramo i novi Kampus\' ', 'Čak 500 milijuna eura prikupila je Rimac Grupa u najnovijem krugu investicija, čime je tržišna vrijednost kompanije sada premašila dvije milijarde eura. Velik je to uspjeh za kompaniju koja je u strelovitom rastu i danas ima više od 1500 ljudi, gradi novi kampus, ali i planira njegovog nasljednika te ove godine želi zaposliti više od 700 novih radnika.\r\nTime 0:39 / 0:39\r\nVideo: 24sata/pixsell\r\n\r\nIz kompanije ističu da investicija odražava uspjeh Grupe u razvoju i isporuci sustava za električna vozila visokih performansi, ali i u vlastitom razvoju hiperautomobila. Kako nam je rekao Mate Rimac u razgovoru, ovo ulaganje prvenstveno će ići za razvoj tvrtke Rimac Technology i velike serije za globalne automobilske proizvođače, a njih je, istaknuli su, ranije već bilo 12, među kojima su Mercedes, Hyundai, Aston Martin, Porsche, Koenigsegg.\r\n\r\n- Radi se o serijama od nekoliko desetaka tisuća komada i to će se raditi u Kampusu, a dio se već radi u Jankomiru - kaže Rimac i dodaje da se radi o baterijama, pogonskim sustavima, raznim sustavima elektronike...\r\nZAGREB ĆE BITI STARTNI GRAD Rimčev P3 Mobility koji razvija samovozeće taksije ima već 100 ljudi, planiraju zaposliti 1000\r\n10.03.2022., Zagreb, - Marko Pejkovic CEO tvrtke Project 3 Mobility.\r\nTko su novi ulagači?\r\n24sata\r\nFoto: Rimac Automobili\r\n\r\nKljučni novi ulagači su SoftBank Vision Fund 2 te Goldman Sachs Asset Management, uz sudjelovanje postojećih dioničara Rimac Grupe, uključujući Porsche i InvestIndustrial.\r\n\r\nNakon ovog ulaganja Mate Rimac i dalje ima najveći udio u kompaniji. Rimac Grupa ima 55 posto vlasništva u tvrtki Bugatti Rimac, dok 45 posto drži Porsche, a tvrtka Rimac Tehnology koja se nedavno izdvojila je potpuno neovisna i u 100-postotnom vlasništvu Rimac Grupe. \r\n\r\n- Počašćeni smo potporom značajnih novih investitora kao što su SoftBank Vision Fund 2 i Goldman Sachs Asset Management, koji vjeruju u našu viziju. Zahvalni smo i Porscheu i InvestIndustrialu koji su i dosad igrali važnu ulogu u našem uspjehu, a sada su pojačali svoju potporu novim ulaganjem. Dok reorganiziramo Rimac Grupu, uspostavljamo nove proizvodne procese da bismo zadovoljili globalnu potražnju, zapošljavamo 700 novih zaposlenika samo u 2022., otvaramo nove urede na više lokacija u Europi i širimo proizvodnju u Kampusu i na drugim lokacijama, potpora naših stručnih investitora pomoći će nam da kompaniju dovedemo do sljedeće faze života. Želio bih i osobno zahvaliti svim našim zaposlenicima jer bez njihovog vrijednog rada, odanosti i entuzijazma za viziju Rimac Grupe, ne bismo bili ovdje gdje smo danas - rekao je Mate Rimac u službenom priopćenju.\r\nPRVI SUSRET Rimac objavio sliku s Elonom Muskom: \'Bilo je zabavno\'\r\n24sata\r\n\r\nKako je pojasnio Rimac u razgovoru, SoftBank je jedan od vodećih tehnoloških investitora, a Goldman jedan od najvećih financijskih i bilo im je važno da su vodeći investitori u ovom krugu tvrtke koje nisu u automobilskoj industriji. Kad su krenuli u razgovore s investitorima, interes je bio puno veći nego su htjeli kapitala, a SoftBank se pokazao idealnim jer su htjeli pokazati i da su velika tehnološka kompanija.\r\n\r\n- Kad velike tvrtke investiraju u male, obično se razočaraju, a kod nas su četiri puta u četiri godine investirali - rekao je o Porscheu koji je među investitorima i u ovom krugu ulaganja. \r\n\r\nProlazeći kroz investicije koje su dobili kroz povijest, naglasio je da su dobili 100 puta više kroz investicije nego od europskih ili hrvatskih sredstava.\r\n\r\n- Ne znam iz kojih interesa se pokazuje da živimo od EU fondova - poručio je.\r\n\r\n- Svjedočimo brzom rastu potražnje za elektrifikacijom u industriji koja se suočava sa značajnim izazovima u prilagodbi tehnološkim promjenama. Rimac se brzo etablirao kao vodeći EV tehnološki partner globalnoj automobilskoj industriji u tranziciji prema električnoj budućnosti. Sretni smo što možemo podržati Matu i njegov tim u daljnjem uspjehu i podizanju Rimca na novu razinu - rekao je Jimi Macdonald, investitor za SoftBank Investment Advisers.\r\nŠire se u Buzinu, planiraju još veći Kampus 2\r\n24sata\r\nFoto: Rimac Automobili\r\n\r\nGovoreći o investiciji i planovima, Rimac je istaknuo kako su pri kraju s radovima na prostoru bivšeg Peveca na Jankomiru, gdje sada radi više od 500 ljudi.  No, naglašava da im to nije dovoljno i da je to bila najmanje loša opcija, ali da su si dali vremena i da je odlično ispao projekt u kojem je krenula serijska proizvodnja Nevere.\r\n\r\n- Kampus nam neće biti dovoljan, zakupili smo i nekoliko zgrada u novom kompleksu City Island u Buzinu i šriimo se tamo - rekao je Rimac i dodao da su mala kašnjenja na izgradnji Kampusa, no prihvatljiva.\r\n\r\nSvjesni da im ni to neće biti dovoljno u ekspanziji, Rimac ističe da planiraju razvoj objekta koji je četiri do pet puta veći od sadašnjeg Kampusa i da ga trenutno planiraju u Hrvatskoj, jer su kupili 600.000 kvadrata zemljišta od Plive. Kaže i kako ovdje planiraju zaposliti i daleko veći broj ljudi.\r\nUSPJEŠAN ŠKOLSKI PROJEKT Patrik (16) izradio svojeg Teslu u djedovoj radionici: Svaki vikend putovao sam u Rijeku\r\n24sata\r\nSkoro pola novih ljudi su stranci\r\n24sata\r\nFoto: Rimac Automobili\r\n\r\nNa pitanje o zapošljavanju tih 700 ljudi, Rimac kaže da je zadnje dvije godine fokus na iskustvu i strancima te da imaju puno ljudi iz Ferrarija, Aston Martina i drugih tvrtki. Oko 30 do 40 posto od tih 700 novih ljudi u ovoj godini bit će stranci, ističe.  Dodaje da imaju jako puno Engleza, iako imaju ured u Engleskoj-. \r\n\r\nIstiče kako je njima puno zgodnije zaposliti u Hrvatskoj, ali je problem nedostatka iskustva te da bi svugdje bilo teško napraviti takav tim u tako kratkom vremenu, a da se ne zapošljava internacionalno. \r\nIzlazak na burzu\r\n\r\n- Odluka da ne idemo na burzu bila je jako ispravna i imamo dugoročniji pogled od mnogih firmi - rekao je Rimac o eventualnom IPO-u.\r\n\r\nNa pitanje o burzi kratko kaže da nemaju konkretnog tajminga kad moraju i žele te da očekuje da će to napraviti kad tvrtka bude predvidivija. No, ne može reći hoće li to biti za tri ili pet godina, napominje.\r\nBugatti rasprodan, Nevere kreću kupcima, struja ih ne brine\r\n24sata\r\nFoto: Rimac Automobili\r\n\r\nRimac je komentirao i stanje u Bugatti Rimac kompaniji koja upravlja Bugattijem i Rimac Automobilima te naglasio da su lani imali 150 naručenih Bugattija koji su potpuno rasprodani do 2025. godine.\r\n\r\nS druge strane, sa zakašnjenjem se spremaju za isporuke prvih modela Nevere i u Jankomiru je krenula serijska proizvodnja te bi prvi modeli kupcima trebali krenuti za nekoliko tjedana. \r\n\r\nRat u Ukrajini i globalni problemi u opskrbnim lancima pogodili su i Rimčevu kompaniju. Kaže  kako su oni imali sreće oko Ukrajine, jer sami rade ožičenja za automobile, dok brojne tvrtke ovise o proizvodnji iz Ukrajine, no da ih je pogodila opskrba komponenti.\r\n\r\nIako rade puno manje serije od velikih svjetskih proizvođača, Rimac ističe kako je problem vertikalne integracije. Naime, velik broj dijelova sami proizvode, ali ako nema jednog dijela ili određenog čipa, ne mogu proizvesti taj sustav i zato im je trebalo više vremena nego što su očekivali. \r\n\r\n- No, možemo se izvući ako platimo 10 ili 30 puta više za te neke dijelove, nego da nam proizvodnja stoji - rekao je komentiravši stanje na tržištu.\r\n\r\nRat i globalna situacija utjecali su i na rast energenata, no RImac kaže da je njima vrijeme daleko važniji faktor, a da su energenti manje od 1 posto troškova. \r\n\r\n- Budžet za razvoj nam je preko 200 milijuna eura, kad gledate listu prioriteta gdje možemo uštedjeti, nama su energenti na 100. mjestu, to me ne brine. Puno toga ovisi o tome koliko smo brzi da ne dođe do kašnjenja - rekao je.', '2022-06-02 13:00:00', 1, 'https://img.24sata.hr/99lo0YMYV80cZHXNT677o3iAjBE=/1243x700/smart/media/images/2022-22/dizajn-bez-naslova-58.jpg', 'https://www.24sata.hr/tech/u-rimac-ulozili-jos-378-milijardi-kuna-zaposlit-cemo-700-ljudi-u-2022-planiramo-i-novi-kampus-839213', 4, 13, 476),
(19, 'I ona stoji iza Čilićevog uspjeha na Roland Garrosu: Kristina je supruga, majka i psihologinja ', 'Nadal 1.40, Zverev 4.00, Ruud 5.00, Čilić 10.00. Kladionice Marinu Čiliću (33) daju najmanje šanse od svih polufinalista za osvajanje Roland Garrosa, ali ih znatno povećava Marinova supruga - Kristina (32).\r\n\r\nDiplomirana psihologinja i politologinja uplovila je s najboljim hrvatskim tenisačem u bračnu luku 2018. i od tada mu je najveća podrška, a sigurno uskoči i s pokojim savjetom kako ostati miran i staložen u ključnim trenucima meča.\r\n\r\n- Ne trebam psihologa, imam Kristinu - našalio se jednom prilikom Čilić.\r\n\r\nBila je Kristina uz njega u najtežim trenucima karijere, kada su ga nepravedno optužili za doping. Zajedno si u to prebrodili, a Marin je rekao da joj duguje uspjeh. Danas zajedno sudjeluju u radu zaklade kojoj je cilj svakom djetetu dati priliku da ostvari svoj potencijal i snove.\r\n\r\nU Parizu je sa Kristinom u Čilićevom kutu i njihovo dijete, mali Baldo, ponosni vlasnik Mercedesa kojeg je njegov tata osvojio u Stuttgartu prošle godine, dok je Vito ipak još premlad za ludnicu na terenu "Philippe-Chatrier".\r\n\r\nPodsjetimo, Marin i Kristina izrekli su sudbonosno "da" u crkvi svetog Nikole u Cavtatu nakon deset godina veze. Upoznali su se u Dubrovniku 2018. na Davis Cupu, gdje je Kristina radila kao hostesa, a dvije godine kasnije ponijela je titulu najseksepilnije Dubrovkinje, po izboru čitatelja lokalnog magazina.\r\nCavtat: Marin Čilić sa suprugom Kristinom izlazi iz crkve nakon vjenčanja\r\n\r\n\r\nČilić će za veliki finale Roland Garrosa igrati protiv osmog tenisača svijeta, neugodnog zemljaša Caspera Ruuda.', '2022-06-02 16:03:00', 1, 'https://img.24sata.hr/T6Zd6ewYXiXilOhgpNOxaxLBPhA=/1243x700/smart/media/images/2022-22/untitled-design-8.jpg', 'https://www.24sata.hr/sport/i-ona-stoji-iza-cilicevog-uspjeha-na-roland-garrosu-kristina-je-supruga-majka-i-psihologinja-839655', 2, 13, 437),
(20, 'Tko Čiliću stoji na putu do finala RG-a: Ne prepoznaju ga na ulici u domovini, trenira kod Nadala ', 'Marin je igrao sjajno cijeli tjedan. čini se da igra najbolji tenis u životu i bit će to za mene još jedan težak meč. Igrao sam protiv mladog igrača i na meni je bio pritisak da pobijedim. Protiv Čilića nemam što izgubiti, sav je pritisak na njemu, rekao je Marinov protivnik u polufinalu Casper Ruud (23) nakon što je u četiri seta četvrtfinala mladog kolegu iz Danske Holgera Runea (19) s 3-1 u setovima (6-1, 4-6, 7-6(2), 6-3).\r\nJOŠ GA NIJE DOBIO Marin saznao protivnika: Protiv osmog na svijetu za veliki finale\r\nTennis - French Open - Roland Garros, Paris, France - June 1, 2022 Croatia\'s Marin Cilic reacts during his quarter final match against Russia\'s Andrey Rublev REUTERS/Yves Herman\r\n\r\nATP lista poprilično se promijenila u proteklih nekoliko godina, ostali smo bez dosta dobro poznatih lica te su primat počele uzimati mlade nade. a za one koji u spomenutim godinama pomnije prate tenis ovaj Norvežanin dobro je poznati zemljaš. No, nekima je možda i prošao \'ispod radara\', ali Norvežanin koji na Roland Garrosu nikad nije došao dalje od treće runde, opasan je protivnik.\r\nTime 0:42 / 0:42\r\nVideo: Davor Kovačević/24sata\r\n\r\n- Nisam najpoznatiji sportaš u zemlji, znam doći u dućan i ljudi mi govore da me znaju odnekud, ali ne mogu se točno sjetiti gdje pa me pitaju jesam li neka poznata ličnost. Ali, još me ne \'love po gradu\' što je dobro - rekao je svojevremeno Ruud.\r\n\r\nDa, Marin Čilić igra vrhunski na ovom turniru i ako će igrati kao što je to napravio protiv Rubljeva i Medvjedeva, pobijedit će svakog na svijetu. A njegov idući protivnik rođen je 22. prosinca 1998. godine u norveškom Oslu. Počeo je igrati tenis već sa četiri godine u teniskom klubu u Snaroyi, mjestu na poluotoku nedaleko Osla.\r\nFrench Open\r\nFoto: GONZALO FUENTES\r\n\r\n- Tko je poznatiji od mene? Definitivno nogometaš Erling Haaland, olimpijska medaljašica na 400m s preponama Karsten Warholm, tu je i Jakob Ingebritsen koji je bio zlatni na 1500 metara. \r\n\r\nIma dvije sestre, a sin je bivšeg norveškog tenisača Christiana Ruuda (49) koji je svojevremeno bio 39. tenisač svijeta, a sin mu je s 22 godine već bio bolji nego on kad je sezonu završio na 27. mjestu. Gradio je put prema vrhu i s 18 godina zasjeo na prvo mjesto juniorske ATP ljestvice te postao prvi Norvežanin kojem je to uspjelo. Prvi je seniorski ATP Challenger odigrao 2016. godine i u finalu pobijedio Japanca Tara Daniela (29, ATP 114.) i najavio velike stvari.\r\nLOVA DO KROVA Čiliću 8431 kuna za minutu na Grand Slamu, ispred Nadala, Đokovića i Federera je - žena\r\n24sata\r\n\r\nTri godine kasnije ušao je u TOP 100 i igrao Next Gen Finals, ali je ispao u grupnoj fazi natjecanja. Do prve ATP titule dolazi godinu kasnije kad je slavio u Argentini, a ušao je među najboljih 25 tenisača svijeta.\r\n\r\nTad se već pridružio akademiji Rafaela Nadala u Mallorci, a nakon uvoda u 2020., godinu dana kasnije igrao je u četiri polufinala na velikim turnirima i osvojio pet turnira iz 250 serije, dok je trenutačno u nizu od devet pobjeda na zemlji, a prije dolaska u Pariz osvojio je turnir na zemlji u Ženevi.\r\nFrench Open\r\nFoto: GONZALO FUENTES\r\n\r\nPoslao je u mirovinu Tsongu, izbjegao sve tenisače iz TOP 10 na putu do polufinala, a sad pred njim stoji bivši treći tenisač svijeta. Ovaj dešnjak tražit će svoju priliku s osnovne linije, ali pokazao je Marin da mu duže izmjene trenutačno ne stvaraju probleme. Njihov je susret na rasporedu u petak, a još je pitanje u kojem terminu.\r\n\r\nDva su puta igrali, jednom prije dvije godine u Rimu na zemlji te prošle godine u Torontu na tvrdoj podlozi i oba je puta slavio Ruud. Ovaj je put prema kladionicama favorit Norvežanin na kojeg je koeficijent 1.50, dok je na pobjedu Čilića koeficijent 2.40.', '2022-06-02 14:00:00', 1, 'https://img.24sata.hr/4HJLCTheDwVFdWYJj34uq2AIuSM=/1243x700/smart/media/images/2022-22/2022-05-30t131859z-1939484254-up1ei5u10zk3e-rtrmadp-3-tennis-frenchopen.jpg', 'https://www.24sata.hr/sport/tko-cilicu-stoji-na-putu-do-finala-rg-a-ne-prepoznaju-ga-na-ulici-u-domovini-trenira-kod-nadala-839563', 2, 13, 45),
(21, 'Čilić saznao termin meča protiv Ruuda: Išlo se \'na ruku\' Nadalu', 'Polufinale Roland Garrosa, teren Phillipe-Chatrier, petak 3. lipnja, a pitanje je bilo samo hoće li Marin Čilić i Casper Ruud na teren prije ili poslije kralja zemlje, Španjolca Rafaela Nadala kojeg u polufinalu čeka Nijemac Alexander Zverev. Ali sad su stvari jasne, naš će tenisač igrati u \'udarnom\' terminu.\r\nCASPER RUUD (23) Tko Čiliću stoji na putu do finala RG-a: Ne prepoznaju ga na ulici u domovini, trenira kod Nadala\r\nTennis - French Open - Roland Garros, Paris, France - May 30, 2022 Norway\'s Casper Ruud in action during his fourth round match against Poland\'s Hubert Hurkacz REUTERS/Pascal Rossignol\r\n\r\nTako će prvi na parišku zemlju izaći 13-erostruki osvajač zemljanog Grand Slama protiv trećeg tenisača svijeta od 14 sati i 45 minuta, dok će Marin i Norvežanin na teren nakon njih, a ne prije 17 sati i 30 minuta. Više je puta Rafa govorio kako mu je draže igrati po danu, a želja mu je i ovaj put uslišana.\r\nFrench Open\r\nFoto: DYLAN MARTINEZ\r\n\r\nPodsjetimo, nakon pobjede protiv Rubljova s 3-2 u setovima, Marina u polufinalu Roland Garrosa čeka tenisač koji do ovog turnira nije prošao dalje od trećeg kola u Parizu, a na putu do polufinala nije se susretao s TOP 10 igračima. \r\nSADA PO ČETVRTO FINALE Čudesni Marin oduševio je teniski svijet i poslao poruku kralju zemlje: Rafa, pazi se!\r\n24sata\r\n\r\nPrema kladionicama je favorit norveški tenisač na čiju je pobjedu koeficijent 1.50, dok je koeficijent na pobjedu Čilića 2.40.', '2022-06-02 20:18:00', 1, 'https://img.24sata.hr/CFHUxWRS6k12QakaxLmy66YX8Yc=/1243x700/smart/media/images/2022-22/2022-06-01t203343z-513527588-up1ei6119jua7-rtrmadp-3-tennis-frenchopen.jpg', 'https://www.24sata.hr/sport/cilic-saznao-termin-meca-protiv-ruuda-islo-se-na-ruku-nadalu-839689', 2, 13, 38),
(26, 'Dramatična utrka u Belgiji: Max izletio pa slavio, Leclerc najveći gubitnik, Russell junak ', 'Nizozemac Max Verstappen pobjednik je dramatične utrke za Veliku nagradu Španjolske! Pilot Red Bulla i aktualni prvak slavio je ispred momčadskog kolege Sergija Pereza, koji je neko vrijeme bio vodeći pa nevoljko morao propustiti Verstappena na čelnu poziciju, dok je treći završio Mercedesov George Russell!\r\n\r\nČetvrti je bio Ferrarijev Carlos Sainz Jr., koji je u 60. krugu izgubio poziciju od Lewisa Hamiltona, ali uzvratio pet krugova kasnije dok je uoči ove utrke vodeći vozač prvenstva Charles Leclerc iz Ferrarija morao odustati u 27. krugu zbog problema s bolidom premda je gradio veliku prednost na vrhu.\r\n\r\nSainz Jr. je tako stigao do najboljeg plasmana u karijeri na domaćoj utrci u Španjolskoj dok je Russell svaku utrku ove sezone završio u top 5 s tim da je danas u Barceloni dugo držao Verstappena iza sebe pa stigao i do drugog postolja u ovom prvenstvu. Da je bolid malo konkurentniji vjerojatno bi imao i koju pobjedu, no bez obzira na sve Russell pokazuje zašto mu je Toto Wolff ukazao povjerenje.\r\n\r\nU osvajače bodova ugurao se i Esteban Ocon. Krenuo je s 12. pozicije pa završio na odličnom sedmom mjestu, osmi je bio Lando Norris (startao 11.), a fantastičnu utrku imao je i Fernando Alonso, koji je odvozio do devetog mjesta nakon što je startao sa začelja, sa 17. startne pozicije.\r\n\r\nLeclerc je tako ostao bez bodova u Barceloni što je omogućilo Verstappenu, koji je izletio sa staze u 9. krugu, a kasnije imao i problema s DRS-om, da preuzme vrh poretka vozača i sada ima 110 bodova, šest više od Monegažanina.\r\n\r\nSpomenimo i da je najbrži krug odvozio Sergio Perez te osvojio dodatni bod, a iduća utrka je već sljedeći vikend kada se vozi čuvena Velika nagrada Monaca.\r\nPoredak prvih 10 vozača u Barceloni:\r\n\r\n    Max Verstappen (Red Bull)\r\n    Sergio Perez (Red Bull)\r\n    George Russell (Mercedes)\r\n    Carlos Sainz Jr. (Ferrari)\r\n    Lewis Hamilton (Mercedes)\r\n    Valtteri Bottas (Alfa Romeo)\r\n    Esteban Ocon (Alpine)\r\n    Lando Norris (McLaren)\r\n    Fernando Alonso (Alpine)\r\n    Yuki Tsunoda (AlphaTauri)\r\n', '2022-06-03 22:50:34', 4, 'https://img.24sata.hr/LZrF6_03-KTg5eDFtK4xgpNfuMM=/1243x700/smart/media/images/2022-20/2022-05-22t142406z-1828785634-up1ei5m1403fh-rtrmadp-3-motor-f1-spain.jpg', 'https://www.24sata.hr/sport/dramaticna-utrka-u-spanjolskoj-max-izletio-pa-slavio-leclerc-najveci-gubitnik-russell-junak-837255', 1, 13, 0),
(29, 'Nevrijeme u Zagorju', 'Nikada nismo imali ovakve tuče, ovo je jučer bilo kataklizmično. Šteta je 100 posto. Mi osiguranje imamo, ali ovo osiguranje ne može pokriti. Sve je uništeno, govori nam vinogradar iz Klanjca kojem je tuča uništila vinograd od kojeg osim njega žive još tri obitelji.\r\n\r\nVeliko nevrijeme praćeno snažnom i obilnom tučom zahvatilo je u četvrtak područje grada Klanjca, općine Kumrovec i općine Zagorska Sela, Veliko Trgovišće, Stubičke Toplice te grad Oroslavje.\r\n\r\nKrapinsko-zagorski župan Željko Kolar rekao nam je kako su na teren morale izići i ralice jer je napadalo i preko 25 centimetara tuče te kako su vinogradi uništeni.\r\n\r\n- Velike su štete i u Kumrovcu i to ne samo na nasadima već i na zgradama i kućama. Hrvatska mislim da ne pamti da u šestom mjesecu morate angažirati ralice da čiste put i da bi uspostavili ponovno promet. Moram pohvaliti i vatrogasne postrojbe i sve službe koje su se uključile u sanaciju - rekao je načelnik općine Kumrovec Robert Šplajt.', '2022-06-03 23:37:59', 1, 'https://img.24sata.hr/rDTGLbvliIKH6WB--16lAYopWCE=/1243x700/smart/media/images/2022-22/untitled-design-2022-06-03t161538-536.jpg', 'https://www.24sata.hr/news/nevrijeme-u-zagorju-to-je-bila-kataklizma-steta-je-100-ovo-ne-moze-ni-osiguranje-pokriti-839943', 5, 13, 3),
(30, 'Idemo, care: Čilić protiv Ruda za finale Roland Garosa, sve je spremno za početak spektakla!', 'Ostala su još najbolja četiri. Među njima - tko bi se tomu nadao prije desetak dana - i Marin Čilić. Najbolji hrvatski tenisač opet igra tenis koji može uništiti svakog igrača na svijetu, a kad je takav, vjerujemo da današnje polufinale neće biti njegov kraj u Parizu.', '2022-06-04 00:12:01', 3, 'https://img.24sata.hr/_PMzy-4wCySVeStg1nDImrk9hJQ=/1243x700/smart/media/images/2022-22/2022-06-01t181059z-1387542500-up1ei611eiacw-rtrmadp-3-tennis-frenchopen.jpg', 'https://www.24sata.hr/sport/idemo-care-cilic-protiv-ruuda-za-veliko-finale-roland-garrosa-839907', 2, 13, 4);
INSERT INTO `Vijest` (`id`, `naslov`, `tekst`, `datumvrijemeKreiranja`, `revizija`, `slika`, `urlIzvora`, `idKategorijeVijesti`, `idKreator`, `brojPregleda`) VALUES
(31, 'Nisu mogli s kolicima u kafić pa su smislili aplikaciju za pomoć osobama s invaliditetom', 'Stipo je slavio rođendan. Imali smo problem naći objekt u kojemu bismo popili piće, proslavili rođendan, ali bez stepenica. Onda nam je palo na pamet napraviti mapu koja će pokazivati te informacije da znamo gdje možemo ići. Tako smo počeli raditi na aplikaciji, a onda smo pokrenuli i udrugu, kaže nam Mijo Matijević, dopredsjednik Udruge Liberato i student završne godine na Sveučilišnom odjelu za stručne studije u Splitu.\r\nSplit: Stipo Margić i Mijo Matijević osmislili su razne projekte za osobe s invaliditetom\r\nFoto: Miroslav Lelas/PIXSELL\r\nNepristupačnost i nedostatak informacija\r\n\r\nOn i njegov prijatelj, predsjednik udruge Stipo Margić, inače student četvrte godine Primijenjenog računarstva, pokrenuli su izuzetan projekt za osobe s invaliditetom, koje prečesto ograničavaju preuski prostori, nepristupačnost, ali i nedostatak informacija. I dok većina ni ne razmišlja koliko je dijelu naših sugrađana težak pristup svakodnevnim uslugama, Udruga Liberato odlučila je tu situaciju početi mijenjati. Pod motom Svijet bez granica osmislili su interaktivnu mapu za osobe s invaliditetom te pokreću mnoge druge projekte.\r\n\r\nStipi i Miji do danas se pridružilo i dvadesetak kolega volontera, a s obzirom na mnogo objekata, kažu, prikupljanje i ažuriranje podataka i dalje traje. Mapi je moguće pristupiti preko web stranice udruge.\r\nNa listi objekti u Omišu, Trogiru, Zadru\r\n\r\n- Korisnik pristupi kao gost i odabere kategoriju. Ako želi hrana i piće, aplikacija mu pokaže restorane u Splitu te informacije imaju li stepenice, rampu, parking... I tu vidi sliku ulaza, adresu, telefon, sve informacije koje su korisniku usluge potrebne - kaže Mijo te dodaje kako je prema informacijama u trenutačnoj bazi samo jedan ugostiteljski objekt potpuno prilagođen osobama s invaliditetom.\r\n\r\nPosebno je zanimljivo što se korisnik može sam registrirati i svoj objekt sam slikati, staviti informacije koje članovi Liberata moraju prvo provjeriti i onda ih odobriti da budu dostupne na mapi.\r\n\r\n- Trenutačno se na mapi mogu pretraživati objekti u Omišu, Trogiru i Zadru. Uskoro se nadamo u Makarskoj, Solinu i Zagrebu - kaže Stipo.', '2022-06-03 19:13:38', 1, 'https://img.24sata.hr/d49pfyDrSuXs3FqhOMTCpQPrQzg=/1243x700/smart/media/images/2022-22/pxl-110522-93418478.jpg', 'https://www.24sata.hr/tech/nisu-mogli-s-kolicima-u-kafic-pa-su-smislili-aplikaciju-za-pomoc-osobama-s-invaliditetom-839063', 7, 13, 0),
(32, ' Nisu mogli s kolicima u kafić pa su smislili aplikaciju za pomoć osobama s invaliditetom ', 'Stipo je slavio rođendan. Imali smo problem naći objekt u kojemu bismo popili piće, proslavili rođendan, ali bez stepenica. Onda nam je palo na pamet napraviti mapu koja će pokazivati te informacije da znamo gdje možemo ići. Tako smo počeli raditi na aplikaciji, a onda smo pokrenuli i udrugu, kaže nam Mijo Matijević, dopredsjednik Udruge Liberato i student završne godine na Sveučilišnom odjelu za stručne studije u Splitu.', '2022-06-03 19:17:01', 1, 'https://img.24sata.hr/d49pfyDrSuXs3FqhOMTCpQPrQzg=/1243x700/smart/media/images/2022-22/pxl-110522-93418478.jpg', 'https://www.24sata.hr/tech/nisu-mogli-s-kolicima-u-kafic-pa-su-smislili-aplikaciju-za-pomoc-osobama-s-invaliditetom-839063', 7, 13, 0),
(33, 'Reakcije susjeda: Hrvati se pošteno obrukali; Srbin šokirao cijelu Hrvatsku i utišao stadion', 'Veliki poraz izabranika Zlatka Dalića u Gradskom vrtu protiv Austrije odjeknuo je i u našem susjedstvu. Hrvatska je na otvaranju Lige nacija izgubila 3-0, a golove su zabili Arnautović, Gregoritscha i Sabitzera. ', '2022-06-04 10:47:37', 1, 'https://img.24sata.hr/r-3KIhp9-JkmrRG0QggPZ9vqf-k=/1243x700/smart/media/images/2022-22/untitled-design-48.png', 'https://www.24sata.hr/sport/srpski-mediji-hrvati-se-posteno-obrukali-srbin-sokirao-cijelu-hrvatsku-utisao-je-cijeli-stadion-840019', 2, 4, 1),
(34, 'Iva Majoli 25 godina nakon osvajanja Pariza: Marin nije igrao ovako od US Opena 2014.', 'Marin je zadnjih tjedana u top formi, baš dobro izgleda na terenu, djeluje moćno, odlično komunicira s publikom i baš ga je gušt gledati. A gledala sam skoro svaki njegov meč, ovako dobro nije igrao od US Opena, koji je osvojio 2014.\r\n\r\nGlas joj je prepoznatljiv i veseo, u formi se održava jer je redovito na teniskim terenima, a i lipanj u Parizu njezin je standard. No, Iva Majoli (44) ove je godine ipak na Roland Garrosu posebna gošća. Jubilarka. U utorak 7. lipnja navršit će se 25 godina otkad je djevojka iz Hrvatske kao deveta nositeljica otišla do kraja i postala jedina Hrvatica s osvojenim Grand Slamom.', '2022-06-04 10:50:03', 1, 'https://img.24sata.hr/UaMu3PjHvtKirk7RKGXhQ1hx2pU=/1243x700/smart/media/images/2022-22/untitled-design-16_ODNPxGA.jpg', 'https://www.24sata.hr/sport/iva-majoli-25-godina-nakon-osvajanja-pariza-marin-nije-igrao-ovako-od-us-opena-2014-839443', 2, 4, 3),
(35, 'Hit HNL-a otkrio nam je misterij svog imena: I djed je bio špica...', 'Djed Drago također je bio nogometaš. Čak jako dobar na toj lokalnoj razini. Bio je špica, kao i ja. Povratak u Osijek? Trener Nenad Bjelica pratio je moje igre u Istri, čuli smo se, kaže Dion Drena Beljo ', '2022-06-05 11:53:11', 1, 'https://img.24sata.hr/9AVZzGUcauFZJuxmneCd2DOOSY0=/1243x700/smart/media/images/2022-22/pxl-301121-90904178_usuAT8n.jpg', 'https://www.24sata.hr/sport/hit-hnl-a-otkrio-nam-je-misterij-svog-imena-i-djed-je-bio-spica-838840', 2, 4, 0),
(36, 'Vozač (42), koji je u Zagrebu usmrtio pješakinju na zebri i onda pobjegao, bio je pijan', 'Zbog izazivanja prometne nesreće u cestovnom prometu 42-godišnjak je u zakonskom roku predan pritvorskom nadzorniku, dok je kaznena prijava podnijeta nadležnom državnom odvjetništvu, priopćila je zagrebačka PU', '2022-06-05 15:39:40', 1, 'https://img.24sata.hr/xZKNSRdDbCQHqNO3Hfhz6kRjZE8=/1243x700/smart/media/images/2022-22/pxl-030622-93867035_JiFic3L.jpg', 'https://www.24sata.hr/news/vozac-42-koji-je-u-zagrebu-usmrtio-pjesakinju-na-zebri-i-onda-pobjegao-bio-je-pijan-840209', 5, 13, 0),
(37, 'Nema krova ni za helikoptere niti za kune. Banožić je jedino osigurao sebi krov nad glavom', 'NOVI EXPRESS MORH nije uspio omogućiti smještaj helikopterima, a čini se da neće ni kunama. Zapravo je jedini ostvareni državni krov nad glavom onaj iznad Marija Banožića', '2022-06-05 18:47:27', 2, 'https://img.24sata.hr/EF0enT6HxZYzrnkua55Qbos8MRA=/1680x560/smart/media/images/2022-22/dizajn-bez-naslova.jpg', 'https://www.24sata.hr/news/nema-krova-ni-za-helikoptere-niti-za-kune-banozic-je-jedino-osigurao-sebi-krov-nad-glavom-839589', 1, 13, 2),
(38, 'Stiže jako nevrijeme, narančasti alarm upaljen za osječku regiju: Može prouzročiti veliku štetu', 'Moguća su oštećenja na imovini te na drveću te lokalne bujične poplave, olujni udari vjetra i tuča, upozoravaju iz DHMZ', '2022-06-06 12:00:30', 1, 'https://img.24sata.hr/LJqOdT8GUGfW3Ia5BvuFX8j20yc=/1243x700/smart/media/images/2022-23/1.png', 'https://www.24sata.hr/news/stize-jako-nevrijeme-narancasti-alarm-upaljen-za-osjecku-regiju-moze-prouzrociti-veliku-stetu-840291', 3, 24, 1),
(39, 'Stiže jako nevrijeme, narančasti alarm upaljen za osječku regiju: Može prouzročiti veliku štetu', 'Moguća su oštećenja na imovini te na drveću te lokalne bujične poplave, olujni udari vjetra i tuča, upozoravaju iz DHMZ', '2022-06-06 12:02:45', 1, 'https://img.24sata.hr/LJqOdT8GUGfW3Ia5BvuFX8j20yc=/1243x700/smart/media/images/2022-23/1.png', 'https://www.24sata.hr/news/stize-jako-nevrijeme-narancasti-alarm-upaljen-za-osjecku-regiju-moze-prouzrociti-veliku-stetu-840291', 3, 24, 0),
(40, 'Uhitili bivšeg igrača Hajduka! Pijan prijetio treneru Dinamove momčadi, psovao je i roditelje', 'Tijekom utakmice Hajduka i Dia na turniru za mlade u Trogiru policija je morala intervenirati zbog sramotnog ponašanja bivšeg igrača Hajduka, prenosi Slobodna Dalmacija.\r\n\r\nDalmatinski portal objavio je da se radi o Jurici Vučku koji je bio pomoćni trener Igoru Tudoru', '2022-06-05 15:25:36', 2, 'https://img.24sata.hr/kO8GMu42TpQxkdijH16Y_9JJNVs=/1243x700/smart/media/images/2022-23/whatsapp-image-2022-06-06-at-10-05-31_qW9anNZ.jpeg', 'https://www.24sat.hr/sport/sramota-u-trogiru-bivsi-igrac-hajduka-pijan-vrijedao-djecu-i-trenera-iz-zagreba-priveli-ga-840322', 1, 13, 1),
(41, 'Uhitili bivšeg igrača Hajduka! Pijan prijetio treneru Dinamove momčadi, psovao je i roditelje', 'Tijekom utakmice Hajduka i Dinama na turniru za mlade u Trogiru policija je morala intervenirati zbog sramotnog ponašanja bivšeg igrača Hajduka, prenosi Slobodna Dalmacija.\r\n\r\nDalmatinski portal objavio je da se radi o Jurici Vučku koji je bio pomoćni trener Igoru Tudoru. ', '2022-06-06 11:42:21', 1, 'https://img.24sata.hr/kO8GMu42TpQxkdijH16Y_9JJNVs=/1243x700/smart/media/images/2022-23/whatsapp-image-2022-06-06-at-10-05-31_qW9anNZ.jpeg', 'https://www.24sata.hr/sport/sramota-u-trogiru-bivsi-igrac-hajduka-pijan-vrijedao-djecu-i-trenera-iz-zagreba-priveli-ga-840322', 2, 13, 2),
(42, '1', '1', '2022-06-06 11:42:31', 1, '1', '1', 1, 13, 0),
(43, '1', '1', '2022-06-06 14:47:47', 1, 'https://img.24sata.hr/kO8GMu42TpQxkdijH16Y_9JJNVs=/1243x700/smart/media/images/2022-23/whatsapp-image-2022-06-06-at-10-05-31_qW9anNZ.jpeg', '', 2, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `VrstaGreške`
--

CREATE TABLE `VrstaGreške` (
  `id` int(11) NOT NULL,
  `nazivGreške` varchar(100) COLLATE utf8_bin NOT NULL,
  `opis` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `VrstaGreške`
--

INSERT INTO `VrstaGreške` (`id`, `nazivGreške`, `opis`) VALUES
(1, 'Činjenična greška', NULL),
(2, 'Gramatička greška', ''),
(3, 'Nedostatak mateijala', 'Nedostaju materijali poput audio ili video sadržaja koji daljne opisuju stanje.'),
(4, 'Nedostaje izvor', 'Izvor za određeni dio vijest nije prisutan.');

-- --------------------------------------------------------

--
-- Table structure for table `VrstaRadnje`
--

CREATE TABLE `VrstaRadnje` (
  `id` int(11) NOT NULL,
  `vrstaRadnje` varchar(45) COLLATE utf8_bin NOT NULL,
  `opis` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `VrstaRadnje`
--

INSERT INTO `VrstaRadnje` (`id`, `vrstaRadnje`, `opis`) VALUES
(1, 'Objava vijesti', 'Registrirani korisnici popunjuju formu za vijest te ako je forma ispravno ispunjena vijest se postavlja u sustav te se stvata nova recenzija koja se treba dodjeliti moderatoru.'),
(2, 'Recenzija vijesti', 'Moderator pregleda vijest koja mu je dodjeljenja te nakon toga određuje jeli vijest dovoljno dobra za webstranicu, dali treba jos doraditi ili ona bude odbijena'),
(3, 'Vijest doradena', 'Registrirani korisnik izmjenjuje vijest koju je postavio te je nakon recenzije bila poslana na doradu.'),
(4, 'Moderator blokira korisnika', 'Moderato je nakon pregleda vijesti i statistika blokirao korisnika '),
(5, 'Administrator dodjeljuje kategoriju', 'Administrator je moderator dodjelio kategoriju vijest za koje će dobivati vijest za recenziju i imati mogućnost blokiranja i deblokiranja registriranih korisnika.'),
(6, 'Administrator deblokira korisnika', 'Administrator je korisnika koji se 3 puta za redom neuspješno ulogirao deblokirao.');

-- --------------------------------------------------------

--
-- Table structure for table `ZakljucaniKorisnik`
--

CREATE TABLE `ZakljucaniKorisnik` (
  `idKorisnika` int(11) NOT NULL,
  `datumvrijemeZakljucavanja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ZakljucaniKorisnik`
--

INSERT INTO `ZakljucaniKorisnik` (`idKorisnika`, `datumvrijemeZakljucavanja`) VALUES
(1, '2022-04-01 07:44:26'),
(2, '2022-04-13 17:33:19'),
(5, '2022-04-08 10:42:34'),
(6, '2022-04-04 06:30:45'),
(7, '2022-04-08 19:00:00'),
(8, '2022-04-06 07:32:42'),
(9, '2022-04-13 00:00:00'),
(10, '2022-04-13 07:45:35'),
(23, '2022-06-05 15:36:07'),
(28, '2022-06-05 15:13:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Autor`
--
ALTER TABLE `Autor`
  ADD PRIMARY KEY (`Korisnik_id`,`Vijest_id`),
  ADD KEY `fk_Autor_Vijest1_idx` (`Vijest_id`);

--
-- Indexes for table `AutorKategorije`
--
ALTER TABLE `AutorKategorije`
  ADD PRIMARY KEY (`IdAdministratora`,`idKategorijeVijesti`),
  ADD KEY `fk_AutorKategorije_KategorijeVijesti1_idx` (`idKategorijeVijesti`);

--
-- Indexes for table `BlokiraniKorisnik`
--
ALTER TABLE `BlokiraniKorisnik`
  ADD PRIMARY KEY (`idBlokiranogKorisnika`,`idModeratora`,`idKategorijeVijesti`),
  ADD KEY `fk_BlokiraniKorisnik_Korisnik2_idx` (`idModeratora`),
  ADD KEY `fk_BlokiraniKorisnik_KategorijeVijesti1_idx` (`idKategorijeVijesti`);

--
-- Indexes for table `Cookie`
--
ALTER TABLE `Cookie`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `Cookie_has_Korisnik`
--
ALTER TABLE `Cookie_has_Korisnik`
  ADD PRIMARY KEY (`Cookie_id`,`Korisnik_id`),
  ADD KEY `fk_Cookie_has_Korisnik_Korisnik1_idx` (`Korisnik_id`),
  ADD KEY `fk_Cookie_has_Korisnik_Cookie1_idx` (`Cookie_id`);

--
-- Indexes for table `Dnevnik`
--
ALTER TABLE `Dnevnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Dnevnik_VrstaRadnje1_idx` (`idVrstaRadnje`),
  ADD KEY `fk_Dnevnik_Korisnik1` (`idKornisnika`);

--
-- Indexes for table `DZ4_Kolacici`
--
ALTER TABLE `DZ4_Kolacici`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DZ4_Kolacici_has_DZ4_Korisnici`
--
ALTER TABLE `DZ4_Kolacici_has_DZ4_Korisnici`
  ADD PRIMARY KEY (`DZ4_Kolacici_id`,`DZ4_Korisnici_id`),
  ADD KEY `fk_DZ4_Kolacici_has_DZ4_Korisnici_DZ4_Korisnici1_idx` (`DZ4_Korisnici_id`),
  ADD KEY `fk_DZ4_Kolacici_has_DZ4_Korisnici_DZ4_Kolacici1_idx` (`DZ4_Kolacici_id`);

--
-- Indexes for table `DZ4_Korisnici`
--
ALTER TABLE `DZ4_Korisnici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `korisnickoIme_UNIQUE` (`korisnickoIme`),
  ADD KEY `fk_DZ4_Korisnici_DZ4_VrstaKorisnika_idx` (`DZ4_VrstaKorisnika_id`);

--
-- Indexes for table `DZ4_Obrazac`
--
ALTER TABLE `DZ4_Obrazac`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `DZ4_VrstaKorisnika`
--
ALTER TABLE `DZ4_VrstaKorisnika`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `KategorijaKorisnika`
--
ALTER TABLE `KategorijaKorisnika`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `Naziv_UNIQUE` (`Naziv`);

--
-- Indexes for table `KategorijeVijesti`
--
ALTER TABLE `KategorijeVijesti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `korisnickoIme_UNIQUE` (`korisnickoIme`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `fk_Korisnik_KategorijaKorisnika1_idx` (`KategorijaKorisnika_id`);

--
-- Indexes for table `ModeratorKategorije`
--
ALTER TABLE `ModeratorKategorije`
  ADD PRIMARY KEY (`idModeratora`,`idKategorijeVijesti`),
  ADD KEY `fk_ModeratorKategorije_KategorijeVijesti1_idx` (`idKategorijeVijesti`);

--
-- Indexes for table `Pogreske`
--
ALTER TABLE `Pogreske`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_CinjenicnePogreske_VrstaGreške1_idx` (`VrstaGreške_id`),
  ADD KEY `fk_CinjenicnePogreske_Recenzija1` (`idRecenzije`);

--
-- Indexes for table `ProsleVerzijeVjesti`
--
ALTER TABLE `ProsleVerzijeVjesti`
  ADD PRIMARY KEY (`idVjesti`);

--
-- Indexes for table `Recenzija`
--
ALTER TABLE `Recenzija`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Recenzija_Korisnik1_idx` (`idModeratora`),
  ADD KEY `fk_Recenzija_VrstaRecenzije1_idx` (`idVrsteRecenzije`),
  ADD KEY `fk_Recenzija_Korisnik2_idx` (`idAdministratora`),
  ADD KEY `fk_Recenzija_Vijest1` (`idVjesti`);

--
-- Indexes for table `Sesija`
--
ALTER TABLE `Sesija`
  ADD PRIMARY KEY (`idKorisnika`);

--
-- Indexes for table `StanjeRecenzije`
--
ALTER TABLE `StanjeRecenzije`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `VideoAudio`
--
ALTER TABLE `VideoAudio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Video_Vijest1` (`idVjesti`);

--
-- Indexes for table `Vijest`
--
ALTER TABLE `Vijest`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Vijest_KategorijeVijesti1_idx` (`idKategorijeVijesti`),
  ADD KEY `fk_Vijest_Korisnik1_idx` (`idKreator`);

--
-- Indexes for table `VrstaGreške`
--
ALTER TABLE `VrstaGreške`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `VrstaRadnje`
--
ALTER TABLE `VrstaRadnje`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `ZakljucaniKorisnik`
--
ALTER TABLE `ZakljucaniKorisnik`
  ADD PRIMARY KEY (`idKorisnika`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cookie`
--
ALTER TABLE `Cookie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Dnevnik`
--
ALTER TABLE `Dnevnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `DZ4_Kolacici`
--
ALTER TABLE `DZ4_Kolacici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `DZ4_Korisnici`
--
ALTER TABLE `DZ4_Korisnici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `DZ4_Obrazac`
--
ALTER TABLE `DZ4_Obrazac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `DZ4_VrstaKorisnika`
--
ALTER TABLE `DZ4_VrstaKorisnika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `KategorijaKorisnika`
--
ALTER TABLE `KategorijaKorisnika`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `KategorijeVijesti`
--
ALTER TABLE `KategorijeVijesti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Korisnik`
--
ALTER TABLE `Korisnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `Pogreske`
--
ALTER TABLE `Pogreske`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `Recenzija`
--
ALTER TABLE `Recenzija`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `StanjeRecenzije`
--
ALTER TABLE `StanjeRecenzije`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `VideoAudio`
--
ALTER TABLE `VideoAudio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `Vijest`
--
ALTER TABLE `Vijest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `VrstaGreške`
--
ALTER TABLE `VrstaGreške`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `VrstaRadnje`
--
ALTER TABLE `VrstaRadnje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Autor`
--
ALTER TABLE `Autor`
  ADD CONSTRAINT `fk_Autor_Korisnik1` FOREIGN KEY (`Korisnik_id`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Autor_Vijest1` FOREIGN KEY (`Vijest_id`) REFERENCES `Vijest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `AutorKategorije`
--
ALTER TABLE `AutorKategorije`
  ADD CONSTRAINT `fk_AutorKategorije_KategorijeVijesti1` FOREIGN KEY (`idKategorijeVijesti`) REFERENCES `KategorijeVijesti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_AutorKategorije_Korisnik1` FOREIGN KEY (`IdAdministratora`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `BlokiraniKorisnik`
--
ALTER TABLE `BlokiraniKorisnik`
  ADD CONSTRAINT `fk_BlokiraniKorisnik_KategorijeVijesti1` FOREIGN KEY (`idKategorijeVijesti`) REFERENCES `KategorijeVijesti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_BlokiraniKorisnik_Korisnik1` FOREIGN KEY (`idBlokiranogKorisnika`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_BlokiraniKorisnik_Korisnik2` FOREIGN KEY (`idModeratora`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Cookie_has_Korisnik`
--
ALTER TABLE `Cookie_has_Korisnik`
  ADD CONSTRAINT `fk_Cookie_has_Korisnik_Cookie1` FOREIGN KEY (`Cookie_id`) REFERENCES `Cookie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cookie_has_Korisnik_Korisnik1` FOREIGN KEY (`Korisnik_id`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Dnevnik`
--
ALTER TABLE `Dnevnik`
  ADD CONSTRAINT `fk_Dnevnik_Korisnik1` FOREIGN KEY (`idKornisnika`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Dnevnik_VrstaRadnje1` FOREIGN KEY (`idVrstaRadnje`) REFERENCES `VrstaRadnje` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DZ4_Kolacici_has_DZ4_Korisnici`
--
ALTER TABLE `DZ4_Kolacici_has_DZ4_Korisnici`
  ADD CONSTRAINT `fk_DZ4_Kolacici_has_DZ4_Korisnici_DZ4_Kolacici1` FOREIGN KEY (`DZ4_Kolacici_id`) REFERENCES `DZ4_Kolacici` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DZ4_Kolacici_has_DZ4_Korisnici_DZ4_Korisnici1` FOREIGN KEY (`DZ4_Korisnici_id`) REFERENCES `DZ4_Korisnici` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DZ4_Korisnici`
--
ALTER TABLE `DZ4_Korisnici`
  ADD CONSTRAINT `fk_DZ4_Korisnici_DZ4_VrstaKorisnika` FOREIGN KEY (`DZ4_VrstaKorisnika_id`) REFERENCES `DZ4_VrstaKorisnika` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Korisnik`
--
ALTER TABLE `Korisnik`
  ADD CONSTRAINT `fk_Korisnik_KategorijaKorisnika1` FOREIGN KEY (`KategorijaKorisnika_id`) REFERENCES `KategorijaKorisnika` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ModeratorKategorije`
--
ALTER TABLE `ModeratorKategorije`
  ADD CONSTRAINT `fk_ModeratorKategorije_KategorijeVijesti1` FOREIGN KEY (`idKategorijeVijesti`) REFERENCES `KategorijeVijesti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ModeratorKategorije_Korisnik1` FOREIGN KEY (`idModeratora`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Pogreske`
--
ALTER TABLE `Pogreske`
  ADD CONSTRAINT `fk_CinjenicnePogreske_Recenzija1` FOREIGN KEY (`idRecenzije`) REFERENCES `Recenzija` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_CinjenicnePogreske_VrstaGreške1` FOREIGN KEY (`VrstaGreške_id`) REFERENCES `VrstaGreške` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ProsleVerzijeVjesti`
--
ALTER TABLE `ProsleVerzijeVjesti`
  ADD CONSTRAINT `fk_ProsleVerzijeJesti_Vijest1` FOREIGN KEY (`idVjesti`) REFERENCES `Vijest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Recenzija`
--
ALTER TABLE `Recenzija`
  ADD CONSTRAINT `fk_Recenzija_Korisnik1` FOREIGN KEY (`idModeratora`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Recenzija_Korisnik2` FOREIGN KEY (`idAdministratora`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Recenzija_Vijest1` FOREIGN KEY (`idVjesti`) REFERENCES `Vijest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Recenzija_VrstaRecenzije1` FOREIGN KEY (`idVrsteRecenzije`) REFERENCES `StanjeRecenzije` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Sesija`
--
ALTER TABLE `Sesija`
  ADD CONSTRAINT `fk_korisnik` FOREIGN KEY (`idKorisnika`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `VideoAudio`
--
ALTER TABLE `VideoAudio`
  ADD CONSTRAINT `fk_Video_Vijest1` FOREIGN KEY (`idVjesti`) REFERENCES `Vijest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Vijest`
--
ALTER TABLE `Vijest`
  ADD CONSTRAINT `fk_Vijest_KategorijeVijesti1` FOREIGN KEY (`idKategorijeVijesti`) REFERENCES `KategorijeVijesti` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Vijest_Korisnik1` FOREIGN KEY (`idKreator`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ZakljucaniKorisnik`
--
ALTER TABLE `ZakljucaniKorisnik`
  ADD CONSTRAINT `fk_ZakljucaniKorisnici_Korisnik1` FOREIGN KEY (`idKorisnika`) REFERENCES `Korisnik` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
