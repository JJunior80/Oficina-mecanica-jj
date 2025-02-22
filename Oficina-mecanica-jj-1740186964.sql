CREATE TABLE IF NOT EXISTS `cliente` (
	`id_cliente` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(100) NOT NULL,
	`telefone` varchar(15) NOT NULL,
	`endereco` text NOT NULL,
	`cpf` varchar(11) NOT NULL UNIQUE,
	PRIMARY KEY (`id_cliente`)
);

CREATE TABLE IF NOT EXISTS `veiculo` (
	`id_veiculo` int AUTO_INCREMENT NOT NULL,
	`id_cliente` int NOT NULL,
	`renavam` varchar(45) NOT NULL UNIQUE,
	`placa` varchar(10) NOT NULL UNIQUE,
	`modelo` varchar(50) NOT NULL,
	`cor` varchar(30) NOT NULL,
	`ano` int NOT NULL,
	PRIMARY KEY (`id_veiculo`)
);

CREATE TABLE IF NOT EXISTS `equipe` (
	`id_equipe` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(100) NOT NULL,
	PRIMARY KEY (`id_equipe`)
);

CREATE TABLE IF NOT EXISTS `mecanico` (
	`id_mecanico` int AUTO_INCREMENT NOT NULL,
	`nome` varchar(100) NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`especialidade` varchar(100) NOT NULL,
	`codigo` varchar(45) NOT NULL UNIQUE,
	`id_equipe` int NOT NULL,
	PRIMARY KEY (`id_mecanico`)
);

CREATE TABLE IF NOT EXISTS `ordemservico` (
	`id_os` int AUTO_INCREMENT NOT NULL,
	`id_veiculo` int NOT NULL,
	`id_equipe` int NOT NULL,
	`descricao` text NOT NULL,
	`data_emissao` timestamp NOT NULL DEFAULT 'current_timestamp',
	`data_conclusao` date NOT NULL,
	`valor_total` decimal(10,2) NOT NULL,
	PRIMARY KEY (`id_os`)
);

CREATE TABLE IF NOT EXISTS `servico` (
	`id_servico` int AUTO_INCREMENT NOT NULL,
	`descricao` varchar(100) NOT NULL,
	`valor_mao_de_obra` decimal(10,2) NOT NULL,
	PRIMARY KEY (`id_servico`)
);

CREATE TABLE IF NOT EXISTS `peca` (
	`id_peca` int AUTO_INCREMENT NOT NULL,
	`descricao` varchar(100) NOT NULL,
	`valor` decimal(10,2) NOT NULL,
	PRIMARY KEY (`id_peca`)
);

CREATE TABLE IF NOT EXISTS `itemservico` (
	`id_os` int NOT NULL,
	`id_servico` int NOT NULL,
	PRIMARY KEY (`id_os`, `id_servico`)
);

CREATE TABLE IF NOT EXISTS `itempeca` (
	`id_os` int NOT NULL,
	`id_peca` int NOT NULL,
	PRIMARY KEY (`id_os`, `id_peca`)
);

CREATE TABLE IF NOT EXISTS `servico_1740186189` (

);

CREATE TABLE IF NOT EXISTS `peca_1740186226` (

);

CREATE TABLE IF NOT EXISTS `itemservico_1740186262` (

);

CREATE TABLE IF NOT EXISTS `itempeca_1740186306` (

);

CREATE TABLE IF NOT EXISTS `pagamento` (
	`id_os` int NOT NULL UNIQUE,
	`id_pagamento` int AUTO_INCREMENT NOT NULL,
	PRIMARY KEY (`id_pagamento`)
);


ALTER TABLE `veiculo` ADD CONSTRAINT `veiculo_fk1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente`(`id_cliente`);

ALTER TABLE `mecanico` ADD CONSTRAINT `mecanico_fk5` FOREIGN KEY (`id_equipe`) REFERENCES `equipe`(`id_equipe`);
ALTER TABLE `ordemservico` ADD CONSTRAINT `ordemservico_fk1` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculo`(`id_veiculo`);


ALTER TABLE `itemservico` ADD CONSTRAINT `itemservico_fk0` FOREIGN KEY (`id_os`) REFERENCES `ordemservico`(`id_os`);
ALTER TABLE `itempeca` ADD CONSTRAINT `itempeca_fk0` FOREIGN KEY (`id_os`) REFERENCES `ordemservico`(`id_os`);




ALTER TABLE `pagamento` ADD CONSTRAINT `pagamento_fk0` FOREIGN KEY (`id_os`) REFERENCES `ordemservico`(`id_os`);