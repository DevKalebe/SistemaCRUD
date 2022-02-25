-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Fev-2022 às 02:07
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(50) NOT NULL,
  `GENERO` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `ENDERECO` varchar(255) NOT NULL,
  `CELULAR` varchar(20) NOT NULL,
  `PRODUTO_INTERESSE` varchar(100) NOT NULL,
  `DATA_NASCIMENTO` date NOT NULL,
  `DATA_CADASTRO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`ID`, `NOME`, `GENERO`, `EMAIL`, `ENDERECO`, `CELULAR`, `PRODUTO_INTERESSE`, `DATA_NASCIMENTO`, `DATA_CADASTRO`) VALUES
(9, 'Gabriel Marques', 'Masculino', 'gmgabriellima@gmail.com', 'Travessa Cachoeira', '11910740613', 'boné', '2003-06-20', '2022-02-21 22:07:05'),
(10, 'Damião Duarte', 'Masculino', 'duartealpha821@gmail.com', 'Rua Pau Brasil', '11972356935', 'Tenis', '1969-05-14', '2022-02-21 22:09:15'),
(11, 'Valeria Barbosa', 'Feminino', 'valeria@gmail.com', 'Av Marechal Juarez', '11972017900', 'maquiagem', '1965-10-23', '2022-02-21 22:10:47'),
(12, 'Renata Duarte', 'Feminino', 'renata@outlook.com', 'Rua Pau Brasil', '11997474968', 'cremes', '1987-07-02', '2022-02-21 22:12:11'),
(13, 'Yasmin Castro', 'Feminino', 'yasmin@yahoo.com', ' Rua Pau Brasil', '11975932882', 'tenis', '2005-12-14', '2022-02-21 22:13:03'),
(14, 'André Vieira', 'Masculino', 'andrevbs@gmail.com', 'Monte Kemel', '11991685565', 'Computadores', '1989-08-25', '2022-02-21 22:18:42'),
(15, 'Rafael Vieira dos Santos', 'Masculino', 'rafael@gmail.com', 'São paulo', '11981521864', 'Alexa', '1992-09-30', '2022-02-21 22:20:03'),
(16, 'TESTE', 'Masculino', 'teste@gmail.com', 'av teste', '999999999', 'teste33333333', '2022-02-23', '2022-02-23 20:06:51'),
(19, 'Matheus Fatte', 'Masculino', 'Fattelala@gmail.com', 'Rua Pirapora', '(11) 99836-8263', 'Skate', '2001-08-31', '2022-02-24 22:02:36');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
