

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;






CREATE TABLE `cartao` (
  `idcartao` int(10) NOT NULL,
  `codcartao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unidades` int(10) NOT NULL,
  `saldo` float NOT NULL,
  `data-validade` date NOT NULL,
  `data-recarga` datetime NOT NULL,
  `idcategoria` int(10) NOT NULL,
  `idusuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `cartao` (`idcartao`, `codcartao`, `unidades`, `saldo`, `data-validade`, `data-recarga`, `idcategoria`, `idusuario`) VALUES
(1, '221698745', 10, 10, '2019-12-31', '2018-10-29 00:00:00', 1, 1);





CREATE TABLE `categoria` (
  `idcategoria` int(10) NOT NULL,
  `nomecategoria` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `valor-passagem` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `categoria` (`idcategoria`, `nomecategoria`, `valor-passagem`) VALUES
(1, 'ESTUDANTE', 1),
(2, 'PADRÃO', 3.8);



CREATE TABLE `sessao` (
  `idsessao` int(10) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idusuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `sessao` (`idsessao`, `login`, `senha`, `foto`, `idusuario`) VALUES
(1, 'marcelo-1950@live.com', 'myeggs', '', 1);



CREATE TABLE `usuario` (
  `idusuario` int(10) NOT NULL,
  `nomecompleto` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cpf` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data-nascimento` date NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logadouro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bairro` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cep` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `idcartao` int(10) NOT NULL,
  `idsessao` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO `usuario` (`idusuario`, `nomecompleto`, `cpf`, `data-nascimento`, `email`, `logadouro`, `numero`, `bairro`, `cep`, `idcartao`, `idsessao`) VALUES
(1, 'MARCELO DOS SANTOS SARAIVA JUNIOR', '037.977.382-18', '1998-10-20', 'marcelo-1950@live.com', 'Rua 06 de agosto', '990', '06 de agosto', '69905684', 1, 1);


ALTER TABLE `cartao`
  ADD PRIMARY KEY (`idcartao`),
  ADD KEY `idcategoria` (`idcategoria`),
  ADD KEY `idusuario` (`idusuario`);


ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);


ALTER TABLE `sessao`
  ADD PRIMARY KEY (`idsessao`),
  ADD KEY `idusuario` (`idusuario`);


ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idsessao` (`idsessao`),
  ADD KEY `idcartao` (`idcartao`);


ALTER TABLE `cartao`
  MODIFY `idcartao` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `categoria`
  MODIFY `idcategoria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `sessao`
  MODIFY `idsessao` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `usuario`
  MODIFY `idusuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `cartao`
  ADD CONSTRAINT `cartao_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `cartao_ibfk_2` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);


ALTER TABLE `sessao`
  ADD CONSTRAINT `sessao_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);


ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idsessao`) REFERENCES `sessao` (`idsessao`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idcartao`) REFERENCES `cartao` (`idcartao`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
