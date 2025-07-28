CREATE TABLE VEICULO (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    placa               TEXT,
    modelo              TEXT,
    quilometragem       TEXT,
    ano                 INTEGER,
    cor                 TEXT,
    marca               TEXT
);

CREATE TABLE MANUTENCAO (
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    veiculo_id          INTEGER,
    tipo                TEXT,
    peca                TEXT,
    marca               TEXT,
    quilometragem       TEXT,
    data                TEXT,
    valor               REAL,
    descricao           TEXT
)