Após aprender comandos básicos como SELECT, FROM e INSERT, avancei para a criação de estruturas de banco de dados utilizando CREATE TABLE e definição de constraints.

Neste exercício, desenvolvi um modelo simples de banco de dados para uma escola fictícia, utilizando conceitos fundamentais como:

PRIMARY KEY: identificação única de cada registro
NOT NULL: garantia de preenchimento obrigatório
UNIQUE: prevenção de duplicidade (ex: CPF)
FOREIGN KEY: criação de relacionamento entre tabelas

O modelo é composto por três tabelas:

setores: áreas da escola
funcionarios: dados dos colaboradores
financeiro: controle de pagamentos

Esse exercício foi desenvolvido com base nas aulas da Nave do Conhecimento, com apoio de IA como ferramenta auxiliar de aprendizado.

    

-- Criação da estrutura de tabelas (Dia 2 de aula)

CREATE TABLE setores (
    id_setor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_setor TEXT NOT NULL
);

CREATE TABLE funcionarios (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE,
    cargo TEXT,
    id_setor INTEGER,
    data_admissao DATE,
    FOREIGN KEY (id_setor) REFERENCES setores(id_setor)
);

CREATE TABLE financeiro (
    id_lancamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_funcionario INTEGER,
    valor_salario REAL,
    status_pagamento TEXT,
    data_pagamento DATE,
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);
