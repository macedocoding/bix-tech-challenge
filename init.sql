CREATE TABLE IF NOT EXISTS dim_funcionario (
    id_funcionario integer UNIQUE NOT NULL,
    nome_funcionario varchar (50),
    PRIMARY KEY (id_funcionario)
);

CREATE TABLE IF NOT EXISTS dim_categoria (
    id_categoria integer UNIQUE NOT NULL,
    nome_categoria varchar (50),
    PRIMARY KEY (id_categoria)
);

CREATE TABLE IF NOT EXISTS fact_venda (
    id_venda integer UNIQUE NOT NULL,
    id_funcionario integer NOT NULL REFERENCES dim_funcionario (id_funcionario),
    id_categoria integer NOT NULL REFERENCES dim_categoria (id_categoria),
    data_venda date NOT NULL, 
    venda integer NOT NULL CHECK (venda >= 0),
    PRIMARY KEY (id_venda)
);

CREATE TABLE IF NOT EXISTS aux_id ( 
    id_param integer UNIQUE NOT NULL
);

INSERT INTO aux_id VALUES (GENERATE_SERIES(1, 9));
