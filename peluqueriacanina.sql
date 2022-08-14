SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `peluqueriacanina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dueno`
--

CREATE TABLE `Dueno` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(25) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Dueno`
--

INSERT INTO `Dueno` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES
(25423519, 'jose', 'gomez', 155124365, 'Av Mendoza 345'),
(33423510, 'pedro', 'gomez', 155124365, 'Av Mendoza 345'),
(37423511, 'hernan', 'gomez', 155124365, 'Av Mendoza 345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Historial`
--

CREATE TABLE `Historial` (
  `ID_Historial` int(11) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Perro` int(11) NOT NULL,
  `Descripcion` varchar(60) DEFAULT NULL,
  `Monto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Perro`
--

CREATE TABLE `Perro` (
  `ID_Perro` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` varchar(30) NOT NULL,
  `DNI_dueno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `Perro`
--

INSERT INTO `Perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `DNI_dueno`) VALUES
(1, 'toby', '2017-05-14', 'm', 37423511),
(2, 'tomas', '2022-05-14', 'm', 33423510),
(3, 'eragon', '2019-05-14', 'm', 25423519);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Dueno`
--
ALTER TABLE `Dueno`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD PRIMARY KEY (`ID_Historial`),
  ADD KEY `FK_Perro` (`Perro`);

--
-- Indices de la tabla `Perro`
--
ALTER TABLE `Perro`
  ADD PRIMARY KEY (`ID_Perro`),
  ADD KEY `FK_DNI_dueno` (`DNI_dueno`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Historial`
--
ALTER TABLE `Historial`
  MODIFY `ID_Historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Perro`
--
ALTER TABLE `Perro`
  MODIFY `ID_Perro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Historial`
--
ALTER TABLE `Historial`
  ADD CONSTRAINT `FK_Perro` FOREIGN KEY (`Perro`) REFERENCES `Perro` (`ID_Perro`);

--
-- Filtros para la tabla `Perro`
--
ALTER TABLE `Perro`
  ADD CONSTRAINT `FK_DNI_dueno` FOREIGN KEY (`DNI_dueno`) REFERENCES `Dueno` (`DNI`);
COMMIT;

-- --------------------------------------------------------
--
-- Punto 12: Obtener todos los perros de Sexo “Machos” nacidos entre 2020 y 2022
--
SELECT Nombre FROM Perro WHERE (YEAR(Fecha_nac) BETWEEN 2020 AND 2022) AND Sexo='m';

-- --------------------------------------------------------
--
-- Punto 9: Escriba una consulta que permita actualizar la dirección de un dueño. 
-- Su nueva dirección es Libertad 123
--
UPDATE Dueno SET Direccion = 'Libertad 123' WHERE DNI = 33423511;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
