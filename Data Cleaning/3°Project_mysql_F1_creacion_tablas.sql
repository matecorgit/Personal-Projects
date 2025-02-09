
CREATE TABLE `Equipos` (
    `id_equipo` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    `nombre` VARCHAR(50)  NOT NULL ,
    `sede` VARCHAR(50)  NOT NULL ,
    `fundacion` DATE  NOT NULL ,
    `numero_campeonatos` INT  NOT NULL
);

CREATE TABLE `Pilotos` (
    `id_piloto` INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(30)  NOT NULL ,
    `apellido` VARCHAR(30)  NOT NULL ,
    `nacionalidad` VARCHAR(50)  NOT NULL ,
    `id_equipo` INT,
    `campeonatos_ganados` INT  NOT NULL,
    FOREIGN KEY (`id_equipo`) REFERENCES Equipos(`id_equipo`) ON DELETE CASCADE
);

CREATE TABLE `Circuitos` (
    `id_circuito` INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ubicacion` VARCHAR(50)  NOT NULL ,
    `pais` VARCHAR(30)  NOT NULL ,
    `longitud_km` DOUBLE  NOT NULL ,
    `numero_curvas` INT  NOT NULL
);

CREATE TABLE `Carreras` (
    `id_carrera` INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_circuito` INT  NOT NULL ,
    `fecha` DATE  NOT NULL ,
    `nombre_gran_premio` VARCHAR(50)  NOT NULL,
    FOREIGN KEY (`id_circuito`) REFERENCES Circuitos(`id_circuito`) ON DELETE CASCADE
);

CREATE TABLE `Resultados` (
    `id_resultado` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_carrera` INT NOT NULL,
    `id_piloto` INT NOT NULL,
    `posicion_final` INT NOT NULL CHECK(posicion_final>0),
    `vuelta_rapida` TIME(3) NOT NULL,
    `abandono` BOOLEAN NOT NULL,
    FOREIGN KEY (`id_carrera`) REFERENCES `Carreras`(`id_carrera`) ON DELETE CASCADE,
    FOREIGN KEY (`id_piloto`) REFERENCES `Pilotos`(`id_piloto`) ON DELETE CASCADE
);

