CREATE TABLE cliente (
    idcliente SERIAL,
    nome CHARACTER VARYING,
    cpf CHARACTER VARYING,
    tel_res CHARACTER VARYING,
    tel_cel CHARACTER VARYING,
    e_mail CHARACTER VARYING,
CONSTRAINT pk_cliente PRIMARY KEY (idcliente)
);

CREATE TABLE usuario (
    idusuario SERIAL,
    nomeusuario CHARACTER VARYING,
    email CHARACTER VARYING,
    senha CHARACTER VARYING,
    CONSTRAINT usuario_pkey PRIMARY KEY (idusuario),
    CONSTRAINT usuario_email_key UNIQUE (email),
    CONSTRAINT usuario_nomeusuario_key UNIQUE (nomeusuario)
);

CREATE TABLE automovel (
    idAutomovel SERIAL,
    placa CHARACTER VARYING,
    marca CHARACTER VARYING,
    modelo CHARACTER VARYING,
    chassi CHARACTER VARYING NOT NULL,
    observacoes CHARACTER VARYING,
    portas INTEGER,
    passageiros INTEGER,
    tipoAutomovel CHARACTER VARYING,
    cor CHARACTER VARYING,
    valorVenda NUMERIC(10, 2),
    status CHARACTER VARYING,
CONSTRAINT automovel_pk PRIMARY KEY (idAutomovel),
CONSTRAINT uk_placa UNIQUE(placa),
CONSTRAINT uk_chassi UNIQUE(chassi)
);

CREATE TABLE transacao (
    id SERIAL,
    numero INTEGER,
    data DATE,
    hora TIME WITHOUT TIME ZONE,
    idCliente INTEGER NOT NULL,
    idAutomovel INTEGER NOT NULL,   
    observacao CHARACTER VARYING,
    total NUMERIC(10,2) NOT NULL,
    situacao CHARACTER VARYING,
CONSTRAINT id_transacao PRIMARY KEY(id),
CONSTRAINT uk_numero UNIQUE(numero),
CONSTRAINT fk_automovel FOREIGN KEY(idAutomovel)
    REFERENCES automovel(idAutomovel),
CONSTRAINT fk_cliente FOREIGN KEY(idCliente)
    REFERENCES cliente(idCliente)
);

INSERT INTO usuario(nomeusuario, email, senha) VALUES ('Leonardo', 'leo@umcar.com.br', '1234567');
INSERT INTO usuario(nomeusuario, email, senha) VALUES ('Diogo', 'diogo@umcar.com.br', '1234567');