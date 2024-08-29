-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2024 at 06:32 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gatemonitoring`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$fCOiMky4n5hCJx3cpsG20Od4wHtlkCLKmO6VLobJNRIg9ooHTkgjK', 'Harry', 'Den', 'male6.jpg', '2018-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `blockrfidstaff`
--

CREATE TABLE `blockrfidstaff` (
  `id` int(11) NOT NULL,
  `blocked_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `staffregis_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blockrfidstud`
--

CREATE TABLE `blockrfidstud` (
  `id` int(11) NOT NULL,
  `blocked_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `studentregis_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dailylogs`
--

CREATE TABLE `dailylogs` (
  `log_id` int(10) NOT NULL,
  `registeredstudentid` int(10) DEFAULT NULL,
  `registeredstaffid` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `timeinout` enum('in','out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dailylogs`
--

INSERT INTO `dailylogs` (`log_id`, `registeredstudentid`, `registeredstaffid`, `timestamp`, `timeinout`) VALUES
(94, 9, NULL, '2024-06-20 11:05:45', 'out'),
(95, 9, NULL, '2024-06-20 11:07:24', 'out'),
(96, 9, NULL, '2024-06-20 11:09:34', 'out'),
(97, NULL, 5, '2024-06-20 11:49:35', 'out'),
(98, NULL, 5, '2024-06-21 02:11:41', 'in'),
(99, 8, NULL, '2024-06-21 02:12:19', 'in'),
(100, 8, NULL, '2024-06-21 02:12:20', 'in'),
(101, NULL, 5, '2024-06-21 04:21:06', 'in'),
(102, 9, NULL, '2024-06-21 04:21:09', 'in'),
(103, 9, NULL, '2024-06-21 04:23:14', 'in'),
(104, NULL, 5, '2024-06-21 04:23:17', 'in'),
(105, 9, NULL, '2024-06-21 04:23:20', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `registeredrfid_staff`
--

CREATE TABLE `registeredrfid_staff` (
  `registeredstaffid` int(10) NOT NULL,
  `rfid_card_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `idpicture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registeredrfid_staff`
--

INSERT INTO `registeredrfid_staff` (`registeredstaffid`, `rfid_card_id`, `staff_id`, `idpicture`) VALUES
(5, 45, 8, '../../idpic/WIN_20240620_10_12_56_Pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `registeredrfid_student`
--

CREATE TABLE `registeredrfid_student` (
  `registeredstudentid` int(10) NOT NULL,
  `rfid_card_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `idpicture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registeredrfid_student`
--

INSERT INTO `registeredrfid_student` (`registeredstudentid`, `rfid_card_id`, `student_id`, `idpicture`) VALUES
(8, 51, 551, '../../idpic/thanossmile.jpg'),
(9, 49, 553, '../../idpic/WIN_20240409_17_38_58_Pro.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `repsid` int(50) NOT NULL,
  `logid` int(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`repsid`, `logid`, `date`) VALUES
(1, 97, '2024-06-20'),
(2, 94, '2024-06-20'),
(3, 95, '2024-06-20'),
(4, 96, '2024-06-20');

-- --------------------------------------------------------

--
-- Table structure for table `rfid_cards`
--

CREATE TABLE `rfid_cards` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rfid_cards`
--

INSERT INTO `rfid_cards` (`id`, `uid`, `timestamp`) VALUES
(39, '13e73fe4', '2024-06-16 04:00:48'),
(41, 'a443afa1', '2024-06-16 04:22:23'),
(45, 'd46304a0', '2024-06-20 05:36:59'),
(46, 'a4455ea1', '2024-06-20 05:37:26'),
(47, '941f2ba1', '2024-06-20 06:02:57'),
(48, '936dbfe4', '2024-06-20 06:03:01'),
(49, 'd4224ca0', '2024-06-20 06:35:08'),
(50, '849b66a1', '2024-06-20 06:35:22'),
(51, '2310cde4', '2024-06-20 06:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `staffdailylogs`
--

CREATE TABLE `staffdailylogs` (
  `stafflog_id` int(11) NOT NULL,
  `regisstaffid` int(10) NOT NULL,
  `log_date` date DEFAULT NULL,
  `timein/timeout` enum('In','Out','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_list`
--

CREATE TABLE `staff_list` (
  `staff_id` int(11) NOT NULL,
  `staff_id_number` varchar(20) NOT NULL,
  `staff_name` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_list`
--

INSERT INTO `staff_list` (`staff_id`, `staff_id_number`, `staff_name`, `department`, `role`) VALUES
(6, 'Mayra', 'Bena', 'Buelt, David L Esq', '808 Glen Cove Ave'),
(7, 'Idella', 'Scotland', 'Artesian Ice & Cold Storage Co', '373 Lafayette St'),
(8, 'Sherill', 'Klar', 'Midway Hotel', '87 Sylvan Ave'),
(9, 'Ena', 'Desjardiws', 'Selsor, Robert J Esq', '60562 Ky Rt 321'),
(10, 'Vince', 'Siena', 'Vincent J Petti & Co', '70 S 18th Pl'),
(11, 'Theron', 'Jarding', 'Prentiss, Paul F Esq', '8839 Ventura Blvd'),
(12, 'Amira', 'Chudej', 'Public Works Department', '3684 N Wacker Dr'),
(13, 'Marica', 'Tarbor', 'Prudential Lighting Corp', '68828 S 32nd St #6'),
(14, 'Shawna', 'Albrough', 'Wood, J Scott Esq', '43157 Cypress St'),
(15, 'Paulina', 'Maker', 'Swanson Peterson Fnrl Home Inc', '6 S Hanover Ave'),
(16, 'Rose', 'Jebb', 'Old Cider Mill Grove', '27916 Tarrytown Rd'),
(17, 'Reita', 'Tabar', 'Cooper Myers Y Co', '79620 Timber Dr'),
(18, 'Maybelle', 'Bewley', 'Angelo International', '387 Airway Cir #62'),
(19, 'Camellia', 'Pylant', 'Blackley, William J Pa', '570 W Pine St'),
(20, 'Roy', 'Nybo', 'Phoenix Phototype', '823 Fishers Ln'),
(21, 'Albert', 'Sonier', 'Quartzite Processing Inc', '4 Brookcrest Dr #7786'),
(22, 'Hayley', 'Taghon', 'Biltmore Textile Co Inc', '72 Wyoming Ave'),
(23, 'Norah', 'Daleo', 'Gateway Refrigeration', '754 Sammis Ave'),
(24, 'Rosina', 'Sidhu', 'Anchorage Yamaha', '660 N Green St'),
(25, 'Royal', 'Costeira', 'Wynns Precision Inc Az Div', '970 Waterloo Rd'),
(26, 'Barrie', 'Nicley', 'Paragon Cable Tv', '4129 Abbott Dr'),
(27, 'Linsey', 'Gedman', 'Eagle Computer Services Inc', '1529 Prince Rodgers Ave'),
(28, 'Laura', 'Bourbonnais', 'Kansas Association Ins Agtts', '2 N Valley Mills Dr'),
(29, 'Fanny', 'Stoneking', 'Di Giacomo, Richard F Esq', '50968 Kurtz St #45'),
(30, 'Kristian', 'Ellerbusch', 'Butler, Frank B Esq', '71585 S Ayon Ave #9'),
(31, 'Gwen', 'Julye', 'Alphagraphics Printshops', '8 Old County Rd #3'),
(32, 'Ben', 'Majorga', 'Voyager Travel Service', '13904 S 35th St'),
(33, 'Trina', 'Oto', 'N Amer Plast & Chemls Co Inc', '6149 Kapiolani Blvd #6'),
(34, 'Emelda', 'Geffers', 'D L Downing General Contr Inc', '95431 34th Ave #62'),
(35, 'Zana', 'Ploszaj', 'Community Insurance Agy Inc', '25 Swift Ave'),
(36, 'Shaun', 'Rael', 'House Of Ing', '14304 Old Alexandria Ferry Rd'),
(37, 'Oren', 'Lobosco', 'Vei Inc', '1585 Salem Church Rd #59'),
(38, 'Catherin', 'Aguele', 'Hanna, Robert J Esq', '75962 E Drinker St'),
(39, 'Pearlene', 'Boudrie', 'Design Rite Homes Inc', '8978 W Henrietta Rd'),
(40, 'Kathryn', 'Bonalumi', 'State Library', '86 Worth St #272'),
(41, 'Suzan', 'Landa', 'Vista Grande Baptist Church', '15 Campville Rd #191'),
(42, 'Sommer', 'Agar', 'Poole Publications Inc', '3 N Ridge Ave'),
(43, 'Keena', 'Rebich', 'Affilated Consulting Group Inc', '3713 Poway Rd'),
(44, 'Rupert', 'Hinkson', 'Northwestern Mutual Life Ins', '1 E 17th St'),
(45, 'Aleta', 'Poarch', 'Barrett Burke Wilson Castl', '5 Liberty Ave'),
(46, 'Jamal', 'Korczynski', 'Helricks Inc', '404 Broxton Ave'),
(47, 'Luz', 'Broccoli', 'Wynn, Mary Ellen Esq', '4 S Main St #285'),
(48, 'Janessa', 'Ruthers', 'Mackraft Signs', '1255 W Passaic St #1553'),
(49, 'Lavonne', 'Esco', 'Ansaring Answering Service', '377 Excalibur Dr'),
(50, 'Honey', 'Lymaster', 'Joiner & Goudeau Law Offices', '7 Wilshire Blvd'),
(51, 'Jean', 'Cecchinato', 'Cox, J Thomas Jr', '7 Hugh Wallis Rd'),
(52, 'Katlyn', 'Flitcroft', 'Bill, Michael M', '7177 E 14th St'),
(53, 'Cassie', 'Soros', 'A B C Tank Co', '67765 W 11th St'),
(54, 'Rolf', 'Gene', 'Jolley, Mark A Cpa', '99968 Merced St #79'),
(55, 'Darnell', 'Moothart', 'Melco Embroidery Systems', '40 E 19th Ave'),
(56, 'Cherilyn', 'Fraize', 'Witchs Brew', '84826 Plaza Dr'),
(57, 'Lynda', 'Lazzaro', 'Funding Equity Corp', '20214 W Main St'),
(58, 'Leigha', 'Capelli', 'Saturn Of Delray', '8039 Howard Ave'),
(59, 'Delfina', 'Binnie', 'Motel 6', '8 Austin Bluffs Pky'),
(60, 'Carlota', 'Gephardt', 'Ultimate In Womens Apparel The', '96605 Pioneer Rd'),
(61, 'Alida', 'Helger', 'Ballinger, Maria Chan Esq', '6 Hope Rd #10'),
(62, 'Donte', 'Resureccion', 'N E Industrial Distr Inc', '65898 E St Nw'),
(63, 'Lou', 'Kriner', 'Joondeph, Jerome J Esq', '39 Broad St'),
(64, 'Dortha', 'Vrieze', 'Art In Forms', '654 Seguine Ave'),
(65, 'Genevive', 'Sanborn', 'Central Hudson Ent Corp', '78 31st St'),
(66, 'Alease', 'Strawbridge', 'Marscher, William F Iii', '35673 Annapolis Rd #190'),
(67, 'Veda', 'Mishkin', 'Smith, Sean O Esq', '98247 Russell Blvd'),
(68, 'Craig', 'Vandersloot', 'Maverik Country Stores Inc', '3 S Willow St #82'),
(69, 'Lauran', 'Tovmasyan', 'United Christian Cmnty Crdt Un', '199 Maple Ave'),
(70, 'Aaron', 'Kloska', 'Radecker, H Philip Jr', '423 S Navajo St #56'),
(71, 'Francene', 'Skursky', 'Cullen, Jack J Esq', '5 30w W #3083'),
(72, 'Zena', 'Daria', 'Kszl Am Radio', '57245 W Union Blvd #25'),
(73, 'Brigette', 'Breckenstein', 'Blewett, Yvonne S', '971 Northwest Blvd'),
(74, 'Jeniffer', 'Jezek', 'Sheraton Inn Atlanta Northwest', '1089 Pacific Coast Hwy'),
(75, 'Selma', 'Elm', 'Preston, Anne M Esq', '6787 Emerson St'),
(76, 'Elenora', 'Handler', 'A & A Custom Rubber Stamps', '8 Middletown Blvd #708'),
(77, 'Nadine', 'Okojie', 'Hirsch, Walter W Esq', '56 Tank Farm Rd'),
(78, 'Kristin', 'Shiflet', 'Jones, Peter B Esq', '503 Fulford Ave'),
(79, 'Melinda', 'Fellhauer', 'Sterling Institute', '8275 Calle De Industrias'),
(80, 'Kirby', 'Litherland', 'Cross Western Store', '92 South St'),
(81, 'Kent', 'Ivans', 'Demer Normann Smith Ltd', '56710 Euclid Ave'),
(82, 'Dan', 'Platz', 'Ny Stat Trial Lawyers Assn', '5210 E Airy St #2'),
(83, 'Millie', 'Pirkl', 'Mann, Charles E Esq', '31 Schuyler Ave'),
(84, 'Moira', 'Qadir', 'Airnetics Engineering Co', '661 Plummer St #963'),
(85, 'Reta', 'Qazi', 'American Pie Co Inc', '1351 Simpson St'),
(86, 'Brittney', 'Lolley', 'Brown Chiropractic', '2391 Pacific Blvd'),
(87, 'Leandro', 'Bolka', 'Classic Video Duplication Inc', '1886 2nd Ave'),
(88, 'Edison', 'Sumera', 'Mcclier Corp', '52404 S Clinton Ave'),
(89, 'Breana', 'Cassi', 'Gormley Lore Murphy', '405 W Lee St'),
(90, 'Jarvis', 'Nicols', 'Thudium Mail Advg Company', '5656 N Fiesta Blvd'),
(91, 'Felicitas', 'Orlinski', 'Jen E Distributing Co', '9 Beverly Rd #5'),
(92, 'Geraldine', 'Neisius', 'Re/max Realty Services', '96 Armitage Ave'),
(93, 'Alfred', 'Pacleb', 'Roundys Pole Fence Co', '523 N Prince St'),
(94, 'Leatha', 'Block', 'Chadds Ford Winery', '6926 Orange Ave'),
(95, 'Jacquelyne', 'Rosso', 'Barragar, Anne L Esq', '6940 Prospect Pl'),
(96, 'Jonelle', 'Epps', 'Kvoo Radio', '52347 San Fernando Rd'),
(97, 'Rosamond', 'Amlin', 'Donovan, William P Esq', '5399 Mcwhorter Rd'),
(98, 'Johnson', 'Mcenery', 'Overseas General Business Co', '7 Hall St'),
(99, 'Elliot', 'Scatton', 'Nilad Machining', '5 W Allen St'),
(100, 'Gerri', 'Perra', 'Byrne, Beth Hobbs', '15126 Goldenwest St'),
(101, 'Rosendo', 'Jelsma', 'Dileo, Lucille A Esq', '94 I 55s S'),
(102, 'Eveline', 'Brickhouse', 'First Express', '288 N 168th Ave #266'),
(103, 'Laurene', 'Bennett', 'Elbin Internatl Baskets', '5 Richmond Ct'),
(104, 'Tegan', 'Ebershoff', 'Multiform Business Printing', '28 Aaronwood Ave Ne'),
(105, 'Tracie', 'Huro', 'Jin Shin Travel Agency', '39701 6th Ave #1485'),
(106, 'Mertie', 'Kazeck', 'Electra Gear Divsn Regal', '35662 S University Blvd'),
(107, 'Clare', 'Bortignon', 'Sparta Home Center', '73 Dennison St #70'),
(108, 'Rebeca', 'Baley', 'R A C E Enterprises Inc', '9591 Bayshore Rd #637'),
(109, 'Nilsa', 'Pawell', 'Jersey Wholesale Fence Co Inc', '57 N Weinbach Ave'),
(110, 'Samuel', 'Arellanes', 'Ryan, Barry M Esq', '286 Santa Rosa Ave'),
(111, 'Ivette', 'Servantes', 'Albright, Alexandra W Esq', '446 Woodward Ave #1'),
(112, 'Merrilee', 'Fajen', 'Gazette Record', '1 Jenks Ave'),
(113, 'Gianna', 'Eilers', 'Cochnower Pest Control', '7 Valley Blvd'),
(114, 'Hyman', 'Phinazee', 'Als Village Stationers', '42741 Anania Dr'),
(115, 'Buck', 'Pascucci', 'A B C Pattern & Foundry Co', '5 Shakespeare Ave'),
(116, 'Kenny', 'Leicht', 'Gaddis Court Reporting', '245 5th Ave'),
(117, 'Tabetha', 'Bai', 'Howard Johnson', '2 Gateway Ctr'),
(118, 'Alonso', 'Popper', 'Sunrise Cirby Animal Hospital', '3175 Northwestern Hwy'),
(119, 'Alonzo', 'Polek', 'Braid Electric Co', '8 S Plaza Dr'),
(120, 'Son', 'Magnotta', 'Lisko, Roy K Esq', '8 Collins Ave'),
(121, 'Jesusita', 'Druck', 'House Of Ing', '9526 Lincoln St'),
(122, 'Annice', 'Kunich', 'Hassanein, Nesa E Esq', '406 E 4th St'),
(123, 'Delila', 'Buchman', 'Frasier Karen L Kolligs', '361 Via Colinas'),
(124, 'Iraida', 'Sionesini', 'Arc Of Montgomery County Inc', '94 S Jefferson Rd'),
(125, 'Alona', 'Driesenga', 'Redington, Thomas P Esq', '8961 S Central Expy'),
(126, 'Lajuana', 'Vonderahe', 'Milwaukee Courier Inc', '7 Wiley Post Way'),
(127, 'Madelyn', 'Maestri', 'Mervis Steel Co', '60 S 4th St'),
(128, 'Louann', 'Susmilch', 'M Sorkin Sanford Associates', '6 Lafayette St #3034'),
(129, 'William', 'Devol', 'Low Country Kitchen & Bath', '35 Jefferson Ave'),
(130, 'Corazon', 'Grafenstein', 'Spieker Properties', '3492 88th St'),
(131, 'Fairy', 'Burket', 'Walker & Brehn Pa', '20 Sw 28th Ter'),
(132, 'Lashawn', 'Urion', 'U Stor', '6 Argyle Rd'),
(133, 'Ronald', 'Gayner', 'Moorhead, Michael D Esq', '438 E Reynolds Rd #239'),
(134, 'Shizue', 'Hayduk', 'R M Sloan Co Inc', '47 Hall St'),
(135, 'Nida', 'Fitz', 'Star Limousine', '17720 Beach Blvd'),
(136, 'Amos', 'Limberg', 'Pioneer Telephone Paging', '8 2nd St'),
(137, 'Dexter', 'Prosienski', 'Communication Buildings Amer', '490 Court St'),
(138, 'Ludivina', 'Calamarino', 'Components & Equipment Co', '1456 Hill Rd'),
(139, 'Ariel', 'Stavely', 'Grand Rapids Right To Life', '6 7th St'),
(140, 'Haley', 'Vaughn', 'Martin Nighswander & Mitchell', '29 Nottingham Way #926'),
(141, 'Raelene', 'Legeyt', 'Barter Systems Inc', '8818 Century Park E #33'),
(142, 'Micaela', 'Shiflett', 'W R Grace & Co', '4 Commerce Center Dr'),
(143, 'Alpha', 'Prudhomme', 'Davis, J Mark Esq', '979 S La Cienega Blvd #627'),
(144, 'Zack', 'Warman', 'Roswell Honda Partners', '9181 E 26th St'),
(145, 'Wilford', 'Pata', 'Era Mclachlan John Morgan Real', '8855 North Ave'),
(146, 'Carman', 'Robasciotti', 'Vaughan, James J Esq', '4 Spinning Wheel Ln'),
(147, 'Carylon', 'Bayot', 'Wzyx 1440 Am', '5905 S 32nd St'),
(148, 'Gladys', 'Schmale', 'Amercn Spdy Printg Ctrs Ocala', '514 Glenn Way'),
(149, 'Matilda', 'Peleg', 'A & D Pallet Co', '708 S Wilson Way'),
(150, 'Jacklyn', 'Wojnar', 'Nationwide Insurance', '16949 Harristown Rd'),
(151, 'Tashia', 'Charney', 'Gallagher, Owen Esq', '9 13th Ave S'),
(152, 'Dorian', 'Eischens', 'Thomas Somerville Co', '1 Rock Island Rd #8'),
(153, 'Jesus', 'Merkt', 'Unr Rohn', '1554 Bracken Crk'),
(154, 'Brandee', 'Svoboda', 'Cath Lea For Relig & Cvl Rgts', '7 10th St W'),
(155, 'Edda', 'Mcquaide', 'Eagles Nest', '9 Cron Hill Dr'),
(156, 'Felix', 'Bumby', 'Epsilon Products Company', '82 Tremont St #4'),
(157, 'Mickie', 'Upton', 'Oakey & Oakey Abstrct Burnett', '900 W Wood St'),
(158, 'Phung', 'Krome', 'Pacific Scientific Co', '847 Norristown Rd'),
(159, 'Lashonda', 'Langanke', 'Krausert, Diane D Esq', '667 S Highland Dr #4'),
(160, 'Patria', 'Popa', 'Blaney Sheet Metal', '21 W 2nd St'),
(161, 'Nidia', 'Horr', 'Goodknight, David R', '2 W Henrietta Rd #6'),
(162, 'Skye', 'Culcasi', 'Sullivan & Associates Ltd', '82655 Shawnee Mission Pky #5798'),
(163, 'Kanisha', 'Reyelts', 'American Board Of Surgery', '9 Taylor Ave'),
(164, 'Hector', 'Barras', 'Vernon Manor Hotel', '62 J St #450'),
(165, 'Stefan', 'Mongolo', 'Keith Altizer & Company Pa', '2 Pennington St'),
(166, 'Francoise', 'Byon', 'H P Stran & Co', '5496 Ne Columbia Blvd'),
(167, 'Lindy', 'Vandermeer', 'Southern National Bank S Car', '4244 Lucas Creek Rd'),
(168, 'Arthur', 'Diniz', 'American Western Mortgage', '79819 Palmetto Ave'),
(169, 'Nicholle', 'Hulme', 'Oxner Vallerie', '7 N Glenn Rd'),
(170, 'Tijuana', 'Mesch', 'Rochelle Cold Storage', '61 Center St #8'),
(171, 'Lorenza', 'Schoenleber', 'Mail Boxes Etc', '562 Nw Cornell Rd'),
(172, 'Iola', 'Baird', 'Xandex Inc', '48 General George Patton Dr #8611'),
(173, 'Sang', 'Weigner', 'Hander, Deborah G Esq', '9 W Passaic St'),
(174, 'Leonor', 'Prez', 'Vinco Furniture Inc', '968 Delaware Ave'),
(175, 'Silvana', 'Whelpley', 'Stamp House', '548 Charmonie Ln'),
(176, 'Anthony', 'Stever', 'Burton & Davis', '91114 Grand Ave'),
(177, 'Wenona', 'Carmel', 'Maier, Kristine M', '44 Bush St'),
(178, 'Isadora', 'Yurick', 'J M Edmunds Co Inc', '6 Mahler Rd'),
(179, 'Mose', 'Vonseggern', 'Art Concepts', '1 E Main St'),
(180, 'Marci', 'Aveline', 'Richards, Don R Esq', '58 State St #998'),
(181, 'Michel', 'Hoyne', 'B & B Environmental Inc', '11408 Green St'),
(182, 'Stephania', 'Connon', 'Printing Delite', '297 8th Ave S #9'),
(183, 'Charolette', 'Turk', 'Weil Mclain Co', '1 Wyckoff Ave'),
(184, 'Katie', 'Magro', 'Jones, Andrew D Esq', '8 E North Ave'),
(185, 'Inocencia', 'Angeron', 'South Adams Savings Bank', '13386 Tamarco Dr #20'),
(186, 'Nikita', 'Novosel', 'Universal Granite & Marble Inc', '70 W Market St #20'),
(187, 'Malcolm', 'Gohlke', 'Imagelink', '53247 Montgomery St #36'),
(188, 'Desiree', 'Englund', 'Wrrr Fm', '9495 Central Hwy #66'),
(189, 'Holley', 'Worland', 'Lord Aeck & Sargent Architects', '2 Route 9'),
(190, 'Maryann', 'Tates', 'Dalbec Agency Inc', '75700 Academy Rd'),
(191, 'Ling', 'Dibello', 'Reese Press Inc', '6 Monte Ave'),
(192, 'Hailey', 'Kopet', 'Stokes, Fred J Esq', '5 France Ave S'),
(193, 'Farrah', 'Malboeuf', 'Slachter, David Esq', '803 Tupper Ln'),
(194, 'Candra', 'Deritis', 'Girling Health Care Inc', '43 Nolan St'),
(195, 'Reuben', 'Hegland', 'Welders Supply Service Inc', '6 W 39th St'),
(196, 'Anglea', 'Andrion', 'Engelbrecht, William H Esq', '910 21st St'),
(197, 'Paris', 'Tuccio', 'Nancy Brandon Realtor', '2677 S Jackson St'),
(198, 'Latricia', 'Schmoyer', 'Flanagan Lieberman Hoffman', '6 Central Ave #4'),
(199, 'Jeffrey', 'Leuenberger', 'Walter W Lawrence Ink', '564 Almeria Ave #7474'),
(200, 'Dean', 'Vollstedt', 'Ship It Packaging Inc', '4 Grand St'),
(201, 'Deane', 'Haag', 'Malsbary Mfg Co', '9 Hamilton Blvd #299'),
(202, 'Edelmira', 'Pedregon', 'Independence Marine Corp', '50638 Northwest Blvd'),
(203, 'Andrew', 'Keks', 'Anthonys', '51 Bridge Ave'),
(204, 'Miesha', 'Decelles', 'L M H Inc', '457 St Sebastian Way #189'),
(205, 'Javier', 'Osmer', 'Milgo Industrial Inc', '6 Ackerman Rd'),
(206, 'Kizzy', 'Stangle', 'Rogers, Clay M Esq', '8 W Lake St #1'),
(207, 'Sharan', 'Wodicka', 'Usa Asbestos Co', '8454 6  17 M At Bradleys'),
(208, 'Novella', 'Fritch', 'Voils, Otis V', '5 Ellestad Dr'),
(209, 'German', 'Dones', 'Oaz Communications', '9 N Nevada Ave'),
(210, 'Robt', 'Blanck', 'Elan Techlgy A Divsn Mansol', '790 E Wisconsin Ave'),
(211, 'Rossana', 'Biler', 'Norfolk County Newton Lung', '60481 N Clark St'),
(212, 'Henriette', 'Gish', 'Parker Bush & Lane Pc', '43 E Main St'),
(213, 'Buffy', 'Stitely', 'Stylecraft Corporation', '5 Madison St #4651'),
(214, 'Christiane', 'Osmanski', 'Bennett, Matthew T Esq', '85 Nw Frontage Rd'),
(215, 'Annamae', 'Lothridge', 'Highland Meadows Golf Club', '584 Meridian St #997'),
(216, 'Vanesa', 'Glockner', 'Nelson, Michael J Esq', '28220 Park Avenue W'),
(217, 'Gennie', 'Pastorino', 'Henry, Robert J Esq', '5 Austin Ave'),
(218, 'Tamra', 'Kenfield', 'Mackraft Signs', '481 925n N #959'),
(219, 'Tien', 'Kinney', 'Orco State Empl Fed Crdt Un', '9 9th St #4'),
(220, 'Malcom', 'Leja', 'Johnsen, Robert U Esq', '56232 Hohman Ave'),
(221, 'Claudia', 'Gawrych', 'Abe Goldstein Ofc Furn', '3 Wall St #26'),
(222, 'Page', 'Entzi', 'Roland Ashcroft', '63154 Artesia Blvd'),
(223, 'Lorita', 'Roches', 'Village Meadows', '32 E Poythress St'),
(224, 'Annita', 'Lek', 'Busada Manufacturing Corp', '86274 Howell Mill Rd Nw'),
(225, 'Eliseo', 'Mikovec', 'Air Flow Co Inc', '25488 Brickell Ave'),
(226, 'Tyisha', 'Layland', 'Freitag Pc', '270 5th Ave'),
(227, 'Colene', 'Tolbent', 'Saw Repair & Supply Co', '891 Union Pacific Ave #8463'),
(228, 'Francis', 'Senters', 'Middendorf Meat Quality Foods', '4562 Aurora Ave N'),
(229, 'Hester', 'Dollins', 'Eagle Plywood & Door Mfrs Inc', '4864 N 168th Ave'),
(230, 'Susana', 'Baumgarter', 'Leigh, Lewis R Esq', '7 Elm Ave'),
(231, 'Dahlia', 'Tummons', 'Bare Bones', '6508 Adams St #32'),
(232, 'Osvaldo', 'Falvey', 'Avila, Edward G Esq', '6434 Westchester Ave #28'),
(233, 'Armando', 'Barkley', 'Oregon Handling Equip Co', '70680 S Rider Trl'),
(234, 'Torie', 'Deras', 'Reynolds, Stephen R Esq', '700 Factory Ave #5649'),
(235, 'Tamie', 'Hollimon', 'Credit Union Of The Rockies', '3 Cherokee St'),
(236, 'Lettie', 'Hessenthaler', 'Sullivan, John M Esq', '76542 W Bijou St'),
(237, 'Chaya', 'Muhlbauer', 'Henry D Lederman', '44009 W 63rd #269'),
(238, 'Terina', 'Wildeboer', 'Burress, S Paige Esq', '462 Morris Ave'),
(239, 'Lisbeth', 'Agney', 'Dynetics', '1 El Camino Real #603'),
(240, 'Lillian', 'Dominique', 'West Pac Environmental Inc', '92417 Arbuckle Ct'),
(241, 'Corrina', 'Lindblom', 'Progressive Machine Co', '1 Westpark Dr'),
(242, 'Dylan', 'Chaleun', 'Berhanu International Foods', '5 Montana Ave'),
(243, 'Jerrod', 'Luening', 'Mcmillan, Regina E Esq', '6629 Main St'),
(244, 'Gracie', 'Vicente', 'Central Nebraska Home Care', '4 W 18th St'),
(245, 'Barabara', 'Amedro', 'Unicircuit Inc', '95412 16th St #6'),
(246, 'Delsie', 'Ducos', 'F H Overseas Export Inc', '17 Kamehameha Hwy'),
(247, 'Tamekia', 'Kajder', 'Santek Inc', '16 Talmadge Rd'),
(248, 'Johanna', 'Saffer', 'Springer Industrial Equip Inc', '750 Lancaster Ave'),
(249, 'Sharita', 'Kruk', 'Long, Robert B Jr', '8808 Northern Blvd'),
(250, 'Gerald', 'Chrusciel', 'Prusax, Maximilian M Esq', '76596 Pleasant Hill Rd'),
(251, 'Ardella', 'Dieterich', 'Custom Jig Grinding', '94 Delta Fair Blvd #2702'),
(252, 'Jackie', 'Kellebrew', 'Senior Village Nursing Home', '25 Sw End Blvd #609'),
(253, 'Mabelle', 'Ramero', 'Mchale, Joseph G Esq', '15258 W Charleston Blvd'),
(254, 'Jonell', 'Biasi', 'Pestmaster Services Inc', '75 Ryan Dr #70'),
(255, 'Linwood', 'Wessner', 'Moorhead Associates Inc', '9634 South St'),
(256, 'Samira', 'Heninger', 'Alb Inc', '40490 Morrow St'),
(257, 'Julieta', 'Cropsey', 'Atrium Marketing Inc', '9 Commerce Cir'),
(258, 'Serita', 'Barthlow', 'Machine Design Service Inc', '190 34th St #8'),
(259, 'Tori', 'Tepley', 'Mcwhirter Realty Corp', '1036 Malone Rd'),
(260, 'Nancey', 'Whal', 'National Mortgage Co', '398 Fort Campbell Blvd #923'),
(261, 'Wilbert', 'Beckes', 'Alvis, John W Esq', '2799 Cajon Blvd'),
(262, 'Werner', 'Hermens', 'Community Health Law Project', '302 N 10th St #3896'),
(263, 'Sunny', 'Catton', 'Highway Rentals Inc', '79346 Firestone Blvd'),
(264, 'Keva', 'Moehring', 'Rapid Reproductions Printing', '37564 Grace Ln'),
(265, 'Mary', 'Dingler', 'Autocrat Inc', '470 W Irving Park Rd'),
(266, 'Huey', 'Bukovac', 'Venino And Venino', '6 Jefferson St'),
(267, 'Antonio', 'Eighmy', 'Corporex Companies Inc', '1758 Park Pl'),
(268, 'Quinn', 'Weissbrodt', 'Economy Stainless Supl Co Inc', '7659 Market St'),
(269, 'Carin', 'Georgiades', 'Dgstv Diseases Cnslnts', '95830 Webster Dr'),
(270, 'Jill', 'Davoren', 'Broaches Inc', '26 Old William Penn Hwy'),
(271, 'Sanjuana', 'Goodness', 'Woods Manufactured Housing', '343 E Main St'),
(272, 'Elin', 'Koerner', 'Theos Software Corp', '8 Cabot Rd'),
(273, 'Charlena', 'Decamp', 'Stanco Metal Products Inc', '8 Allied Dr'),
(274, 'Annette', 'Breyer', 'Xyvision Inc', '26921 Vassar St'),
(275, 'Alexis', 'Morguson', 'Carrera Casting Corp', '9 Old York Rd #418'),
(276, 'Princess', 'Saffo', 'Asian Jewelry', '12398 Duluth St'),
(277, 'Ashton', 'Sutherburg', 'Southwark Corporation', '960 S Arroyo Pkwy'),
(278, 'Elmer', 'Redlon', 'Kdhl Am Radio', '53 Euclid Ave'),
(279, 'Aliza', 'Akiyama', 'Kelly, Charles G Esq', '700 Wilmson Rd'),
(280, 'Ora', 'Handrick', 'Fennessey Buick Inc', '466 Hillsdale Ave'),
(281, 'Brent', 'Ahlborn', 'Apex Bottle Co', '86351 Pine Ave'),
(282, 'Tora', 'Telch', 'Shamrock Food Service', '6139 Contractors Dr #450'),
(283, 'Hildred', 'Eilbeck', 'Plastic Supply Inc', '83 Longhurst Rd'),
(284, 'Dante', 'Freiman', 'Gaylord', '76 Daylight Way #7'),
(285, 'Emmanuel', 'Avera', 'Bank Of New York Na', '3883 N Central Ave'),
(286, 'Keshia', 'Wasp', 'Cole, Gary D Esq', '75 E Main'),
(287, 'Sherman', 'Mahmud', 'Gencheff, Nelson E Do', '9 Memorial Pky Nw'),
(288, 'Lore', 'Brothers', 'American General Finance', '70086 Division St #3'),
(289, 'Shawn', 'Weibe', 'Feutz, James F Esq', '4 Middletown Blvd #33'),
(290, 'Karima', 'Cheever', 'Kwik Kopy Printing & Copying', '20907 65s S'),
(291, 'Francesco', 'Kloos', 'Borough Clerk', '82136 Post Rd'),
(292, 'King', 'Picton', 'U S Rentals', '3 W Pioneer Dr'),
(293, 'Mica', 'Simco', 'Katz Brothers Market Inc', '5610 Holliday Rd'),
(294, 'Lamonica', 'Princiotta', 'Grossman Tuchman & Shah', '29133 Hammond Dr #1'),
(295, 'Curtis', 'Ware', 'American Inst Muscl Studies', '51 Greenwood Ave'),
(296, 'Sabrina', 'Rabena', 'Joyces Submarine Sandwiches', '327 Ward Pky'),
(297, 'Denae', 'Saeteun', 'Domurad, John M Esq', '52680 W Hwy 55 #59'),
(298, 'Anastacia', 'Carranzo', 'Debbies Golden Touch', '654 Se 29th St'),
(299, 'Irving', 'Plocica', 'Johnston, George M Esq', '65 Clayton Rd'),
(300, 'Elenor', 'Siefken', 'Chateau Sonesta Hotel', '136 2nd Ave N'),
(301, 'Crista', 'Padua', 'Breathitt Fnrl Home & Mnmt Co', '1607 Laurel St'),
(302, 'Lawana', 'Yuasa', 'Viking Lodge', '77818 Prince Drew Rd'),
(303, 'Maryrose', 'Cove', 'Brown Bear Bait Company', '1 Vogel Rd'),
(304, 'Lindsey', 'Rathmann', 'Pakzad Advertising', '5 Main St'),
(305, 'Lynelle', 'Koury', 'Jean Barbara Ltd', '7696 Carey Ave'),
(306, 'Brice', 'Bogacz', 'Thurmon, Steven P', '76 San Pablo Ave'),
(307, 'Laine', 'Killean', 'Bussard, Vicki L Esq', '767 9th Ave Sw'),
(308, 'Rachael', 'Crawley', 'Stamell Tabacco & Schager', '82 Hopkins Plz'),
(309, 'Della', 'Selestewa', 'Aztech Controls Inc', '64 Prairie Ave'),
(310, 'Thomasena', 'Graziosi', 'Hutchinson Inc', '5 Jackson St'),
(311, 'Frederic', 'Schimke', 'Curtis & Curtis Inc', '705 Stanwix St'),
(312, 'Halina', 'Dellen', 'Roane, Matthew H Esq', '3318 Buckelew Ave'),
(313, 'Ryann', 'Riston', 'Best Western Gloucester Inn', '38494 Port Reading Ave'),
(314, 'Leah', 'Milsap', 'Schwartz, Seymour I Md', '45 Mountain View Ave'),
(315, 'Ira', 'Zihal', 'American Express Publshng Corp', '6 W Meadow St'),
(316, 'Shayne', 'Sundahl', 'Jaywork, John Terence Esq', '5614 Public Sq'),
(317, 'Ernestine', 'Paavola', 'Northbros Co Divsn Natl Svc', '6 E Gloria Switch Rd #96'),
(318, 'Eleonore', 'Everline', 'Psychotherapy Associates', '1 Us Highway 206'),
(319, 'Misty', 'Leriche', 'K J N Advertising Inc', '5289 Ramblewood Dr'),
(320, 'Na', 'Hodges', 'Automatic Feed Co', '5 Aquarium Pl #1'),
(321, 'Juan', 'Knudtson', 'Newton Clerk', '466 Lincoln Blvd'),
(322, 'Desmond', 'Tarkowski', 'Body Part Connection', '5920 E Arapahoe Rd'),
(323, 'Tommy', 'Gennusa', 'Cooper And Raley', '2 New Brooklyn Rd'),
(324, 'Adrianna', 'Poncio', 'H T Communications Group Ltd', '9 34th Ave #69'),
(325, 'Adaline', 'Galagher', 'Debbie Reynolds Hotel', '32716 N Michigan Ave #82'),
(326, 'Tammi', 'Schiavi', 'Crew, Robert B Esq', '78 Sw Beaverton Hillsdale H'),
(327, 'Virgilio', 'Phay', 'Reef Encrustaceans', '8494 E 57th St'),
(328, 'Emeline', 'Sotelo', 'Reporters Inc', '46 Broadway St'),
(329, 'Marcos', 'Seniff', 'Arizona Equipment Trnsprt Inc', '228 S Tyler St'),
(330, 'Yuonne', 'Carabajal', 'Hub Manufacturing Company Inc', '2714 Beach Blvd'),
(331, 'Gladis', 'Kazemi', 'Dippin Flavors', '3266 Welsh Rd'),
(332, 'Muriel', 'Drozdowski', 'Harfred Oil Co', '1 S Maryland Pky'),
(333, 'Juliann', 'Dammeyer', 'Wilheim, Kari A Esq', '6 De Belier Rue'),
(334, 'Reiko', 'Dejarme', 'Gilardis Frozen Food', '57869 Alemany Blvd'),
(335, 'Verdell', 'Garness', 'Ronald Massingill Pc', '39 Plummer St'),
(336, 'Arleen', 'Kane', 'Colosi, Darryl J Esq', '78717 Graves Ln'),
(337, 'Launa', 'Vanauken', 'Tripuraneni, Prabhakar Md', '30338 S Dunworth St'),
(338, 'Casandra', 'Gordis', 'Carlyle Abstract Co', '6 Walnut St'),
(339, 'Julio', 'Puccini', 'Streator Onized Fed Crdt Un', '2244 Franquette Ave'),
(340, 'Alica', 'Alerte', 'Valley Hi Bank', '9892 Hernando W'),
(341, 'Karol', 'Sarkissian', 'Pep Boys Manny Moe & Jack', '9296 Prince Rodgers Ave'),
(342, 'Wava', 'Ochs', 'Knights Inn', '9 Chandler Ave #355'),
(343, 'Jamie', 'Kushnir', 'Bell Electric Co', '3216 W Wabansia Ave'),
(344, 'Fidelia', 'Dampier', 'Signs Now', '947 W Harrison St #640'),
(345, 'Kris', 'Medich', 'Chieftain Four Inc', '94843 Trabold Rd #59'),
(346, 'Lashawna', 'Filan', 'South Carolina State Housing F', '8 Lincoln Way W #6698'),
(347, 'Lachelle', 'Andrzejewski', 'Lucas Cntrl Systems Prod Deeco', '262 Montauk Blvd'),
(348, 'Katy', 'Saltourides', 'J C S Iron Works Inc', '5040 Teague Rd #65'),
(349, 'Bettyann', 'Fernades', 'Lsr Pokorny Schwartz Friedman', '54648 Hylan Blvd #883'),
(350, 'Valda', 'Levay', 'Branom Instrument Co', '7463 Elmwood Park Blvd'),
(351, 'Lynette', 'Beaureguard', 'Young, Craig C Md', '630 E Plano Pky'),
(352, 'Victor', 'Laroia', 'Midwest Marketing Inc', '166 N Maple Dr'),
(353, 'Pa', 'Badgero', 'Korolishin, Michael Esq', '20 Meadow Ln'),
(354, 'Dorathy', 'Miskelly', 'Perrysburg Animal Care Inc', '73 Robert S'),
(355, 'Rodrigo', 'Schuh', 'Hospitality Design Group', '512 E Idaho St'),
(356, 'Stanford', 'Waganer', 'Ciba Geigy Corp', '98021 Harwin Dr'),
(357, 'Michael', 'Orehek', 'Robinson, Michael C Esq', '892 Sw Broadway #8'),
(358, 'Ines', 'Tokich', 'De Woskin, Alan E Esq', '192 N Sheffield Ave'),
(359, 'Dorinda', 'Markoff', 'Alumi Span Inc', '5 Columbia Pike'),
(360, 'Clarence', 'Gabbert', 'M C Publishing', '35983 Daubert St'),
(361, 'Omer', 'Radel', 'Phoenix Marketing Rep Inc', '678 S Main St'),
(362, 'Winifred', 'Kingshott', 'Remc South Eastern', '532 Saint Marks Ct'),
(363, 'Theresia', 'Salomone', 'Curran, Carol N Esq', '1337 N 26th St'),
(364, 'Daisy', 'Kearsey', 'Faber Castell Corporation', '556 Bernardo Cent'),
(365, 'Aretha', 'Bodle', 'Palmetto Food Equipment Co Inc', '9561 Chartres St'),
(366, 'Bettina', 'Diciano', 'Greater Ky Corp', '11999 Main St'),
(367, 'Omega', 'Mangino', 'Kajo 1270 Am Radio', '495 Distribution Dr #996'),
(368, 'Dana', 'Vock', 'Fried, Monte Esq', '49 Walnut St'),
(369, 'Naomi', 'Tuamoheloa', 'Dayer Real Estate Group', '85 S Washington Ave'),
(370, 'Luis', 'Yerry', 'On Your Feet', '72984 W 1st St'),
(371, 'Dominga', 'Barchacky', 'South Side Machine Works Inc', '3 Ridge Rd W #949'),
(372, 'Isreal', 'Calizo', 'Milner Inn', '2 Landmeier Rd'),
(373, 'Myrtie', 'Korba', 'United Mortgage', '82 W Market St'),
(374, 'Jodi', 'Naifeh', 'Cahill, Steven J Esq', '89 N Himes Ave'),
(375, 'Pearly', 'Hedstrom', 'G Whitfield Richards Co', '62296 S Elliott Rd #2'),
(376, 'Aileen', 'Menez', 'Cuzzo, Michael J Esq', '8 S Main St'),
(377, 'Glory', 'Carlo', 'Swanson Travel', '50808 A Pamalee Dr'),
(378, 'Kathrine', 'Francoise', 'Jackson, Brian C', '30691 Poplar Ave #4'),
(379, 'Domingo', 'Mckale', 'Fables Gallery', '80968 Armitage Ave'),
(380, 'Julian', 'Laprade', 'Forsyth Steel Co', '5 Pittsburg St'),
(381, 'Marylou', 'Lofts', 'Lally, Lawrence D Esq', '812 Berry Blvd #96'),
(382, 'Louis', 'Brueck', 'Sassy Lassie Dolls', '73 12th St'),
(383, 'Ellsworth', 'Guenther', 'Performance Consulting Grp Inc', '27730 American Ave'),
(384, 'Wilburn', 'Lary', 'Padrick, Comer W Jr', '72 Park Ave'),
(385, 'Arlie', 'Borra', 'Analytical Laboratories', '59215 W 80th St'),
(386, 'Alysa', 'Lehoux', 'Signs Of The Times', '186 Geary Blvd #923'),
(387, 'Marilynn', 'Herrera', 'Brown, Alan Esq', '717 Midway Pl'),
(388, 'Scot', 'Jarva', 'Biancas La Petite French Bkry', '68 Camden Rd'),
(389, 'Adelaide', 'Ender', 'Williams Design Group', '175 N Central Ave'),
(390, 'Carli', 'Bame', 'Hampton Inn Hotel', '6584 S Bascom Ave #371'),
(391, 'Coletta', 'Thro', 'Hoffman, Carl Esq', '64865 Main St'),
(392, 'Katheryn', 'Lamers', 'Sonoco Products Co', '62171 E 6th Ave'),
(393, 'Santos', 'Wisenbaker', 'Brattleboro Printing Inc', '67729 180th St'),
(394, 'Kimberely', 'Weyman', 'Scientific Agrcltl Svc Inc', '7721 Harrison St'),
(395, 'Earlean', 'Suffern', 'Booster Farms', '5351 E Thousand Oaks Blvd'),
(396, 'Dannette', 'Heimbaugh', 'Accent Copy Center Inc', '5 Carpenter Ave'),
(397, 'Odelia', 'Hutchin', 'Mccaffreys Supermarket', '374 Sunrise Ave'),
(398, 'Lina', 'Schwiebert', 'Chemex Labs Ltd', '68538 N Bentz St #1451'),
(399, 'Fredric', 'Johanningmeie', 'Galaxie Displays Inc', '23 S Orange Ave #55'),
(400, 'Alfreda', 'Delsoin', 'Harris, Eric C Esq', '4373 Washington St'),
(401, 'Bernadine', 'Elamin', 'Tarix Printing', '61550 S Figueroa St'),
(402, 'Ming', 'Thaxton', 'Chem Aqua', '8 N Town East Blvd'),
(403, 'Gracia', 'Pecot', 'Kern Valley Printing', '2452 Bango Rd'),
(404, 'Yuette', 'Metevelis', 'American Speedy Printing Ctrs', '8219 Roswell Rd Ne'),
(405, 'Yuriko', 'Kazarian', 'Doane Products Company', '3 Davis Blvd'),
(406, 'Linette', 'Summerfield', 'Mortenson Broadcasting Co', '78 S Robson'),
(407, 'Jospeh', 'Couzens', 'M & M Quality Printing', '2749 Van Nuys Blvd'),
(408, 'Anna', 'Ovit', 'Georgia Business Machines', '722 E Liberty St'),
(409, 'Shawnta', 'Woodhams', 'Leo, Frank M', '9 Gunnison St'),
(410, 'Ettie', 'Luckenbach', 'S E M A', '2902 Edison Dr #278'),
(411, 'Chara', 'Leveston', 'Arthur Andersen & Co', '72 N Buckeye Ave'),
(412, 'Pansy', 'Todesco', 'Schmidt, Charles E Jr', '684 William St'),
(413, 'Georgeanna', 'Silverstone', 'Emess Professional Svces', '185 W Guadalupe Rd'),
(414, 'Jamey', 'Tetter', 'Vicon Corporation', '28 Standiford Ave #6'),
(415, 'Alberta', 'Motter', 'Turl Engineering Works', '33108 S Yosemite Ct'),
(416, 'Tamala', 'Hickie', 'Mister Bagel', '351 Crooks Rd'),
(417, 'Gerry', 'Mohrmann', 'Howard Winig Realty Assocs Inc', '8 Glenn Way #3'),
(418, 'Isaiah', 'Kueter', 'Jordan, Mark D Esq', '8 W Virginia St'),
(419, 'Magnolia', 'Overbough', 'Marin Sun Printing', '65484 Bainbridge Rd'),
(420, 'Ngoc', 'Guglielmina', 'Verde, Louis J Esq', '156 Morris St'),
(421, 'Julene', 'Lauretta', 'Convum Internatl Corp', '1881 Market St'),
(422, 'Magda', 'Lindbeck', 'Thomas Torto Constr Corp', '6 Kings St #4790'),
(423, 'Shantell', 'Lizama', 'Astromatic', '9787 Dunksferry Rd'),
(424, 'Audria', 'Piccinich', 'Kuhio Photo', '13 Blanchard St #996'),
(425, 'Nickole', 'Derenzis', 'Lehigh Furn Divsn Lehigh', '2 Pompton Ave'),
(426, 'Grover', 'Reynolds', 'Okon Inc', '2867 Industrial Way'),
(427, 'Rocco', 'Bergstrom', 'Postlewaite, Jack A Esq', '850 Warwick Blvd #58'),
(428, 'Ethan', 'Quintero', 'Regent Consultants Corp', '2 Ellis Rd'),
(429, 'Glynda', 'Sanzenbacher', 'Hinkson Cooper Weaver Inc', '80 Monroe St'),
(430, 'Yolande', 'Scrimsher', 'Spclty Fastening Systems Inc', '71089 Queens Blvd'),
(431, 'Twanna', 'Sieber', 'Rudolph, William S Cpa', '66094 Pioneer Rd'),
(432, 'Rosenda', 'Petteway', 'Choo Choo Caboose At Jade Bbq', '66 Congress St'),
(433, 'Lacey', 'Francis', 'Anthony & Langford', '44 105th Ave'),
(434, 'Cordie', 'Meikle', 'Shapiro Bag Company', '40809 Rockburn Hill Rd'),
(435, 'Annalee', 'Graleski', 'Lescure Company Inc', '9 Green Rd #5877'),
(436, 'Wai', 'Raddle', 'Dot Pitch Electronics', '2 Stirrup Dr #4907'),
(437, 'Johana', 'Conquest', 'Henri D Kahn Insurance', '19 Court St'),
(438, 'Tomas', 'Fults', 'Test Tools Inc', '3 Hwy 61 #2491'),
(439, 'Karon', 'Etzler', 'Rachmel & Company Cpa Pa', '97539 Connecticut Ave Nw #3586'),
(440, 'Delbert', 'Houben', 'Hermann Assocs Inc Safe Mart', '59 Murray Hill Pky'),
(441, 'Ashleigh', 'Rimmer', 'Palmer Publications Inc', '15 W 11mile Rd'),
(442, 'Nenita', 'Mckenna', 'Southern Imperial Inc', '709 New Market St'),
(443, 'Micah', 'Shear', 'United Water Resources Inc', '324 Shawnee Mission Pky'),
(444, 'Stefany', 'Figueras', 'Burke, Jonathan H Esq', '37 Saint Louis Ave #292'),
(445, 'Rene', 'Burnsworth', 'Nurses Ofr Newborns', '80289 Victory Ave #9'),
(446, 'Cary', 'Orazine', 'Para Laboratories', '16 Governors Dr Sw'),
(447, 'Micheal', 'Ocken', 'New Orleans Credit Service Inc', '4 E Aven #284'),
(448, 'Frederick', 'Tamburello', 'Signs By Berry', '262 8th St'),
(449, 'Burma', 'Noa', 'Saum, Scott J Esq', '79 State Route 35'),
(450, 'Cherry', 'Roh', 'Ulrich, Lawrence M Esq', '75 Blackington Ave'),
(451, 'Gabriele', 'Frabotta', 'Stewart Levine & Davis', '6 Abbott Rd'),
(452, 'Clement', 'Chee', 'Bark Eater Inn', '5159 Saint Ann St'),
(453, 'Beckie', 'Apodace', 'Reich, Richard J Esq', '26 Ripley St #5444'),
(454, 'Catrice', 'Fowlkes', 'Kappus Co', '39828 Abbott Rd'),
(455, 'Richelle', 'Remillard', 'Terri, Teresa Hutchens Esq', '2495 Beach Blvd #557'),
(456, 'Cherri', 'Miccio', 'Hong Iwai Hulbert & Kawano', '3 Bustleton Ave'),
(457, 'Dorethea', 'Taketa', 'Fraser Dante Ltd', '7 N 4th St'),
(458, 'Barb', 'Latina', 'Die Craft Stamping', '1 National Plac #6619'),
(459, 'Bettye', 'Meray', 'Sako, Bradley T Esq', '248 Academy Rd'),
(460, 'Sherrell', 'Sprowl', 'Country Comfort', '2 State Hwy'),
(461, 'Ruth', 'Niglio', 'Amberley Suite Hotels', '6 W Cornelia Ave'),
(462, 'Alva', 'Shoulders', 'Warren Leadership', '461 S Fannin Ave'),
(463, 'Carri', 'Palaspas', 'Alexander, David T Esq', '51255 Tea Town Rd #9'),
(464, 'Onita', 'Milbrandt', 'Fairfield Inn By Marriott', '93 Bloomfield Ave #829'),
(465, 'Jessenia', 'Sarp', 'Skyline Lodge & Restaurant', '5775 Mechanic St #517'),
(466, 'Tricia', 'Peressini', 'Aviation Design', '3 Industrial Blvd'),
(467, 'Stephaine', 'Manin', 'Malmon, Alvin S Esq', '8202 Cornwall Rd'),
(468, 'Florinda', 'Gudgel', 'Transit Cargo Services Inc', '53597 W Clarendon Ave'),
(469, 'Marsha', 'Farnham', 'Comfort Inn Of Revere', '577 Cleveland Ave'),
(470, 'Josefa', 'Oakland', 'Duncan & Associates', '259 1st Ave'),
(471, 'Deeann', 'Nicklous', 'Philip Kingsley Trichological', '79 Mechanic St'),
(472, 'Jeannetta', 'Vonstaden', 'Burlington Homes Of Maine', '269 Executive Dr'),
(473, 'Ramonita', 'Picotte', 'Art Material Services Inc', '504 Steve Dr'),
(474, 'Temeka', 'Bodine', 'Consolidated Manufacturing Inc', '407 E 57th Ave'),
(475, 'Bea', 'Iida', 'Reliance Credit Union', '72 W Ripley Ave'),
(476, 'Soledad', 'Mockus', 'Sinclair Machine Products Inc', '75 Elm Rd #1190'),
(477, 'Margurite', 'Okon', 'Kent, Wendy M Esq', '32 Broadway St'),
(478, 'Artie', 'Saine', 'Dixon, Eric D Esq', '41 Washington Blvd'),
(479, 'Major', 'Studwell', 'Wood Sign & Banner Co', '5 Buford Hwy Ne #3'),
(480, 'Veronika', 'Buchauer', 'Adkins, Russell Esq', '6 Flex Ave'),
(481, 'Christene', 'Cisney', 'Danform Shoe Stores', '21058 Massillon Rd'),
(482, 'Miles', 'Feldner', 'Antietam Cable Television', '28465 Downey Ave #4238'),
(483, 'Aide', 'Ghera', 'Nathaniel Electronics', '22 Livingston Ave'),
(484, 'Noelia', 'Brackett', 'Rodriguez, Joseph A Esq', '403 Conn Valley Rd'),
(485, 'Lenora', 'Delacruz', 'Stilling, William J Esq', '5400 Market St'),
(486, '1', 'm', '3-Feb-1952', '3'),
(487, '2', 'm', '23-May-1958', '1'),
(488, '3', 'f', '26-Jul-1929', '1'),
(489, '4', 'f', '15-Apr-1947', '1'),
(490, '5', 'm', '9-Feb-1955', '1'),
(491, '6', 'm', '22-Aug-1958', '1'),
(492, '7', 'm', '26-Apr-1956', '1'),
(493, '8', 'f', '6-May-1966', '1'),
(494, '9', 'f', '23-Jan-1946', '1'),
(495, '10', 'f', '13-Feb-1946', '1'),
(496, '11', 'f', '7-Feb-1950', '1'),
(497, '12', 'm', '11-Jan-1966', '1'),
(498, '13', 'm', '17-Jul-1960', '1'),
(499, '14', 'f', '26-Feb-1949', '1'),
(500, '15', 'm', '29-Aug-1962', '1'),
(501, '16', 'm', '17-Nov-1964', '1'),
(502, '17', 'm', '18-Jul-1962', '1'),
(503, '18', 'm', '20-Mar-1956', '3'),
(504, '19', 'm', '19-Aug-1962', '1'),
(505, '20', 'f', '23-Jan-1940', '1'),
(506, '21', 'f', '19-Feb-1963', '1'),
(507, '22', 'm', '24-Sep-1940', '1'),
(508, '23', 'f', '15-Mar-1965', '1'),
(509, '24', 'f', '27-Mar-1933', '1'),
(510, '25', 'f', '1-Jul-1942', '1'),
(511, '26', 'm', '8-Nov-1966', '1'),
(512, '27', 'm', '19-Mar-1954', '3'),
(513, '28', 'm', '11-Apr-1963', '1'),
(514, '29', 'm', '28-Jan-1944', '3'),
(515, '30', 'm', '17-Sep-1961', '1'),
(516, '31', 'm', '24-Feb-1964', '1'),
(517, '32', 'm', '28-Jan-1954', '3'),
(518, '33', 'm', '18-Mar-1961', '1'),
(519, '34', 'm', '2-Feb-1949', '3'),
(520, '35', 'm', '22-Aug-1961', '3'),
(521, '36', 'f', '7-Aug-1963', '1'),
(522, '37', 'm', '9-Oct-1954', '1'),
(523, '38', 'm', '27-Apr-1962', '1'),
(524, '39', 'm', '22-Jun-1960', '1'),
(525, '40', 'f', '28-Aug-1933', '1'),
(526, '41', 'f', '18-Mar-1961', '1'),
(527, '42', 'm', '23-Sep-1960', '1'),
(528, '43', 'm', '18-Jan-1964', '1'),
(529, '44', 'm', '15-Jun-1963', '1'),
(530, '45', 'm', '2-Aug-1938', '2'),
(531, '46', 'f', '18-Nov-1940', '1'),
(532, '47', 'f', '28-Apr-1938', '1'),
(533, '48', 'm', '7-Jun-1947', '2'),
(534, '49', 'm', '16-Sep-1958', '1'),
(535, '50', 'm', '9-Feb-1960', '3'),
(536, '51', 'm', '8-Jul-1962', '1'),
(537, '52', 'm', '12-Nov-1963', '1'),
(538, '53', 'm', '21-Apr-1954', '3'),
(539, '54', 'm', '4-Jun-1931', '1'),
(540, '55', 'm', '25-Jun-1960', '1'),
(541, '56', 'm', '16-Apr-1962', '1'),
(542, '57', 'm', '15-Apr-1963', '1'),
(543, '58', 'f', '14-Nov-1964', '1'),
(544, '59', 'm', '7-May-1961', '1'),
(545, '60', 'm', '16-Feb-1959', '1'),
(546, '61', 'm', '28-Apr-1964', '1'),
(547, '62', 'm', '18-Jul-1962', '3'),
(548, '63', 'm', '20-Aug-1961', '3'),
(549, '64', 'm', '28-Sep-1963', '3'),
(550, '65', 'm', '28-Mar-1964', '1'),
(551, '66', 'm', '16-Feb-1962', '3'),
(552, '67', 'm', '28-May-1964', '3'),
(553, '68', 'm', '5-May-1963', '3'),
(554, '69', 'm', '23-Jun-1960', '3'),
(555, '70', 'm', '8-Feb-1962', '1'),
(556, '71', 'm', '26-Aug-1948', '3'),
(557, '72', 'f', '7-Jan-1964', '1'),
(558, '73', 'f', '9-Feb-1968', '1'),
(559, '74', 'f', '28-Apr-1933', '1'),
(560, '75', 'f', '12-Aug-1965', '1'),
(561, '76', 'f', '3-Sep-1967', '1'),
(562, '77', 'f', '9-Sep-1968', '1'),
(563, '78', 'f', '20-Aug-1968', '1'),
(564, '79', 'f', '23-Jan-1962', '1'),
(565, '80', 'f', '25-May-1961', '1'),
(566, '81', 'f', '12-Mar-1968', '1'),
(567, '82', 'f', '28-Aug-1947', '1'),
(568, '83', 'f', '12-Oct-1967', '1'),
(569, '84', 'f', '12-Mar-1967', '1'),
(570, '85', 'm', '9-Apr-1962', '1'),
(571, '86', 'm', '25-Aug-1961', '1'),
(572, '87', 'm', '20-Oct-1959', '1'),
(573, '88', 'm', '10-Feb-1962', '3'),
(574, '89', 'm', '24-Jun-1961', '3'),
(575, '90', 'f', '27-Feb-1938', '1'),
(576, '91', 'f', '4-Nov-1967', '1'),
(577, '92', 'f', '25-Jun-1968', '1'),
(578, '93', 'f', '5-Mar-1968', '1'),
(579, '94', 'f', '4-Aug-1950', '1'),
(580, '95', 'f', '8-Aug-1968', '1'),
(581, '96', 'm', '2-Oct-1933', '2'),
(582, '97', 'm', '18-Jan-1953', '1'),
(583, '98', 'm', '17-May-1956', '2'),
(584, '99', 'f', '7-Jul-1968', '1'),
(585, '100', 'm', '25-Oct-1963', '3'),
(586, '101', 'm', '14-Mar-1960', '3'),
(587, '102', 'm', '28-Mar-1963', '1'),
(588, '103', 'm', '17-Mar-1959', '3'),
(589, '104', 'm', '5-Nov-1962', '1'),
(590, '105', 'm', '7-Mar-1966', '1'),
(591, '106', 'm', '4-Aug-1962', '3'),
(592, '107', 'f', '16-Aug-1960', '1'),
(593, '108', 'f', '16-Jul-1930', '1'),
(594, '109', 'm', '10-Nov-1963', '1'),
(595, '110', 'm', '29-Oct-1952', '1'),
(596, '111', 'm', '27-Nov-1940', '2'),
(597, '112', 'm', '21-Jun-1948', '2'),
(598, '113', 'm', '6-Oct-1959', '3'),
(599, '114', 'm', '25-Aug-1961', '1'),
(600, '115', 'm', '12-May-1961', '1'),
(601, '116', 'm', '9-Jun-1962', '1'),
(602, '117', 'f', '14-Jan-1932', '1'),
(603, '118', 'f', '4-Mar-1964', '1'),
(604, '119', 'f', '23-Jul-1963', '1'),
(605, '120', 'f', '12-Nov-1964', '3'),
(606, '121', 'f', '6-Aug-1936', '1'),
(607, '122', 'f', '26-Sep-1965', '1'),
(608, '123', 'f', '24-Apr-1949', '1'),
(609, '124', 'f', '29-May-1963', '1'),
(610, '125', 'm', '6-Aug-1956', '1'),
(611, '126', 'm', '21-Jan-1951', '2'),
(612, '127', 'm', '1-Sep-1950', '2'),
(613, '128', 'f', '25-Jul-1946', '1'),
(614, '129', 'm', '18-Jul-1959', '3'),
(615, '130', 'm', '6-Sep-1958', '3'),
(616, '131', 'm', '8-Feb-1962', '1'),
(617, '132', 'm', '17-May-1953', '1'),
(618, '133', 'm', '12-Sep-1959', '1'),
(619, '134', 'f', '10-Nov-1941', '3'),
(620, '135', 'f', '22-May-1968', '1'),
(621, '136', 'm', '25-Aug-1939', '1'),
(622, '137', 'm', '12-Jul-1937', '3'),
(623, '138', 'm', '9-Jan-1947', '1'),
(624, '139', 'f', '18-Jun-1931', '1'),
(625, '140', 'f', '5-Apr-1965', '1'),
(626, '141', 'f', '14-Jun-1966', '1'),
(627, '142', 'f', '13-Nov-1966', '1'),
(628, '143', 'f', '24-Aug-1939', '1'),
(629, '144', 'f', '28-Aug-1931', '1'),
(630, '145', 'm', '15-Jan-1964', '1'),
(631, '146', 'm', '2-Jan-1951', '1'),
(632, '147', 'm', '11-Sep-1936', '1'),
(633, '148', 'f', '5-Oct-1959', '1'),
(634, '149', 'm', '28-Jun-1962', '1'),
(635, '150', 'm', '5-Mar-1954', '1'),
(636, '151', 'm', '16-Aug-1954', '3'),
(637, '152', 'm', '3-May-1929', '2'),
(638, '153', 'f', '13-May-1967', '1'),
(639, '154', 'f', '7-Jun-1940', '1'),
(640, '155', 'm', '6-Mar-1963', '1'),
(641, '156', 'm', '12-Jan-1963', '1'),
(642, '157', 'f', '2-Jul-1967', '1'),
(643, '158', 'f', '20-Sep-1964', '1'),
(644, '159', 'f', '13-Jan-1951', '1'),
(645, '160', 'm', '27-Aug-1951', '3'),
(646, '161', 'm', '11-Feb-1963', '1'),
(647, '162', 'm', '25-May-1961', '3'),
(648, '163', 'm', '10-Nov-1965', '1'),
(649, '164', 'f', '13-Aug-1965', '1'),
(650, '165', 'f', '29-Apr-1966', '1'),
(651, '166', 'f', '12-Jul-1942', '1'),
(652, '167', 'f', '26-Aug-1932', '1'),
(653, '168', 'f', '23-Apr-1962', '3'),
(654, '169', 'm', '23-May-1965', '1'),
(655, '170', 'm', '13-Jun-1964', '1'),
(656, '171', 'm', '21-Jan-1930', '1'),
(657, '172', 'f', '13-Jun-1953', '1'),
(658, '173', 'm', '15-Jan-1950', '3'),
(659, '174', 'm', '7-Jan-1935', '2'),
(660, '175', 'm', '8-Jan-1938', '1'),
(661, '176', 'f', '5-Oct-1962', '1'),
(662, '177', 'f', '11-Aug-1962', '1'),
(663, '178', 'f', '17-Jan-1938', '1'),
(664, '179', 'm', '19-Jan-1965', '1'),
(665, '180', 'f', '23-Jan-1960', '1'),
(666, '181', 'f', '4-Jan-1939', '1'),
(667, '182', 'f', '8-Mar-1943', '1'),
(668, '183', 'm', '1-Mar-1960', '1'),
(669, '184', 'm', '5-Nov-1964', '1'),
(670, '185', 'm', '28-Aug-1930', '2'),
(671, '186', 'm', '6-Jul-1964', '1'),
(672, '187', 'm', '29-Jul-1963', '3'),
(673, '188', 'f', '4-Feb-1934', '1'),
(674, '189', 'f', '28-Mar-1950', '1'),
(675, '190', 'f', '15-Nov-1932', '1'),
(676, '191', 'f', '23-Oct-1931', '1'),
(677, '192', 'm', '9-Oct-1949', '1'),
(678, '193', 'f', '22-Jul-1966', '1'),
(679, '194', 'f', '10-Apr-1938', '1'),
(680, '195', 'f', '6-Nov-1955', '1'),
(681, '196', 'f', '3-Mar-1946', '1'),
(682, '197', 'm', '1-Oct-1962', '3'),
(683, '198', 'm', '17-Mar-1952', '3'),
(684, '199', 'm', '2-Feb-1958', '3'),
(685, '200', 'm', '13-Feb-1963', '3'),
(686, '201', 'm', '8-May-1955', '1'),
(687, '202', 'm', '17-Mar-1963', '1'),
(688, '203', 'm', '17-Mar-1964', '1'),
(689, '204', 'm', '21-Oct-1960', '1'),
(690, '205', 'm', '22-Jun-1944', '3'),
(691, '206', 'm', '22-May-1943', '2'),
(692, '207', 'm', '15-Feb-1959', '1'),
(693, '208', 'f', '28-Nov-1968', '1'),
(694, '209', 'f', '14-Jan-1934', '1'),
(695, '210', 'm', '4-May-1949', '1'),
(696, '211', 'm', '8-Nov-1950', '1'),
(697, '212', 'm', '14-May-1965', '1'),
(698, '213', 'm', '20-Oct-1945', '2'),
(699, '214', 'f', '13-Sep-1968', '1'),
(700, '215', 'f', '15-Sep-1968', '1'),
(701, '216', 'm', '16-May-1964', '1'),
(702, '217', 'm', '15-Mar-1949', '1'),
(703, '218', 'm', '21-Mar-1964', '1'),
(704, '219', 'm', '2-Feb-1963', '1'),
(705, '220', 'm', '17-Aug-1963', '1'),
(706, '221', 'f', '22-May-1947', '1'),
(707, '222', 'f', '15-Sep-1935', '1'),
(708, '223', 'f', '14-Mar-1942', '1'),
(709, '224', 'f', '20-Nov-1934', '1'),
(710, '225', 'f', '13-Oct-1967', '1'),
(711, '226', 'f', '21-Jun-1964', '1'),
(712, '227', 'f', '17-Jul-1965', '1'),
(713, '228', 'f', '21-Sep-1963', '1'),
(714, '229', 'f', '21-Aug-1940', '1'),
(715, '230', 'm', '4-Feb-1934', '1'),
(716, '231', 'm', '9-Jan-1965', '3'),
(717, '232', 'm', '13-Sep-1963', '3'),
(718, '233', 'm', '21-Jul-1963', '1'),
(719, '234', 'm', '12-Nov-1960', '1'),
(720, '235', 'm', '11-Sep-1962', '3'),
(721, '236', 'f', '2-May-1969', '1'),
(722, '237', 'f', '4-Jun-1969', '1'),
(723, '238', 'f', '15-Jun-1969', '1'),
(724, '239', 'f', '14-Sep-1969', '1'),
(725, '240', 'f', '15-Jun-1961', '3'),
(726, '241', 'f', '27-Aug-1936', '1'),
(727, '242', 'f', '3-Nov-1967', '1'),
(728, '243', 'f', '10-Feb-1969', '1'),
(729, '244', 'f', '15-Sep-1969', '1'),
(730, '245', 'f', '16-Mar-1969', '1'),
(731, '246', 'f', '14-Jan-1968', '1'),
(732, '247', 'f', '13-May-1968', '1'),
(733, '248', 'f', '9-Apr-1969', '1'),
(734, '249', 'f', '9-May-1969', '1'),
(735, '250', 'f', '10-Oct-1966', '1'),
(736, '251', 'f', '19-Jan-1969', '1'),
(737, '252', 'm', '18-Sep-1969', '1'),
(738, '253', 'f', '21-Feb-1942', '1'),
(739, '254', 'm', '8-Feb-1964', '3'),
(740, '255', 'm', '15-Aug-1932', '2'),
(741, '256', 'm', '3-Jan-1948', '3'),
(742, '257', 'm', '24-Sep-1951', '3'),
(743, '258', 'm', '9-Mar-1969', '1'),
(744, '259', 'f', '15-Mar-1969', '1'),
(745, '260', 'f', '20-Feb-1969', '1'),
(746, '261', 'f', '27-Mar-1969', '1'),
(747, '262', 'f', '20-Jun-1968', '1'),
(748, '263', 'f', '13-Oct-1968', '1'),
(749, '264', 'f', '16-Jan-1969', '1'),
(750, '265', 'f', '24-Sep-1969', '1'),
(751, '266', 'f', '7-Oct-1963', '1'),
(752, '267', 'f', '24-Aug-1969', '1'),
(753, '268', 'm', '16-May-1936', '1'),
(754, '269', 'm', '17-Mar-1966', '1'),
(755, '270', 'm', '29-Oct-1947', '1'),
(756, '271', 'm', '24-Aug-1963', '1'),
(757, '272', 'm', '17-Jun-1964', '1'),
(758, '273', 'm', '12-Nov-1939', '2'),
(759, '274', 'm', '4-Aug-1964', '3'),
(760, '275', 'm', '14-Jan-1963', '1'),
(761, '276', 'm', '11-May-1965', '3'),
(762, '277', 'f', '20-May-1965', '3'),
(763, '278', 'f', '12-Jun-1943', '1'),
(764, '279', 'f', '16-Apr-1969', '1'),
(765, '280', 'f', '20-Oct-1969', '1'),
(766, '281', 'm', '18-Feb-1945', '2'),
(767, '282', 'm', '15-Sep-1963', '1'),
(768, '283', 'm', '25-Feb-1963', '3'),
(769, '284', 'm', '10-Oct-1961', '3'),
(770, '285', 'm', '28-May-1930', '2'),
(771, '286', 'm', '7-Mar-1958', '3'),
(772, '287', 'm', '18-Jan-1965', '1'),
(773, '288', 'm', '22-Jan-1955', '3'),
(774, '289', 'm', '27-Oct-1964', '3'),
(775, '290', 'm', '5-Apr-1954', '3'),
(776, '291', 'm', '23-Sep-1934', '2'),
(777, '292', 'm', '7-May-1963', '1'),
(778, '293', 'm', '19-Sep-1965', '1'),
(779, '294', 'm', '10-Oct-1968', '1'),
(780, '295', 'm', '20-Aug-1932', '1'),
(781, '296', 'm', '12-Feb-1964', '1'),
(782, '297', 'f', '16-Apr-1942', '1'),
(783, '298', 'f', '24-Aug-1966', '1'),
(784, '299', 'f', '11-May-1965', '1'),
(785, '300', 'm', '26-May-1960', '1'),
(786, '301', 'm', '4-Aug-1968', '1'),
(787, '302', 'm', '28-Sep-1939', '1'),
(788, '303', 'm', '10-Feb-1938', '2'),
(789, '304', 'f', '28-Sep-1945', '1'),
(790, '305', 'm', '25-Oct-1941', '2'),
(791, '306', 'm', '5-Apr-1966', '1'),
(792, '307', 'm', '24-Jul-1945', '3'),
(793, '308', 'm', '1-Feb-1963', '1'),
(794, '309', 'm', '19-Jul-1964', '1'),
(795, '310', 'm', '23-Mar-1964', '1'),
(796, '311', 'f', '15-Feb-1951', '1'),
(797, '312', 'f', '12-Mar-1963', '1'),
(798, '313', 'f', '25-Oct-1969', '1'),
(799, '314', 'f', '24-Nov-1966', '1'),
(800, '315', 'f', '19-Sep-1969', '1'),
(801, '316', 'm', '14-Jan-1960', '1'),
(802, '317', 'm', '27-Feb-1969', '1'),
(803, '318', 'm', '19-Feb-1961', '3'),
(804, '319', 'm', '2-Mar-1966', '1'),
(805, '320', 'm', '10-Nov-1936', '1'),
(806, '321', 'f', '26-Oct-1953', '1'),
(807, '322', 'f', '2-Mar-1938', '1'),
(808, '323', 'f', '13-May-1967', '1'),
(809, '324', 'f', '14-Oct-1966', '1'),
(810, '325', 'f', '4-Nov-1934', '1'),
(811, '326', 'm', '24-Jul-1958', '2'),
(812, '327', 'm', '2-Mar-1965', '1'),
(813, '328', 'm', '25-Oct-1952', '3'),
(814, '329', 'm', '24-Aug-1958', '3'),
(815, '330', 'm', '9-May-1959', '1'),
(816, '331', 'f', '4-Feb-1942', '1'),
(817, '332', 'f', '10-May-1964', '1'),
(818, '333', 'f', '26-Jan-1965', '1'),
(819, '334', 'f', '9-May-1966', '1'),
(820, '335', 'm', '26-Feb-1930', '2'),
(821, '336', 'm', '10-Jan-1964', '3'),
(822, '337', 'f', '27-Jan-1970', '1'),
(823, '338', 'f', '12-Aug-1938', '1'),
(824, '339', 'f', '7-Nov-1942', '1'),
(825, '340', 'f', '6-May-1934', '1'),
(826, '341', 'm', '20-Jan-1945', '3'),
(827, '342', 'f', '1-Jun-1948', '1'),
(828, '343', 'm', '9-Jun-1953', '3'),
(829, '344', 'm', '13-Oct-1963', '1'),
(830, '345', 'f', '5-May-1969', '1'),
(831, '346', 'f', '16-Aug-1968', '1'),
(832, '347', 'f', '10-Aug-1944', '1'),
(833, '348', 'f', '11-Jun-1962', '3'),
(834, '349', 'f', '22-Mar-1938', '1'),
(835, '350', 'f', '21-Apr-1939', '1'),
(836, '351', 'f', '27-Jan-1966', '1'),
(837, '352', 'f', '26-Nov-1933', '1'),
(838, '353', 'm', '10-Mar-1955', '2'),
(839, '354', 'f', '8-May-1946', '1'),
(840, '355', 'm', '19-May-1961', '1'),
(841, '356', 'm', '10-Nov-1965', '1'),
(842, '357', 'f', '18-Jan-1932', '1'),
(843, '358', 'f', '11-Apr-1944', '1'),
(844, '359', 'f', '12-Jun-1941', '1'),
(845, '360', 'f', '11-Aug-1968', '1'),
(846, '361', 'f', '9-Jun-1966', '1'),
(847, '362', 'f', '8-Apr-1937', '1'),
(848, '363', 'm', '3-Jun-1954', '1'),
(849, '364', 'f', '26-Mar-1947', '1'),
(850, '365', 'f', '16-Oct-1948', '1'),
(851, '366', 'f', '21-Mar-1961', '1'),
(852, '367', 'f', '22-May-1942', '1'),
(853, '368', 'f', '20-Jul-1943', '1'),
(854, '369', 'm', '14-Nov-1967', '1'),
(855, '370', 'f', '20-Jan-1963', '1'),
(856, '371', 'f', '5-Apr-1966', '3'),
(857, '372', 'm', '22-Aug-1935', '1'),
(858, '373', 'm', '29-Oct-1949', '1'),
(859, '374', 'm', '26-Jul-1967', '1'),
(860, '375', 'm', '8-Oct-1966', '1'),
(861, '376', 'm', '9-Oct-1964', '1'),
(862, '377', 'm', '29-Nov-1965', '1'),
(863, '378', 'f', '21-Sep-1930', '1'),
(864, '379', 'f', '12-May-1938', '1'),
(865, '380', 'f', '22-Feb-1941', '1'),
(866, '381', 'm', '15-Jul-1946', '1'),
(867, '382', 'm', '20-Oct-1959', '1'),
(868, '383', 'm', '3-Jun-1961', '3'),
(869, '384', 'f', '11-Nov-1955', '1'),
(870, '385', 'm', '1-Oct-1930', '2'),
(871, '386', 'm', '18-Aug-1934', '2'),
(872, '387', 'm', '3-Feb-1965', '3'),
(873, '388', 'm', '2-Jan-1959', '1'),
(874, '389', 'm', '15-Apr-1959', '3'),
(875, '390', 'f', '9-Nov-1968', '1'),
(876, '391', 'f', '12-Jan-1969', '1'),
(877, '392', 'f', '12-May-1970', '1'),
(878, '393', 'f', '24-Jun-1969', '1'),
(879, '394', 'f', '4-Feb-1970', '1'),
(880, '395', 'f', '9-Mar-1970', '1'),
(881, '396', 'f', '17-Aug-1970', '1'),
(882, '397', 'f', '17-Jan-1970', '1'),
(883, '398', 'f', '21-Nov-1970', '1'),
(884, '399', 'f', '6-Feb-1970', '1'),
(885, '400', 'f', '6-Aug-1969', '1'),
(886, '401', 'f', '14-Mar-1970', '1'),
(887, '402', 'f', '7-Feb-1970', '1'),
(888, '403', 'f', '28-Apr-1970', '1'),
(889, '404', 'f', '1-May-1953', '1'),
(890, '405', 'f', '12-Jul-1944', '1'),
(891, '406', 'm', '5-Oct-1965', '3'),
(892, '407', 'm', '6-Sep-1965', '1'),
(893, '408', 'm', '12-Feb-1964', '3'),
(894, '409', 'm', '21-Nov-1962', '1'),
(895, '410', 'f', '9-Jan-1942', '1'),
(896, '411', 'f', '21-Aug-1931', '1'),
(897, '412', 'f', '16-Jun-1970', '1'),
(898, '413', 'f', '13-Mar-1966', '3'),
(899, '414', 'm', '8-Jan-1961', '2'),
(900, '415', 'm', '2-May-1963', '1'),
(901, '416', 'm', '16-Jan-1965', '1'),
(902, '417', 'm', '22-Jul-1967', '1'),
(903, '418', 'm', '5-Jun-1965', '1'),
(904, '419', 'm', '20-Oct-1964', '1'),
(905, '420', 'm', '16-Jul-1957', '3'),
(906, '421', 'm', '1-Nov-1961', '1'),
(907, '422', 'm', '20-Jul-1963', '1'),
(908, '423', 'f', '26-Apr-1936', '1'),
(909, '424', 'f', '6-Jul-1966', '1'),
(910, '425', 'f', '26-Jan-1942', '1'),
(911, '426', 'm', '27-Oct-1952', '1'),
(912, '427', 'm', '21-Apr-1942', '1'),
(913, '428', 'm', '28-Feb-1964', '1'),
(914, '429', 'm', '13-Aug-1946', '2'),
(915, '430', 'm', '29-Apr-1956', '3'),
(916, '431', 'm', '15-Jan-1959', '3'),
(917, '432', 'm', '12-Mar-1964', '1'),
(918, '433', 'm', '15-Nov-1966', '1'),
(919, '434', 'm', '#NULL!', '1'),
(920, '435', 'm', '24-May-1964', '1'),
(921, '436', 'm', '27-May-1965', '1'),
(922, '437', 'm', '4-Sep-1933', '1'),
(923, '438', 'm', '11-Oct-1964', '1'),
(924, '439', 'f', '25-Jun-1970', '1'),
(925, '440', 'f', '10-Nov-1947', '1'),
(926, '441', 'f', '2-Aug-1949', '1'),
(927, '442', 'f', '18-Sep-1968', '1'),
(928, '443', 'f', '10-Feb-1929', '1'),
(930, '445', 'm', '4-Aug-1963', '1'),
(931, '446', 'm', '3-Aug-1958', '3');
INSERT INTO `staff_list` (`staff_id`, `staff_id_number`, `staff_name`, `department`, `role`) VALUES
(960, 'scc-21-00013293', 'asdasd', 'BSIT', '3'),
(961, 'scc-21-00013294', 'sdasd', 'BSIT', '3'),
(962, 'scc-21-00013295', 'dasdas', 'BSIT', '3'),
(963, 'scc-21-00013296', 'asdasdas', 'BSIT', '3'),
(964, 'scc-21-00013297', 'adasd', 'BSIT', '3'),
(965, 'scc-21-00013298', 'asd', 'BSIT', '3'),
(966, 'scc-21-00013299', 'a', 'BSIT', '3'),
(967, 'scc-21-00013300', 'dasdas', 'BSIT', '3'),
(968, 'scc-21-00013301', 'a', 'BSIT', '3'),
(969, 'scc-21-00013302', 'sdasd', 'BSIT', '3'),
(970, 'scc-21-00013303', 'as', 'BSIT', '3'),
(971, 'scc-21-00013304', 'dasdas', 'BSIT', '3'),
(972, 'scc-21-00013305', 'asd', 'BSIT', '3'),
(973, 'scc-21-00013306', 'as', 'BSIT', '3'),
(974, 'scc-21-00013307', 'dasdas', 'BSIT', '3'),
(975, 'scc-21-00013308', 'a', 'BSIT', '3'),
(976, 'scc-21-00013309', 'f', 'BSIT', '3'),
(977, 'scc-21-00013310', 'g', 'BSIT', '3'),
(978, 'scc-21-00013311', '', 'BSIT', '3'),
(979, 'scc-21-00013312', 'ghh', 'BSIT', '3'),
(980, 'scc-21-00013313', 'hafhshgf', 'BSIT', '3'),
(981, 'scc-21-00013314', 'sj', 'BSIT', '3'),
(982, 'scc-21-00013315', 's', 'BSIT', '3');

-- --------------------------------------------------------

--
-- Table structure for table `studentdailylogs`
--

CREATE TABLE `studentdailylogs` (
  `studentlog_id` int(11) NOT NULL,
  `	regisid` int(11) DEFAULT NULL,
  `log_date` date DEFAULT NULL,
  `timein/timeout` enum('In','Out','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_list`
--

CREATE TABLE `student_list` (
  `student_id` int(11) NOT NULL,
  `student_id_number` varchar(20) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `course` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_list`
--

INSERT INTO `student_list` (`student_id`, `student_id_number`, `student_name`, `year`, `course`) VALUES
(551, 'scc-21-00013292', 'torrejas sherwin', 3, 'BSIT'),
(552, 'scc-21-00013294', 'sdasd', 3, 'BSIT'),
(553, 'scc-21-00013295', 'dasdas', 3, 'BSIT'),
(554, 'scc-21-00013296', 'asdasdas', 3, 'BSIT'),
(555, 'scc-21-00013297', 'adasd', 3, 'BSIT'),
(556, 'scc-21-00013298', 'asd', 3, 'BSIT'),
(557, 'scc-21-00013299', 'a', 3, 'BSIT'),
(558, 'scc-21-00013300', 'dasdas', 3, 'BSIT'),
(559, 'scc-21-00013301', 'a', 3, 'BSIT'),
(560, 'scc-21-00013302', 'sdasd', 3, 'BSIT'),
(561, 'scc-21-00013303', 'as', 3, 'BSIT'),
(562, 'scc-21-00013304', 'dasdas', 3, 'BSIT'),
(563, 'scc-21-00013305', 'asd', 3, 'BSIT'),
(564, 'scc-21-00013306', 'as', 3, 'BSIT'),
(565, 'scc-21-00013307', 'dasdas', 3, 'BSIT'),
(566, 'scc-21-00013308', 'a', 3, 'BSIT'),
(567, 'scc-21-00013309', 'f', 3, 'BSIT'),
(568, 'scc-21-00013310', 'g', 3, 'BSIT'),
(569, 'scc-21-00013311', '', 3, 'BSIT'),
(570, 'scc-21-00013312', 'ghh', 3, 'BSIT'),
(571, 'scc-21-00013313', 'hafhshgf', 3, 'BSIT'),
(572, 'scc-21-00013314', 'sj', 3, 'BSIT'),
(573, 'scc-21-00013315', 's', 3, 'BSIT');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Admin', '', 'admin@mail.com', 'D00F5D5217896FB7FD601412CB890830');

-- --------------------------------------------------------

--
-- Table structure for table `tblattendance`
--

CREATE TABLE `tblattendance` (
  `Id` int(10) NOT NULL,
  `admissionNo` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `sessionTermId` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblattendance`
--

INSERT INTO `tblattendance` (`Id`, `admissionNo`, `classId`, `classArmId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(162, 'ASDFLKJ', '1', '2', '1', '1', '2020-11-01'),
(163, 'HSKSDD', '1', '2', '1', '1', '2020-11-01'),
(164, 'JSLDKJ', '1', '2', '1', '1', '2020-11-01'),
(172, 'HSKDS9EE', '1', '4', '1', '1', '2020-11-01'),
(171, 'JKADA', '1', '4', '1', '0', '2020-11-01'),
(170, 'JSFSKDJ', '1', '4', '1', '1', '2020-11-01'),
(173, 'ASDFLKJ', '1', '2', '1', '1', '2020-11-19'),
(174, 'HSKSDD', '1', '2', '1', '1', '2020-11-19'),
(175, 'JSLDKJ', '1', '2', '1', '1', '2020-11-19'),
(176, 'JSFSKDJ', '1', '4', '1', '0', '2021-07-15'),
(177, 'JKADA', '1', '4', '1', '0', '2021-07-15'),
(178, 'HSKDS9EE', '1', '4', '1', '0', '2021-07-15'),
(179, 'ASDFLKJ', '1', '2', '1', '0', '2021-09-27'),
(180, 'HSKSDD', '1', '2', '1', '1', '2021-09-27'),
(181, 'JSLDKJ', '1', '2', '1', '1', '2021-09-27'),
(182, 'ASDFLKJ', '1', '2', '1', '0', '2021-10-06'),
(183, 'HSKSDD', '1', '2', '1', '0', '2021-10-06'),
(184, 'JSLDKJ', '1', '2', '1', '1', '2021-10-06'),
(185, 'ASDFLKJ', '1', '2', '1', '0', '2021-10-07'),
(186, 'HSKSDD', '1', '2', '1', '0', '2021-10-07'),
(187, 'JSLDKJ', '1', '2', '1', '0', '2021-10-07'),
(188, 'AMS110', '4', '6', '1', '1', '2021-10-07'),
(189, 'AMS133', '4', '6', '1', '0', '2021-10-07'),
(190, 'AMS135', '4', '6', '1', '0', '2021-10-07'),
(191, 'AMS144', '4', '6', '1', '1', '2021-10-07'),
(192, 'AMS148', '4', '6', '1', '0', '2021-10-07'),
(193, 'AMS151', '4', '6', '1', '1', '2021-10-07'),
(194, 'AMS159', '4', '6', '1', '1', '2021-10-07'),
(195, 'AMS161', '4', '6', '1', '1', '2021-10-07'),
(196, 'AMS110', '4', '6', '1', '1', '2022-06-06'),
(197, 'AMS133', '4', '6', '1', '0', '2022-06-06'),
(198, 'AMS135', '4', '6', '1', '0', '2022-06-06'),
(199, 'AMS144', '4', '6', '1', '1', '2022-06-06'),
(200, 'AMS148', '4', '6', '1', '0', '2022-06-06'),
(201, 'AMS151', '4', '6', '1', '1', '2022-06-06'),
(202, 'AMS159', '4', '6', '1', '1', '2022-06-06'),
(203, 'AMS161', '4', '6', '1', '1', '2022-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `tblclass`
--

CREATE TABLE `tblclass` (
  `Id` int(10) NOT NULL,
  `className` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclass`
--

INSERT INTO `tblclass` (`Id`, `className`) VALUES
(1, 'Seven'),
(3, 'Eight'),
(4, 'Nine');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassarms`
--

CREATE TABLE `tblclassarms` (
  `Id` int(10) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmName` varchar(255) NOT NULL,
  `isAssigned` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclassarms`
--

INSERT INTO `tblclassarms` (`Id`, `classId`, `classArmName`, `isAssigned`) VALUES
(2, '1', 'S1', '1'),
(4, '1', 'S2', '1'),
(5, '3', 'E1', '1'),
(6, '4', 'N1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblclassteacher`
--

CREATE TABLE `tblclassteacher` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblclassteacher`
--

INSERT INTO `tblclassteacher` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classArmId`, `dateCreated`) VALUES
(1, 'Will', 'Kibagendi', 'teacher2@mail.com', '32250170a0dca92d53ec9624f336ca24', '09089898999', '1', '2', '2022-10-31'),
(4, 'Demola', 'Ade', 'teacher3@gmail.com', '32250170a0dca92d53ec9624f336ca24', '09672002882', '1', '4', '2022-11-01'),
(5, 'Ryan', 'Mbeche', 'teacher4@mail.com', '32250170a0dca92d53ec9624f336ca24', '7014560000', '3', '5', '2022-10-07'),
(6, 'John', 'Keroche', 'teacher@mail.com', '32250170a0dca92d53ec9624f336ca24', '0100000030', '4', '6', '2022-10-07'),
(7, '', '', '', '32250170a0dca92d53ec9624f336ca24', '', '', '', '2024-06-14');

-- --------------------------------------------------------

--
-- Table structure for table `tblsessionterm`
--

CREATE TABLE `tblsessionterm` (
  `Id` int(10) NOT NULL,
  `sessionName` varchar(50) NOT NULL,
  `termId` varchar(50) NOT NULL,
  `isActive` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblsessionterm`
--

INSERT INTO `tblsessionterm` (`Id`, `sessionName`, `termId`, `isActive`, `dateCreated`) VALUES
(1, '2021/2022', '1', '1', '2022-10-31'),
(3, '2021/2022', '2', '0', '2022-10-31');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudents`
--

CREATE TABLE `tblstudents` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `otherName` varchar(255) NOT NULL,
  `admissionNumber` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classArmId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblstudents`
--

INSERT INTO `tblstudents` (`Id`, `firstName`, `lastName`, `otherName`, `admissionNumber`, `password`, `classId`, `classArmId`, `dateCreated`) VALUES
(1, 'Thomas', 'Omari', 'none', 'AMS005', '12345', '1', '2', '2022-10-31'),
(3, 'Samuel', 'Ondieki', 'none', 'AMS007', '12345', '1', '2', '2022-10-31'),
(4, 'Milagros', 'Oloo', 'none', 'AMS011', '12345', '1', '2', '2022-10-31'),
(5, 'Luis', 'Ayo', 'none', 'AMS012', '12345', '1', '4', '2022-10-31'),
(6, 'Sandra', 'Sagero', 'none', 'AMS015', '12345', '1', '4', '2022-10-31'),
(7, 'Smith', 'Makori', 'Mack', 'AMS017', '12345', '1', '4', '2022-10-31'),
(8, 'Juliana', 'Kerubo', 'none', 'AMS019', '12345', '3', '5', '2022-10-31'),
(9, 'Richard', 'Semo', 'none', 'AMS021', '12345', '3', '5', '2022-10-31'),
(10, 'Jon', 'Mbeeka', 'none', 'AMS110', '12345', '4', '6', '2022-10-07'),
(11, 'Aida', 'Moraa', 'none', 'AMS133', '12345', '4', '6', '2022-10-07'),
(12, 'Miguel', 'Bush', 'none', 'AMS135', '12345', '4', '6', '2022-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `tblterm`
--

CREATE TABLE `tblterm` (
  `Id` int(10) NOT NULL,
  `termName` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblterm`
--

INSERT INTO `tblterm` (`Id`, `termName`) VALUES
(1, 'First'),
(2, 'Second'),
(3, 'Third');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blockrfidstaff`
--
ALTER TABLE `blockrfidstaff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentregis_id` (`staffregis_id`);

--
-- Indexes for table `blockrfidstud`
--
ALTER TABLE `blockrfidstud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentregis_id` (`studentregis_id`);

--
-- Indexes for table `dailylogs`
--
ALTER TABLE `dailylogs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_student_id` (`registeredstudentid`),
  ADD KEY `fk_staff_id` (`registeredstaffid`);

--
-- Indexes for table `registeredrfid_staff`
--
ALTER TABLE `registeredrfid_staff`
  ADD PRIMARY KEY (`registeredstaffid`),
  ADD KEY `registeredrfid_staff_ibfk_1` (`rfid_card_id`),
  ADD KEY `registeredrfid_staff_ibfk_2` (`staff_id`);

--
-- Indexes for table `registeredrfid_student`
--
ALTER TABLE `registeredrfid_student`
  ADD PRIMARY KEY (`registeredstudentid`),
  ADD KEY `registeredrfid_student_ibfk_1` (`rfid_card_id`),
  ADD KEY `registeredrfid_student_ibfk_2` (`student_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`repsid`),
  ADD KEY `logid` (`logid`);

--
-- Indexes for table `rfid_cards`
--
ALTER TABLE `rfid_cards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staffdailylogs`
--
ALTER TABLE `staffdailylogs`
  ADD PRIMARY KEY (`stafflog_id`),
  ADD KEY `registeredstaffid` (`regisstaffid`);

--
-- Indexes for table `staff_list`
--
ALTER TABLE `staff_list`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `studentdailylogs`
--
ALTER TABLE `studentdailylogs`
  ADD PRIMARY KEY (`studentlog_id`),
  ADD KEY `registeredrfid_id` (`	regisid`);

--
-- Indexes for table `student_list`
--
ALTER TABLE `student_list`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblattendance`
--
ALTER TABLE `tblattendance`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclass`
--
ALTER TABLE `tblclass`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblstudents`
--
ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tblterm`
--
ALTER TABLE `tblterm`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blockrfidstaff`
--
ALTER TABLE `blockrfidstaff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blockrfidstud`
--
ALTER TABLE `blockrfidstud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `dailylogs`
--
ALTER TABLE `dailylogs`
  MODIFY `log_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `registeredrfid_staff`
--
ALTER TABLE `registeredrfid_staff`
  MODIFY `registeredstaffid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registeredrfid_student`
--
ALTER TABLE `registeredrfid_student`
  MODIFY `registeredstudentid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `repsid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rfid_cards`
--
ALTER TABLE `rfid_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `staffdailylogs`
--
ALTER TABLE `staffdailylogs`
  MODIFY `stafflog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_list`
--
ALTER TABLE `staff_list`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=983;

--
-- AUTO_INCREMENT for table `studentdailylogs`
--
ALTER TABLE `studentdailylogs`
  MODIFY `studentlog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_list`
--
ALTER TABLE `student_list`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=574;

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblattendance`
--
ALTER TABLE `tblattendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `tblclass`
--
ALTER TABLE `tblclass`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblclassarms`
--
ALTER TABLE `tblclassarms`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblclassteacher`
--
ALTER TABLE `tblclassteacher`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblsessionterm`
--
ALTER TABLE `tblsessionterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblstudents`
--
ALTER TABLE `tblstudents`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblterm`
--
ALTER TABLE `tblterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blockrfidstaff`
--
ALTER TABLE `blockrfidstaff`
  ADD CONSTRAINT `blockrfidstaff_ibfk_1` FOREIGN KEY (`staffregis_id`) REFERENCES `registeredrfid_staff` (`registeredstaffid`);

--
-- Constraints for table `blockrfidstud`
--
ALTER TABLE `blockrfidstud`
  ADD CONSTRAINT `blockrfidstud_ibfk_2` FOREIGN KEY (`studentregis_id`) REFERENCES `registeredrfid_student` (`registeredstudentid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dailylogs`
--
ALTER TABLE `dailylogs`
  ADD CONSTRAINT `fk_staff_id` FOREIGN KEY (`registeredstaffid`) REFERENCES `registeredrfid_staff` (`registeredstaffid`),
  ADD CONSTRAINT `fk_student_id` FOREIGN KEY (`registeredstudentid`) REFERENCES `registeredrfid_student` (`registeredstudentid`);

--
-- Constraints for table `registeredrfid_staff`
--
ALTER TABLE `registeredrfid_staff`
  ADD CONSTRAINT `registeredrfid_staff_ibfk_1` FOREIGN KEY (`rfid_card_id`) REFERENCES `rfid_cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registeredrfid_staff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff_list` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `registeredrfid_student`
--
ALTER TABLE `registeredrfid_student`
  ADD CONSTRAINT `registeredrfid_student_ibfk_1` FOREIGN KEY (`rfid_card_id`) REFERENCES `rfid_cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `registeredrfid_student_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student_list` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`logid`) REFERENCES `dailylogs` (`log_id`);

--
-- Constraints for table `staffdailylogs`
--
ALTER TABLE `staffdailylogs`
  ADD CONSTRAINT `staffdailylogs_ibfk_1` FOREIGN KEY (`regisstaffid`) REFERENCES `registeredrfid_staff` (`registeredstaffid`);

--
-- Constraints for table `studentdailylogs`
--
ALTER TABLE `studentdailylogs`
  ADD CONSTRAINT `studentdailylogs_ibfk_1` FOREIGN KEY (`	regisid`) REFERENCES `registeredrfid_student` (`registeredstudentid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
