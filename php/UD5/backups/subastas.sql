SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `categoria` (`id`, `categoria`) VALUES
(1, 'videojuegos'),
(2, 'tecnología'),
(3, 'deporte'),
(4, 'hogar');

DROP TABLE IF EXISTS `imagen`;
CREATE TABLE IF NOT EXISTS `imagen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_item` (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `imagen` (`id`, `id_item`, `imagen`) VALUES
(1, 1, 'xboxcontroller.jpg'),
(2, 2, 'ps5.jpg'),
(3, 3, 'rtx3070.jpg'),
(4, 4, 'adidascomfort.jpg');

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cat` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `precio_partida` float NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechafin` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cat` (`id_cat`,`id_user`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `item` (`id`, `id_cat`, `id_user`, `nombre`, `precio_partida`, `descripcion`, `fechafin`) VALUES
(1, 1, 1, 'Mando xbox', 59.99, 'Mando ergonómico de nueva generación, con sujeción en los laterales para una mejor experiencia.\r\n\r\nCompatible con xbox, android, IOS, Windows, Linux, MacOs  ', '2021-11-30 08:51:43'),
(2, 1, 1, 'Play station 5', 599.99, 'Consola de nueva generación con gráficos hasta 4k, con la nueva tecnología mejorada HDMI 2.1 para mayora tasa de refresco.', '2021-11-30 16:20:56'),
(3, 2, 1, 'RTX 3070TI 16GB ASUS', 799.99, 'Tarjeta gráfica 4k para los juegos de nueva generación.\r\n\r\nTrazado de rayos y tecnología de Super escalado de resolución por medio de inteligencia artificial.', '2021-11-30 16:20:56'),
(4, 3, 1, 'Zapatillas Adidas confort ', 49, 'Zapatillas de deporte Adidas confort con la tecnología de ColudFoam para mayor comodidad al caminar.', '2021-11-30 23:30:47'),
(5, 3, 1, 'Bicicleta Giant Trance X 29 ', 3559.99, 'Bicicleta de montaña con chasis de fibra de carbono, frenos de disco y marchas electrónicas orbitales, Giant ofrece 10 años de garantía y reparación gratuita en caso de defecto de fábrica', '2021-12-31 00:39:15');

DROP TABLE IF EXISTS `puja`;
CREATE TABLE IF NOT EXISTS `puja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_item` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_item` (`id_item`,`id_user`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `puja` (`id`, `id_item`, `id_user`, `cantidad`, `fecha`) VALUES
(1, 1, 4, 100.99, '2021-10-20'),
(2, 4, 3, 50, '2021-10-20');

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cadenaverificacion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `falso` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `usuario` (`id`, `username`, `nombre`, `password`, `email`, `cadenaverificacion`, `activo`, `falso`) VALUES
(1, 'admin', 'Aketza Egusquiza Vázquez', '0810', 'aketza.vazquez@gmail.com', '123456', 1, 1),
(2, 'juan', 'Juan Carlos María', 'wireless', 'juanwireless@protonmail.com', 'alskdjal98123masd', 1, 1),
(3, 'patriChikita99', 'Patricia Bastida', 'pokemon', 'patriChikita@pokemonmail.com', '136x0843we', 1, 1),
(4, 'cesferortYT', 'Cesar Ferreiro', 'cesfe2021', 'cesferortyoutube@gmail.com', '102984m1267', 1, 1),
(5, 'martaBasada97', 'Marta', 'javascript', 'marta.basada@gmail.com', '123jkjhfc123fh12', 1, 1),
(6, 'akrck02', 'Ake', '1234', 'akrck02@gmail.com', 'dhfsjksjkdh238', 0, 0);


ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`);

ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`);

ALTER TABLE `puja`
  ADD CONSTRAINT `puja_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `puja_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
