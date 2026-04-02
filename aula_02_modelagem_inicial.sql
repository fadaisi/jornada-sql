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
