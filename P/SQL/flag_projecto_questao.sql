/*
Navicat MySQL Data Transfer

Source Server         : Ri_Valé
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : flag_projecto_questao

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-02-22 21:32:44
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE flag_projecto_questao;

-- ----------------------------
-- Table structure for `questao_contacto`
-- ----------------------------
DROP TABLE IF EXISTS `questao_contacto`;
CREATE TABLE `questao_contacto` (
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `questao` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questao_contacto
-- ----------------------------
INSERT INTO `questao_contacto` VALUES ('jricvalerio@gmail.com', 'José Ricardo de Almeida Valério', 'Qual o tamanho do Universo?');
