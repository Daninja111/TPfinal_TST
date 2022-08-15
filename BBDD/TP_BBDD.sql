CREATE SCHEMA `bd_tp_integrador_mazzini_daniella` DEFAULT CHARACTER SET utf8 ;
use bd_tp_integrador_mazzini_daniella;

CREATE TABLE `cliente` (
  `DNI` int NOT NULL,
  `Nro_cliente` int NOT NULL,
  `Apellido_paterno` varchar(25) NOT NULL,
  `Apellido_materno` varchar(25) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Calle` varchar(50) DEFAULT NULL,
  `Barrio` varchar(25) DEFAULT NULL,
  `Telefono_cel1` varchar(25) NOT NULL,
  `Telefono_cel2` int DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `Email` varchar(25) NOT NULL,
  `Fecha_alta` date DEFAULT NULL,
  `Id_carrito` int NOT NULL,
  `Id_historial` int NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `Nro_cliente_UNIQUE` (`Nro_cliente`),
  KEY `Id_carrito_idx` (`Id_carrito`),
  KEY `Id_historial_idx` (`Id_historial`),
  CONSTRAINT `Id_carrito` FOREIGN KEY (`Id_carrito`) 
  REFERENCES `carrito_compras` (`Id_carrito`),
  CONSTRAINT `Id_historial` FOREIGN KEY (`Id_historial`) 
  REFERENCES `historial_compras` (`Id_historial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

;

CREATE TABLE `bd_tp_integrador_mazzini_daniella`.`carrito_compras` (
  `Id_carrito` INT NOT NULL,
  `Articulo_nombre` VARCHAR(45) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Precio` varchar(25) NOT NULL,
  `Fecha_compra` DATE NOT NULL,
  `Orden_compra` INT NOT NULL,
  PRIMARY KEY (`Id_carrito`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
;
INSERT INTO carrito_compras
(Id_Carrito, Articulo_nombre, Cantidad, Precio, Fecha_compra, Orden_compra)
VALUES
(1, 'teclado', 1, 1050, '2022-05-23', 100)
;
INSERT INTO historial_compras (`Id_historial`, `Articulo_nombre`,
 `Cantidad`, `Precio`, `Fecha_compra`, `Orden_compra`, `Id_carrito`)
 VALUES ('2', 'teclado', '1', '1050', '2022-08-20', '100', '1');
;
INSERT INTO cliente
(DNI, Nro_cliente, Apellido_paterno, Apellido_materno, Nombre, Calle, Barrio,
Telefono_cel1, Telefono_cel2, Edad, Email, Fecha_alta, Id_carrito, Id_historial)
VALUES
(96017438, 1, 'MAZZINI', 'HENRIQUEZ', 'DANIELLA', 'PJE ESPAÑA', 'NUEVA CORDOBA',
3517893883, NULL , 27, 'MAZZINIDANIELLA@GMAIL.COM', '2020-03-23', 1, 2)
;

SELECT * FROM historial_compras AS hc
INNER JOIN cliente as cl ON cl.Id_historial=hc.Id_historial
WHERE hc.Fecha_compra <= '2010-08-20'
DELETE FROM cliente WHERE DNI=34568349
;
UPDATE cliente set Fecha_alta = '2015-08-29'
WHERE DNI = 43756845
;
INNER JOIN Carrito_compras as cc ON cc.Id_carrito=cl.Id_carrito
WHERE cc.Articulo_nombre LIKE '%televisor uhd%'
;
SELECT * FROM cliente AS cl
INNER JOIN historial_Compras hc ON hc.Id_historial= cl.Id_historial
WHERE hc.Fecha_compra LIKE '%2022%'
;
SELECT SUM(cc.Cantidad * cc.Precio) AS ingresos_julio
FROM cliente AS cl
inner join carrito_Compras AS cc ON cc.Id_Carrito= cl.Id_Carrito
WHERE cc.Fecha_Compra LIKE '%07%'
;

SELECT cl.Nombre, cl.Apellido_Paterno, cl.Telefono_Cel1,
cc.Articulo_Nombre, cc.Precio, cc.Cantidad
FROM cliente AS cl
INNER JOIN carrito_Compras AS cc ON cc.Id_carrito = cl.Id_carrito
WHERE cc.Orden_Compra = NULL
;
UPDATE cliente SET Calle ='Libertad',Numero='123' WHERE DNI=47362514
;

SET foreign_key_checks=0;
TRUNCATE TABLE historial_compras;
SET foreign_key_checks=1;
;

SELECT cl.DNI,cl.Nombre,cl.Apellido_paterno FROM cliente AS cl
INNER JOIN historial_compras AS hc ON hc.Id_Historial = cl.Id_Historial
WHERE hc.Fecha_compra BETWEEN '2020-08-15' AND '2022-08-15'
AND hc.Orden_compra IS NOT NULL
GROUP BY cl.DNI,cl.Nombre,cl.Apellido_paterno, hc.Fecha_compra HAVING
Fecha_compra BETWEEN '2020-08-15' AND '2022-08-15'
;

SELECT * FROM cliente AS cl
INNER JOIN carrito_compras AS cc ON cc.Id_carrito= cl.Id_carrito
WHERE cl.Edad < 35 AND cc.Articulo_nombre LIKE '%consola de juegos%'
;