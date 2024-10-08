-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vptnlhdfmiaxywiqhdzasfppxzxcnddgfcpn` (`primaryOwnerId`),
  CONSTRAINT `fk_rxmxzimfusqdogfppixzewwptcqlvykddaql` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vptnlhdfmiaxywiqhdzasfppxzxcnddgfcpn` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ptvfcvzryzyuoeqqkvuoqiqzhooqqzewyicx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_mzgdhemnjxzirivnsjjvpepjegjozzscgfpf` (`dateRead`),
  KEY `fk_aavndcnveqlvlowohgppnocfuwvkhujehioc` (`pluginId`),
  CONSTRAINT `fk_aavndcnveqlvlowohgppnocfuwvkhujehioc` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ssttfrmsyyxjneszxzqkhuphazyubfpmmkmw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lkziqfmnahsfcpdhizsskthvvdtyvdpncncc` (`sessionId`,`volumeId`),
  KEY `idx_mzcmhphvrucfnpoibvjdoeowoiuvxcqboybq` (`volumeId`),
  CONSTRAINT `fk_afvbgbzjxyutocbylinkjyjuzlrncrstrgiw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_osdsxngbpcjqbtniteghwglzpdelmtrsmrgu` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gbicxwytzkghthkjsrhexawwyutoacuoosmm` (`filename`,`folderId`),
  KEY `idx_fenjsynzvlubgngbrzakbnpkgfrrcwivufwn` (`folderId`),
  KEY `idx_pgudznhkwecaylprtitxtgmajqhsxnpplnhz` (`volumeId`),
  KEY `fk_cppuwjcejerglcaqhyflioaxqmffuzfqnnmr` (`uploaderId`),
  CONSTRAINT `fk_cppuwjcejerglcaqhyflioaxqmffuzfqnnmr` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nxxoiymrkuazdikenuppdpnozgyvcenbtnbc` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ptejopebadugotcvfmwiomallluciszdwzeh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwygbjchcexbqajuacceqlburxyyiqjgqwdy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_jfqeaunvmbmevtznkhvgglljdfsxchogymmm` (`siteId`),
  CONSTRAINT `fk_jfqeaunvmbmevtznkhvgglljdfsxchogymmm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uqjuzltisbiakkpbrqrxefblzuobjivgyioz` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hxczdgqqulhwarsemdwelriycsstvfsfzhnv` (`userId`),
  CONSTRAINT `fk_hxczdgqqulhwarsemdwelriycsstvfsfzhnv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hfguvcmrzsiabesnfarawmmzbeydzftpvbcr` (`groupId`),
  KEY `fk_zfrgklkysaimjyugaaomcsozvdcxzaatzcju` (`parentId`),
  CONSTRAINT `fk_gyrmkkdkthtwcrmttnbcrefeosxozrigxgdw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zfrgklkysaimjyugaaomcsozvdcxzaatzcju` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ziihcuqwcupetycqclsoypfbgscnvwrfatwm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fywxtkrjiphnquvmynqlcvykcfiyuipapanx` (`name`),
  KEY `idx_irzgwswzpnjfvirhsuyhewneeksflwvxfywv` (`handle`),
  KEY `idx_ffoxrmcdqzcislpqlccetuuwngrzhkjcskfs` (`structureId`),
  KEY `idx_fodcqesqwkeslhkovddjypvtoehxvrpglgcr` (`fieldLayoutId`),
  KEY `idx_tuhjdaortdafuxwgjgiyaxmfnczwwphynxsy` (`dateDeleted`),
  CONSTRAINT `fk_hgptzdhgtiowtflhwmhnfgmxsspxkddyfcky` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tddadeexilvkufzmbpkztjhwfzowwgzviewi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pwzckdrtpommienaevxgwgrdmxreuiglgalb` (`groupId`,`siteId`),
  KEY `idx_npomjpybbhpzdwkjobmngfzawwguxgzvhrqk` (`siteId`),
  CONSTRAINT `fk_nmvfnxamzduommfmbdowggkivxbyuqdltumy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wlbcrbxpvsicsxdpfpqosqlspasnlnfrksse` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_smwxmiorrpdgunnqlbyunblbiypkgqcjkhop` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cyqhijspcfltypjtnwhgwobhmfeddhozjjtk` (`siteId`),
  KEY `fk_myzgjzyvhbdsnlhytgmnhavwlwxlhsovcwpv` (`userId`),
  CONSTRAINT `fk_cyqhijspcfltypjtnwhgwobhmfeddhozjjtk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_myzgjzyvhbdsnlhytgmnhavwlwxlhsovcwpv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_tahpnlaoiewmhsqpcgyrylyrkocffwggxjed` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_jooafpxyisqitxegfazeegtmckziypbalpog` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ohccoxagilukfadbriimtlmndnsgrybmbick` (`siteId`),
  KEY `fk_geafufpcargxyzwxyarmdqqvuhmwzrtjexhe` (`fieldId`),
  KEY `fk_jbnmbwyfrgdjdpgqfumghdrsilhychwzrppm` (`userId`),
  CONSTRAINT `fk_fycvwdafkkypspmmmpncxxinzorxsvsjdjaj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_geafufpcargxyzwxyarmdqqvuhmwzrtjexhe` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jbnmbwyfrgdjdpgqfumghdrsilhychwzrppm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ohccoxagilukfadbriimtlmndnsgrybmbick` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gxynylqjhzwlelzyccflpirpmenuqvxipxeb` (`userId`),
  CONSTRAINT `fk_gxynylqjhzwlelzyccflpirpmenuqvxipxeb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_owtngqrxvljczjawftpxxuuouqofftchgrgp` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_xiqsvptjbkfvawnlibywxrnuaroprumlldhe` (`creatorId`,`provisional`),
  KEY `idx_tfoghgmhrwadozvhwlsaeoivcbyeqniriyzn` (`saved`),
  KEY `fk_sbpbvjnjycahmmqbdruhmpsfhmstvvvsjwpd` (`canonicalId`),
  CONSTRAINT `fk_lzearowugkoczrpkzzbmqrogixedwmportzn` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_sbpbvjnjycahmmqbdruhmpsfhmstvvvsjwpd` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_oxkasybmwlahdqprvoivzzczqlkwlthvlaiq` (`elementId`,`timestamp`,`userId`),
  KEY `fk_wauzhgyhhbijmkbqtqxhhuketnievszpzvxa` (`userId`),
  KEY `fk_kciqofomfgmkoppitvjmuucmxmannduwnreu` (`siteId`),
  KEY `fk_segmbmsaximqidrrzqrcnnrkorzbivvdqjtw` (`draftId`),
  CONSTRAINT `fk_kciqofomfgmkoppitvjmuucmxmannduwnreu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_segmbmsaximqidrrzqrcnnrkorzbivvdqjtw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vackouoxvafmocxduonzpfnazwiutuduaddl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wauzhgyhhbijmkbqtqxhhuketnievszpzvxa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rpywolsvslzuwdfbqvnjcltyyatguepsvxjk` (`dateDeleted`),
  KEY `idx_pszbkxkipkbjepcldwhgqqgvffmhhopixotq` (`fieldLayoutId`),
  KEY `idx_cfogxlkdmhdnlsxbkelibdtidnvrfajtwuyh` (`type`),
  KEY `idx_vbzcaiumycfuvvifdfgjzizzfsmpekyuqepk` (`enabled`),
  KEY `idx_uwjlntsuobfvjoidujlwyutfbxotbobedwgy` (`canonicalId`),
  KEY `idx_tsfrudzkwsosesxdkmwpnsutsruxfzzhowjd` (`archived`,`dateCreated`),
  KEY `idx_tkahykspniknifhhkynbsqjtnqmfhcjrqbpa` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_aocidnfilknihzpkfjywfogkbjlvlglurkqd` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_shxgdxkgizuyxiejxzbxjanjrrmznenrerzu` (`draftId`),
  KEY `fk_yjqxhjydjoyugujzxsmzawxohdjqsmnwzkir` (`revisionId`),
  CONSTRAINT `fk_ambovueklwgkhrdsavwmrevknpxivkthuzvu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kzdekrqkzynwpqgyewsndsgwlmvszewyhqla` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_shxgdxkgizuyxiejxzbxjanjrrmznenrerzu` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yjqxhjydjoyugujzxsmzawxohdjqsmnwzkir` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_opoosgxjtzjlxobozyencgjpvimghqnxenna` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_iujoatsfntvbwctcvicbmqxqyyypdwvsquyo` (`ownerId`),
  CONSTRAINT `fk_iujoatsfntvbwctcvicbmqxqyyypdwvsquyo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jxmplhqtsjdittuwmemlvmmllnqffmghzkck` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pxatsjbxopybqhyefpervhmbvmkywvpniioh` (`elementId`,`siteId`),
  KEY `idx_eesgzdbicarorrjgsjfanwziqfcffudmamrn` (`siteId`),
  KEY `idx_kubztrldulbphflokywdhdrtugeqjrjcejnz` (`title`,`siteId`),
  KEY `idx_nzafqlyrrdqxumukscwzbcphpxcunimewfsk` (`slug`,`siteId`),
  KEY `idx_lzcrptquieaarctstlstscezsygiiwrjkaxr` (`enabled`),
  KEY `idx_dhpxtfjlyqkqjzneosymplnxspxgodwgeelc` (`uri`,`siteId`),
  CONSTRAINT `fk_nhvsgdcrjlbtzfebowlcszdbjbjsckfaufer` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ugzhbdgdnfsdzhyaklftexoiujewccbnpwyp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_spyvtajljnnzkjryldqgljkpfidanfqywtmh` (`postDate`),
  KEY `idx_weenltefnqwufjxxosnxrygjywldiexnnbea` (`expiryDate`),
  KEY `idx_hsnhtbawuzdwiqivimfpnwpnvqzkgmuediza` (`sectionId`),
  KEY `idx_gopweqfnwakhlekvjqcplvzxodgjnmnikljp` (`typeId`),
  KEY `idx_fesuycqvcgtxdgfmyrokoyflsruulnfqkowl` (`primaryOwnerId`),
  KEY `idx_hhnmbdlrvtgrpvfrbetvxhpespkjdycmykhf` (`fieldId`),
  KEY `fk_aswtfrvkunoxvqzjtexnshyyibkchdfjjgdh` (`parentId`),
  CONSTRAINT `fk_aswtfrvkunoxvqzjtexnshyyibkchdfjjgdh` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fxrajkhduyvvxalrlmpszsgbwckyejrtabxi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nkdbudtrgzkgxuwuhnvtkinqzcjtmbbqizry` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qepxsmqksplpsigcyptkfwvtkskkayjbbrla` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rjgxfaimtsivjtixfhhcijxrspvbkzggleim` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfympcxqblrhjadhqgohnxwuuyiyiphuhzuc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_fbpkbijsheaxfxvluraowtnoqqltnxidnrau` (`authorId`),
  KEY `idx_tswwxdshqatfqbxwafvokqllepxjcgnhmaeb` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_ffeorwyceajmsdytovitgwjzuerljaqnreoe` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qbomhmisjlbxldvexmghzytmhpbstmhlerhl` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_swhoigcekcccwkeervqrwfhhetwnjhowbqzt` (`fieldLayoutId`),
  KEY `idx_rkxlkdesqrwoefpqindyesigvjxtyzaqwvpy` (`dateDeleted`),
  CONSTRAINT `fk_klfjbpalubitlqsooghcutxcqlagnafxpfhu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cdczrsgbtjmqlsfnsmbsaqwptrvvfykoofny` (`dateDeleted`),
  KEY `idx_hasgmnybgahtwvyuzfvrhwpszkhczejunoti` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eicucgnsnfqlkpnigaxnkxvkcmgogyocyagy` (`handle`,`context`),
  KEY `idx_lskyvyngvfkgyrmvynzfshlkkhqjijsjirob` (`context`),
  KEY `idx_xwaajiykepzuelyiatxnnqxrwfdkbwuddozk` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pdcpztqbnbltvlqeemibcckdzsmsslboxigz` (`name`),
  KEY `idx_mddespugwwnjeraunrevdjskgvfcvlbbipsr` (`handle`),
  KEY `idx_alisnljfiaweteeqydufwedstmgvxfikmboh` (`fieldLayoutId`),
  KEY `idx_pbgeqzsplircypylgmaytijwoyssjcmdxrxs` (`sortOrder`),
  CONSTRAINT `fk_orxspaiyeirexvesnphpbrdzsoeqdywpjlyk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ushdhloduqwgrxidzqjopynlxeqdmuohpcpt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vspwcyoaxmqjtxkpzrzufkzeonbangsazszf` (`accessToken`),
  UNIQUE KEY `idx_ymaepqijmhauhsnsvcvvflgnvomhnntiyunn` (`name`),
  KEY `fk_fzxxqsdewquxjhnchdyavlsgciyclvaarujy` (`schemaId`),
  CONSTRAINT `fk_fzxxqsdewquxjhnchdyavlsgciyclvaarujy` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qyfpoohznwdltpxlyastlkosddowixaizgpv` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_genepugnqsjuracsvthxbudmhhcftbbubjtg` (`name`),
  KEY `idx_aoqmtcriwegjywdgshzdpjfasufexdlgyrku` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tiiouwmhtfgbjplmpxmjdpwigzxwjudhdcbz` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jrvdwenupeexvyyroqoldvzjnxafvpqbtoby` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_hvujytcvoydvynzoykgfabzwbsmmlvphewqs` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_khmewartfnuocrbxyqftugtkpjugnabyoezb` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ukaebvhjrkzvqtvshwdzcjsbmhcjkxaapldq` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_kfwngkgdqxfcrbqhuejmyfiwukzljabmcnjd` (`sourceId`),
  KEY `idx_zbpgyfawyztehwyfczkwzmlbbxeejpmujynm` (`targetId`),
  KEY `idx_lucedhbxssoiyvtaxgkndmjzizkilnarijdv` (`sourceSiteId`),
  CONSTRAINT `fk_dhmjznfwtwbwnpgeimdqwgthqckavnjjayhj` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mqeajysmjerkgztfdciglgyxoyskhguldumg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qhqkbfvdxgkmnllvbvpwxvsgmgyvkbcawuom` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ygnfrnsbhuuvwhnrcgofjcuatiyqurswyvya` (`canonicalId`,`num`),
  KEY `fk_yenurfsgadzltloyddpegfhewbylqkjqpnft` (`creatorId`),
  CONSTRAINT `fk_spvtsgwdagwywetkivcdjmjdmxqqjcmakgci` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yenurfsgadzltloyddpegfhewbylqkjqpnft` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_xprttfonmjhsejigucbznlxyzuiaqdgpsdtp` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wylszbbngttitktetvrhqiyahxfiyrvxfwan` (`handle`),
  KEY `idx_enkciykvrtifrrqgnnfjtvaaoetqbecypokx` (`name`),
  KEY `idx_pggefgonbwjkefkpamdrxptdaawkvmpendnm` (`structureId`),
  KEY `idx_kefdjlciysfuwxzphklongofilmzrqexjddu` (`dateDeleted`),
  CONSTRAINT `fk_gtomubighppnddqfjvnjyropptxlvaackvsl` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_gwdzoxwdhpptxdnhxoqtefafztdtolmzqbho` (`typeId`),
  CONSTRAINT `fk_gwdzoxwdhpptxdnhxoqtefafztdtolmzqbho` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ztexqxvarqcgjfvvildyrpebnljxqwgtqjib` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trjpobrvvkxpdghidbscodhvdovzntplxkec` (`sectionId`,`siteId`),
  KEY `idx_bonbenkxiyrxdeacizhiljumqcbhacarurbi` (`siteId`),
  CONSTRAINT `fk_fgudstmibtqtnpsjsqwoxcvilarahmubinhp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sivxbhgtdkrjfepicgrysnmdbmsxxyxctotl` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_szpnxelkayrnldnevvxpqwzppiyhanibarnm` (`uid`),
  KEY `idx_rnpgqyswulupbaaffzjhilsccjqedmuecfjz` (`token`),
  KEY `idx_ljqbtmyhefexmwpropvkkgvblwklvdnmqiiw` (`dateUpdated`),
  KEY `idx_nkbugchkorlkkhwiofewralxwwcddidhpcne` (`userId`),
  CONSTRAINT `fk_okheqjicnifllzgvnnzjcgqucrlrxczljgpf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_plbxjbipnwavjnvyhucrmaoecppqfvicmjzo` (`userId`,`message`),
  CONSTRAINT `fk_yxkbjpcoyvubzodpouizkoruddoagrjupxtm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kfvhpbsueptxshzthwgbyfxwsduwmecxvbov` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zxsverfifefpbewaajdstnxixleufgugywxs` (`dateDeleted`),
  KEY `idx_yohroyfirgxddjgevifzlkhrlwmtlwriyecz` (`handle`),
  KEY `idx_xphtzvzuhfiejuobmcaedoykxvclqxnfwblc` (`sortOrder`),
  KEY `fk_bpvxjkcufabslqqhjhhiuzypoedtyqpmerav` (`groupId`),
  CONSTRAINT `fk_bpvxjkcufabslqqhjhhiuzypoedtyqpmerav` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_iynicfdknxrphkkovrezncvmhjakksvpkesy` (`userId`),
  CONSTRAINT `fk_iynicfdknxrphkkovrezncvmhjakksvpkesy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_exmkvxrrqkaxntugpqnxhfuydvztedydoonm` (`structureId`,`elementId`),
  KEY `idx_bimemexahuslcwfpxuftgyfkpqemdqoxsuuo` (`root`),
  KEY `idx_abxcoojezgfhudmbafwnxelofpalhetwqsth` (`lft`),
  KEY `idx_vufdelolwwkjtlretctbeyygjwabpuxaknrt` (`rgt`),
  KEY `idx_dxlgmbogtldmryeaseioowuxhxcycblkfcpn` (`level`),
  KEY `idx_icdevjhhdrihiitdxmzxquofpbupscpbuepy` (`elementId`),
  CONSTRAINT `fk_ekgudrmdwciwixfmfejhrxnuocmlzmytvnya` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ggfdmxisxqgfsecwvvvfazmefrpphjorhmmm` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zccyrtxalqmzjgozxscppidszmbsugtnjobm` (`key`,`language`),
  KEY `idx_zckmzjwfowmnyspacealhjqekopcjditowhq` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_odbknszdrzxfzilbgktehbwfdzavzmvjhtpt` (`name`),
  KEY `idx_csxbcnhzcnnucvisghgyzdnxndmpamygfeie` (`handle`),
  KEY `idx_jbjzenicjkqydhbqlvievptgslmzhbpcezye` (`dateDeleted`),
  KEY `fk_fvjudjtozmirqwbapltgklofdfescfbtcfij` (`fieldLayoutId`),
  CONSTRAINT `fk_fvjudjtozmirqwbapltgklofdfescfbtcfij` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vvbgohyhqzpjhfsleplywouecxrefsgfumuc` (`groupId`),
  CONSTRAINT `fk_jttmoewapulkyhlolnacbmhtvtagwfarelro` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stiwscskdfnqcxhtefbspmtvtavhmiwglhwm` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vugumfkuonzzdgkmbwrjakqvdevtuwxyuekb` (`token`),
  KEY `idx_uvdovswrgafzikuewjabkbvrliztadjtjjie` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fmadzlytllphsitzlbqxyejsqbsamfufygbn` (`handle`),
  KEY `idx_hywvbkwowtlxklhfdaehoilhcelnfqegfzvz` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cfqelckfypgszdonjtlnclgoktluponfhwby` (`groupId`,`userId`),
  KEY `idx_adlapmmztvindcxoasnxnnkasjqhwkkyydjq` (`userId`),
  CONSTRAINT `fk_kkgagjgzggefnixlactzplpymvcajmflrykv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_skaiucbtuvrnbwcrsmnvegyayjchhmxhdqsx` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vwaewjwuyaizitlrjqtsmheovsbcdyytyytb` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sabnapavvuwbqzzevdsmxxodaahxufjgetxk` (`permissionId`,`groupId`),
  KEY `idx_jlxamqjmnioxuypbxxuhyurnvgbgxeupxchr` (`groupId`),
  CONSTRAINT `fk_askczrnnxejguynisqmxxacrskyahxqdczbq` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_juthmikmvtoxhpnqxplekfybaxnaplnpiuuc` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jsegortiwmtlqhrjkevyhcouvddodxksorpn` (`permissionId`,`userId`),
  KEY `idx_bwnfdeoygjwctkyglmraaiwjiqovvwxrtdtw` (`userId`),
  CONSTRAINT `fk_ruquyewicrwammhtcqkouxzvfbejeaoyrmlh` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdrrhbyncqnjawdccrlupubqivmfggxqijpi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_athbbnfqgsimuojavkhoxxvfrfrgyptxbbgc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pfueyhgxhytamrayibmifetijpqvbeqmohiu` (`active`),
  KEY `idx_ybagscgtrqqdyyvnqxztqsnknlgflaaxlnhj` (`locked`),
  KEY `idx_lyyanmnectzrqvruxhyddvgfzrrapbndaraw` (`pending`),
  KEY `idx_jwhvtocpqtygxjnhezrdrxwjfzbyghburfem` (`suspended`),
  KEY `idx_ibgbfjixozrftzbyzmtuyfaefwcunswybnbz` (`verificationCode`),
  KEY `idx_czsdvabcsoeximtkvzqnvzdfhvddvwfidgme` (`email`),
  KEY `idx_nnmutskferyqcqkhewcqzidhgxtmorkpakuj` (`username`),
  KEY `fk_efhrlnomcdpydwfonstbimfapqycgqnrnslb` (`photoId`),
  CONSTRAINT `fk_efhrlnomcdpydwfonstbimfapqycgqnrnslb` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_laulxjcpqlxdytvvsjsqtchbckuoxoykfgve` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sgvbgymrlvahnbkpgtilvbkbozhelgujsffy` (`name`,`parentId`,`volumeId`),
  KEY `idx_wawuodjxjkozwelvjlvfcoxwlkpverxolsgb` (`parentId`),
  KEY `idx_hgehgzjvpajmuknzacipjlwwzymhqclsxumr` (`volumeId`),
  CONSTRAINT `fk_pfxoxzbucwsbzzxrauybrrkrntwgsyqntunl` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zmcjneiebvpzdsfoaoxfbmlhpjmbleyxkdoo` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kiekxkrqlecftwsjprtveovzugclflyimplk` (`name`),
  KEY `idx_sohrxuvkupenbvfgutbpsxykfprpldchhmif` (`handle`),
  KEY `idx_cpufhedgtepevebfnvgpqkcppsvfncdnggdt` (`fieldLayoutId`),
  KEY `idx_iwskefsegvnrclsgfjeezagiskdyumjclhgp` (`dateDeleted`),
  CONSTRAINT `fk_tolhnptmrgairvtvuknrguplsqsneskmpwik` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ipeizgkekqlntkmqzhizgtccpthdonsclltn` (`userId`),
  CONSTRAINT `fk_ipeizgkekqlntkmqzhizgtccpthdonsclltn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gmlvednzdxqbmtgjtkxplvnncsyqunzzlhkk` (`userId`),
  CONSTRAINT `fk_cghnktvqzzrigsguzytcukooienxehaefbxw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-09 12:52:09
-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES
(5,1,1,1,'massimo-sartirana-W_mBu-aC2m8-unsplash.jpg','image',NULL,5616,3744,2582359,NULL,NULL,NULL,'2024-09-06 08:21:57','2024-09-06 08:21:57','2024-09-06 08:21:57'),
(10,1,4,1,'alex-shutin-kKvQJ6rK6S4-unsplash.jpg','image',NULL,4135,2760,490077,NULL,NULL,NULL,'2024-09-06 08:34:19','2024-09-06 08:34:19','2024-09-06 08:34:19'),
(11,1,4,1,'alessio-soggetti-GYr9A2CPMhY-unsplash.jpg','image',NULL,6016,4016,1905211,NULL,NULL,NULL,'2024-09-06 08:34:19','2024-09-06 08:34:19','2024-09-06 08:34:19'),
(12,1,4,1,'massimo-sartirana-W_mBu-aC2m8-unsplash.jpg','image',NULL,5616,3744,2582359,NULL,NULL,NULL,'2024-09-06 08:34:20','2024-09-06 08:34:20','2024-09-06 08:34:20');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets_sites` VALUES
(5,1,NULL),
(10,1,NULL),
(11,1,NULL),
(12,1,NULL);
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES
(2,1,'title','2024-09-06 08:21:58',0,1),
(7,1,'postDate','2024-09-06 08:33:52',0,1),
(7,1,'slug','2024-09-06 08:32:40',0,1),
(7,1,'title','2024-09-06 08:32:40',0,1),
(7,1,'uri','2024-09-06 08:32:40',0,1),
(47,1,'enabled','2024-09-06 09:16:04',0,1),
(47,1,'uri','2024-09-06 09:11:59',0,1),
(57,1,'postDate','2024-09-06 09:34:41',0,1),
(57,1,'slug','2024-09-06 09:34:20',0,1),
(57,1,'title','2024-09-06 09:34:20',0,1),
(57,1,'uri','2024-09-06 09:34:20',0,1),
(58,1,'postDate','2024-09-06 09:34:30',0,1),
(61,1,'postDate','2024-09-06 09:35:30',0,1),
(61,1,'slug','2024-09-06 09:35:22',0,1),
(61,1,'title','2024-09-06 09:35:22',0,1),
(61,1,'uri','2024-09-06 09:35:22',0,1),
(69,1,'postDate','2024-09-06 11:58:04',0,1),
(69,1,'slug','2024-09-06 11:58:04',0,1),
(69,1,'title','2024-09-06 11:57:55',0,1),
(71,1,'postDate','2024-09-06 11:58:24',0,1),
(71,1,'slug','2024-09-06 11:58:24',0,1),
(71,1,'title','2024-09-06 11:58:17',0,1),
(73,1,'slug','2024-09-06 12:04:28',0,1),
(73,1,'title','2024-09-06 12:04:21',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES
(2,1,1,'3ceb3fd0-a647-4a3b-90c9-585ff075bf97','2024-09-06 09:42:43',0,1),
(2,1,1,'8b38108b-b7ae-4247-b96b-8baec0c514ef','2024-09-06 08:21:58',0,1),
(2,1,2,'0efaae5b-b8c6-48e2-801c-10d2916bcdd8','2024-09-06 08:21:58',0,1),
(7,1,1,'07450d5b-3a3e-42ca-a224-57db0e9716a5','2024-09-06 08:33:52',0,1),
(7,1,1,'83378ed0-a8e8-47ab-8eb7-cf323a1621fc','2024-09-06 08:33:52',0,1),
(7,1,3,'cdd4a58f-94f7-4702-a78e-5d3f802f71c6','2024-09-06 08:34:32',0,1),
(7,1,7,'041b7644-dc0b-4bfb-be94-2bd65fae0c2f','2024-09-06 09:19:17',0,1),
(7,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:07:51',0,1),
(7,1,10,'e9bfd649-01d3-4c1e-9864-e40e799fb12f','2024-09-06 09:37:05',0,1),
(22,1,6,'c42f398e-cc92-493a-a04d-5ae11e99c8f9','2024-09-06 09:19:17',0,1),
(39,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:07:51',0,1),
(53,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:19:17',0,1),
(55,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:24:23',0,1),
(56,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:28:20',0,1),
(57,1,3,'5d5e5748-912b-4cad-b85f-0215a0f8bbcf','2024-09-06 09:34:41',0,1),
(57,1,9,'4764437f-a6f3-4589-abfe-08bd68964782','2024-09-06 09:34:41',0,1),
(58,1,6,'c42f398e-cc92-493a-a04d-5ae11e99c8f9','2024-09-06 09:34:30',0,1),
(59,1,9,'4764437f-a6f3-4589-abfe-08bd68964782','2024-09-06 09:34:41',0,1),
(61,1,3,'5d5e5748-912b-4cad-b85f-0215a0f8bbcf','2024-09-06 09:35:30',0,1),
(61,1,9,'4764437f-a6f3-4589-abfe-08bd68964782','2024-09-06 09:35:30',0,1),
(64,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:37:05',0,1),
(68,1,9,'70e7cc66-4147-48dc-8818-f7531c31f562','2024-09-06 09:56:26',0,1),
(69,1,1,'51a112c8-8359-465b-883f-593494b546bd','2024-09-06 11:58:04',0,1),
(69,1,1,'5cdc702e-292c-4770-b3c6-aaafd0b108c0','2024-09-06 11:58:04',0,1),
(71,1,1,'51a112c8-8359-465b-883f-593494b546bd','2024-09-06 11:58:24',0,1),
(71,1,1,'5cdc702e-292c-4770-b3c6-aaafd0b108c0','2024-09-06 11:58:24',0,1),
(73,1,1,'51a112c8-8359-465b-883f-593494b546bd','2024-09-06 12:04:28',0,1),
(73,1,1,'5cdc702e-292c-4770-b3c6-aaafd0b108c0','2024-09-06 12:04:28',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES
(1,1,1,NULL,'view','2024-09-06 09:41:13'),
(2,1,1,NULL,'edit','2024-09-06 09:42:43'),
(2,1,1,NULL,'save','2024-09-06 09:56:22'),
(2,1,1,NULL,'view','2024-09-06 09:56:20'),
(7,1,1,NULL,'edit','2024-09-06 09:37:03'),
(7,1,1,NULL,'save','2024-09-06 09:56:26'),
(7,1,1,NULL,'view','2024-09-09 11:39:39'),
(47,1,1,NULL,'save','2024-09-06 09:16:04'),
(47,1,1,NULL,'view','2024-09-06 09:15:52'),
(57,1,1,NULL,'save','2024-09-06 09:34:41'),
(57,1,1,NULL,'view','2024-09-06 09:34:29'),
(58,1,1,NULL,'save','2024-09-06 09:34:30'),
(61,1,1,NULL,'save','2024-09-06 09:35:30'),
(61,1,1,NULL,'view','2024-09-06 09:35:17'),
(69,1,1,NULL,'save','2024-09-06 11:58:04'),
(69,1,1,NULL,'view','2024-09-06 11:57:49'),
(71,1,1,NULL,'save','2024-09-06 11:58:24'),
(71,1,1,NULL,'view','2024-09-06 11:58:22'),
(73,1,1,NULL,'save','2024-09-06 12:04:28'),
(73,1,1,NULL,'view','2024-09-06 12:04:15');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-03-11 23:24:29','2024-03-11 23:24:29',NULL,NULL,NULL,'b8eb9ba3-120a-4633-9676-a5994090dc1a'),
(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2024-09-06 08:20:54','2024-09-06 09:56:22',NULL,NULL,NULL,'b3c37edb-cc7c-4fda-b985-e434110758cc'),
(3,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2024-09-06 08:20:54','2024-09-06 08:20:54',NULL,NULL,NULL,'6697620b-fa9b-495e-b991-f93362b942b8'),
(5,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-09-06 08:21:56','2024-09-06 08:21:56',NULL,NULL,NULL,'030ce6c0-6702-43c5-a98f-8f0affa75f65'),
(6,2,NULL,2,2,'craft\\elements\\Entry',1,0,'2024-09-06 08:21:58','2024-09-06 08:21:59',NULL,NULL,NULL,'e21f6bb0-1350-443e-875d-dbdbbbd9be50'),
(7,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2024-09-06 08:32:33','2024-09-06 09:56:26',NULL,NULL,NULL,'b84157da-c97a-4335-8c36-4aef9aa2f5ce'),
(8,7,NULL,3,3,'craft\\elements\\Entry',1,0,'2024-09-06 08:33:52','2024-09-06 08:33:52',NULL,NULL,NULL,'840d9497-86e5-4c92-975f-c1b9ee0bb3fb'),
(10,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-09-06 08:34:18','2024-09-06 08:34:18',NULL,NULL,NULL,'f5074640-638d-4bb7-9ff9-b36daf8154dc'),
(11,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-09-06 08:34:19','2024-09-06 08:34:19',NULL,NULL,NULL,'d920ced4-189c-423c-848c-0a7da90aa6f0'),
(12,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2024-09-06 08:34:20','2024-09-06 08:34:20',NULL,NULL,NULL,'f9721021-f64b-4594-9384-934e6894a019'),
(13,7,NULL,4,3,'craft\\elements\\Entry',1,0,'2024-09-06 08:34:32','2024-09-06 08:34:32',NULL,NULL,NULL,'bc229258-48f7-425f-a469-9e9e917becf4'),
(20,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'f4a99f3e-9d18-4f84-8895-6dd7800fc988'),
(21,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'e47a155f-6985-411f-a69f-36b17a832262'),
(22,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:19:17',NULL,NULL,NULL,'52e64ba4-e5da-47cb-8eea-c7dee1b7f38b'),
(23,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'fd59ece5-3006-46e2-8481-265fbc9c7faa'),
(24,7,NULL,5,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'c0dee5b4-c3e9-4074-93be-df0f94cf0dfc'),
(25,20,NULL,6,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'044bd1f1-c242-4f5c-9e88-dbacfa7affd8'),
(26,21,NULL,7,4,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'a994c193-5e94-407e-9e91-1c4022ff2d9f'),
(27,22,NULL,8,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'f75f8700-bb57-4554-991b-e5bc81726caa'),
(28,23,NULL,9,5,'craft\\elements\\Entry',1,0,'2024-09-06 09:02:44','2024-09-06 09:02:44',NULL,NULL,NULL,'4464f4e4-9cfa-4d63-b980-6e33db55e4ed'),
(30,7,NULL,10,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:03:50','2024-09-06 09:03:50',NULL,NULL,NULL,'88183c03-c62d-431c-9eea-4a64e80ec675'),
(36,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:07:51',NULL,NULL,NULL,'f126acb2-c841-404f-9cce-3d076cfea430'),
(37,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:07:51',NULL,NULL,NULL,'128472ec-92e8-453b-8906-5e5a5293de1f'),
(38,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:07:51',NULL,NULL,NULL,'7b60d107-a39c-436d-bed7-580d4e46ef0e'),
(39,7,NULL,11,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:07:51',NULL,NULL,NULL,'1aac8e92-9c4a-4790-a62f-5e1e970089a9'),
(40,36,NULL,12,4,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:56:26',NULL,NULL,NULL,'f503a4b2-8c55-4846-bf7d-572027333a88'),
(41,37,NULL,13,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:56:26',NULL,NULL,NULL,'630109cb-72d8-4de7-9d12-4dd79b32a774'),
(42,38,NULL,14,5,'craft\\elements\\Entry',1,0,'2024-09-06 09:07:51','2024-09-06 09:07:51',NULL,NULL,NULL,'242bc7d6-213a-4520-8f9f-8303d1454dda'),
(45,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:11:47','2024-09-06 09:12:52',NULL,NULL,NULL,'e0292fed-9950-41cf-a942-374f339e414d'),
(46,45,NULL,16,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:11:47','2024-09-06 09:11:47',NULL,NULL,NULL,'618f4fe3-9aa9-4369-a8c4-b1840b6f73d9'),
(47,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:11:59','2024-09-06 09:16:04',NULL,NULL,NULL,'34276d86-1798-41b3-a92d-3149a57540bc'),
(48,47,NULL,17,7,'craft\\elements\\Entry',0,0,'2024-09-06 09:11:59','2024-09-06 09:11:59',NULL,NULL,NULL,'68942e10-4c4c-4bed-9c5f-708d451a7291'),
(49,45,NULL,18,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:12:52','2024-09-06 09:12:52',NULL,NULL,NULL,'023621c6-b1e0-47ff-b475-1ecd851b1735'),
(50,47,NULL,19,7,'craft\\elements\\Entry',1,0,'2024-09-06 09:16:04','2024-09-06 09:16:04',NULL,NULL,NULL,'98e90f3d-7cba-4dc1-97fe-f6a276e28564'),
(53,7,NULL,20,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:19:17','2024-09-06 09:19:17',NULL,NULL,NULL,'8145db1c-8747-4a4f-817e-a69624e7c77d'),
(54,22,NULL,21,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:19:17','2024-09-06 09:19:17',NULL,NULL,NULL,'d06f916c-af6f-425a-9b65-df63e305afc9'),
(55,7,NULL,22,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:24:23','2024-09-06 09:24:23',NULL,NULL,NULL,'0e246058-fd44-48b3-9408-11af8dc5e3bc'),
(56,7,NULL,23,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:28:20','2024-09-06 09:28:20',NULL,NULL,NULL,'c8f1c000-bf24-4132-8524-3c7292aa51a2'),
(57,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2024-09-06 09:33:58','2024-09-06 09:34:41',NULL,NULL,NULL,'efcf8e17-af65-4c3b-b802-3bdd4f5beaaf'),
(58,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:34:24','2024-09-06 09:34:41',NULL,NULL,NULL,'443eb686-63b3-4ddf-ae69-fc9d2f0c2309'),
(59,57,NULL,24,9,'craft\\elements\\Entry',1,0,'2024-09-06 09:34:41','2024-09-06 09:34:41',NULL,NULL,NULL,'b67f06a9-c279-4ad3-9ed1-70e445d3376f'),
(60,58,NULL,25,6,'craft\\elements\\Entry',1,0,'2024-09-06 09:34:41','2024-09-06 09:34:41',NULL,NULL,NULL,'f3276736-81e9-4dd3-b078-33d7c7f5b7cb'),
(61,NULL,NULL,NULL,9,'craft\\elements\\Entry',1,0,'2024-09-06 09:35:17','2024-09-06 09:35:30',NULL,NULL,NULL,'b2b37223-d9e7-4b47-8dd7-2b39535b8794'),
(62,61,NULL,26,9,'craft\\elements\\Entry',1,0,'2024-09-06 09:35:30','2024-09-06 09:35:30',NULL,NULL,NULL,'63e3aa01-03f0-4510-9451-8f4dd39840c9'),
(64,7,NULL,27,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:37:05','2024-09-06 09:37:05',NULL,NULL,NULL,'cc20d691-d96d-4b85-acd9-ba4f3adaa2da'),
(66,2,NULL,28,2,'craft\\elements\\Entry',1,0,'2024-09-06 09:42:43','2024-09-06 09:42:43',NULL,NULL,NULL,'acf44c23-90f0-4565-a0cf-489ad22fcf2a'),
(67,2,NULL,29,2,'craft\\elements\\Entry',1,0,'2024-09-06 09:56:22','2024-09-06 09:56:22',NULL,NULL,NULL,'7872598f-3163-41b1-8c62-0f7f3d0ed5c8'),
(68,7,NULL,30,3,'craft\\elements\\Entry',1,0,'2024-09-06 09:56:26','2024-09-06 09:56:26',NULL,NULL,NULL,'655ec451-d926-4af5-89e7-aac6f31658a5'),
(69,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2024-09-06 11:57:34','2024-09-06 11:58:04',NULL,NULL,NULL,'7c8d5b46-9619-4845-9017-72ba15321611'),
(70,69,NULL,31,10,'craft\\elements\\Entry',1,0,'2024-09-06 11:58:04','2024-09-06 11:58:04',NULL,NULL,NULL,'920f1836-f3f3-4759-b75b-9432d37fab91'),
(71,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2024-09-06 11:58:06','2024-09-06 11:58:24',NULL,NULL,NULL,'ec867d9d-7329-4b37-af30-0a56a9493103'),
(72,71,NULL,32,10,'craft\\elements\\Entry',1,0,'2024-09-06 11:58:24','2024-09-06 11:58:24',NULL,NULL,NULL,'bc2e1984-89cb-4e1a-80ff-64a3e1a7fe0f'),
(73,NULL,NULL,NULL,10,'craft\\elements\\Entry',1,0,'2024-09-06 12:04:00','2024-09-06 12:04:28',NULL,NULL,NULL,'b13d97ed-a40f-41a8-8a7e-58c149ecb11d'),
(74,73,NULL,33,10,'craft\\elements\\Entry',1,0,'2024-09-06 12:04:28','2024-09-06 12:04:28',NULL,NULL,NULL,'82063283-abf8-4065-b6c7-3c34cf1e0a44');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_owners` VALUES
(20,7,2),
(21,7,1),
(22,7,3),
(23,22,1),
(25,24,1),
(25,30,2),
(25,39,2),
(25,53,2),
(25,55,2),
(25,56,2),
(25,64,2),
(25,68,2),
(26,24,2),
(26,30,1),
(26,39,1),
(26,53,1),
(26,55,1),
(26,56,1),
(26,64,1),
(26,68,1),
(27,24,3),
(27,30,3),
(27,39,3),
(28,27,1),
(36,7,1),
(37,7,2),
(38,37,1),
(40,39,1),
(40,53,1),
(40,55,1),
(40,56,1),
(40,64,1),
(40,68,1),
(41,39,2),
(41,53,2),
(41,55,2),
(41,56,2),
(41,64,2),
(41,68,2),
(42,41,1),
(54,53,3),
(54,55,3),
(54,56,3),
(54,64,3),
(54,68,3),
(58,57,1),
(60,59,1);
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,NULL,NULL,1,'2024-03-11 23:24:29','2024-03-11 23:24:29','5fc4e708-fda1-4d9f-915c-9849d7c0684a'),
(2,2,1,'Get out and Explore the Trails','homepage','__home__','{\"0efaae5b-b8c6-48e2-801c-10d2916bcdd8\": [5], \"3ceb3fd0-a647-4a3b-90c9-585ff075bf97\": \"Super fun running vacations and adventures for runners of all abilities. Wouldn\'t you rather run than sit at a pool and drink?\", \"8b38108b-b7ae-4247-b96b-8baec0c514ef\": \"Get out and Explore the Trails\"}',1,'2024-09-06 08:20:54','2024-09-06 09:42:43','5f830eb4-635f-47a5-9849-4dba349fa0b0'),
(3,3,1,'Homepage','homepage','__home__',NULL,1,'2024-09-06 08:20:54','2024-09-06 08:20:54','bf0a2fad-3fb4-4547-ae15-4929f7f4b915'),
(5,5,1,'Massimo sartirana W m Bu a C2m8 unsplash',NULL,NULL,NULL,1,'2024-09-06 08:21:56','2024-09-06 08:21:56','63a41b02-ffab-41fd-8f46-339571a28fdc'),
(6,6,1,'Get out and Explore the Trails','homepage','__home__','{\"3ceb3fd0-a647-4a3b-90c9-585ff075bf97\": \"Fun running vacations and adventures for runners of all abilities. Wouldn\'t you rather run than sit at a pool and drink?\", \"8b38108b-b7ae-4247-b96b-8baec0c514ef\": \"Get out and Explore the Trails\"}',1,'2024-09-06 08:21:59','2024-09-06 08:21:59','2028b4c8-acec-4ca5-aaed-44371e247280'),
(7,7,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"36\\\"> </craft-entry><craft-entry data-entry-id=\\\"37\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11], \"e9bfd649-01d3-4c1e-9864-e40e799fb12f\": [57]}',1,'2024-09-06 08:32:33','2024-09-06 09:37:05','c21bbb1a-9977-4312-8a21-c72c54a0072d'),
(8,8,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\"}',1,'2024-09-06 08:33:52','2024-09-06 08:33:52','704c33a2-0b4e-45aa-9883-c22beb9dac3c'),
(10,10,1,'Alex shutin k Kv QJ6r K6 S4 unsplash',NULL,NULL,NULL,1,'2024-09-06 08:34:18','2024-09-06 08:34:18','1c325476-486d-4ecd-8b28-245496d8ff40'),
(11,11,1,'Alessio soggetti G Yr9 A2 CP Mh Y unsplash',NULL,NULL,NULL,1,'2024-09-06 08:34:19','2024-09-06 08:34:19','355e3dfc-a150-4a49-b724-48ef66260c1e'),
(12,12,1,'Massimo sartirana W m Bu a C2m8 unsplash',NULL,NULL,NULL,1,'2024-09-06 08:34:20','2024-09-06 08:34:20','c100add4-ea3c-4eb6-9eae-6f1229592cc9'),
(13,13,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\"}',1,'2024-09-06 08:34:32','2024-09-06 08:34:32','23cae0dc-f5d5-4dc1-98cd-645fd612ae26'),
(20,20,1,NULL,'__temp_euxgmwduumpwtojwsnyiqyrrzaonyhspujlc',NULL,'{\"f422b20c-b6e6-4100-8f0a-60b27f99ea7e\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p>\"}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','77b004f3-7f83-4555-a628-327554292700'),
(21,21,1,'Big Bend Bounce Stats','big-bend-bounce-stats',NULL,'{\"43a92626-2af7-4746-b31b-6f2e0157b7d4\": [{\"col1\": \"Total Miles\", \"col2\": \"64\"}, {\"col1\": \"Days\", \"col2\": \"4\"}, {\"col1\": \"Elevation Gain\", \"col2\": \"9200ft\"}, {\"col1\": \"Cost\", \"col2\": \"$1299\"}]}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','1a88ceef-0878-461f-ac71-6dfc03e7d895'),
(22,22,1,'Sign Up Now CTA','sign-up-now-cta',NULL,'{\"c42f398e-cc92-493a-a04d-5ae11e99c8f9\": [{\"col1\": \"Sign Up Now\", \"col2\": \"\"}]}',1,'2024-09-06 09:02:44','2024-09-06 09:19:17','847c87bf-cf50-4f22-90b9-ac391919221d'),
(23,23,1,'Sign Up Now','sign-up-now',NULL,'{\"18b57efa-ec3c-4c15-831e-d0ffff31629a\": \"Sign Up Now\"}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','0881d41b-6293-4c3d-a6a1-494120cf5d20'),
(24,24,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11]}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','62d0920d-13ec-431f-824b-8b826e83e36f'),
(25,25,1,NULL,'__temp_euxgmwduumpwtojwsnyiqyrrzaonyhspujlc',NULL,'{\"f422b20c-b6e6-4100-8f0a-60b27f99ea7e\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p>\"}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','7968776a-ada6-4ade-8fec-344ae7fc4b77'),
(26,26,1,'Big Bend Bounce Stats','big-bend-bounce-stats',NULL,'{\"43a92626-2af7-4746-b31b-6f2e0157b7d4\": [{\"col1\": \"Total Miles\", \"col2\": \"64\"}, {\"col1\": \"Days\", \"col2\": \"4\"}, {\"col1\": \"Elevation Gain\", \"col2\": \"9200ft\"}, {\"col1\": \"Cost\", \"col2\": \"$1299\"}]}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','1f1d2bc1-c839-4550-88f2-077e9a03f687'),
(27,27,1,'Sign Up Now CTA','sign-up-now-cta',NULL,NULL,1,'2024-09-06 09:02:44','2024-09-06 09:02:44','476e3fdd-c8b9-4794-8da1-68ee6989bd5b'),
(28,28,1,'Sign Up Now','sign-up-now',NULL,'{\"18b57efa-ec3c-4c15-831e-d0ffff31629a\": \"Sign Up Now\"}',1,'2024-09-06 09:02:44','2024-09-06 09:02:44','12b75617-c0b6-41b7-b8c7-923897dcb774'),
(30,30,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11]}',1,'2024-09-06 09:03:50','2024-09-06 09:03:50','31dc44e2-a187-4068-aec6-0a3f27837ffe'),
(36,36,1,'Big Bend Bounce Stats','big-bend-bounce-stats',NULL,'{\"43a92626-2af7-4746-b31b-6f2e0157b7d4\": [{\"col1\": \"days\", \"col2\": \"4\"}, {\"col1\": \"Cost\", \"col2\": \"$1299\"}]}',1,'2024-09-06 09:07:51','2024-09-06 09:07:51','740d99b8-40f3-4110-b1f7-b36c49f924f6'),
(37,37,1,'Sign Up Now CTA','sign-up-now-cta',NULL,NULL,1,'2024-09-06 09:07:51','2024-09-06 09:07:51','7e7c1f7f-d0cc-45c4-b8ab-c5f688d79c53'),
(38,38,1,'Sign Up Now','sign-up-now',NULL,'{\"18b57efa-ec3c-4c15-831e-d0ffff31629a\": \"Sign Up Now\"}',1,'2024-09-06 09:07:51','2024-09-06 09:07:51','3147e4ab-53d0-454d-a6db-91918948cbfc'),
(39,39,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"40\\\"> </craft-entry><craft-entry data-entry-id=\\\"41\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11]}',1,'2024-09-06 09:07:51','2024-09-06 09:07:51','bc80392f-d150-4b6c-81f5-ba8c654a1b89'),
(40,40,1,'Big Bend Bounce Stats','big-bend-bounce-stats',NULL,'{\"43a92626-2af7-4746-b31b-6f2e0157b7d4\": [{\"col1\": \"days\", \"col2\": \"4\"}, {\"col1\": \"Cost\", \"col2\": \"$1299\"}]}',1,'2024-09-06 09:07:51','2024-09-06 09:07:51','486911d4-ef1b-49e3-8bd0-65454ea65c48'),
(41,41,1,'Sign Up Now CTA','sign-up-now-cta',NULL,NULL,1,'2024-09-06 09:07:51','2024-09-06 09:07:51','88247c4b-425d-4c24-96fb-f7e7791ea391'),
(42,42,1,'Sign Up Now','sign-up-now',NULL,'{\"18b57efa-ec3c-4c15-831e-d0ffff31629a\": \"Sign Up Now\"}',1,'2024-09-06 09:07:51','2024-09-06 09:07:51','a4badc68-f82e-43e8-93f6-0ffd0b4d7c60'),
(45,45,1,'FAQs','faqs','faqs',NULL,1,'2024-09-06 09:11:47','2024-09-06 09:11:47','4e596eff-804f-4f4f-9bb1-f94ae94f1a33'),
(46,46,1,'FAQs','faqs','faqs',NULL,1,'2024-09-06 09:11:47','2024-09-06 09:11:47','30d1e421-c213-4750-ae95-7e1a38a09e22'),
(47,47,1,'About','about','about',NULL,1,'2024-09-06 09:11:59','2024-09-06 09:11:59','9e728818-6b0d-4abe-808b-b1b0ded8e81d'),
(48,48,1,'About','about',NULL,NULL,1,'2024-09-06 09:11:59','2024-09-06 09:11:59','3227d278-5a52-4d54-afae-7d19b26c05b2'),
(49,49,1,'FAQs','faqs','faqs',NULL,1,'2024-09-06 09:12:52','2024-09-06 09:12:52','dce17c74-85f3-48c8-ba1d-a2d9915e076a'),
(50,50,1,'About','about','about',NULL,1,'2024-09-06 09:16:04','2024-09-06 09:16:04','2784e5a1-f601-49bf-be86-3ebb701717f0'),
(53,53,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"40\\\"> </craft-entry><craft-entry data-entry-id=\\\"41\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11]}',1,'2024-09-06 09:19:17','2024-09-06 09:19:17','6ad609ef-d895-4029-b845-341cd1cf3a6a'),
(54,54,1,'Sign Up Now CTA','sign-up-now-cta',NULL,'{\"c42f398e-cc92-493a-a04d-5ae11e99c8f9\": [{\"col1\": \"Sign Up Now\", \"col2\": \"\"}]}',1,'2024-09-06 09:19:17','2024-09-06 09:19:17','0ba54b86-22c1-4b21-b933-39984649e9f3'),
(55,55,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"40\\\"> </craft-entry><craft-entry data-entry-id=\\\"41\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11]}',1,'2024-09-06 09:24:23','2024-09-06 09:24:23','11cdfd38-0723-495c-9b2d-9d0f056b3d5b'),
(56,56,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"40\\\"> </craft-entry><craft-entry data-entry-id=\\\"41\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11]}',1,'2024-09-06 09:28:20','2024-09-06 09:28:20','ec5723b8-17a5-4573-8742-93476bd15a71'),
(57,57,1,'Big Bend National Park','big-bend-national-park','locations/big-bend-national-park','{\"4764437f-a6f3-4589-abfe-08bd68964782\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><craft-entry data-entry-id=\\\"58\\\"> </craft-entry><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"5d5e5748-912b-4cad-b85f-0215a0f8bbcf\": [5]}',1,'2024-09-06 09:33:58','2024-09-06 09:34:40','c690e4cd-8251-4192-baba-c6a87d481761'),
(58,58,1,NULL,'__temp_fhqvknwdyvovnnjbmncswznqgwzootwqaolk',NULL,'{\"c42f398e-cc92-493a-a04d-5ae11e99c8f9\": [{\"col1\": \"Book Now\", \"col2\": \"\"}]}',1,'2024-09-06 09:34:24','2024-09-06 09:34:30','06991314-6f29-4017-9a4d-8e8b28111c9b'),
(59,59,1,'Big Bend National Park','big-bend-national-park','locations/big-bend-national-park','{\"4764437f-a6f3-4589-abfe-08bd68964782\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><craft-entry data-entry-id=\\\"60\\\"> </craft-entry><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"5d5e5748-912b-4cad-b85f-0215a0f8bbcf\": [5]}',1,'2024-09-06 09:34:41','2024-09-06 09:34:41','0562f6b8-790f-49a6-9f3d-12e4a47e7c1e'),
(60,60,1,NULL,'__temp_fhqvknwdyvovnnjbmncswznqgwzootwqaolk',NULL,'{\"c42f398e-cc92-493a-a04d-5ae11e99c8f9\": [{\"col1\": \"Book Now\", \"col2\": \"\"}]}',1,'2024-09-06 09:34:41','2024-09-06 09:34:41','b01beaf9-0027-4d11-9d13-34d672faf35b'),
(61,61,1,'Bend OR','bend-or','locations/bend-or','{\"4764437f-a6f3-4589-abfe-08bd68964782\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p>\", \"5d5e5748-912b-4cad-b85f-0215a0f8bbcf\": [12, 11]}',1,'2024-09-06 09:35:17','2024-09-06 09:35:28','736a9fab-b7ef-434e-b176-923ae1a96d61'),
(62,62,1,'Bend OR','bend-or','locations/bend-or','{\"4764437f-a6f3-4589-abfe-08bd68964782\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p>\", \"5d5e5748-912b-4cad-b85f-0215a0f8bbcf\": [12, 11]}',1,'2024-09-06 09:35:30','2024-09-06 09:35:30','a4ff7b38-5a88-4034-ad7c-85a6cec58fcb'),
(64,64,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"40\\\"> </craft-entry><craft-entry data-entry-id=\\\"41\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11], \"e9bfd649-01d3-4c1e-9864-e40e799fb12f\": [57]}',1,'2024-09-06 09:37:05','2024-09-06 09:37:05','fd5d285a-454f-4336-88d3-c0a33bc8994c'),
(66,66,1,'Get out and Explore the Trails','homepage','__home__','{\"0efaae5b-b8c6-48e2-801c-10d2916bcdd8\": [5], \"3ceb3fd0-a647-4a3b-90c9-585ff075bf97\": \"Super fun running vacations and adventures for runners of all abilities. Wouldn\'t you rather run than sit at a pool and drink?\", \"8b38108b-b7ae-4247-b96b-8baec0c514ef\": \"Get out and Explore the Trails\"}',1,'2024-09-06 09:42:43','2024-09-06 09:42:43','5a3f9d50-9eef-4360-a01f-559d9931ef53'),
(67,67,1,'Get out and Explore the Trails','homepage','__home__','{\"0efaae5b-b8c6-48e2-801c-10d2916bcdd8\": [5], \"3ceb3fd0-a647-4a3b-90c9-585ff075bf97\": \"Super fun running vacations and adventures for runners of all abilities. Wouldn\'t you rather run than sit at a pool and drink?\", \"8b38108b-b7ae-4247-b96b-8baec0c514ef\": \"Get out and Explore the Trails\"}',1,'2024-09-06 09:56:22','2024-09-06 09:56:22','0414291b-34bd-4352-92b0-0ff2cecd3b5b'),
(68,68,1,'Big Bend Bounce','big-bend-bounce','adventures/big-bend-bounce','{\"07450d5b-3a3e-42ca-a224-57db0e9716a5\": \"A four-day running adventure in Big Bend National Park, Big Bend State Park, and a few hidden trails just for us. It\'s the ultimate outdoors Big Bend experience.\", \"70e7cc66-4147-48dc-8818-f7531c31f562\": \"<p>Sollicitudin tristique eros erat odio sed vitae, consequat turpis elementum. Lorem nibh vel, eget pretium arcu vitae. Eros eu viverra donec ut volutpat donec laoreet quam urna.</p><p>Lorem ipsum dolor sit amet consectetur a</p><craft-entry data-entry-id=\\\"40\\\"> </craft-entry><craft-entry data-entry-id=\\\"41\\\"> </craft-entry><p>dipisicing elit. Soluta dignissimos sapiente sint molestiae voluptas non, modi, minus earum facilis voluptates, minima iusto neque enim iure deserunt cumque dolores provident nihil?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Quis elit egestas venenatis mattis dignissim.</p><p>Cras cras lobortis vitae vivamus ultricies facilisis tempus.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit.</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Facilis ipsam velit magnam possimus blanditiis, ratione consectetur repellat aut voluptate commodi provident voluptatum, inventore totam quos similique optio modi dolor deleniti?</p><h2>Things to Consider</h2><p>We\'ll run about 10 miles per day, every day, on rugged southwest Texas trails. We\'ll run in the morning and afternoon, and we\'ll run at night. You should be prepared to run technical trails, and we\'ll have a lot of fun doing it!</p><p>Your previous experience should be comfortably completing ten mile trail runs with self-sufficient equipment.</p><p> </p>\", \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\": \"The stunning views of Big Bend National Park and Big Bend State Park will put a bounce in your step.\", \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\": [5, 10, 11], \"e9bfd649-01d3-4c1e-9864-e40e799fb12f\": [57]}',1,'2024-09-06 09:56:26','2024-09-06 09:56:26','d8048d45-6ee9-4cbc-b202-a1004eb18fe2'),
(69,69,1,'Justine Jakes','justine-jakes',NULL,'{\"51a112c8-8359-465b-883f-593494b546bd\": \"Austin, TX\", \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\": \"“A travel adventure that challenges even the most experienced trail runner. I love it!”\"}',1,'2024-09-06 11:57:34','2024-09-06 11:58:04','f1a05cfa-79b4-4564-aa40-54f61101fa22'),
(70,70,1,'Justine Jakes','justine-jakes',NULL,'{\"51a112c8-8359-465b-883f-593494b546bd\": \"Austin, TX\", \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\": \"“A travel adventure that challenges even the most experienced trail runner. I love it!”\"}',1,'2024-09-06 11:58:04','2024-09-06 11:58:04','45ada0ea-a6b9-4f48-8c68-08ba5526570e'),
(71,71,1,'Milton Waddams','milton-waddams',NULL,'{\"51a112c8-8359-465b-883f-593494b546bd\": \"Austin, TX\", \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\": \"“The best way to spend my 5 days of annual vacation time away from the cubicle!”\"}',1,'2024-09-06 11:58:06','2024-09-06 11:58:24','f966374e-b6a0-4fb9-8830-155ce5b9b720'),
(72,72,1,'Milton Waddams','milton-waddams',NULL,'{\"51a112c8-8359-465b-883f-593494b546bd\": \"Austin, TX\", \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\": \"“The best way to spend my 5 days of annual vacation time away from the cubicle!”\"}',1,'2024-09-06 11:58:24','2024-09-06 11:58:24','491b760d-d131-4cee-93cc-4918447e7d5f'),
(73,73,1,'Pitbull','pitbull',NULL,'{\"51a112c8-8359-465b-883f-593494b546bd\": \"Austin, TX\", \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\": \"Believe me, been there done that\"}',1,'2024-09-06 12:04:00','2024-09-06 12:04:28','c39553e7-2146-4ba5-a247-d7d3d4e95036'),
(74,74,1,'Pitbull','pitbull',NULL,'{\"51a112c8-8359-465b-883f-593494b546bd\": \"Austin, TX\", \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\": \"Believe me, been there done that\"}',1,'2024-09-06 12:04:28','2024-09-06 12:04:28','3c33d57c-15aa-483b-b79f-cce233ed9a78');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES
(2,1,NULL,NULL,NULL,1,'2024-09-06 08:20:00',NULL,NULL,'2024-09-06 08:20:54','2024-09-06 08:20:54'),
(3,1,NULL,NULL,NULL,1,'2024-09-06 08:20:00',NULL,NULL,'2024-09-06 08:20:54','2024-09-06 08:20:54'),
(6,1,NULL,NULL,NULL,1,'2024-09-06 08:20:00',NULL,NULL,'2024-09-06 08:21:59','2024-09-06 08:21:59'),
(7,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 08:32:33','2024-09-06 08:33:52'),
(8,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 08:33:52','2024-09-06 08:33:52'),
(13,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 08:34:32','2024-09-06 08:34:32'),
(20,NULL,NULL,7,7,6,'2024-09-06 09:00:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(21,NULL,NULL,7,7,3,'2024-09-06 09:01:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(22,NULL,NULL,7,7,5,'2024-09-06 09:02:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(23,NULL,NULL,22,6,4,'2024-09-06 09:02:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(24,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(25,NULL,NULL,24,7,6,'2024-09-06 09:00:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(26,NULL,NULL,24,7,3,'2024-09-06 09:01:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(27,NULL,NULL,24,7,5,'2024-09-06 09:02:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(28,NULL,NULL,27,6,4,'2024-09-06 09:02:00',NULL,NULL,'2024-09-06 09:02:44','2024-09-06 09:02:44'),
(30,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:03:50','2024-09-06 09:03:50'),
(36,NULL,NULL,7,9,3,'2024-09-06 09:07:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(37,NULL,NULL,7,9,5,'2024-09-06 09:06:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(38,NULL,NULL,37,6,4,'2024-09-06 09:06:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(39,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(40,NULL,NULL,39,9,3,'2024-09-06 09:07:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(41,NULL,NULL,39,9,5,'2024-09-06 09:06:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(42,NULL,NULL,41,6,4,'2024-09-06 09:06:00',NULL,NULL,'2024-09-06 09:07:51','2024-09-06 09:07:51'),
(45,4,NULL,NULL,NULL,6,'2024-09-06 09:11:00',NULL,NULL,'2024-09-06 09:11:47','2024-09-06 09:11:47'),
(46,4,NULL,NULL,NULL,6,'2024-09-06 09:11:00',NULL,NULL,'2024-09-06 09:11:47','2024-09-06 09:11:47'),
(47,3,NULL,NULL,NULL,6,'2024-09-06 09:11:00',NULL,NULL,'2024-09-06 09:11:59','2024-09-06 09:11:59'),
(48,3,NULL,NULL,NULL,6,'2024-09-06 09:11:00',NULL,NULL,'2024-09-06 09:11:59','2024-09-06 09:11:59'),
(49,4,NULL,NULL,NULL,6,'2024-09-06 09:11:00',NULL,NULL,'2024-09-06 09:12:52','2024-09-06 09:12:52'),
(50,3,NULL,NULL,NULL,6,'2024-09-06 09:11:00',NULL,NULL,'2024-09-06 09:16:04','2024-09-06 09:16:04'),
(53,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:19:17','2024-09-06 09:19:17'),
(54,NULL,NULL,53,7,5,'2024-09-06 09:02:00',NULL,NULL,'2024-09-06 09:19:17','2024-09-06 09:19:17'),
(55,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:24:23','2024-09-06 09:24:23'),
(56,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:28:20','2024-09-06 09:28:20'),
(57,5,NULL,NULL,NULL,8,'2024-09-06 09:34:00',NULL,NULL,'2024-09-06 09:33:58','2024-09-06 09:34:41'),
(58,NULL,NULL,57,9,5,'2024-09-06 09:34:00',NULL,NULL,'2024-09-06 09:34:24','2024-09-06 09:34:30'),
(59,5,NULL,NULL,NULL,8,'2024-09-06 09:34:00',NULL,NULL,'2024-09-06 09:34:41','2024-09-06 09:34:41'),
(60,NULL,NULL,59,9,5,'2024-09-06 09:34:00',NULL,NULL,'2024-09-06 09:34:41','2024-09-06 09:34:41'),
(61,5,NULL,NULL,NULL,8,'2024-09-06 09:35:00',NULL,NULL,'2024-09-06 09:35:17','2024-09-06 09:35:30'),
(62,5,NULL,NULL,NULL,8,'2024-09-06 09:35:00',NULL,NULL,'2024-09-06 09:35:30','2024-09-06 09:35:30'),
(64,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:37:05','2024-09-06 09:37:05'),
(66,1,NULL,NULL,NULL,1,'2024-09-06 08:20:00',NULL,NULL,'2024-09-06 09:42:43','2024-09-06 09:42:43'),
(67,1,NULL,NULL,NULL,1,'2024-09-06 08:20:00',NULL,NULL,'2024-09-06 09:56:22','2024-09-06 09:56:22'),
(68,2,NULL,NULL,NULL,2,'2024-09-06 08:33:00',NULL,NULL,'2024-09-06 09:56:26','2024-09-06 09:56:26'),
(69,6,NULL,NULL,NULL,9,'2024-09-06 11:58:00',NULL,NULL,'2024-09-06 11:57:34','2024-09-06 11:58:04'),
(70,6,NULL,NULL,NULL,9,'2024-09-06 11:58:00',NULL,NULL,'2024-09-06 11:58:04','2024-09-06 11:58:04'),
(71,6,NULL,NULL,NULL,9,'2024-09-06 11:58:00',NULL,NULL,'2024-09-06 11:58:06','2024-09-06 11:58:24'),
(72,6,NULL,NULL,NULL,9,'2024-09-06 11:58:00',NULL,NULL,'2024-09-06 11:58:24','2024-09-06 11:58:24'),
(73,6,NULL,NULL,NULL,9,'2024-09-06 12:04:00',NULL,NULL,'2024-09-06 12:04:00','2024-09-06 12:04:00'),
(74,6,NULL,NULL,NULL,9,'2024-09-06 12:04:00',NULL,NULL,'2024-09-06 12:04:28','2024-09-06 12:04:28');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES
(7,1,1),
(8,1,1),
(13,1,1),
(24,1,1),
(30,1,1),
(39,1,1),
(53,1,1),
(55,1,1),
(56,1,1),
(57,1,1),
(59,1,1),
(61,1,1),
(62,1,1),
(64,1,1),
(68,1,1),
(69,1,1),
(70,1,1),
(71,1,1),
(72,1,1),
(73,1,1),
(74,1,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES
(1,2,'Homepage','homepage','house',NULL,0,'site',NULL,'{headline}',0,'site',NULL,0,'2024-09-06 08:20:18','2024-09-06 08:20:18',NULL,'3db93919-04b1-4128-975f-f831ed967af0'),
(2,3,'Adventures','adventures','person-hiking','orange',1,'site',NULL,'',1,'site',NULL,1,'2024-09-06 08:31:48','2024-09-06 08:31:48',NULL,'5ebfdea0-4852-45f6-961c-31de85495858'),
(3,4,'Stats','stats','chart-line','green',1,'site',NULL,'',0,'site',NULL,0,'2024-09-06 08:46:54','2024-09-06 08:46:54',NULL,'b93f0c37-9d23-4379-a1b7-6b76af1181ab'),
(4,5,'Text Link','textLink','link',NULL,0,'site',NULL,'{linkText}',0,'site',NULL,0,'2024-09-06 08:50:00','2024-09-06 08:50:00',NULL,'8f8b8035-b0d0-44a9-b3af-681ce34f8cad'),
(5,6,'Call To Action','callToAction','comment','fuchsia',0,'site',NULL,'{entryId}',0,'site',NULL,0,'2024-09-06 08:50:21','2024-09-06 09:18:53',NULL,'460a499b-f8f1-4721-9a4f-aec7570042fd'),
(6,7,'Rich Text','richText','font-case','yellow',0,'site',NULL,'{entryId}',0,'site',NULL,0,'2024-09-06 08:58:08','2024-09-06 08:58:08',NULL,'ca5e0d18-e144-47cd-946e-047f4febda59'),
(7,8,'About','about','person',NULL,1,'site',NULL,'',0,'site',NULL,0,'2024-09-06 09:10:53','2024-09-06 09:10:53',NULL,'396f0793-7466-4fc7-8d32-be8328d2369b'),
(8,9,'Locations','locations','map',NULL,1,'site',NULL,'',1,'site',NULL,1,'2024-09-06 09:32:29','2024-09-06 09:32:29',NULL,'f92db1fe-0a5a-4f76-bc5d-867ce8a9b650'),
(9,10,'Testimonials','testimonials','messages',NULL,1,'site',NULL,'',0,'site',NULL,1,'2024-09-06 11:57:06','2024-09-06 11:57:06',NULL,'fe374ec6-3f0b-4484-84e4-45a29a3a93b7');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Asset','{\"tabs\": [{\"uid\": \"7427e29a-16f2-4d4f-a6ae-63a1d6ef3889\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"aa78243a-f656-40a9-81c0-4edee5120fca\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 07:50:14','2024-09-06 07:50:14',NULL,'9fc75424-93f8-411b-b0c4-4dd06e64631e'),
(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9b97b8be-564a-4eef-a29f-059d23ca87fa\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"6fee79a0-88da-4c37-ab93-d6a5b4676d89\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"8b38108b-b7ae-4247-b96b-8baec0c514ef\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Headline\", \"width\": 100, \"handle\": \"headline\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"instructions\": \"Headline for the homepage hero\", \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"3ceb3fd0-a647-4a3b-90c9-585ff075bf97\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Tagline\", \"width\": 100, \"handle\": \"tagline\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"instructions\": \"Appears under the hero headline.\", \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"0efaae5b-b8c6-48e2-801c-10d2916bcdd8\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Hero Image\", \"width\": 100, \"handle\": \"heroImage\", \"warning\": null, \"fieldUid\": \"a5462f8d-6e69-451f-bcbf-9bb200fc174d\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 08:20:18','2024-09-06 08:20:18',NULL,'55a81975-ab3f-4a95-9f53-aa2d4bc15dc2'),
(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"936cacf0-fa35-47db-b25b-ac7029aaa272\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"71504d26-8346-4a09-ab3c-bf9a0df688cc\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-06T08:55:03+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"uid\": \"ce795482-6f4a-408f-9a3d-aca78af06272\", \"type\": \"craft\\\\fieldlayoutelements\\\\HorizontalRule\", \"dateAdded\": \"2024-09-06T08:55:03+00:00\", \"userCondition\": null, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"e9bfd649-01d3-4c1e-9864-e40e799fb12f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"99d56909-2e5f-46e7-a360-37ef5f53f971\", \"required\": false, \"dateAdded\": \"2024-09-06T09:36:41+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Short Description\", \"width\": 100, \"handle\": \"shortDescription\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"dateAdded\": \"2024-09-06T08:55:03+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"07450d5b-3a3e-42ca-a224-57db0e9716a5\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Long Description\", \"width\": 100, \"handle\": \"longDescription\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"dateAdded\": \"2024-09-06T08:55:03+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"c0bc4677-f606-4645-bd11-dbf8eec07b9e\", \"name\": \"Images\", \"elements\": [{\"tip\": null, \"uid\": \"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ea9b90a7-89ea-48f5-b25f-9c0675e0d876\", \"required\": false, \"dateAdded\": \"2024-09-06T08:55:03+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}, {\"uid\": \"89ab7786-28d8-416a-b44f-c9ac583e45af\", \"name\": \"Content Builder\", \"elements\": [{\"tip\": null, \"uid\": \"041b7644-dc0b-4bfb-be94-2bd65fae0c2f\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"695adb81-e37d-40c6-91f1-96198a560e1c\", \"required\": false, \"dateAdded\": \"2024-09-06T08:58:24+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"70e7cc66-4147-48dc-8818-f7531c31f562\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"89e6df1f-af15-42ee-b1ca-95ca80f456c2\", \"required\": false, \"dateAdded\": \"2024-09-06T09:06:05+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 08:31:48','2024-09-06 09:36:41',NULL,'61949501-caf0-43f5-a878-933f3339ac5d'),
(4,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"abef9235-b631-4161-ad85-9651f106687f\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"592c88ec-d4a2-4444-866e-acbe53437cea\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-09T11:19:52+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"43a92626-2af7-4746-b31b-6f2e0157b7d4\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Stats\", \"width\": 100, \"handle\": \"stats\", \"warning\": null, \"fieldUid\": \"16080038-b7ee-465a-869e-112483ff46c0\", \"required\": false, \"dateAdded\": \"2024-09-09T11:19:52+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 08:46:53','2024-09-09 11:20:56',NULL,'9ef7535e-0c98-4df5-b963-9a653ff8ab75'),
(5,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"64ff6725-9629-4162-9d7e-55a099b2d722\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4e616e7c-4ece-40db-bca6-1b61e31671ac\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"18b57efa-ec3c-4c15-831e-d0ffff31629a\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Link Text\", \"width\": 100, \"handle\": \"linkText\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5e220bf8-93e9-48b1-abb6-4d44fc64b3a2\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"2bcdf88c-4733-4b12-b3fe-9799c2773aea\", \"required\": false, \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 08:50:00','2024-09-06 08:50:00',NULL,'8c4021ec-cc4f-436d-acda-8ff1444dc84d'),
(6,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"7061424c-06aa-4e11-bb59-30cf11acb9fb\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"77163896-0efe-4eda-a4d5-717ea794beb8\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-06T09:16:31+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"c42f398e-cc92-493a-a04d-5ae11e99c8f9\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"a62a212f-7b95-4908-8315-df40cc1a5093\", \"required\": false, \"dateAdded\": \"2024-09-06T09:16:31+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 08:50:21','2024-09-06 09:18:53',NULL,'30701b16-ad70-4aae-8cd8-e21f0eedd554'),
(7,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"5abdd3c8-d6fd-420c-bdfe-42c62db1292c\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"b867f9f3-d490-4405-aea5-c516fde8d060\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-06T08:55:27+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"f422b20c-b6e6-4100-8f0a-60b27f99ea7e\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c72a3f62-2918-4562-a5dc-f4ce9058d1f4\", \"required\": false, \"dateAdded\": \"2024-09-06T08:58:08+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 08:58:08','2024-09-06 08:58:08',NULL,'f963a26a-1ae7-4018-a377-48603315252a'),
(8,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"8423fca4-55e2-4447-8a05-febbe449bd9d\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"9df34c5d-dedd-4ada-92ee-087da0ef9117\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-06T09:08:37+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"c1ee6e28-9e01-459b-95bf-414482995eea\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"c72a3f62-2918-4562-a5dc-f4ce9058d1f4\", \"required\": false, \"dateAdded\": \"2024-09-06T09:10:53+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 09:10:53','2024-09-06 09:10:53',NULL,'8a7f5a29-4a98-4445-ba34-d1ba86ed8558'),
(9,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"c8cd9954-344f-46c7-88dd-0442035c1664\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"92b71cef-ffe9-453a-962e-9d5a0adf822d\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-06T09:29:43+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"4764437f-a6f3-4589-abfe-08bd68964782\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Location Content \", \"width\": 100, \"handle\": \"locationContent\", \"warning\": null, \"fieldUid\": \"89e6df1f-af15-42ee-b1ca-95ca80f456c2\", \"required\": false, \"dateAdded\": \"2024-09-06T09:32:29+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"tip\": null, \"uid\": \"5d5e5748-912b-4cad-b85f-0215a0f8bbcf\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": null, \"width\": 100, \"handle\": null, \"warning\": null, \"fieldUid\": \"ea9b90a7-89ea-48f5-b25f-9c0675e0d876\", \"required\": false, \"dateAdded\": \"2024-09-06T09:32:29+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 09:32:29','2024-09-06 09:32:29',NULL,'152d9ed6-8286-407f-9b6c-a9241b83c641'),
(10,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"9e865495-da65-4015-ac3f-3de62af44721\", \"name\": \"Content\", \"elements\": [{\"tip\": null, \"uid\": \"5cdc702e-292c-4770-b3c6-aaafd0b108c0\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Testimonial\", \"width\": 100, \"handle\": \"testimonial\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"dateAdded\": \"2024-09-06T11:57:06+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}, {\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"cc390fca-3a19-4f14-84f3-da1447b39cdb\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": \"Name\", \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2024-09-06T11:53:43+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}, {\"tip\": null, \"uid\": \"51a112c8-8359-465b-883f-593494b546bd\", \"type\": \"craft\\\\fieldlayoutelements\\\\CustomField\", \"label\": \"Location\", \"width\": 100, \"handle\": \"location\", \"warning\": null, \"fieldUid\": \"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\", \"required\": false, \"dateAdded\": \"2024-09-06T11:57:06+00:00\", \"instructions\": null, \"userCondition\": null, \"includeInCards\": false, \"providesThumbs\": false, \"elementCondition\": null}], \"userCondition\": null, \"elementCondition\": null}]}','2024-09-06 11:57:06','2024-09-06 11:57:06',NULL,'90008bdf-d52a-41af-94e2-41b9f7930fff');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES
(1,'Plain Text','plainText','global',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-09-06 08:17:45','2024-09-06 08:17:45',NULL,'6de8ed43-4ef2-41a4-962e-7fdcd2e65031'),
(2,'Image','image','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"add an image\",\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-09-06 08:19:52','2024-09-06 08:19:52',NULL,'a5462f8d-6e69-451f-bcbf-9bb200fc174d'),
(3,'images','images','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\",\"defaultUploadLocationSubpath\":\"{slug}\",\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":4,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\",\"restrictedLocationSubpath\":null,\"selectionLabel\":\"Add an image\",\"showCardsInGrid\":false,\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-09-06 08:30:07','2024-09-06 08:30:07',NULL,'ea9b90a7-89ea-48f5-b25f-9c0675e0d876'),
(4,'Simple Table','simpleTable','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a stat\",\"columns\":{\"col1\":{\"heading\":\"Name\",\"handle\":\"name\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Value\",\"handle\":\"value\",\"width\":\"\",\"type\":\"singleline\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\"}],\"maxRows\":4,\"minRows\":2,\"staticRows\":false}','2024-09-06 08:46:26','2024-09-06 08:46:26',NULL,'16080038-b7ee-465a-869e-112483ff46c0'),
(5,'URL','simpleUrl','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":255,\"types\":[\"url\",\"tel\",\"email\"]}','2024-09-06 08:49:55','2024-09-06 08:49:55',NULL,'2bcdf88c-4733-4b12-b3fe-9799c2773aea'),
(6,'Text Link','textLink','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Table','{\"addRowLabel\":\"Add a CTA\",\"columns\":{\"col1\":{\"heading\":\"Link Text\",\"handle\":\"linkText\",\"width\":\"\",\"type\":\"singleline\"},\"col2\":{\"heading\":\"Link URL\",\"handle\":\"linkUrl\",\"width\":\"\",\"type\":\"url\"}},\"defaults\":[{\"col1\":\"\",\"col2\":\"\"}],\"maxRows\":1,\"minRows\":null,\"staticRows\":false}','2024-09-06 08:50:14','2024-09-06 09:18:28',NULL,'a62a212f-7b95-4908-8315-df40cc1a5093'),
(7,'Content Builder','contentBuilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"minEntries\":null,\"maxEntries\":null,\"viewMode\":\"blocks\",\"showCardsInGrid\":false,\"includeTableView\":false,\"defaultTableColumns\":[],\"pageSize\":null,\"createButtonLabel\":\"New Content Model\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null,\"siteSettings\":{\"d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b\":[]},\"entryTypes\":[\"b93f0c37-9d23-4379-a1b7-6b76af1181ab\",\"460a499b-f8f1-4721-9a4f-aec7570042fd\",\"ca5e0d18-e144-47cd-946e-047f4febda59\"]}','2024-09-06 08:51:30','2024-09-06 09:18:56',NULL,'695adb81-e37d-40c6-91f1-96198a560e1c'),
(8,'Rich Text Content','richTextContent','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"aada7c0a-0401-46f7-bc65-12fc53fb9109\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-09-06 08:57:57','2024-09-06 08:57:57',NULL,'c72a3f62-2918-4562-a5dc-f4ce9058d1f4'),
(9,'Content Builder CK','contentBuilderCk','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"ckeConfig\":\"2fa9c924-e215-49c1-ba08-660b2b04acb5\",\"wordLimit\":null,\"showWordCount\":false,\"availableVolumes\":\"*\",\"availableTransforms\":\"\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"showUnpermittedVolumes\":false,\"showUnpermittedFiles\":false,\"createButtonLabel\":\"New Content Module\",\"purifierConfig\":null,\"purifyHtml\":true,\"entryTypes\":[\"b93f0c37-9d23-4379-a1b7-6b76af1181ab\",\"460a499b-f8f1-4721-9a4f-aec7570042fd\"]}','2024-09-06 09:05:10','2024-09-06 09:20:04',NULL,'89e6df1f-af15-42ee-b1ca-95ca80f456c2'),
(10,'Location','location','global',NULL,NULL,0,'none',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"branchLimit\":null,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":1,\"selectionLabel\":\"Add a location\",\"showCardsInGrid\":false,\"showSiteMenu\":false,\"sources\":[\"section:f80f1d9a-9689-4aa1-9688-5bf4e20efc71\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2024-09-06 09:36:18','2024-09-06 09:36:18',NULL,'99d56909-2e5f-46e7-a360-37ef5f53f971');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES
(1,'Public Schema','[]',1,'2024-09-06 07:50:14','2024-09-06 07:50:14','620caa93-2603-4217-9713-700e82292681');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES
(1,'5.4.1','5.3.0.2',0,'skuiqohnnxiy','3@vlhiebrcfu','2024-03-11 23:24:29','2024-09-09 11:20:56','5b7d8f63-a1d4-4478-ba44-70dedf549d96');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'craft','Install','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','c258cfea-bc5d-432e-a146-0bc8af8be09f'),
(2,'craft','m221101_115859_create_entries_authors_table','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','995ff2dd-4496-4dff-a420-cff1dfb9ba11'),
(3,'craft','m221107_112121_add_max_authors_to_sections','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','4ab254a9-5a01-48b6-aa97-67536de36d1d'),
(4,'craft','m221205_082005_translatable_asset_alt_text','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','04d057c6-37d4-47db-9dc2-2f5385b32ec5'),
(5,'craft','m230314_110309_add_authenticator_table','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','bde21a73-4d98-49d2-860e-acb112238bbd'),
(6,'craft','m230314_111234_add_webauthn_table','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','7613ee5d-1fc2-4d0a-a70c-530b2ab0991f'),
(7,'craft','m230503_120303_add_recoverycodes_table','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','710c2a5f-53f6-4f2c-9220-51d9fa408fb1'),
(8,'craft','m230511_000000_field_layout_configs','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','69f9dcfd-59f6-4c41-b6af-3b968a8fe8b8'),
(9,'craft','m230511_215903_content_refactor','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','717fa1e9-4d71-4de0-8fc1-4cce96a7c86f'),
(10,'craft','m230524_000000_add_entry_type_show_slug_field','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','e1775c93-714c-48e6-9bd3-04bcea6ccd07'),
(11,'craft','m230524_000001_entry_type_icons','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','6fff60b7-da8c-443a-bea2-2188b719e24b'),
(12,'craft','m230524_000002_entry_type_colors','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','e7bf5a78-d0b4-4bb6-8748-346ff5ec4391'),
(13,'craft','m230524_220029_global_entry_types','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','a150715c-4010-467a-b114-01be1584e9d7'),
(14,'craft','m230531_123004_add_entry_type_show_status_field','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','c70ddd1f-0421-4d0e-9ab0-bcb6705bac49'),
(15,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','b86d1ba5-b9bc-4717-8503-4050a2a349c8'),
(16,'craft','m230616_173810_kill_field_groups','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','f4e57ec6-4e1f-4a1e-b58e-7ed40381f678'),
(17,'craft','m230616_183820_remove_field_name_limit','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','645e4db0-2c78-4e45-aa9c-9cc6e985aa82'),
(18,'craft','m230617_070415_entrify_matrix_blocks','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','4c12c7a9-a10f-47d4-80b5-6c0d526ba07c'),
(19,'craft','m230710_162700_element_activity','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','cce581ca-cf70-4c2f-9b85-ab8698b12e89'),
(20,'craft','m230820_162023_fix_cache_id_type','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','58775b28-be35-4260-a5ca-41959dda97d1'),
(21,'craft','m230826_094050_fix_session_id_type','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','1d8542cf-d77c-44c2-9f2c-e43fb131c442'),
(22,'craft','m230904_190356_address_fields','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','28cf7228-585a-4539-9b47-f936b1f3c29b'),
(23,'craft','m230928_144045_add_subpath_to_volumes','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','c268f591-93d7-418e-9715-53b4f8640660'),
(24,'craft','m231013_185640_changedfields_amend_primary_key','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','dac49c05-40ba-40cb-8e01-76061857a418'),
(25,'craft','m231213_030600_element_bulk_ops','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','7d06ce73-67be-4278-b9ae-6e13719bea01'),
(26,'craft','m240129_150719_sites_language_amend_length','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','6613740d-ece0-48d7-aa23-cb997380a27c'),
(27,'craft','m240206_035135_convert_json_columns','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','4107c57d-5543-41cb-b744-42dc27cbac74'),
(28,'craft','m240207_182452_address_line_3','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','d54a295d-dfcd-427b-a2ec-c99d53bf6bd9'),
(29,'craft','m240302_212719_solo_preview_targets','2024-03-11 23:24:30','2024-03-11 23:24:30','2024-03-11 23:24:30','3919fb8c-2320-4f96-821e-add8abf1a6f9'),
(30,'craft','m240619_091352_add_auth_2fa_timestamp','2024-09-06 07:50:14','2024-09-06 07:50:14','2024-09-06 07:50:14','1befbc48-8e5a-482c-a33d-a285f2684870'),
(31,'craft','m240723_214330_drop_bulkop_fk','2024-09-06 08:54:50','2024-09-06 08:54:50','2024-09-06 08:54:50','ce47956b-0a99-4d56-a7cc-fc0c74cbfff5'),
(32,'craft','m240731_053543_soft_delete_fields','2024-09-06 08:54:50','2024-09-06 08:54:50','2024-09-06 08:54:50','a135150b-d15a-4329-98c2-88cf9437a940'),
(33,'craft','m240805_154041_sso_identities','2024-09-06 08:54:50','2024-09-06 08:54:50','2024-09-06 08:54:50','2057c6ac-cd16-4507-bf2c-0c753f76874c'),
(34,'plugin:ckeditor','Install','2024-09-06 08:55:10','2024-09-06 08:55:10','2024-09-06 08:55:10','ed7cc399-a57a-4c32-a921-c914f0559fb6'),
(35,'plugin:ckeditor','m230408_163704_v3_upgrade','2024-09-06 08:55:10','2024-09-06 08:55:10','2024-09-06 08:55:10','fe587726-d6ec-4836-a497-d5349bf3c8c8');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES
(1,'ckeditor','4.2.0','3.0.0.0','2024-09-06 08:55:10','2024-09-06 08:55:10','2024-09-06 08:55:10','152e90b7-f62f-4557-8ea8-c0961fabea62');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.headingLevels.0','1'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.headingLevels.1','2'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.headingLevels.2','3'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.headingLevels.3','4'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.headingLevels.4','5'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.headingLevels.5','6'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.name','\"Content Builder\"'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.toolbar.0','\"heading\"'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.toolbar.1','\"|\"'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.toolbar.2','\"bold\"'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.toolbar.3','\"italic\"'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.toolbar.4','\"link\"'),
('ckeditor.configs.2fa9c924-e215-49c1-ba08-660b2b04acb5.toolbar.5','\"createEntry\"'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.headingLevels.0','1'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.headingLevels.1','2'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.headingLevels.2','3'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.headingLevels.3','4'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.headingLevels.4','5'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.headingLevels.5','6'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.name','\"Simple\"'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.toolbar.0','\"heading\"'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.toolbar.1','\"|\"'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.toolbar.2','\"bold\"'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.toolbar.3','\"italic\"'),
('ckeditor.configs.aada7c0a-0401-46f7-bc65-12fc53fb9109.toolbar.4','\"link\"'),
('dateModified','1725880856'),
('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),
('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),
('elementSources.craft\\elements\\Entry.0.disabled','false'),
('elementSources.craft\\elements\\Entry.0.key','\"*\"'),
('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"status\"'),
('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"section\"'),
('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"postDate\"'),
('elementSources.craft\\elements\\Entry.0.tableAttributes.3','\"expiryDate\"'),
('elementSources.craft\\elements\\Entry.0.tableAttributes.4','\"authors\"'),
('elementSources.craft\\elements\\Entry.0.tableAttributes.5','\"link\"'),
('elementSources.craft\\elements\\Entry.0.type','\"native\"'),
('elementSources.craft\\elements\\Entry.1.key','\"singles\"'),
('elementSources.craft\\elements\\Entry.1.type','\"native\"'),
('elementSources.craft\\elements\\Entry.2.key','\"section:3e394d1a-6745-477e-90a6-d9aea2f71188\"'),
('elementSources.craft\\elements\\Entry.2.type','\"native\"'),
('elementSources.craft\\elements\\Entry.3.defaultSort.0','\"structure\"'),
('elementSources.craft\\elements\\Entry.3.defaultSort.1','\"asc\"'),
('elementSources.craft\\elements\\Entry.3.disabled','false'),
('elementSources.craft\\elements\\Entry.3.key','\"section:f80f1d9a-9689-4aa1-9688-5bf4e20efc71\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.0','\"status\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.1','\"postDate\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.2','\"expiryDate\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.3','\"authors\"'),
('elementSources.craft\\elements\\Entry.3.tableAttributes.4','\"link\"'),
('elementSources.craft\\elements\\Entry.3.type','\"native\"'),
('email.fromEmail','\"ryan@craftquest.io\"'),
('email.fromName','\"House Quest\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.color','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elementCondition','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.autocomplete','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.autocorrect','true'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.class','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.dateAdded','\"2024-09-06T09:08:37+00:00\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.disabled','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.elementCondition','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.id','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.includeInCards','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.inputType','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.instructions','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.label','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.max','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.min','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.name','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.orientation','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.placeholder','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.readonly','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.requirable','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.size','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.step','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.tip','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.title','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.uid','\"9df34c5d-dedd-4ada-92ee-087da0ef9117\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.userCondition','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.warning','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.0.width','100'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.dateAdded','\"2024-09-06T09:10:53+00:00\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.elementCondition','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.fieldUid','\"c72a3f62-2918-4562-a5dc-f4ce9058d1f4\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.handle','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.includeInCards','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.instructions','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.label','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.required','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.tip','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.uid','\"c1ee6e28-9e01-459b-95bf-414482995eea\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.userCondition','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.warning','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.elements.1.width','100'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.name','\"Content\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.uid','\"8423fca4-55e2-4447-8a05-febbe449bd9d\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.fieldLayouts.8a7f5a29-4a98-4445-ba34-d1ba86ed8558.tabs.0.userCondition','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.handle','\"about\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.hasTitleField','true'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.icon','\"person\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.name','\"About\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.showSlugField','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.showStatusField','false'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.slugTranslationKeyFormat','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.slugTranslationMethod','\"site\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.titleFormat','\"\"'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.titleTranslationKeyFormat','null'),
('entryTypes.396f0793-7466-4fc7-8d32-be8328d2369b.titleTranslationMethod','\"site\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.color','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elementCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.autocomplete','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.autocorrect','true'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.class','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.disabled','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.elementCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.id','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.includeInCards','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.inputType','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.instructions','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.label','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.max','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.min','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.name','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.orientation','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.placeholder','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.readonly','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.requirable','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.size','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.step','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.tip','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.title','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.uid','\"6fee79a0-88da-4c37-ab93-d6a5b4676d89\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.userCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.warning','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.0.width','100'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.elementCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.handle','\"headline\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.includeInCards','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.instructions','\"Headline for the homepage hero\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.label','\"Headline\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.required','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.tip','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.uid','\"8b38108b-b7ae-4247-b96b-8baec0c514ef\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.userCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.warning','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.1.width','100'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.elementCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.handle','\"tagline\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.includeInCards','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.instructions','\"Appears under the hero headline.\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.label','\"Tagline\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.required','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.tip','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.uid','\"3ceb3fd0-a647-4a3b-90c9-585ff075bf97\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.userCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.warning','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.2.width','100'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.elementCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.fieldUid','\"a5462f8d-6e69-451f-bcbf-9bb200fc174d\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.handle','\"heroImage\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.includeInCards','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.instructions','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.label','\"Hero Image\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.required','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.tip','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.uid','\"0efaae5b-b8c6-48e2-801c-10d2916bcdd8\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.userCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.warning','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.elements.3.width','100'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.name','\"Content\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.uid','\"9b97b8be-564a-4eef-a29f-059d23ca87fa\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.fieldLayouts.55a81975-ab3f-4a95-9f53-aa2d4bc15dc2.tabs.0.userCondition','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.handle','\"homepage\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.hasTitleField','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.icon','\"house\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.name','\"Homepage\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.showSlugField','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.showStatusField','false'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.slugTranslationKeyFormat','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.slugTranslationMethod','\"site\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.titleFormat','\"{headline}\"'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.titleTranslationKeyFormat','null'),
('entryTypes.3db93919-04b1-4128-975f-f831ed967af0.titleTranslationMethod','\"site\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.color','\"fuchsia\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elementCondition','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.autocomplete','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.autocorrect','true'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.class','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.dateAdded','\"2024-09-06T09:16:31+00:00\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.disabled','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.elementCondition','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.id','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.includeInCards','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.inputType','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.instructions','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.label','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.max','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.min','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.name','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.orientation','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.placeholder','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.readonly','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.requirable','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.size','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.step','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.tip','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.title','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.uid','\"77163896-0efe-4eda-a4d5-717ea794beb8\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.userCondition','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.warning','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.0.width','100'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.dateAdded','\"2024-09-06T09:16:31+00:00\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.elementCondition','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.fieldUid','\"a62a212f-7b95-4908-8315-df40cc1a5093\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.handle','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.includeInCards','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.instructions','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.label','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.required','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.tip','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.uid','\"c42f398e-cc92-493a-a04d-5ae11e99c8f9\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.userCondition','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.warning','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.elements.1.width','100'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.name','\"Content\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.uid','\"7061424c-06aa-4e11-bb59-30cf11acb9fb\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.fieldLayouts.30701b16-ad70-4aae-8cd8-e21f0eedd554.tabs.0.userCondition','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.handle','\"callToAction\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.hasTitleField','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.icon','\"comment\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.name','\"Call To Action\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.showSlugField','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.showStatusField','false'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.slugTranslationKeyFormat','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.slugTranslationMethod','\"site\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.titleFormat','\"{entryId}\"'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.titleTranslationKeyFormat','null'),
('entryTypes.460a499b-f8f1-4721-9a4f-aec7570042fd.titleTranslationMethod','\"site\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.color','\"orange\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.autocomplete','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.autocorrect','true'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.class','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.dateAdded','\"2024-09-06T08:55:03+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.disabled','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.id','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.inputType','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.label','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.max','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.min','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.name','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.orientation','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.placeholder','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.readonly','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.requirable','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.size','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.step','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.title','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.uid','\"71504d26-8346-4a09-ab3c-bf9a0df688cc\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.0.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.1.dateAdded','\"2024-09-06T08:55:03+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.1.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.1.uid','\"ce795482-6f4a-408f-9a3d-aca78af06272\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.1.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.dateAdded','\"2024-09-06T09:36:41+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.fieldUid','\"99d56909-2e5f-46e7-a360-37ef5f53f971\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.handle','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.label','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.required','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.uid','\"e9bfd649-01d3-4c1e-9864-e40e799fb12f\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.2.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.dateAdded','\"2024-09-06T08:55:03+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.handle','\"shortDescription\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.label','\"Short Description\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.required','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.uid','\"83378ed0-a8e8-47ab-8eb7-cf323a1621fc\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.3.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.dateAdded','\"2024-09-06T08:55:03+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.handle','\"longDescription\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.label','\"Long Description\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.required','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.uid','\"07450d5b-3a3e-42ca-a224-57db0e9716a5\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.elements.4.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.name','\"Content\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.uid','\"936cacf0-fa35-47db-b25b-ac7029aaa272\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.0.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.dateAdded','\"2024-09-06T08:55:03+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.fieldUid','\"ea9b90a7-89ea-48f5-b25f-9c0675e0d876\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.handle','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.label','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.required','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.uid','\"cdd4a58f-94f7-4702-a78e-5d3f802f71c6\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.elements.0.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.name','\"Images\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.uid','\"c0bc4677-f606-4645-bd11-dbf8eec07b9e\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.1.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.dateAdded','\"2024-09-06T08:58:24+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.fieldUid','\"695adb81-e37d-40c6-91f1-96198a560e1c\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.handle','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.label','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.required','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.uid','\"041b7644-dc0b-4bfb-be94-2bd65fae0c2f\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.0.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.dateAdded','\"2024-09-06T09:06:05+00:00\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.elementCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.fieldUid','\"89e6df1f-af15-42ee-b1ca-95ca80f456c2\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.handle','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.includeInCards','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.instructions','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.label','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.providesThumbs','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.required','false'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.tip','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.uid','\"70e7cc66-4147-48dc-8818-f7531c31f562\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.warning','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.elements.1.width','100'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.name','\"Content Builder\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.uid','\"89ab7786-28d8-416a-b44f-c9ac583e45af\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.fieldLayouts.61949501-caf0-43f5-a878-933f3339ac5d.tabs.2.userCondition','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.handle','\"adventures\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.hasTitleField','true'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.icon','\"person-hiking\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.name','\"Adventures\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.showSlugField','true'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.showStatusField','true'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.slugTranslationKeyFormat','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.slugTranslationMethod','\"site\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.titleFormat','\"\"'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.titleTranslationKeyFormat','null'),
('entryTypes.5ebfdea0-4852-45f6-961c-31de85495858.titleTranslationMethod','\"site\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.color','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elementCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.autocomplete','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.autocorrect','true'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.class','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.disabled','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.elementCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.id','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.includeInCards','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.inputType','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.instructions','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.label','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.max','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.min','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.name','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.orientation','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.placeholder','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.readonly','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.requirable','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.size','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.step','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.tip','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.title','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.uid','\"4e616e7c-4ece-40db-bca6-1b61e31671ac\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.userCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.warning','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.0.width','100'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.elementCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.handle','\"linkText\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.includeInCards','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.instructions','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.label','\"Link Text\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.required','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.tip','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.uid','\"18b57efa-ec3c-4c15-831e-d0ffff31629a\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.userCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.warning','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.1.width','100'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.elementCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.fieldUid','\"2bcdf88c-4733-4b12-b3fe-9799c2773aea\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.handle','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.includeInCards','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.instructions','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.label','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.required','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.tip','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.uid','\"5e220bf8-93e9-48b1-abb6-4d44fc64b3a2\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.userCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.warning','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.elements.2.width','100'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.name','\"Content\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.uid','\"64ff6725-9629-4162-9d7e-55a099b2d722\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.fieldLayouts.8c4021ec-cc4f-436d-acda-8ff1444dc84d.tabs.0.userCondition','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.handle','\"textLink\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.hasTitleField','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.icon','\"link\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.name','\"Text Link\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.showSlugField','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.showStatusField','false'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.slugTranslationKeyFormat','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.slugTranslationMethod','\"site\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.titleFormat','\"{linkText}\"'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.titleTranslationKeyFormat','null'),
('entryTypes.8f8b8035-b0d0-44a9-b3af-681ce34f8cad.titleTranslationMethod','\"site\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.color','\"green\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elementCondition','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.autocomplete','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.autocorrect','true'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.class','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.dateAdded','\"2024-09-09T11:19:52+00:00\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.disabled','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.elementCondition','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.id','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.includeInCards','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.inputType','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.instructions','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.label','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.max','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.min','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.name','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.orientation','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.placeholder','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.readonly','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.requirable','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.size','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.step','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.tip','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.title','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.uid','\"592c88ec-d4a2-4444-866e-acbe53437cea\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.userCondition','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.warning','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.0.width','100'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.dateAdded','\"2024-09-09T11:19:52+00:00\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.elementCondition','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.fieldUid','\"16080038-b7ee-465a-869e-112483ff46c0\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.handle','\"stats\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.includeInCards','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.instructions','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.label','\"Stats\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.required','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.tip','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.uid','\"43a92626-2af7-4746-b31b-6f2e0157b7d4\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.userCondition','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.warning','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.elements.1.width','100'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.name','\"Content\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.uid','\"abef9235-b631-4161-ad85-9651f106687f\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.fieldLayouts.9ef7535e-0c98-4df5-b963-9a653ff8ab75.tabs.0.userCondition','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.handle','\"stats\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.hasTitleField','true'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.icon','\"chart-line\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.name','\"Stats\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.showSlugField','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.showStatusField','false'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.slugTranslationKeyFormat','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.slugTranslationMethod','\"site\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.titleFormat','\"\"'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.titleTranslationKeyFormat','null'),
('entryTypes.b93f0c37-9d23-4379-a1b7-6b76af1181ab.titleTranslationMethod','\"site\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.color','\"yellow\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elementCondition','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.autocomplete','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.autocorrect','true'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.class','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.dateAdded','\"2024-09-06T08:55:27+00:00\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.disabled','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.elementCondition','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.id','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.includeInCards','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.inputType','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.instructions','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.label','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.max','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.min','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.name','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.orientation','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.placeholder','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.readonly','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.requirable','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.size','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.step','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.tip','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.title','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.uid','\"b867f9f3-d490-4405-aea5-c516fde8d060\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.userCondition','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.warning','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.0.width','100'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.dateAdded','\"2024-09-06T08:58:08+00:00\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.elementCondition','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.fieldUid','\"c72a3f62-2918-4562-a5dc-f4ce9058d1f4\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.handle','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.includeInCards','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.instructions','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.label','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.required','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.tip','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.uid','\"f422b20c-b6e6-4100-8f0a-60b27f99ea7e\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.userCondition','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.warning','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.elements.1.width','100'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.name','\"Content\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.uid','\"5abdd3c8-d6fd-420c-bdfe-42c62db1292c\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.fieldLayouts.f963a26a-1ae7-4018-a377-48603315252a.tabs.0.userCondition','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.handle','\"richText\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.hasTitleField','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.icon','\"font-case\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.name','\"Rich Text\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.showSlugField','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.showStatusField','false'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.slugTranslationKeyFormat','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.slugTranslationMethod','\"site\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.titleFormat','\"{entryId}\"'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.titleTranslationKeyFormat','null'),
('entryTypes.ca5e0d18-e144-47cd-946e-047f4febda59.titleTranslationMethod','\"site\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.color','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elementCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.autocomplete','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.autocorrect','true'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.class','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.dateAdded','\"2024-09-06T09:29:43+00:00\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.disabled','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.elementCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.id','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.includeInCards','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.inputType','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.instructions','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.label','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.max','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.min','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.name','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.orientation','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.placeholder','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.readonly','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.requirable','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.size','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.step','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.tip','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.title','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.uid','\"92b71cef-ffe9-453a-962e-9d5a0adf822d\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.userCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.warning','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.0.width','100'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.dateAdded','\"2024-09-06T09:32:29+00:00\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.elementCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.fieldUid','\"89e6df1f-af15-42ee-b1ca-95ca80f456c2\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.handle','\"locationContent\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.includeInCards','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.instructions','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.label','\"Location Content \"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.required','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.tip','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.uid','\"4764437f-a6f3-4589-abfe-08bd68964782\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.userCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.warning','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.1.width','100'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.dateAdded','\"2024-09-06T09:32:29+00:00\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.elementCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.fieldUid','\"ea9b90a7-89ea-48f5-b25f-9c0675e0d876\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.handle','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.includeInCards','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.instructions','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.label','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.required','false'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.tip','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.uid','\"5d5e5748-912b-4cad-b85f-0215a0f8bbcf\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.userCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.warning','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.elements.2.width','100'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.name','\"Content\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.uid','\"c8cd9954-344f-46c7-88dd-0442035c1664\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.fieldLayouts.152d9ed6-8286-407f-9b6c-a9241b83c641.tabs.0.userCondition','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.handle','\"locations\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.hasTitleField','true'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.icon','\"map\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.name','\"Locations\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.showSlugField','true'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.showStatusField','true'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.slugTranslationKeyFormat','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.slugTranslationMethod','\"site\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.titleFormat','\"\"'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.titleTranslationKeyFormat','null'),
('entryTypes.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650.titleTranslationMethod','\"site\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.color','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elementCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.dateAdded','\"2024-09-06T11:57:06+00:00\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.elementCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.handle','\"testimonial\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.includeInCards','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.instructions','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.label','\"Testimonial\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.required','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.tip','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.uid','\"5cdc702e-292c-4770-b3c6-aaafd0b108c0\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.userCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.warning','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.0.width','100'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.autocapitalize','true'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.autocomplete','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.autocorrect','true'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.class','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.dateAdded','\"2024-09-06T11:53:43+00:00\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.disabled','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.elementCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.id','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.includeInCards','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.inputType','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.instructions','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.label','\"Name\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.max','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.min','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.name','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.orientation','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.placeholder','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.readonly','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.requirable','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.size','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.step','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.tip','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.title','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.uid','\"cc390fca-3a19-4f14-84f3-da1447b39cdb\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.userCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.warning','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.1.width','100'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.dateAdded','\"2024-09-06T11:57:06+00:00\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.elementCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.fieldUid','\"6de8ed43-4ef2-41a4-962e-7fdcd2e65031\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.handle','\"location\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.includeInCards','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.instructions','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.label','\"Location\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.required','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.tip','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.uid','\"51a112c8-8359-465b-883f-593494b546bd\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.userCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.warning','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.elements.2.width','100'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.name','\"Content\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.uid','\"9e865495-da65-4015-ac3f-3de62af44721\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.fieldLayouts.90008bdf-d52a-41af-94e2-41b9f7930fff.tabs.0.userCondition','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.handle','\"testimonials\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.hasTitleField','true'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.icon','\"messages\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.name','\"Testimonials\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.showSlugField','false'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.showStatusField','true'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.slugTranslationKeyFormat','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.slugTranslationMethod','\"site\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.titleFormat','\"\"'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.titleTranslationKeyFormat','null'),
('entryTypes.fe374ec6-3f0b-4484-84e4-45a29a3a93b7.titleTranslationMethod','\"site\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.columnSuffix','null'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.handle','\"simpleTable\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.instructions','null'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.name','\"Simple Table\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.searchable','false'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.addRowLabel','\"Add a stat\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.0','\"col1\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Name\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.1.1','\"name\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.0','\"col2\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Value\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.1.1','\"value\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.columns.__assoc__.1.1.__assoc__.3.1','\"singleline\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.defaults.0.__assoc__.0.0','\"col1\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.defaults.0.__assoc__.0.1','\"\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.defaults.0.__assoc__.1.0','\"col2\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.defaults.0.__assoc__.1.1','\"\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.maxRows','4'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.minRows','2'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.settings.staticRows','false'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.translationKeyFormat','null'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.translationMethod','\"none\"'),
('fields.16080038-b7ee-465a-869e-112483ff46c0.type','\"craft\\\\fields\\\\Table\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.columnSuffix','null'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.handle','\"simpleUrl\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.instructions','null'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.name','\"URL\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.searchable','false'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.settings.maxLength','255'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.settings.types.0','\"url\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.settings.types.1','\"tel\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.settings.types.2','\"email\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.translationKeyFormat','null'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.translationMethod','\"none\"'),
('fields.2bcdf88c-4733-4b12-b3fe-9799c2773aea.type','\"craft\\\\fields\\\\Url\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.columnSuffix','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.handle','\"contentBuilder\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.instructions','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.name','\"Content Builder\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.searchable','false'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.createButtonLabel','\"New Content Model\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.entryTypes.0','\"b93f0c37-9d23-4379-a1b7-6b76af1181ab\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.entryTypes.1','\"460a499b-f8f1-4721-9a4f-aec7570042fd\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.entryTypes.2','\"ca5e0d18-e144-47cd-946e-047f4febda59\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.includeTableView','false'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.maxEntries','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.minEntries','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.pageSize','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.propagationKeyFormat','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.propagationMethod','\"all\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.showCardsInGrid','false'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.settings.viewMode','\"blocks\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.translationKeyFormat','null'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.translationMethod','\"site\"'),
('fields.695adb81-e37d-40c6-91f1-96198a560e1c.type','\"craft\\\\fields\\\\Matrix\"'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.columnSuffix','null'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.handle','\"plainText\"'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.instructions','null'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.name','\"Plain Text\"'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.searchable','false'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.byteLimit','null'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.charLimit','null'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.code','false'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.initialRows','4'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.multiline','false'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.placeholder','null'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.settings.uiMode','\"normal\"'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.translationKeyFormat','null'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.translationMethod','\"none\"'),
('fields.6de8ed43-4ef2-41a4-962e-7fdcd2e65031.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.columnSuffix','null'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.handle','\"contentBuilderCk\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.instructions','null'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.name','\"Content Builder CK\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.searchable','false'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.availableTransforms','\"\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.availableVolumes','\"*\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.ckeConfig','\"2fa9c924-e215-49c1-ba08-660b2b04acb5\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.createButtonLabel','\"New Content Module\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.defaultTransform','null'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.enableSourceEditingForNonAdmins','false'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.entryTypes.0','\"b93f0c37-9d23-4379-a1b7-6b76af1181ab\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.entryTypes.1','\"460a499b-f8f1-4721-9a4f-aec7570042fd\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.purifierConfig','null'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.purifyHtml','true'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.showUnpermittedFiles','false'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.showUnpermittedVolumes','false'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.showWordCount','false'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.settings.wordLimit','null'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.translationKeyFormat','null'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.translationMethod','\"none\"'),
('fields.89e6df1f-af15-42ee-b1ca-95ca80f456c2.type','\"craft\\\\ckeditor\\\\Field\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.columnSuffix','null'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.handle','\"location\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.instructions','null'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.name','\"Location\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.searchable','false'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.allowSelfRelations','false'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.branchLimit','null'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.maintainHierarchy','false'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.maxRelations','1'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.minRelations','1'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.selectionLabel','\"Add a location\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.showCardsInGrid','false'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.showSiteMenu','false'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.sources.0','\"section:f80f1d9a-9689-4aa1-9688-5bf4e20efc71\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.targetSiteId','null'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.validateRelatedElements','false'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.settings.viewMode','\"list\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.translationKeyFormat','null'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.translationMethod','\"none\"'),
('fields.99d56909-2e5f-46e7-a360-37ef5f53f971.type','\"craft\\\\fields\\\\Entries\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.columnSuffix','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.handle','\"image\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.instructions','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.name','\"Image\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.searchable','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.allowedKinds','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.allowSelfRelations','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.allowSubfolders','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.allowUploads','true'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.branchLimit','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.defaultUploadLocationSource','\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.defaultUploadLocationSubpath','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.localizeRelations','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.maintainHierarchy','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.maxRelations','1'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.minRelations','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.previewMode','\"full\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.restrictedDefaultUploadSubpath','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.restrictedLocationSource','\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.restrictedLocationSubpath','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.restrictFiles','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.restrictLocation','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.selectionLabel','\"add an image\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.showCardsInGrid','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.showSiteMenu','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.showUnpermittedFiles','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.showUnpermittedVolumes','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.sources.0','\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.targetSiteId','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.validateRelatedElements','false'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.settings.viewMode','\"list\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.translationKeyFormat','null'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.translationMethod','\"site\"'),
('fields.a5462f8d-6e69-451f-bcbf-9bb200fc174d.type','\"craft\\\\fields\\\\Assets\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.columnSuffix','null'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.handle','\"textLink\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.instructions','null'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.name','\"Text Link\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.searchable','false'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.addRowLabel','\"Add a CTA\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.0','\"col1\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.0.0','\"heading\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.0.1','\"Link Text\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.1.0','\"handle\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.1.1','\"linkText\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.2.0','\"width\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.2.1','\"\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.3.0','\"type\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.0.1.__assoc__.3.1','\"singleline\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.0','\"col2\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.0.0','\"heading\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.0.1','\"Link URL\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.1.0','\"handle\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.1.1','\"linkUrl\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.2.0','\"width\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.2.1','\"\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.3.0','\"type\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.columns.__assoc__.1.1.__assoc__.3.1','\"url\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.defaults.0.__assoc__.0.0','\"col1\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.defaults.0.__assoc__.0.1','\"\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.defaults.0.__assoc__.1.0','\"col2\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.defaults.0.__assoc__.1.1','\"\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.maxRows','1'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.minRows','null'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.settings.staticRows','false'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.translationKeyFormat','null'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.translationMethod','\"none\"'),
('fields.a62a212f-7b95-4908-8315-df40cc1a5093.type','\"craft\\\\fields\\\\Table\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.columnSuffix','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.handle','\"richTextContent\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.instructions','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.name','\"Rich Text Content\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.searchable','false'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.availableTransforms','\"\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.availableVolumes','\"*\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.ckeConfig','\"aada7c0a-0401-46f7-bc65-12fc53fb9109\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.createButtonLabel','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.defaultTransform','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.enableSourceEditingForNonAdmins','false'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.purifierConfig','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.purifyHtml','true'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.showUnpermittedFiles','false'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.showUnpermittedVolumes','false'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.showWordCount','false'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.settings.wordLimit','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.translationKeyFormat','null'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.translationMethod','\"none\"'),
('fields.c72a3f62-2918-4562-a5dc-f4ce9058d1f4.type','\"craft\\\\ckeditor\\\\Field\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.columnSuffix','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.handle','\"images\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.instructions','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.name','\"images\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.searchable','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.allowedKinds.0','\"image\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.allowSelfRelations','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.allowSubfolders','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.allowUploads','true'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.branchLimit','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.defaultUploadLocationSource','\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.defaultUploadLocationSubpath','\"{slug}\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.localizeRelations','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.maintainHierarchy','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.maxRelations','4'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.minRelations','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.previewMode','\"full\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.restrictedDefaultUploadSubpath','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.restrictedLocationSource','\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.restrictedLocationSubpath','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.restrictFiles','true'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.restrictLocation','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.selectionLabel','\"Add an image\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.showCardsInGrid','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.showSiteMenu','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.showUnpermittedFiles','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.showUnpermittedVolumes','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.sources.0','\"volume:9bebaaa3-6d87-4c75-afc8-f5f75ab950c4\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.targetSiteId','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.validateRelatedElements','false'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.settings.viewMode','\"list\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.translationKeyFormat','null'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.translationMethod','\"site\"'),
('fields.ea9b90a7-89ea-48f5-b25f-9c0675e0d876.type','\"craft\\\\fields\\\\Assets\"'),
('fs.local.hasUrls','true'),
('fs.local.name','\"Local\"'),
('fs.local.settings.path','\"@webroot/local\"'),
('fs.local.type','\"craft\\\\fs\\\\Local\"'),
('fs.local.url','\"@web/local\"'),
('graphql.schemas.620caa93-2603-4217-9713-700e82292681.isPublic','true'),
('graphql.schemas.620caa93-2603-4217-9713-700e82292681.name','\"Public Schema\"'),
('meta.__names__.10a7e081-e196-46ea-a6c3-6f04496d7de0','\"About\"'),
('meta.__names__.16080038-b7ee-465a-869e-112483ff46c0','\"Simple Table\"'),
('meta.__names__.19eaa83e-07ac-462d-9d31-928fb4fd4cf3','\"Testimonials\"'),
('meta.__names__.2bcdf88c-4733-4b12-b3fe-9799c2773aea','\"URL\"'),
('meta.__names__.2fa9c924-e215-49c1-ba08-660b2b04acb5','\"Content Builder\"'),
('meta.__names__.396f0793-7466-4fc7-8d32-be8328d2369b','\"About\"'),
('meta.__names__.3db93919-04b1-4128-975f-f831ed967af0','\"Homepage\"'),
('meta.__names__.3e394d1a-6745-477e-90a6-d9aea2f71188','\"Adventures\"'),
('meta.__names__.4052097c-4aec-4442-af4c-df0a26b20065','\"Craft 5\"'),
('meta.__names__.460a499b-f8f1-4721-9a4f-aec7570042fd','\"Call To Action\"'),
('meta.__names__.5ebfdea0-4852-45f6-961c-31de85495858','\"Adventures\"'),
('meta.__names__.620caa93-2603-4217-9713-700e82292681','\"Public Schema\"'),
('meta.__names__.695adb81-e37d-40c6-91f1-96198a560e1c','\"Content Builder\"'),
('meta.__names__.69d923c0-06ba-468b-be90-9c6885e5e710','\"Homepage\"'),
('meta.__names__.6de8ed43-4ef2-41a4-962e-7fdcd2e65031','\"Plain Text\"'),
('meta.__names__.82e25a63-e6c1-4634-a675-ec8f2e3868ff','\"FAQs\"'),
('meta.__names__.89e6df1f-af15-42ee-b1ca-95ca80f456c2','\"Content Builder CK\"'),
('meta.__names__.8f8b8035-b0d0-44a9-b3af-681ce34f8cad','\"Text Link\"'),
('meta.__names__.99d56909-2e5f-46e7-a360-37ef5f53f971','\"Location\"'),
('meta.__names__.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4','\"Images\"'),
('meta.__names__.a5462f8d-6e69-451f-bcbf-9bb200fc174d','\"Image\"'),
('meta.__names__.a62a212f-7b95-4908-8315-df40cc1a5093','\"Text Link\"'),
('meta.__names__.aada7c0a-0401-46f7-bc65-12fc53fb9109','\"Simple\"'),
('meta.__names__.b93f0c37-9d23-4379-a1b7-6b76af1181ab','\"Stats\"'),
('meta.__names__.c72a3f62-2918-4562-a5dc-f4ce9058d1f4','\"Rich Text Content\"'),
('meta.__names__.ca5e0d18-e144-47cd-946e-047f4febda59','\"Rich Text\"'),
('meta.__names__.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b','\"Craft 5\"'),
('meta.__names__.ea9b90a7-89ea-48f5-b25f-9c0675e0d876','\"images\"'),
('meta.__names__.f80f1d9a-9689-4aa1-9688-5bf4e20efc71','\"Locations\"'),
('meta.__names__.f92db1fe-0a5a-4f76-bc5d-867ce8a9b650','\"Locations\"'),
('meta.__names__.fe374ec6-3f0b-4484-84e4-45a29a3a93b7','\"Testimonials\"'),
('plugins.ckeditor.edition','\"standard\"'),
('plugins.ckeditor.enabled','true'),
('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.defaultPlacement','\"end\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.enableVersioning','true'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.entryTypes.0','\"ca5e0d18-e144-47cd-946e-047f4febda59\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.handle','\"about\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.maxAuthors','1'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.name','\"About\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.propagationMethod','\"all\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabledByDefault','true'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','true'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.template','\"about/_entry.twig\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.uriFormat','\"about\"'),
('sections.10a7e081-e196-46ea-a6c3-6f04496d7de0.type','\"single\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.defaultPlacement','\"end\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.enableVersioning','true'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.entryTypes.0','\"fe374ec6-3f0b-4484-84e4-45a29a3a93b7\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.handle','\"testimonials\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.maxAuthors','1'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.name','\"Testimonials\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.propagationMethod','\"all\"'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabledByDefault','true'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','false'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.template','null'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.uriFormat','null'),
('sections.19eaa83e-07ac-462d-9d31-928fb4fd4cf3.type','\"channel\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.defaultPlacement','\"end\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.enableVersioning','true'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.entryTypes.0','\"5ebfdea0-4852-45f6-961c-31de85495858\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.handle','\"adventures\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.maxAuthors','1'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.name','\"Adventures\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.1.__assoc__.0.0','\"label\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.1.__assoc__.0.1','\"Listing page\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.1.__assoc__.1.0','\"urlFormat\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.1.__assoc__.1.1','\"/adventures\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.1.__assoc__.2.0','\"refresh\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.1.__assoc__.2.1','\"1\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.2.__assoc__.0.0','\"label\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.2.__assoc__.0.1','\"Homepage\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.2.__assoc__.1.0','\"urlFormat\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.2.__assoc__.1.1','\"/\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.2.__assoc__.2.0','\"refresh\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.previewTargets.2.__assoc__.2.1','\"1\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.propagationMethod','\"all\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabledByDefault','true'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','true'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.template','\"adventures/_entry\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.uriFormat','\"adventures/{slug}\"'),
('sections.3e394d1a-6745-477e-90a6-d9aea2f71188.type','\"channel\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.defaultPlacement','\"end\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.enableVersioning','true'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.entryTypes.0','\"3db93919-04b1-4128-975f-f831ed967af0\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.handle','\"homepage\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.maxAuthors','1'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.name','\"Homepage\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.propagationMethod','\"all\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabledByDefault','true'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','true'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.template','\"index.twig\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.uriFormat','\"__home__\"'),
('sections.69d923c0-06ba-468b-be90-9c6885e5e710.type','\"single\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.defaultPlacement','\"end\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.enableVersioning','true'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.entryTypes.0','\"ca5e0d18-e144-47cd-946e-047f4febda59\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.handle','\"faqs\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.maxAuthors','1'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.name','\"FAQs\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.propagationMethod','\"all\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabledByDefault','true'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','true'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.template','\"faqs.twig\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.uriFormat','\"faqs\"'),
('sections.82e25a63-e6c1-4634-a675-ec8f2e3868ff.type','\"single\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.defaultPlacement','\"end\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.enableVersioning','true'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.entryTypes.0','\"f92db1fe-0a5a-4f76-bc5d-867ce8a9b650\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.handle','\"locations\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.maxAuthors','1'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.name','\"Locations\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.propagationMethod','\"all\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabledByDefault','true'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','true'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.template','\"locations/_entry\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.siteSettings.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.uriFormat','\"locations/{slug}\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.structure.maxLevels','1'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.structure.uid','\"70322d2c-ef03-41bb-8e88-e6cc0804572c\"'),
('sections.f80f1d9a-9689-4aa1-9688-5bf4e20efc71.type','\"structure\"'),
('siteGroups.4052097c-4aec-4442-af4c-df0a26b20065.name','\"Craft 5\"'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.enabled','true'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.handle','\"default\"'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.hasUrls','true'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.language','\"en-US\"'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.name','\"Craft 5\"'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.primary','true'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.siteGroup','\"4052097c-4aec-4442-af4c-df0a26b20065\"'),
('sites.d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b.sortOrder','1'),
('system.edition','\"pro\"'),
('system.live','true'),
('system.name','\"Craft 5\"'),
('system.retryDuration','null'),
('system.schemaVersion','\"5.3.0.2\"'),
('system.timeZone','\"America/Chicago\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.require2fa','false'),
('users.requireEmailVerification','true'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.altTranslationKeyFormat','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.altTranslationMethod','\"none\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elementCondition','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.autocapitalize','true'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.autocomplete','false'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.autocorrect','true'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.class','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.disabled','false'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.elementCondition','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.id','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.includeInCards','false'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.inputType','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.instructions','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.label','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.max','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.min','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.name','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.orientation','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.placeholder','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.providesThumbs','false'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.readonly','false'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.requirable','false'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.size','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.step','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.tip','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.title','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.uid','\"aa78243a-f656-40a9-81c0-4edee5120fca\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.userCondition','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.warning','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.elements.0.width','100'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.name','\"Content\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.uid','\"7427e29a-16f2-4d4f-a6ae-63a1d6ef3889\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fieldLayouts.9fc75424-93f8-411b-b0c4-4dd06e64631e.tabs.0.userCondition','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.fs','\"local\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.handle','\"images\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.name','\"Images\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.sortOrder','1'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.subpath','\"images\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.titleTranslationKeyFormat','null'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.titleTranslationMethod','\"site\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.transformFs','\"\"'),
('volumes.9bebaaa3-6d87-4c75-afc8-f5f75ab950c4.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES
(2,2,2,NULL,5,1,'2024-09-06 08:21:58','2024-09-06 08:21:58','e72bd0b9-d333-4ecd-b66f-f614640f3dcd'),
(3,2,6,NULL,5,1,'2024-09-06 08:21:59','2024-09-06 08:21:59','70c6d913-818a-4242-9864-b5432edcbf18'),
(8,3,7,NULL,5,1,'2024-09-06 08:34:32','2024-09-06 08:34:32','ab6f687f-29f7-4ccd-be78-6d51283f2809'),
(9,3,7,NULL,10,2,'2024-09-06 08:34:32','2024-09-06 08:34:32','77d5f926-c439-4807-81d1-64958caec52d'),
(10,3,7,NULL,11,3,'2024-09-06 08:34:32','2024-09-06 08:34:32','3c65ff85-4f5c-48f5-a30b-65b32219a16e'),
(11,3,13,NULL,5,1,'2024-09-06 08:34:32','2024-09-06 08:34:32','b9500025-1c24-4576-bf8b-288de2044d7d'),
(12,3,13,NULL,10,2,'2024-09-06 08:34:32','2024-09-06 08:34:32','f07f5e8b-bf86-4976-bea8-41b1ff1d29da'),
(13,3,13,NULL,11,3,'2024-09-06 08:34:32','2024-09-06 08:34:32','ef288fc0-4a5f-47b2-beaa-60c29b945843'),
(17,3,24,NULL,5,1,'2024-09-06 09:02:44','2024-09-06 09:02:44','4e0eac4d-3277-4bfb-a7a4-45c3db16652a'),
(18,3,24,NULL,10,2,'2024-09-06 09:02:44','2024-09-06 09:02:44','fcc643cb-1b6b-4919-ae72-7ea1671fc458'),
(19,3,24,NULL,11,3,'2024-09-06 09:02:44','2024-09-06 09:02:44','f6f2b333-a2d9-4eb7-b838-b79c9fcbd251'),
(23,3,30,NULL,5,1,'2024-09-06 09:03:50','2024-09-06 09:03:50','ef717e8f-24a8-4df3-b4fb-77f031729d24'),
(24,3,30,NULL,10,2,'2024-09-06 09:03:50','2024-09-06 09:03:50','abdaee23-5a86-43f4-854b-57029f8e2830'),
(25,3,30,NULL,11,3,'2024-09-06 09:03:50','2024-09-06 09:03:50','b7eff33c-6589-4a72-b317-ffc98f567742'),
(29,3,39,NULL,5,1,'2024-09-06 09:07:51','2024-09-06 09:07:51','2b62f7e2-b043-4831-bf4a-a0b5a7f6b53e'),
(30,3,39,NULL,10,2,'2024-09-06 09:07:51','2024-09-06 09:07:51','c4ef50f4-7be6-4342-aec7-8cedc755d062'),
(31,3,39,NULL,11,3,'2024-09-06 09:07:51','2024-09-06 09:07:51','c97a46c0-0c8d-4838-b634-99b5453f0667'),
(35,3,53,NULL,5,1,'2024-09-06 09:19:17','2024-09-06 09:19:17','711578d8-9ee7-4486-9b56-d0ea22264811'),
(36,3,53,NULL,10,2,'2024-09-06 09:19:17','2024-09-06 09:19:17','5bd08cfc-b41c-4374-8516-b2bdc733d70d'),
(37,3,53,NULL,11,3,'2024-09-06 09:19:17','2024-09-06 09:19:17','86066e1d-2184-485d-82d2-069b9db4e764'),
(38,3,55,NULL,5,1,'2024-09-06 09:24:23','2024-09-06 09:24:23','03f33ab3-420d-4908-80ca-7a7639c5d973'),
(39,3,55,NULL,10,2,'2024-09-06 09:24:23','2024-09-06 09:24:23','d3496c69-9148-480c-a981-4d1b0c3b6705'),
(40,3,55,NULL,11,3,'2024-09-06 09:24:23','2024-09-06 09:24:23','8d61408e-a6ad-4e80-8c13-6babdee0ea57'),
(41,3,56,NULL,5,1,'2024-09-06 09:28:20','2024-09-06 09:28:20','330fd157-4e35-4c2a-8404-3daf406b0dfd'),
(42,3,56,NULL,10,2,'2024-09-06 09:28:20','2024-09-06 09:28:20','0a8c6eb1-e7c8-4120-b097-3dc8733f585f'),
(43,3,56,NULL,11,3,'2024-09-06 09:28:20','2024-09-06 09:28:20','47306c6b-18bf-44d2-9e74-1df8f76480ce'),
(44,3,57,NULL,5,1,'2024-09-06 09:34:40','2024-09-06 09:34:40','6280f504-a2fa-45e5-a583-4f9fc9145aa7'),
(45,3,59,NULL,5,1,'2024-09-06 09:34:41','2024-09-06 09:34:41','7943ff56-3354-402a-8527-c49188562a84'),
(46,3,61,NULL,12,1,'2024-09-06 09:35:28','2024-09-06 09:35:28','d87ec432-87be-4134-b807-e410f2001b9d'),
(47,3,61,NULL,11,2,'2024-09-06 09:35:28','2024-09-06 09:35:28','4a1e5084-1382-4a77-9801-7a8bba588e38'),
(48,3,62,NULL,12,1,'2024-09-06 09:35:30','2024-09-06 09:35:30','25c723ab-792f-4189-a3fb-b2f054ce78f3'),
(49,3,62,NULL,11,2,'2024-09-06 09:35:30','2024-09-06 09:35:30','18bbd594-a1c8-41e8-9417-aa1253564f09'),
(54,10,7,NULL,57,1,'2024-09-06 09:37:05','2024-09-06 09:37:05','50f52cc7-cbf6-46fe-8ea8-158e068c8ef0'),
(55,10,64,NULL,57,1,'2024-09-06 09:37:05','2024-09-06 09:37:05','5a375ce7-ca7c-4f1d-8079-62bd4d4afa07'),
(56,3,64,NULL,5,1,'2024-09-06 09:37:05','2024-09-06 09:37:05','da76b592-72a7-495c-94b9-fb00658af9a7'),
(57,3,64,NULL,10,2,'2024-09-06 09:37:05','2024-09-06 09:37:05','c03b1caf-5494-4589-8fe4-57c9d0de848b'),
(58,3,64,NULL,11,3,'2024-09-06 09:37:05','2024-09-06 09:37:05','b2a79c13-d79f-4388-8fb0-836c73ca6968'),
(60,2,66,NULL,5,1,'2024-09-06 09:42:43','2024-09-06 09:42:43','a1575ffb-3091-4cc3-ae77-25c4003261ae'),
(61,2,67,NULL,5,1,'2024-09-06 09:56:22','2024-09-06 09:56:22','d749761f-58c3-4b12-9122-8f680a228b53'),
(62,10,68,NULL,57,1,'2024-09-06 09:56:26','2024-09-06 09:56:26','a18714d3-5712-4746-9af7-03f43e2031ef'),
(63,3,68,NULL,5,1,'2024-09-06 09:56:26','2024-09-06 09:56:26','23fb57a9-cc8c-469c-970c-9e7ef27ecee3'),
(64,3,68,NULL,10,2,'2024-09-06 09:56:26','2024-09-06 09:56:26','f0fb2da8-eade-45f8-85f6-ad34ae8e99fb'),
(65,3,68,NULL,11,3,'2024-09-06 09:56:26','2024-09-06 09:56:26','9b03cd62-259d-4a0b-8e60-bed5298bbe3b');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES
(1,2,1,1,NULL),
(2,2,1,2,'Applied “Draft 1”'),
(3,7,1,1,''),
(4,7,1,2,'Applied “Draft 1”'),
(5,7,1,3,'Applied “Draft 1”'),
(6,20,1,1,NULL),
(7,21,1,1,NULL),
(8,22,1,1,NULL),
(9,23,1,1,NULL),
(10,7,1,4,'Applied “Draft 1”'),
(11,7,1,5,'Applied “Draft 1”'),
(12,36,1,1,NULL),
(13,37,1,1,NULL),
(14,38,1,1,NULL),
(16,45,1,1,NULL),
(17,47,1,1,NULL),
(18,45,1,2,NULL),
(19,47,1,2,''),
(20,7,1,6,'Applied “Draft 1”'),
(21,22,1,2,NULL),
(22,7,1,7,NULL),
(23,7,1,8,''),
(24,57,1,1,''),
(25,58,1,1,NULL),
(26,61,1,1,''),
(27,7,1,9,'Applied “Draft 1”'),
(28,2,1,3,'Applied “Draft 1”'),
(29,2,1,4,''),
(30,7,1,10,''),
(31,69,1,1,''),
(32,71,1,1,''),
(33,73,1,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES
(1,'email',0,1,' ryan craftquest io '),
(1,'firstname',0,1,''),
(1,'fullname',0,1,''),
(1,'lastname',0,1,''),
(1,'slug',0,1,''),
(1,'username',0,1,' admin '),
(2,'slug',0,1,' homepage '),
(2,'title',0,1,' get out and explore the trails '),
(5,'alt',0,1,''),
(5,'extension',0,1,' jpg '),
(5,'filename',0,1,' massimo sartirana w mbu ac2m8 unsplash jpg '),
(5,'kind',0,1,' image '),
(5,'slug',0,1,''),
(5,'title',0,1,' massimo sartirana w m bu a c2m8 unsplash '),
(7,'slug',0,1,' big bend bounce '),
(7,'title',0,1,' big bend bounce '),
(10,'alt',0,1,''),
(10,'extension',0,1,' jpg '),
(10,'filename',0,1,' alex shutin kkvqj6rk6s4 unsplash jpg '),
(10,'kind',0,1,' image '),
(10,'slug',0,1,''),
(10,'title',0,1,' alex shutin k kv qj6r k6 s4 unsplash '),
(11,'alt',0,1,''),
(11,'extension',0,1,' jpg '),
(11,'filename',0,1,' alessio soggetti gyr9a2cpmhy unsplash jpg '),
(11,'kind',0,1,' image '),
(11,'slug',0,1,''),
(11,'title',0,1,' alessio soggetti g yr9 a2 cp mh y unsplash '),
(12,'alt',0,1,''),
(12,'extension',0,1,' jpg '),
(12,'filename',0,1,' massimo sartirana w mbu ac2m8 unsplash jpg '),
(12,'kind',0,1,' image '),
(12,'slug',0,1,''),
(12,'title',0,1,' massimo sartirana w m bu a c2m8 unsplash '),
(20,'slug',0,1,' temp euxgmwduumpwtojwsnyiqyrrzaonyhspujlc '),
(20,'title',0,1,''),
(21,'slug',0,1,' big bend bounce stats '),
(21,'title',0,1,' big bend bounce stats '),
(22,'slug',0,1,' sign up now cta '),
(22,'title',0,1,' sign up now cta '),
(23,'slug',0,1,' sign up now '),
(23,'title',0,1,' sign up now '),
(36,'slug',0,1,' big bend bounce stats '),
(36,'title',0,1,' big bend bounce stats '),
(37,'slug',0,1,' sign up now cta '),
(37,'title',0,1,' sign up now cta '),
(38,'slug',0,1,' sign up now '),
(38,'title',0,1,' sign up now '),
(45,'slug',0,1,' faqs '),
(45,'title',0,1,' faqs '),
(47,'slug',0,1,' about '),
(47,'title',0,1,' about '),
(57,'slug',0,1,' big bend national park '),
(57,'title',0,1,' big bend national park '),
(58,'slug',0,1,' temp fhqvknwdyvovnnjbmncswznqgwzootwqaolk '),
(58,'title',0,1,''),
(61,'slug',0,1,' bend or '),
(61,'title',0,1,' bend or '),
(69,'slug',0,1,' justine jakes '),
(69,'title',0,1,' justine jakes '),
(71,'slug',0,1,' milton waddams '),
(71,'title',0,1,' milton waddams '),
(73,'slug',0,1,' pitbull '),
(73,'title',0,1,' pitbull ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES
(1,NULL,'Homepage','homepage','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-06 08:20:54','2024-09-06 08:20:54',NULL,'69d923c0-06ba-468b-be90-9c6885e5e710'),
(2,NULL,'Adventures','adventures','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}, {\"label\": \"Listing page\", \"refresh\": \"1\", \"urlFormat\": \"/adventures\"}, {\"label\": \"Homepage\", \"refresh\": \"1\", \"urlFormat\": \"/\"}]','2024-09-06 08:32:25','2024-09-06 09:22:12',NULL,'3e394d1a-6745-477e-90a6-d9aea2f71188'),
(3,NULL,'About','about','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-06 09:10:55','2024-09-06 09:10:55',NULL,'10a7e081-e196-46ea-a6c3-6f04496d7de0'),
(4,NULL,'FAQs','faqs','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-06 09:11:47','2024-09-06 09:11:47',NULL,'82e25a63-e6c1-4634-a675-ec8f2e3868ff'),
(5,1,'Locations','locations','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-06 09:33:04','2024-09-06 09:33:04',NULL,'f80f1d9a-9689-4aa1-9688-5bf4e20efc71'),
(6,NULL,'Testimonials','testimonials','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2024-09-06 11:57:22','2024-09-06 11:57:22',NULL,'19eaa83e-07ac-462d-9d31-928fb4fd4cf3');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES
(1,1,1),
(2,2,1),
(3,6,1),
(4,6,1),
(5,8,1),
(6,9,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'__home__','index.twig',1,'2024-09-06 08:20:54','2024-09-06 08:20:54','b042517f-6ffb-4809-807d-e10500acf912'),
(2,2,1,1,'adventures/{slug}','adventures/_entry',1,'2024-09-06 08:32:25','2024-09-06 10:02:42','9005a22d-8cde-4ca8-95a1-655610e7d4df'),
(3,3,1,1,'about','about/_entry.twig',1,'2024-09-06 09:10:55','2024-09-06 09:10:55','fefe5214-3e50-4923-a3ea-47abd0dc6cd2'),
(4,4,1,1,'faqs','faqs.twig',1,'2024-09-06 09:11:47','2024-09-06 09:12:52','6bed3514-ca18-4219-b8c8-753a6066427d'),
(5,5,1,1,'locations/{slug}','locations/_entry',1,'2024-09-06 09:33:04','2024-09-06 09:33:04','f4ffde6a-7486-442b-a1d9-74cbfdedda1e'),
(6,6,1,0,NULL,NULL,1,'2024-09-06 11:57:22','2024-09-06 11:57:22','2ac09d65-507e-4110-8680-0b1dc6c5560b');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES
(1,'Craft 5','2024-03-11 23:24:29','2024-09-06 07:50:14',NULL,'4052097c-4aec-4442-af4c-df0a26b20065');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES
(1,1,1,'1','Craft 5','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-03-11 23:24:29','2024-09-06 07:50:14',NULL,'d9d1ae21-b5ed-442d-bc28-0e3aa8b8c39b');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES
(1,1,NULL,1,1,6,0,'2024-09-06 09:33:58','2024-09-06 09:35:17','5e5d525d-0de3-451c-bf76-333fa53a03df'),
(2,1,57,1,2,3,1,'2024-09-06 09:33:58','2024-09-06 09:33:58','321649f7-a130-4093-a061-787c405c53d1'),
(3,1,61,1,4,5,1,'2024-09-06 09:35:17','2024-09-06 09:35:17','f73579a8-38dd-4b0f-a40c-8f809402df16');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES
(1,1,'2024-09-06 09:33:04','2024-09-06 09:33:48',NULL,'70322d2c-ef03-41bb-8e88-e6cc0804572c');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES
(1,'{\"locale\": null, \"language\": \"en-US\", \"useShapes\": false, \"weekStartDay\": \"1\", \"underlineLinks\": false, \"disableAutofocus\": \"\", \"profileTemplates\": false, \"showFieldHandles\": true, \"showExceptionView\": false, \"alwaysShowFocusRings\": false, \"notificationDuration\": \"5000\", \"enableDebugToolbarForCp\": false, \"enableDebugToolbarForSite\": false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'ryan@craftquest.io','$2y$13$hm/H3mAxgs7ifedYzY.bZOmp9GYyKL4RTgRovJO3mfT11bz7d.4sq','2024-09-09 11:20:16',NULL,NULL,NULL,'2024-09-09 11:20:11',NULL,1,NULL,NULL,NULL,0,'2024-03-11 23:24:30','2024-03-11 23:24:30','2024-09-09 11:20:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Images',NULL,'2024-09-06 07:50:14','2024-09-06 07:50:14','cb81ee90-c5d3-43a7-b3b3-d447407073db'),
(2,NULL,NULL,'Temporary Uploads',NULL,'2024-09-06 08:32:33','2024-09-06 08:32:33','44fc887e-e7cf-4a03-9ecf-a36c15172916'),
(3,2,NULL,'user_1','user_1/','2024-09-06 08:32:33','2024-09-06 08:32:33','55c83e1c-9f0c-49e8-8d9f-098cf18d4009'),
(4,1,1,'big-bend-bounce','big-bend-bounce/','2024-09-06 08:34:18','2024-09-06 08:34:18','558ef85d-feb6-4e4b-a770-62b6a32e0bad');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES
(1,1,'Images','images','local','images','','','site',NULL,'none',NULL,1,'2024-09-06 07:50:14','2024-09-06 07:50:14',NULL,'9bebaaa3-6d87-4c75-afc8-f5f75ab950c4');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2024-09-06 07:59:29','2024-09-06 07:59:29','c42fc21d-a288-45a2-ad67-2db07dedf5b3'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-09-06 07:59:29','2024-09-06 07:59:29','2f9d76ac-da02-4ccd-b0a9-ed126fa39cdc'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-09-06 07:59:29','2024-09-06 07:59:29','bb44312b-83b3-4f99-96f5-c6d376fe6fa6'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2024-09-06 07:59:29','2024-09-06 07:59:29','a752e47a-dab4-4ca7-ad1c-b6c1f20d526e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-09 12:52:10
