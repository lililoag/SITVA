CREATE DATABASE SITVA;

CREATE TABLE `lineas` (
  
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

  `nombre` VARCHAR(50) NOT NULL, 
  `color` VARCHAR(20) NOT NULL,
	`longitud` float(10), 
  `ruta` VARCHAR(100) NOT NULL,
  `capacidad_pasajeros` int(10),
  `num_estaciones` INT(3) NOT NULL,
  `tipo` VARCHAR(15) NOT NULL,
    
  `created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
	`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id)

)

DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

SELECT * FROM lineas;

--_______________________________________________________________________________________

CREATE TABLE `estaciones` (
  
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `nombre` VARCHAR(35) NOT NULL, 
    `conexion` VARCHAR(20) NOT NULL,
   
    `created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id)

)

DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

SELECT * FROM estaciones;

--_______________________________________________________________________________________

CREATE TABLE `vehiculos` (
  
    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    `serial`  VARCHAR(10)  NOT NULL,
    `linea_id` BIGINT(20) UNSIGNED NOT NULL, 

    `tipo` VARCHAR(20) NOT NULL, 
    `año` INT(4) NOT NULL,

    `created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    CONSTRAINT `vehiculos_linea_id_foreign` 
    FOREIGN KEY (`linea_id`) REFERENCES `lineas`(`id`)

)

DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

SELECT * FROM vehiculos;

-- _______________________________________________________________________________________

CREATE TABLE `lineas_estaciones`(

       `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

        `linea_id` BIGINT(20) UNSIGNED NOT NULL,
        `estacion_id` BIGINT(20) UNSIGNED NOT NULL,

        `created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
        `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        PRIMARY KEY (id),

        CONSTRAINT `lineas_estaciones_linea_id_foreign` 
        FOREIGN KEY (`linea_id`) REFERENCES `lineas`(`id`),

        CONSTRAINT `lineas_estaciones_estacion_id_foreign` 
        FOREIGN KEY (`estacion_id`) REFERENCES `estaciones`(`id`)

)

DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- Creacion de la tabla de locations
CREATE TABLE `ubicacion`(

  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estacion_id` BIGINT(20) UNSIGNED NOT NULL ,

  `ubicacion` POINT NOT NULL, 
    
   
  `created_at` TIMESTAMP NOT NULL  DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),
  CONSTRAINT `ubicacion_estacion_id_foreign`
  FOREIGN KEY (`estacion_id`) REFERENCES `estaciones`(id)

)

DEFAULT CHARSET = utf8mb4
COLLATE = utf8mb4_unicode_ci;




