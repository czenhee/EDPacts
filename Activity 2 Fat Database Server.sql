-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: valorant
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `agent_view`
--

DROP TABLE IF EXISTS `agent_view`;
/*!50001 DROP VIEW IF EXISTS `agent_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `agent_view` AS SELECT 
 1 AS `agents_name`,
 1 AS `agents_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents` (
  `Agents_ID` int NOT NULL,
  `Agents_Name` varchar(45) NOT NULL,
  `Agents_Type` varchar(45) NOT NULL,
  `Players_ID` int NOT NULL,
  PRIMARY KEY (`Agents_ID`,`Players_ID`),
  KEY `PLayers_ID_idx` (`Players_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'Brimstone','Controller',1),(2,'Viper','Controller',2),(3,'Omen','Controller',3),(4,'Killjoy','Sentinel',4),(5,'Cypher','Sentinel',5),(6,'Sova','Initiator',6),(7,'Sage','Sentinel',7),(9,'Phoenix','Duelist',8),(10,'Jett','Duelist',9),(11,'Reyna','Duelist',10);
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_location`
--

DROP TABLE IF EXISTS `agents_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents_location` (
  `Agents_ID` int NOT NULL,
  `Origin` varchar(45) NOT NULL,
  PRIMARY KEY (`Agents_ID`),
  CONSTRAINT `Agent_ID` FOREIGN KEY (`Agents_ID`) REFERENCES `agents` (`Agents_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_location`
--

LOCK TABLES `agents_location` WRITE;
/*!40000 ALTER TABLE `agents_location` DISABLE KEYS */;
INSERT INTO `agents_location` VALUES (1,'United States'),(2,'United States'),(3,'Unknown'),(4,'Germany'),(5,'Morocco'),(6,'Russia'),(7,'China'),(9,'United Kingdom'),(10,'South Korea'),(11,'Mexico');
/*!40000 ALTER TABLE `agents_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents_realname`
--

DROP TABLE IF EXISTS `agents_realname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agents_realname` (
  `Agents_ID` int NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  KEY `First_Name_idx` (`First_Name`),
  KEY `Agents_ID_idx` (`Agents_ID`),
  CONSTRAINT `Agents_ID` FOREIGN KEY (`Agents_ID`) REFERENCES `agents` (`Agents_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents_realname`
--

LOCK TABLES `agents_realname` WRITE;
/*!40000 ALTER TABLE `agents_realname` DISABLE KEYS */;
INSERT INTO `agents_realname` VALUES (1,'Liam','Byrne'),(2,'Sabine','Callas'),(3,'Unknown','Unknown'),(4,'Klara','Böhringer'),(5,'Amir El','Amari'),(6,'Sasha','Novikov'),(7,'Ling Ying','Wei'),(9,'Jamie','Adeyemi'),(10,'Sunwoo','Han'),(11,'Zyanya','Mondragón');
/*!40000 ALTER TABLE `agents_realname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players_agents`
--

DROP TABLE IF EXISTS `players_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_agents` (
  `Player_ID` int NOT NULL,
  `Player_Name` varchar(45) NOT NULL,
  `Main_Agent` varchar(45) NOT NULL,
  PRIMARY KEY (`Player_ID`),
  CONSTRAINT `PID` FOREIGN KEY (`Player_ID`) REFERENCES `agents` (`Players_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_agents`
--

LOCK TABLES `players_agents` WRITE;
/*!40000 ALTER TABLE `players_agents` DISABLE KEYS */;
INSERT INTO `players_agents` VALUES (1,'Team Jupiter Barce','Brimstone'),(2,'TSM Drone','Phoenix'),(3,'LG Stellar','Sage'),(4,'100T Hiko','Sova'),(5,'FPX Ange1','Viper'),(6,'NV FNS','Cypher'),(7,'KC Scream','Reyna'),(8,'100T Steel','Killjoy'),(9,'NV MummAy','Omen'),(10,'Sen Tenz','Jett');
/*!40000 ALTER TABLE `players_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players_team`
--

DROP TABLE IF EXISTS `players_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_team` (
  `Player_ID` int NOT NULL,
  `PAlias` varchar(45) NOT NULL,
  `PFirst_Name` varchar(45) NOT NULL,
  `PLast_Name` varchar(45) NOT NULL,
  `PTeam_Name` varchar(45) NOT NULL,
  `PAge` int NOT NULL,
  PRIMARY KEY (`Player_ID`),
  CONSTRAINT `Players_ID` FOREIGN KEY (`Player_ID`) REFERENCES `players_agents` (`Player_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_team`
--

LOCK TABLES `players_team` WRITE;
/*!40000 ALTER TABLE `players_team` DISABLE KEYS */;
INSERT INTO `players_team` VALUES (1,'Barce','Takebayashi','Ryo','Team Jupiter',26),(2,'Drone','Taylor','Johnson','TSM',25),(3,'Stellar','Brenden','McGrath','Team Luminosity',26),(4,'Hiko','Martin','Spencer','100 Thieves',32),(5,'Ange1','Kirill','Karasiow','FPX',33),(6,'FNS','Pujan','Mehta','Team Envy',30),(7,'ScreaM','Adil','Benrlitom','Karmine Corp',28),(8,'Steel','Joshua','Nissan','100 Thieves',33),(9,'MummAy','Anthony','DiPaolo','Team Envy',28),(10,'Tenz','Tyson','Ngo','Sentinels',21);
/*!40000 ALTER TABLE `players_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `players_view`
--

DROP TABLE IF EXISTS `players_view`;
/*!50001 DROP VIEW IF EXISTS `players_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `players_view` AS SELECT 
 1 AS `PAlias`,
 1 AS `PFirst_Name`,
 1 AS `PLast_Name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `team_view`
--

DROP TABLE IF EXISTS `team_view`;
/*!50001 DROP VIEW IF EXISTS `team_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `team_view` AS SELECT 
 1 AS `palias`,
 1 AS `pteam_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'valorant'
--
/*!50003 DROP FUNCTION IF EXISTS `addyear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `addyear`(PAge int) RETURNS int
    DETERMINISTIC
BEGIN
RETURN page;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_players_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_players_info`(in age int)
BEGIN
select * from players_team where PAge=age;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `agent_view`
--

/*!50001 DROP VIEW IF EXISTS `agent_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `agent_view` AS select `agents`.`Agents_Name` AS `agents_name`,`agents`.`Agents_Type` AS `agents_type` from `agents` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `players_view`
--

/*!50001 DROP VIEW IF EXISTS `players_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `players_view` AS select `players_team`.`PAlias` AS `PAlias`,`players_team`.`PFirst_Name` AS `PFirst_Name`,`players_team`.`PLast_Name` AS `PLast_Name` from `players_team` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `team_view`
--

/*!50001 DROP VIEW IF EXISTS `team_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `team_view` AS select `players_team`.`PAlias` AS `palias`,`players_team`.`PTeam_Name` AS `pteam_name` from `players_team` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-22 19:18:19
