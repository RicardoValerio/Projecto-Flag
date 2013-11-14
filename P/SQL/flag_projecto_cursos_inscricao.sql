/*
Navicat MySQL Data Transfer

Source Server         : Ri_Valé
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : flag_projecto_cursos_inscricao

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-02-22 21:32:53
*/

SET FOREIGN_KEY_CHECKS=0;


CREATE TABLE flag_projecto_cursos_inscricao;

-- ----------------------------
-- Table structure for `aluno_inscrito`
-- ----------------------------
DROP TABLE IF EXISTS `aluno_inscrito`;
CREATE TABLE `aluno_inscrito` (
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `morada` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_telf` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_curso_fk` int(10) unsigned NOT NULL,
  `id_plataforma_fk` int(10) unsigned NOT NULL,
  `comentario` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`email`),
  KEY `id_curso_do_aluno` (`id_curso_fk`),
  KEY `id_plataforma` (`id_plataforma_fk`),
  CONSTRAINT `id_curso_do_aluno` FOREIGN KEY (`id_curso_fk`) REFERENCES `curso_horario` (`id_curso_do_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_plataforma` FOREIGN KEY (`id_plataforma_fk`) REFERENCES `plataforma` (`id_plataforma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aluno_inscrito
-- ----------------------------
INSERT INTO `aluno_inscrito` VALUES ('jricvalerio@gmail.com', 'Ricardo Valério', 'Rua Particular', '960001111', '11', '2', 'Obrigado!');

-- ----------------------------
-- Table structure for `curso`
-- ----------------------------
DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `id_curso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of curso
-- ----------------------------
INSERT INTO `curso` VALUES ('1', 'Web Programmer & Mobile');
INSERT INTO `curso` VALUES ('2', 'Graphic Designer');
INSERT INTO `curso` VALUES ('3', 'Video & Motion');
INSERT INTO `curso` VALUES ('4', 'Web Design');

-- ----------------------------
-- Table structure for `curso_horario`
-- ----------------------------
DROP TABLE IF EXISTS `curso_horario`;
CREATE TABLE `curso_horario` (
  `id_curso_do_aluno` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_curso_fk` int(10) unsigned NOT NULL,
  `id_horario_fk` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_curso_do_aluno`),
  KEY `id_curso_fk` (`id_curso_fk`),
  KEY `id_horario_fk` (`id_horario_fk`),
  CONSTRAINT `id_curso_fk` FOREIGN KEY (`id_curso_fk`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_horario_fk` FOREIGN KEY (`id_horario_fk`) REFERENCES `horario` (`id_horario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of curso_horario
-- ----------------------------
INSERT INTO `curso_horario` VALUES ('1', '1', '1');
INSERT INTO `curso_horario` VALUES ('2', '1', '2');
INSERT INTO `curso_horario` VALUES ('3', '1', '3');
INSERT INTO `curso_horario` VALUES ('4', '2', '1');
INSERT INTO `curso_horario` VALUES ('5', '2', '2');
INSERT INTO `curso_horario` VALUES ('6', '2', '3');
INSERT INTO `curso_horario` VALUES ('7', '3', '1');
INSERT INTO `curso_horario` VALUES ('8', '3', '2');
INSERT INTO `curso_horario` VALUES ('9', '3', '3');
INSERT INTO `curso_horario` VALUES ('10', '4', '1');
INSERT INTO `curso_horario` VALUES ('11', '4', '2');
INSERT INTO `curso_horario` VALUES ('12', '4', '3');

-- ----------------------------
-- Table structure for `horario`
-- ----------------------------
DROP TABLE IF EXISTS `horario`;
CREATE TABLE `horario` (
  `id_horario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_horario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO `horario` VALUES ('1', 'Manhã');
INSERT INTO `horario` VALUES ('2', 'Tarde');
INSERT INTO `horario` VALUES ('3', 'Pós-Laboral');

-- ----------------------------
-- Table structure for `marketing_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `marketing_feedback`;
CREATE TABLE `marketing_feedback` (
  `contador_internet` int(10) unsigned DEFAULT '0',
  `contador_amigo` int(10) unsigned DEFAULT '0',
  `contador_evento` int(10) unsigned DEFAULT '0',
  `contador_outro` int(10) unsigned DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of marketing_feedback
-- ----------------------------
INSERT INTO `marketing_feedback` VALUES ('1', '0', '0', '0');

-- ----------------------------
-- Table structure for `plataforma`
-- ----------------------------
DROP TABLE IF EXISTS `plataforma`;
CREATE TABLE `plataforma` (
  `id_plataforma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_plataforma`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of plataforma
-- ----------------------------
INSERT INTO `plataforma` VALUES ('1', 'Pc - Microsoft');
INSERT INTO `plataforma` VALUES ('2', 'Mac - Apple');
