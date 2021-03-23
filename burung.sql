/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100508
 Source Host           : 127.0.0.1:3306
 Source Schema         : burung

 Target Server Type    : MySQL
 Target Server Version : 100508
 File Encoding         : 65001

 Date: 23/03/2021 09:35:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `pemilik_tempat_id` int(11) DEFAULT NULL,
  `nama_event` varchar(255) DEFAULT NULL,
  `tgl_event` varchar(255) DEFAULT NULL,
  `nominal` decimal(25,2) DEFAULT NULL,
  `jml_row` int(11) DEFAULT NULL,
  `jml_col` int(11) DEFAULT NULL,
  `type_gnt` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of event
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for event_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `event_penilaian`;
CREATE TABLE `event_penilaian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_penilaian_id` int(11) DEFAULT NULL,
  `nilai` decimal(25,2) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of event_penilaian
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gantungan
-- ----------------------------
DROP TABLE IF EXISTS `gantungan`;
CREATE TABLE `gantungan` (
  `id` varchar(60) NOT NULL,
  `no_gnt` varchar(255) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of gantungan
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for juri
-- ----------------------------
DROP TABLE IF EXISTS `juri`;
CREATE TABLE `juri` (
  `id` int(11) NOT NULL,
  `nama_juri` varchar(255) DEFAULT NULL,
  `pemilik_tempat_id` int(11) DEFAULT NULL,
  `kode_juri` varchar(255) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  `telp_juri` varchar(255) DEFAULT NULL,
  `email_juri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of juri
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for penilaian
-- ----------------------------
DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE `penilaian` (
  `id` varchar(60) NOT NULL,
  `gantungan_id` varchar(60) DEFAULT NULL,
  `nilai` decimal(25,0) DEFAULT NULL,
  `type_nilai` int(11) DEFAULT NULL,
  `juri_id` int(11) DEFAULT NULL,
  `timestmp` varchar(25) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of penilaian
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for peserta
-- ----------------------------
DROP TABLE IF EXISTS `peserta`;
CREATE TABLE `peserta` (
  `id` varchar(60) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `telp` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of peserta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for peserta_booking
-- ----------------------------
DROP TABLE IF EXISTS `peserta_booking`;
CREATE TABLE `peserta_booking` (
  `id` varchar(60) NOT NULL,
  `peserta_id` varchar(60) DEFAULT NULL,
  `gantunga_id` varchar(60) DEFAULT NULL,
  `kode_booking` varchar(255) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of peserta_booking
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tempat
-- ----------------------------
DROP TABLE IF EXISTS `tempat`;
CREATE TABLE `tempat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pemilik` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `notlp` varchar(255) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tempat
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi` (
  `id` varchar(60) NOT NULL,
  `peserta_booking_id` varchar(60) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for type_penilaian
-- ----------------------------
DROP TABLE IF EXISTS `type_penilaian`;
CREATE TABLE `type_penilaian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_type` varchar(255) DEFAULT NULL,
  `nilai` decimal(25,2) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `kat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type_penilaian
-- ----------------------------
BEGIN;
INSERT INTO `type_penilaian` VALUES (1, 'Merah', 100.00, 'red', 'LB');
INSERT INTO `type_penilaian` VALUES (2, 'Kuning', 15.00, 'yellow', 'LB');
INSERT INTO `type_penilaian` VALUES (3, 'Biru', 40.00, 'blue', 'LB');
INSERT INTO `type_penilaian` VALUES (4, 'Bunyi', 37.00, NULL, 'OT');
INSERT INTO `type_penilaian` VALUES (5, 'Bunyi Stabil', 37.50, NULL, 'OT');
INSERT INTO `type_penilaian` VALUES (6, 'Bendera Favorit', 0.00, NULL, 'OT');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `created_ad` datetime DEFAULT NULL,
  `updated_ad` datetime DEFAULT NULL,
  `role` int(11) DEFAULT 2 COMMENT '1=superadm 2=event organize',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
