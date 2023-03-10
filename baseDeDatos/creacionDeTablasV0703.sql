-- MySQL Script generated by MySQL Workbench
-- Tue Mar  7 16:42:12 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`idUsuario` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `portfolio`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`Persona` (
  `idPersona` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `acercaDeMi` VARCHAR(450) NULL,
  `fechaNac` DATE NULL,
  `profilePic` VARCHAR(200) NULL,
  `dni` VARCHAR(45) NULL,
  `Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPersona`, `Usuario_idUsuario`),
  UNIQUE INDEX `idPersona_UNIQUE` (`idPersona` ASC) VISIBLE,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  INDEX `fk_Persona_Usuario1_idx` (`Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_Usuario1`
    FOREIGN KEY (`Usuario_idUsuario`)
    REFERENCES `portfolio`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`tipoEmpleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipoEmpleo` (
  `idtipoEmpleo` INT NOT NULL AUTO_INCREMENT,
  `tipoEmpleo` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipoEmpleo`),
  UNIQUE INDEX `idtipoEmpleo_UNIQUE` (`idtipoEmpleo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`Experiencia` (
  `idExperiencia` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NULL,
  `fechaInicio` DATE NULL,
  `empleoActal` TINYINT ZEROFILL NULL,
  `fechaFin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `Persona_idPersona` INT NOT NULL,
  `tipoEmpleo_idtipoEmpleo` INT NOT NULL,
  PRIMARY KEY (`idExperiencia`),
  UNIQUE INDEX `idExperiencia_UNIQUE` (`idExperiencia` ASC) VISIBLE,
  INDEX `fk_Experiencia_Persona_idx` (`Persona_idPersona` ASC) VISIBLE,
  INDEX `fk_Experiencia_tipoEmpleo1_idx` (`tipoEmpleo_idtipoEmpleo` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_tipoEmpleo1`
    FOREIGN KEY (`tipoEmpleo_idtipoEmpleo`)
    REFERENCES `portfolio`.`tipoEmpleo` (`idtipoEmpleo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`tipoEducacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`tipoEducacion` (
  `idtipoEducacion` INT NOT NULL AUTO_INCREMENT,
  `tipoEducacioncol` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipoEducacion`),
  UNIQUE INDEX `idtipoEducacion_UNIQUE` (`idtipoEducacion` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`Educacion` (
  `idEducacion` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `fechaInicio` DATE NULL,
  `fechaFin` DATE NULL,
  `cursandoActual` TINYINT ZEROFILL NULL,
  `Persona_idPersona` INT NOT NULL,
  `tipoEducacion_idtipoEducacion` INT NOT NULL,
  PRIMARY KEY (`idEducacion`),
  UNIQUE INDEX `idEducacion_UNIQUE` (`idEducacion` ASC) VISIBLE,
  INDEX `fk_Educacion_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  INDEX `fk_Educacion_tipoEducacion1_idx` (`tipoEducacion_idtipoEducacion` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Educacion_tipoEducacion1`
    FOREIGN KEY (`tipoEducacion_idtipoEducacion`)
    REFERENCES `portfolio`.`tipoEducacion` (`idtipoEducacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`Proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`Proyecto` (
  `idProyecto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `fecha` DATE NULL,
  `link` VARCHAR(100) NULL,
  `imagen` VARCHAR(100) NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idProyecto`),
  UNIQUE INDEX `idProyecto_UNIQUE` (`idProyecto` ASC) VISIBLE,
  INDEX `fk_Proyecto_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Proyecto_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`nivelHabilidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`nivelHabilidad` (
  `idnivelHabilidad` INT NOT NULL AUTO_INCREMENT,
  `nivelHabilidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idnivelHabilidad`),
  UNIQUE INDEX `idnivelHabilidad_UNIQUE` (`idnivelHabilidad` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`HardSkills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`HardSkills` (
  `idHabilidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `nivelHabilidad_idnivelHabilidad` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idHabilidad`),
  UNIQUE INDEX `idHabilidad_UNIQUE` (`idHabilidad` ASC) VISIBLE,
  INDEX `fk_Habilidad_nivelHabilidad1_idx` (`nivelHabilidad_idnivelHabilidad` ASC) VISIBLE,
  INDEX `fk_Habilidad_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Habilidad_nivelHabilidad1`
    FOREIGN KEY (`nivelHabilidad_idnivelHabilidad`)
    REFERENCES `portfolio`.`nivelHabilidad` (`idnivelHabilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Habilidad_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`Contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`Contacto` (
  `idContacto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `link` VARCHAR(100) NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idContacto`),
  UNIQUE INDEX `idContacto_UNIQUE` (`idContacto` ASC) VISIBLE,
  INDEX `fk_Contacto_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Contacto_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `portfolio`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`SoftSkills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`SoftSkills` (
  `idSoftSkills` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `nivelHabilidad_idnivelHabilidad` INT NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  `Persona_Usuario_idUsuario` INT NOT NULL,
  PRIMARY KEY (`idSoftSkills`),
  UNIQUE INDEX `idSoftSkills_UNIQUE` (`idSoftSkills` ASC) VISIBLE,
  INDEX `fk_SoftSkills_nivelHabilidad1_idx` (`nivelHabilidad_idnivelHabilidad` ASC) VISIBLE,
  INDEX `fk_SoftSkills_Persona1_idx` (`Persona_idPersona` ASC, `Persona_Usuario_idUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_SoftSkills_nivelHabilidad1`
    FOREIGN KEY (`nivelHabilidad_idnivelHabilidad`)
    REFERENCES `portfolio`.`nivelHabilidad` (`idnivelHabilidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SoftSkills_Persona1`
    FOREIGN KEY (`Persona_idPersona` , `Persona_Usuario_idUsuario`)
    REFERENCES `portfolio`.`Persona` (`idPersona` , `Usuario_idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
