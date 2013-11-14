/*
Navicat MySQL Data Transfer

Source Server         : Ri_Valé
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : flag_projecto_cursos_inscricao

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2013-03-11 01:37:00
*/

SET FOREIGN_KEY_CHECKS=0;

--TABELA NECESSARIA
CREATE DATABASE flag_projecto_cursos_inscricao;

-- ----------------------------
-- Table structure for `aluno_inscrito`
-- ----------------------------
DROP TABLE IF EXISTS `aluno_inscrito`;
CREATE TABLE `aluno_inscrito` (
  `id_aluno_inscrito` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `morada` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_telf` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_curso_fk` int(10) unsigned NOT NULL,
  `id_plataforma_fk` int(10) unsigned NOT NULL,
  `comentario` varchar(160) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_aluno_inscrito`),
  KEY `id_curso_do_aluno` (`id_curso_fk`),
  KEY `id_plataforma` (`id_plataforma_fk`),
  CONSTRAINT `id_curso_do_aluno` FOREIGN KEY (`id_curso_fk`) REFERENCES `curso_horario` (`id_curso_do_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_plataforma` FOREIGN KEY (`id_plataforma_fk`) REFERENCES `plataforma` (`id_plataforma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of aluno_inscrito
-- ----------------------------
INSERT INTO `aluno_inscrito` VALUES ('1', 'jricvalerio@gmail.com', 'Ricardo Valério', 'Rua da Parede Verde', '922828222', '1', '2', 'paredeverde');
INSERT INTO `aluno_inscrito` VALUES ('2', 'arturcamacho@gmail.com', 'Artur Camacho', 'Rua da Parede Azul', '946533656', '8', '1', 'paredeazul');
INSERT INTO `aluno_inscrito` VALUES ('7', 'catiavanessa@quintal.com', 'Vanessa', 'Rua da Parede Rosa', '969663636', '10', '1', 'Vamos ver os Tunnings? ');
INSERT INTO `aluno_inscrito` VALUES ('8', 'joao@joao.joao', 'João', 'Rua da Parede Lilás', '987777777', '1', '1', 'Ao infinito e mais além!');

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
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `in_out` bit(1) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('admin', 'a63d72dd12c9f5cc94bf0e801151b98af2dfdf7309589f3497c67b9b51efdc6ae61cee88d44e06f176c51a8e6aa139d4e2d9621e4977917a2c17aa6f0c31af09', '');

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
INSERT INTO `marketing_feedback` VALUES ('4', '3', '1', '0');

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

-- ----------------------------
-- Table structure for `questao_contacto`
-- ----------------------------
DROP TABLE IF EXISTS `questao_contacto`;
CREATE TABLE `questao_contacto` (
  `id_questao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `questao` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_questao`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questao_contacto
-- ----------------------------
INSERT INTO `questao_contacto` VALUES ('1', 'artur@chaparroalentejano.com', 'Artur Chaparro', 'Qual o tamanho do Universo?');
INSERT INTO `questao_contacto` VALUES ('3', 'maria@albertina.com', 'Maria Albertina', 'Porque fui nessa de chamar Vanessa à minha menina?');
INSERT INTO `questao_contacto` VALUES ('4', 'manuel@gmail.com', 'Manuel Gaspar', 'Qual a melhor jogada para começar no Xadrez?');
INSERT INTO `questao_contacto` VALUES ('5', 'joanita@vanessa.com', 'Joana Vanessa', 'O que é Democracia? =/');
INSERT INTO `questao_contacto` VALUES ('7', 'joao@joao.joao', 'João', 'Goa e Macau?');
