-- MySQL Script generated by MySQL Workbench
-- qui 02 jun 2022 20:30:59
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NOT NULL,
  `valor_plano` DOUBLE UNSIGNED NULL,
  PRIMARY KEY (`plano_id`),
  UNIQUE INDEX `album_UNIQUE` (`plano` ASC) VISIBLE,
  UNIQUE INDEX `id_album_UNIQUE` (`plano_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` INT UNSIGNED NOT NULL,
  `data_assinatura` DATE NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `plano_id`),
  UNIQUE INDEX `users_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `fk_users_planos_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_planos`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL,
  PRIMARY KEY (`artista_id`),
  UNIQUE INDEX `artistas_id_UNIQUE` (`artista_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `ano_lancamento` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`, `artista_id`),
  UNIQUE INDEX `album_id_UNIQUE` (`album_id` ASC) VISIBLE,
  INDEX `fk_albuns_artistas1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_albuns_artistas1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `cancoes` VARCHAR(45) NOT NULL,
  `duracao` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`cancao_id`, `album_id`),
  UNIQUE INDEX `cancoes_id_UNIQUE` (`cancao_id` ASC) VISIBLE,
  INDEX `fk_cancoes_albuns1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_albuns1`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguidores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `user_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artista_id`),
  INDEX `fk_users_has_artistas_artistas1_idx` (`artista_id` ASC) VISIBLE,
  INDEX `fk_users_has_artistas_users1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_artistas_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_artistas_artistas1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `historico_id` INT NOT NULL AUTO_INCREMENT,
  `data_reproducao` VARCHAR(45) NOT NULL,
  `user_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`historico_id`, `user_id`, `cancao_id`),
  UNIQUE INDEX `historico_id_UNIQUE` (`historico_id` ASC) VISIBLE,
  INDEX `fk_historico_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_historico_cancoes1_idx` (`cancao_id` ASC) VISIBLE,
  CONSTRAINT `fk_historico_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historico_cancoes1`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE SpotifyClone;

INSERT INTO SpotifyClone.planos (plano, valor_plano)
VALUES 
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);

INSERT INTO SpotifyClone.users (nome, idade, plano_id, data_assinatura)
VALUES
  ('Thati',	23,	1,	'2019-10-20'),
  ('Cintia', 35,	2,	'2017-12-30'),
  ('Bill',	20,	3,	'2019-06-05'),
  ('Roger',	45,	4,	'2020-05-13'),
  ('Norman', 58,	4,	'2017-02-17'),
  ('Patrick', 33,	2,	'2017-01-06'),
  ('Vivian', 26,	3,	'2018-01-05'),
  ('Carol',	19,	3,	'2018-02-14'),
  ('Angelina', 42,	2,	'2018-04-29'),
  ('Paul', 46,	2, '2017-01-17');
  
INSERT INTO SpotifyClone.artistas (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');
  
INSERT INTO SpotifyClone.albuns (album,	ano_lancamento,	artista_id)
VALUES
	('Envious',	1990,	1),
	('Exuberant',	1993,	1),
	('Hallowed Steam',	1995,	2),
	('Incandescent',	1998,	3),
	('Temporary Culture',	2001,	4),
	('Library of liberty',	2003,	4),
	('Chained Down',	2007,	5),
	('Cabinet of fools',	2012,	5),
	('No guarantees',	2015,	5),
	('Apparatus',	2015,	6);

INSERT INTO SpotifyClone.seguidores (artista_id, user_id)
VALUES
	(1,	1),
	(4,	1),
	(3,	1),
	(1,	2),
	(3,	2),
	(2,	3),
	(1,	3),
	(4,	4),
	(5,	5),
	(6,	5),
	(6,	6),
	(3,	6),
	(1,6),
	(2,	7),
	(5,7),
	(1,	8),
	(5,	8),
	(6,	9),
	(4,	9),
	(3,	9),
	(2,	10),
	(6,	10);

INSERT INTO SpotifyClone.cancoes (cancoes,	duracao, album_id)
VALUES
  ('Soul For Us',	200,	1),
  ('Reflections Of Magic',	163,	1),
  ('Dance With Her Own',	116,	1),
  ('Troubles Of My Inner Fire',	203,	2),
  ('Time Fireworks',	152,	2),
  ('Magic Circus',	105,	3),
  ('Honey, So Do I',	207,	3),
  ("Sweetie, Let's Go Wild",	139,	3),
  ('She Knows',	244,	3),
  ('Fantasy For Me',	100,	4),
  ('Celebration Of More',	146,	4),
  ('Rock His Everything',	223,	4),
  ('Home Forever',	231,	4),
  ('Diamond Power',	241,	4),
  ("Let's Be Silly",	132,	4),
  ('Thang Of Thunder',	240,	5),
  ('Words Of Her Life',	185,	5),
  ('Without My Streets',	176,	5),
  ('Need Of The Evening',	190,	6),
  ('History Of My Roses',	222,	6),
  ('Without My Love',	111,	6),
  ('Walking And Game',	123,	6),
  ('Young And Father',	197,	6),
  ('Finding My Traditions',	179,	7),
  ('Walking And Man',	229,	7),
  ('Hard And Time',	135,	7),
  ("Honey, I'm A Lone Wolf",	150,	7),
  ("She Thinks I Won't Stay Tonight",	166,	8),
  ("He Heard You're Bad For Me",	154,	8),
  ("He Hopes We Can't Stay",	210,	8),
  ('I Know I Know',	117,	8),
  ("He's Walking Away",	159,	9),
  ("He's Trouble",	138,	9),
  ('I Heard I Want To Bo Alone',	120,	9),
  ('I Ride Alone',	151,	9),
  ('Honey',	79,	10),
  ('You Cheated On Me',	95,	10),
  ("Wouldn't It Be Nice",	213, 10),
  ('Baby',	136,	10),
  ('You Make Me Feel So..',	83,	10);

INSERT INTO SpotifyClone.historico (user_id, cancao_id,	data_reproducao)
VALUES
(1,	36,	'2020-02-28 10:45:55'),
(1,	25,	'2020-05-02 05:30:35'),
(1,	23,	'2020-03-06 11:22:33'),
(1,	14,	'2020-08-05 08:05:17'),
(1,	15,	'2020-09-14 16:32:22'),
(2,	34,	'2020-01-02 07:40:33'),
(2,	24,	'2020-05-16 06:16:22'),
(2,	21,	'2020-10-09 12:27:48'),
(2,	39,	'2020-09-21 13:14:46'),
(3,	6,	'2020-11-13 16:55:13'),
(3,	3,	'2020-12-05 18:38:30'),
(3,	26,	'2020-07-30 10:00:00'),
(4,	2,	'2021-08-15 17:10:10'),
(4,	35,	'2021-07-10 15:20:30'),
(4,	27,	'2021-01-09 01:44:33'),
(5,	7,	'2020-07-03 19:33:28'),
(5,	12,	'2017-02-24 21:14:22'),
(5,	14,	'2020-08-06 15:23:43'),
(5,	1,	'2020-11-10 13:52:27'),
(6,	38,	'2019-02-07 20:33:48'),
(6,	29,	'2017-01-24 00:31:17'),
(6,	30,	'2017-10-12 12:35:20'),
(6,	22,	'2018-05-29 14:56:41'),
(7,	5,	'2018-05-09 22:30:49'),
(7,	4,	'2020-07-27 12:52:58'),
(7,	11,	'2018-01-16 18:40:43'),
(8,	39,	'2018-03-21 16:56:40'),
(8,	40,	'2020-10-18 13:38:05'),
(8,	32,	'2019-05-25 08:14:03'),
(8,	33,	'2021-08-15 21:37:09'),
(9,	16,	'2021-05-24 17:23:45'),
(9,	17,	'2018-12-07 22:48:52'),
(9,	8,	'2021-03-14 06:14:26'),
(9,	9,	'2020-04-01 03:36:00'),
(10, 20,	'2017-02-06 08:21:34'),
(10, 21,	'2017-12-04 05:33:43'),
(10, 12,	'2017-07-27 05:24:49'),
(10, 13,	'2017-12-25 01:03:57');
