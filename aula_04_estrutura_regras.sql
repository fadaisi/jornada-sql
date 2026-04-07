select * from dbo.equipes

-- renomear coluna

exec sp_rename 'Equipes.Nome', 'Nomes', 'COLUMN' ;

-- alterar informação na coluna

update dbo.equipes
set nomes = 'Mercedes'
where nomes = 'Mercedes-AMG'

-- regra pra que nao seja registrado em numeros  

ALTER TABLE dbo.equipes
ADD CONSTRAINT CK_Equipe_Nome_SemNumeros
CHECK (nomes NOT LIKE '%[0-9]%');

-- teste

update dbo.equipes
set nomes = 56329
where nomes = 'BAR';

-- testando se há outras restrições

SELECT
    name AS Nome_Da_Restricao,
    definition AS Regra_SQL
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('dbo.equipes');

-- aplicar contraints em varias colunas

ALTER TABLE dbo.equipes
ADD CONSTRAINT CK_Equipe_Campos_SemNumeros
CHECK (
    Sede NOT LIKE '%[0-9]%' AND
    ChefeEquipe NOT LIKE '%[0-9]%' AND
    Motor NOT LIKE '%[0-9]%'
);


-- teste deletar restrições

ALTER TABLE dbo.equipes
DROP CONSTRAINT CK_Equipe_Campos_SemNumeros;
