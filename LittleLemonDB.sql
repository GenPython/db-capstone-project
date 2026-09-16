-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `BookingDate` date NOT NULL,
  `BookingTime` time NOT NULL,
  `TableID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `I1_Bookings` (`CustomerID`),
  KEY `I2_Bookings` (`TableID`),
  KEY `I3_Bookings` (`StaffID`),
  CONSTRAINT `FK_Bookings_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `FK_Bookings_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  CONSTRAINT `FK_Bookings_Table` FOREIGN KEY (`TableID`) REFERENCES `tables` (`TableID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (17,'2026-09-16','19:00:00',1,9,2),(18,'2026-09-16','19:30:00',3,10,4),(19,'2026-09-17','20:00:00',6,11,2),(20,'2026-09-17','20:30:00',4,12,4),(21,'2026-09-18','19:00:00',2,13,2),(22,'2026-09-18','20:00:00',5,14,4),(23,'2026-09-19','19:30:00',7,15,2),(24,'2026-09-23','20:00:00',8,16,4),(26,'2026-09-22','19:00:00',3,9,2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (9,'Marco','Rossi','marco.rossi@email.com','+39 333 1111111'),(10,'Giulia','Bianchi','giulia.bianchi@email.com','+39 333 2222222'),(11,'Luca','Ferrari','luca.ferrari@email.com','+39 333 3333333'),(12,'Sofia','Romano','sofia.romano@email.com','+39 333 4444444'),(13,'Andrea','Esposito','andrea.esposito@email.com','+39 333 5555555'),(14,'Anna','Conti','anna.conti@email.com','+39 333 6666666'),(15,'Matteo','Ricci','matteo.ricci@email.com','+39 333 7777777'),(16,'Elena','Marino','elena.marino@email.com','+39 333 8888888');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `ItemName` varchar(100) NOT NULL,
  `Cuisine` varchar(50) NOT NULL,
  `Course` varchar(50) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Bruschetta','Italian','Starter',7.50),(2,'Garlic Bread','Italian','Starter',6.00),(3,'Margherita Pizza','Italian','Main Course',10.50),(4,'Spaghetti Carbonara','Italian','Main Course',13.50),(5,'Lasagna','Italian','Main Course',14.00),(6,'Grilled Chicken','Italian','Main Course',16.50),(7,'Tiramisu','Italian','Dessert',7.00),(8,'Panna Cotta','Italian','Dessert',6.50),(9,'Fresh Lemonade','Italian','Drink',4.50),(10,'Espresso','Italian','Drink',2.50);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `DeliveryStatusID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Status` varchar(50) NOT NULL,
  PRIMARY KEY (`DeliveryStatusID`),
  KEY `I1_ORDERDELIVERY` (`OrderID`),
  CONSTRAINT `FK_DeliveryStatus_Order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystatus`
--

LOCK TABLES `orderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `orderdeliverystatus` DISABLE KEYS */;
INSERT INTO `orderdeliverystatus` VALUES (1,1,'2026-09-16','Delivered'),(2,2,'2026-09-16','Delivered'),(3,3,'2026-09-17','Out for Delivery'),(4,4,NULL,'Preparing'),(5,5,'2026-09-18','Delivered');
/*!40000 ALTER TABLE `orderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Quantity` int NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderItemID`),
  KEY `I1_ORDERITEM` (`OrderID`) /*!80000 INVISIBLE */,
  KEY `I2_ORDERITEM` (`ItemID`),
  CONSTRAINT `FK_OrderItems_Menu` FOREIGN KEY (`ItemID`) REFERENCES `menu` (`ItemID`),
  CONSTRAINT `FK_OrderItems_Order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,3,3,10.50),(2,1,9,1,4.50),(3,1,7,1,7.00),(4,2,4,1,13.50),(5,2,5,4,14.00),(6,2,10,1,2.50),(7,3,6,2,16.50),(8,3,9,1,4.50),(9,3,7,1,7.00),(10,4,3,1,10.50),(11,4,4,1,13.50),(12,5,5,3,14.00),(13,5,9,1,4.50),(14,5,8,1,6.50);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `OrderDate` date NOT NULL,
  `CustomerID` int NOT NULL,
  `StaffID` int DEFAULT NULL,
  `TotalCost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `I1_ORDER` (`CustomerID`) /*!80000 INVISIBLE */,
  KEY `I2_ORDER` (`StaffID`),
  CONSTRAINT `FK_Orders_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`),
  CONSTRAINT `FK_Orders_Staff` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-09-16',9,2,175.00),(2,'2026-09-16',10,4,220.00),(3,'2026-09-17',11,2,195.00),(4,'2026-09-17',12,4,24.00),(5,'2026-09-18',13,2,53.00);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `Salary` decimal(10,2) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Alessandro','Moretti','Manager',3200.00),(2,'Francesca','De Luca','Waiter',1900.00),(3,'Davide','Costa','Chef',2800.00),(4,'Chiara','Greco','Waiter',1850.00),(5,'Simone','Bruno','Delivery Driver',1750.00),(6,'Valentina','Gallo','Assistant Manager',2400.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `TableID` int NOT NULL AUTO_INCREMENT,
  `TableNumber` int NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`TableID`),
  UNIQUE KEY `TableNumber_UNIQUE` (`TableNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,1,2),(2,2,2),(3,3,4),(4,4,4),(5,5,4),(6,6,6),(7,7,6),(8,8,8);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'littlelemondb'
--

--
-- Dumping routines for database 'littlelemondb'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `AddBooking`(
    IN booking_id INT,
    IN customer_id INT,
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE table_id INT;

    SELECT TableID
    INTO table_id
    FROM `Tables`
    WHERE TableNumber = table_number;

    INSERT INTO Bookings
        (BookingID, CustomerID, BookingDate, BookingTime, TableID, StaffID)
    VALUES
        (booking_id, customer_id, booking_date, '19:00:00', table_id, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddValidBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `AddValidBooking`(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE table_id INT;
    DECLARE booking_count INT DEFAULT 0;

    START TRANSACTION;

    SELECT TableID
    INTO table_id
    FROM `Tables`
    WHERE TableNumber = table_number;

    SELECT COUNT(*)
    INTO booking_count
    FROM Bookings
    WHERE BookingDate = booking_date
      AND TableID = table_id;

    IF booking_count > 0 THEN
        ROLLBACK;
        SELECT 'Table is already booked - booking cancelled' AS BookingStatus;
    ELSE
        INSERT INTO Bookings
            (BookingDate, BookingTime, TableID, CustomerID, StaffID)
        VALUES
            (booking_date, '19:00:00', table_id, 9, 2);

        COMMIT;
        SELECT 'Booking confirmed' AS BookingStatus;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `CancelBooking`(
    IN booking_id INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = booking_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `CancelOrder`(IN order_id INT)
BEGIN
    DELETE FROM OrderDeliveryStatus
    WHERE OrderID = order_id;

    DELETE FROM OrderItems
    WHERE OrderID = order_id;

    DELETE FROM Orders
    WHERE OrderID = order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `CheckBooking`(
    IN booking_date DATE,
    IN table_number INT
)
BEGIN
    DECLARE booking_count INT DEFAULT 0;

    SELECT COUNT(*)
    INTO booking_count
    FROM Bookings b
    JOIN `Tables` t
        ON b.TableID = t.TableID
    WHERE b.BookingDate = booking_date
      AND t.TableNumber = table_number;

    IF booking_count > 0 THEN
        SELECT 'Table is already booked' AS BookingStatus;
    ELSE
        SELECT 'Table is available' AS BookingStatus;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMaxQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM OrderItems;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateBooking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`gennaro`@`localhost` PROCEDURE `UpdateBooking`(
    IN booking_id INT,
    IN new_booking_date DATE
)
BEGIN
    UPDATE Bookings
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`gennaro`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `o`.`OrderID` AS `OrderID`,`oi`.`Quantity` AS `Quantity`,`o`.`TotalCost` AS `Cost` from (`orders` `o` join `orderitems` `oi` on((`o`.`OrderID` = `oi`.`OrderID`))) where (`oi`.`Quantity` > 2) */;
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

-- Dump completed on 2026-09-16 10:21:35
