-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2019 a las 06:32:15
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_alquilatodo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_alquiler`
--

CREATE TABLE `tbl_alquiler` (
  `codigo_alquiler` int(11) NOT NULL,
  `codigo_usuario_alquila` int(11) NOT NULL,
  `codigo_producto_alquilado` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_finalizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_fotos`
--

CREATE TABLE `tbl_fotos` (
  `codigo_foto` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `url` varchar(80) NOT NULL,
  `fecha_creacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_fotos`
--

INSERT INTO `tbl_fotos` (`codigo_foto`, `codigo_producto`, `url`, `fecha_creacion`) VALUES
(1, 1, 'img/publicaciones/telefono1.jpg', '2019-04-10'),
(2, 1, 'img/publicaciones/telefono2.jpg', '2019-04-10'),
(3, 1, 'img/publicaciones/telefono3.jpg', '2019-04-10'),
(4, 1, 'img/publicaciones/casa1.jpg', '2019-04-10'),
(5, 1, 'img/publicaciones/casa2.jpg', '2019-04-10'),
(6, 1, 'img/publicaciones/casa3.jpg', '2019-04-10'),
(7, 1, 'img/publicaciones/casa3.jpg', '2019-04-10'),
(10, 5, 'img/publicaciones/telefono1.jpg', '2019-10-05'),
(11, 6, 'img/publicaciones/telefono2.jpg', '2019-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `codigo_producto` int(11) NOT NULL,
  `codigo_usuario_propietario` int(11) NOT NULL,
  `nombre_producto` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio_producto` varchar(45) NOT NULL,
  `estado_producto` varchar(20) NOT NULL,
  `unidades` int(11) NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `fecha_publicacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`codigo_producto`, `codigo_usuario_propietario`, `nombre_producto`, `descripcion`, `precio_producto`, `estado_producto`, `unidades`, `cantidad_disponible`, `fecha_publicacion`) VALUES
(1, 3, 'Samsung s10', 'Nuevo', '5,000', 'Nuevo', 5, 5, '2019-04-10'),
(2, 3, 'Nuevo', 'Un nuevo producto', '5000', '5', 8, 8, '2019-10-05'),
(3, 3, '', '', '', '', 0, 0, '2019-10-05'),
(4, 3, '', '', '', '', 0, 0, '2019-10-05'),
(5, 3, 'Mio', 'Mio', '1500', '8', 2, 2, '2019-10-05'),
(6, 3, 'Nuevo', 'Un nuevo producto', '2000', '10', 2, 2, '2019-10-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `codigo_usuario` int(11) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contrasena` varchar(250) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado_usuario` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`codigo_usuario`, `genero`, `nombre`, `apellido`, `correo`, `contrasena`, `telefono`, `direccion`, `estado_usuario`, `fecha_nacimiento`, `fecha_creacion`, `fecha_modificacion`) VALUES
(2, 'Femenino', 'Maria', 'Santos', 'msantos@gmail.com', 'cb6628e49d36ca24541acb4e2c2a0bacae22b3e1', '94578633', 'Otra casa', 'Activo', '1997-12-12', '2019-10-03', '2019-10-03'),
(3, 'Masculino', 'Oscar', 'Nelson', 'oscar@gmail.com', 'cb6628e49d36ca24541acb4e2c2a0bacae22b3e1', '94688777', 'Una casa muy bonita, en una direccion muy bonita', 'Activo', '1995-07-11', '2019-10-03', NULL),
(4, 'Masculino', 'Oscar', 'Nelson', 'oscarnelson18@gmail.com', '06349be70bd2d5dd98d36b9b8dba0a057500fdac', '5456', 'Col Cantarero', 'Activo', '2019-01-01', '2019-10-03', '2019-10-03'),
(5, 'Masculino', 'David', 'Perez', 'david@gmail.com', 'cb6628e49d36ca24541acb4e2c2a0bacae22b3e1', '96875642', 'Mi nueva casa', 'Activo', '2008-03-02', '2019-10-03', '2019-10-03'),
(6, 'Fem', 'test', 'prueba', 'test@gmail.com', 'cb6628e49d36ca24541acb4e2c2a0bacae22b3e1', '94688777', 'Una casa', 'Activo', '1998-12-01', '2019-10-03', '2019-10-03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_alquiler`
--
ALTER TABLE `tbl_alquiler`
  ADD PRIMARY KEY (`codigo_alquiler`),
  ADD KEY `fk_tbl_alquiler_tbl_usuarios1_idx` (`codigo_usuario_alquila`),
  ADD KEY `fk_tbl_alquiler_tbl_productos1_idx` (`codigo_producto_alquilado`);

--
-- Indices de la tabla `tbl_fotos`
--
ALTER TABLE `tbl_fotos`
  ADD PRIMARY KEY (`codigo_foto`),
  ADD KEY `fk_tbl_fotos_tbl_productos1_idx` (`codigo_producto`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `fk_tbl_productos_tbl_usuarios_idx` (`codigo_usuario_propietario`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`codigo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_alquiler`
--
ALTER TABLE `tbl_alquiler`
  MODIFY `codigo_alquiler` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_fotos`
--
ALTER TABLE `tbl_fotos`
  MODIFY `codigo_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `codigo_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_alquiler`
--
ALTER TABLE `tbl_alquiler`
  ADD CONSTRAINT `fk_tbl_alquiler_tbl_productos1` FOREIGN KEY (`codigo_producto_alquilado`) REFERENCES `tbl_productos` (`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_alquiler_tbl_usuarios1` FOREIGN KEY (`codigo_usuario_alquila`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_fotos`
--
ALTER TABLE `tbl_fotos`
  ADD CONSTRAINT `fk_tbl_fotos_tbl_productos1` FOREIGN KEY (`codigo_producto`) REFERENCES `tbl_productos` (`codigo_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `fk_tbl_productos_tbl_usuarios` FOREIGN KEY (`codigo_usuario_propietario`) REFERENCES `tbl_usuarios` (`codigo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
