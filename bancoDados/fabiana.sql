DROP DATABASE IF EXISTS bd_site_fabiana;

CREATE DATABASE bd_site_fabiana;

USE bd_site_fabiana;

CREATE TABLE produtos(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao_produto VARCHAR (255),
    preco DECIMAL(4,2) NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    qtd_estoque INT NOT NULL,
    CONSTRAINT PKproduto PRIMARY KEY produtos(id)
);

CREATE TABLE clientes(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefone CHAR(11) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    CONSTRAINT PK_cliente PRIMARY KEY clientes(id)
);

CREATE TABLE pedidos(
    id INT AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    data_entrega DATE NOT NULL,
    status_pedido VARCHAR(255) NOT NULL,
    valor_total DECIMAL(4,2) NOT NULL,
    metodo_pagamento VARCHAR(255) NOT NULL,
    CONSTRAINT PK_pedido PRIMARY KEY pedidos(id),
    CONSTRAINT FK_codigo_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id)

);

CREATE TABLE itens_do_pedido(
    id_item INT AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    qtd INT NOT NULL,
    preco_unitario DECIMAL(4,2) NOT NULL,
    CONSTRAINT PK_item_pedido PRIMARY KEY itens_do_pedido(id_item),
    CONSTRAINT FK_codigo_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    CONSTRAINT FK_codigo_produto FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE pagamentos(
    id INT AUTO_INCREMENT,
    id_pedido INT,
    valor_pago DECIMAL(4,2) NOT NULL,
    data_pagamento DATE NOT NULL,
    status_pagamento VARCHAR(255) NOT NULL,
    metodo_pagamento VARCHAR(255) NOT NULL,
    CONSTRAINT PK_pagamento PRIMARY KEY pagamentos(id),
    CONSTRAINT FK_codigo_pedido_pagamentos FOREIGN KEY (id_pedido) REFERENCES pedidos(id)
);

CREATE TABLE categorias(
    id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL, 
    descricao_categoria VARCHAR(255) NOT NULL,
    CONSTRAINT PK_categoria PRIMARY KEY categorias(id)
);

CREATE TABLE avaliacoes(
    id INT AUTO_INCREMENT,
    id_avaliador INT,
    id_produto_avaliado INT,
    nota INT NOT NULL,
    comentário VARCHAR(1000),
    data_avaliacao DATE NOT NULL,
    CONSTRAINT PK_avaliacao PRIMARY KEY avaliacoes(id),
    CONSTRAINT FK_codigo_cliente_avaliador FOREIGN KEY (id_avaliador) REFERENCES clientes(id),
    CONSTRAINT FK_codigo_produto_avaliado FOREIGN KEY (id_produto_avaliado) REFERENCES produtos(id)
);

CREATE TABLE promocoes(
    id_cupom INT AUTO_INCREMENT,
    codigo_cupom CHAR(6) NOT NULL,
    valor_desconto INT NOT NULL,
    data_validade DATE NOT NULL,
    regras_cupom VARCHAR(500) NOT NULL,
    CONSTRAINT PK_cupom PRIMARY KEY promocoes(id_cupom)
);