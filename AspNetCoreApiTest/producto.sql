/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : producto

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-13 17:29:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for aspnetroleclaims
-- ----------------------------
DROP TABLE IF EXISTS `aspnetroleclaims`;
CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `ClaimValue` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetroleclaims
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetroles
-- ----------------------------
DROP TABLE IF EXISTS `aspnetroles`;
CREATE TABLE `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetroles
-- ----------------------------
INSERT INTO `aspnetroles` VALUES ('3183cc03-331q-488b-98fw-b19ebe2681ae', 'administrador', 'administrador', '3183cc03-331q-488b-98fw-b19ebe2681ae');
INSERT INTO `aspnetroles` VALUES ('9bcec911-31dr-454t-9c2y-a7dc747f514u', 'vendedor', 'vendedor', '9bcec911-31dr-454t-9c2y-a7dc747f514u');
INSERT INTO `aspnetroles` VALUES ('b2000f9h-ea6i-452o-a5fp-618e63869c3z', 'cliente', 'cliente', 'b2000f9h-ea6i-452o-a5fp-618e63869c3z');

-- ----------------------------
-- Table structure for aspnetuserclaims
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserclaims`;
CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `ClaimValue` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetuserclaims
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserlogins
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserlogins`;
CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetuserlogins
-- ----------------------------

-- ----------------------------
-- Table structure for aspnetuserroles
-- ----------------------------
DROP TABLE IF EXISTS `aspnetuserroles`;
CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetuserroles
-- ----------------------------
INSERT INTO `aspnetuserroles` VALUES ('3183cc93-3310-488b-98fe-b19ebe2681aa', '3183cc03-331q-488b-98fw-b19ebe2681ae');
INSERT INTO `aspnetuserroles` VALUES ('9bcec916-31d6-4548-9c2d-a7dc747f5148', '9bcec911-31dr-454t-9c2y-a7dc747f514u');
INSERT INTO `aspnetuserroles` VALUES ('b2000f92-ea6e-4524-a5fc-618e63869c31', 'b2000f9h-ea6i-452o-a5fp-618e63869c3z');

-- ----------------------------
-- Table structure for aspnetusers
-- ----------------------------
DROP TABLE IF EXISTS `aspnetusers`;
CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  `Nombre` longtext CHARACTER SET utf8mb4 NOT NULL,
  `Apellido` longtext CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetusers
-- ----------------------------
INSERT INTO `aspnetusers` VALUES ('3183cc93-3310-488b-98fe-b19ebe2681aa', 'frank', null, 'frank@gmail.com', 'FRANK@GMAIL.COM', '1', 'AQAAAAEAACcQAAAAEGa1kM9IQOAXcY4ztwAo4/ttWqB8Fswy9N6zx2swe5XRhG5VuJEcYijbYaT2Ox70dw==', '58e7e482-2efa-4bf2-babc-5ec656094787', 'a0f37dbb-fcc6-4736-954e-cd5e78b3fa1d', null, '0', '0', null, '0', '0', 'Frank', 'Ofoedu');
INSERT INTO `aspnetusers` VALUES ('9bcec916-31d6-4548-9c2d-a7dc747f5148', 'jhon', null, 'jhon@gmail.com', 'JHON@GMAIL.COM', '1', 'AQAAAAEAACcQAAAAEKQUqYBbqzM3i5r8nwE2+cuA4dCbaMezNyb7umtgg06UJPsMjh0vvuzvTpI1KnB/NA==', 'd15f9447-7dd9-4045-8558-ce14255ecc57', 'd4624829-a584-4a1b-bf79-9f9cea549b66', null, '0', '0', null, '0', '0', 'Jhon', 'Whick');
INSERT INTO `aspnetusers` VALUES ('b2000f92-ea6e-4524-a5fc-618e63869c31', 'shaw', null, 'shaw@gmail.com', 'SHAW@GMAIL.COM', '1', 'AQAAAAEAACcQAAAAECQ1o6FuBZY2buVrqqAYWYMSn75UPtc04Lg945uvVoKybr6A4K+W6qSFcNbN6ddd9Q==', 'ac877da2-dbb0-45a2-a788-2fb4498b9cc7', '26c80e4e-7694-4b11-8bc9-a8a6f75772eb', null, '0', '0', null, '0', '0', 'Shaw', 'Owen');

-- ----------------------------
-- Table structure for aspnetusertokens
-- ----------------------------
DROP TABLE IF EXISTS `aspnetusertokens`;
CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of aspnetusertokens
-- ----------------------------

-- ----------------------------
-- Table structure for ordenes
-- ----------------------------
DROP TABLE IF EXISTS `ordenes`;
CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductoId` int(11) NOT NULL,
  `UsuarioId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `Fecha` datetime(6) NOT NULL,
  `Estado` longtext CHARACTER SET utf8mb4 NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IX_Ordenes_ProductoId` (`ProductoId`),
  KEY `IX_Ordenes_UsuarioId` (`UsuarioId`),
  CONSTRAINT `FK_Ordenes_AspNetUsers_UsuarioId` FOREIGN KEY (`UsuarioId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Ordenes_Productos_ProductoId` FOREIGN KEY (`ProductoId`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordenes
-- ----------------------------

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` longtext CHARACTER SET utf8mb4 NOT NULL,
  `Descripcion` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Slug` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `Precio` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of productos
-- ----------------------------

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20210313160549_initial', '3.1.13');
