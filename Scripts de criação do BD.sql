
create table Cliente(

    codigo NUMBER,
    tratamento VARCHAR(8),
    primeironome VARCHAR(50) NOT NULL ,
    nomedomeio VARCHAR(8),
    sobrenome VARCHAR(50) NOT NULL,
    sufixo VARCHAR(10),
    senha VARCHAR(50) NOT NULL
);

create table Endereco(
    
    id NUMBER,
    logadouro VARCHAR(60),
    complemento VARCHAR(60),
    cidade VARCHAR(30) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codigopostal VARCHAR(15) NOT NULL
);


create table Clienteendereco(
    
    codigocliente NUMBER,
    idendereco NUMBER,
    tipoendereco VARCHAR(50)

);



create table Modelo(

    codigo Number,
    nome VARCHAR(50) NOT NULL
    
);

create table Categoria(

    codigo Number,
    nome VARCHAR(50) NOT NULL,
    categoriaprincipal NUMBER
    
);

create table Produto(

    codigo VARCHAR(15),
    nome VARCHAR(50) NOT NULL,
    cor VARCHAR(15),
    custoproducao NUMBER NOT NULL,
    preco NUMBER NOT NULL,
    tamanho VARCHAR(5),
    peso NUMBER,
    codigomodelo NUMBER,
    codigocategoria NUMBER,
    dtiniciovenda TIMESTAMP,
    dtfimvenda TIMESTAMP

);

create table Vendedor(

    codigo NUMBER,
    primeiro VARCHAR(50) NOT NULL,
    nomedomeio VARCHAR(50),
    sobrenome VARCHAR(50) NOT NULL,
    senha VARCHAR(128) NOT NULL,
    dtnascimento TIMESTAMP NOT NULL,
    dtcontratacao TIMESTAMP NOT NULL,
    sexo VARCHAR(1),
    quota NUMBER,
    bonus NUMBER,
    comeissao NUMBER
    
);

create table Idioma(
    
    sigla VARCHAR(6),
    nome VARCHAR(50) NOT NULL
    
);

create table Descricao(
    
    codigo NUMBER,
    descricao VARCHAR(600),
    codigomodelo NUMBER,
    siglaidioma VARCHAR(6)
    
);

create table Pedido(

    codigo NUMBER,
    dpedido TIMESTAMP NOT NULL,
    denvio TIMESTAMP,
    drecebimento TIMESTAMP,
    codigocliente NUMBER NOT NULL,
    contacliente VARCHAR(15),
    numerocartaocredito NUMBER,
    codigoconfirmacao VARCHAR(15),
    codigovendedor NUMBER,
    imposto NUMBER,
    enderecofatura NUMBER,
    enderecoentrega NUMBER,
    codigotransportadora NUMBER

);

create table Detalhespedido(

    codigopedido NUMBER,
    codigoproduto VARCHAR(15),
    quantidade NUMBER NOT NULL,
    precounitario NUMBER NOT NULL,
    desconto NUMBER
    
);

create table transportadora(

    codigo NUMBER,
    nome varchar(30),
    taxabase NUMBER,
    taxaenvio NUMBER
);


/*--------------------FIM Q1----------------------*/

alter table transportadora add CONSTRAINT pktransportadora primary key (codigo);
alter table cliente add CONSTRAINT pkcliente primary key (codigo);
alter table endereco add CONSTRAINT pkendereco primary key (id);
alter table clienteendereco add CONSTRAINT pkclienteendereco primary key (codigocliente, idendereco);
alter table modelo add CONSTRAINT pkmodelo primary key (codigo);
alter table categoria add CONSTRAINT pkcategoria primary key (codigo);
alter table produto add CONSTRAINT pkproduto primary key (codigo);
alter table vendedor add CONSTRAINT pkvendedor primary key (codigo);
alter table idioma add CONSTRAINT pkidioma primary key (sigla);
alter table descricao add CONSTRAINT pkdescricao primary key (codigo);
alter table pedido add CONSTRAINT pkpedido primary key (codigo);
alter table detalhespedido add CONSTRAINT pkdetalhespedido primary key (codigopedido, codigoproduto);


alter table clienteendereco add constraint fkce_codigocliente 
foreign key (codigocliente) references cliente (codigo);
alter table clienteendereco add constraint fkce_idendereco 
foreign key (idendereco) references endereco (id);
alter table clienteendereco add constraint fkce_idendereco 
foreign key (idendereco) references endereco (id);
alter table categoria add constraint fkc_categoriaprincipal 
foreign key (categoriaprincipal) references categoria (codigo);
alter table produto add constraint fkp_codigocategooria 
foreign key (codigocategoria) references categoria (codigo);
alter table produto add constraint fkp_codigomodelo 
foreign key (codigomodelo) references modelo (codigo);
alter table descricao add constraint fkd_codigomodelo 
foreign key (codigomodelo) references modelo (codigo);
alter table descricao add constraint fkd_siglaidioma 
foreign key (siglaidioma) references idioma (sigla);
alter table descricao add constraint fkd_siglaidioma 
foreign key (siglaidioma) references idioma (sigla);
alter table pedido add constraint fkp_codigocliente
foreign key (codigocliente) references cliente (codigo);
alter table pedido add constraint fkp_codigovendedor
foreign key (codigovendedor) references vendedor (codigo);
alter table pedido add constraint fkp_enderecofatura
foreign key (enderecofatura) references endereco (id);
alter table pedido add constraint fkp_enderecoentrega
foreign key (enderecoentrega) references endereco (id);
alter table pedido add constraint fkp_codigotransportadora
foreign key (codigotransportadora) references transportadora (codigo);
alter table detalhespedido add constraint fkdp_codigopedido
foreign key (codigopedido) references pedido (codigo);
alter table detalhespedido add constraint fkdp_codigoproduto
foreign key (codigoproduto) references produto (codigo);
