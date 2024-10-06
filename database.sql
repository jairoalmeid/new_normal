Create database disaster;

CREATE TABLE disasters (
    DisNo VARCHAR(20) PRIMARY KEY,
    is_historic BOOLEAN,
    disaster_subgroup VARCHAR(250),
    disaster_type VARCHAR(250),
    disaster_subtype VARCHAR(250),
    event_name VARCHAR(250),
    country_iso VARCHAR(5),
    country VARCHAR(250),
    subregion VARCHAR(250),
    region VARCHAR(250),
    location TEXT,
    associated_types VARCHAR(250),
    magnitude VARCHAR(100),
    magnitude_scale VARCHAR(250),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    start_year INT,
    start_month INT,
    start_day INT,
    end_year INT,
    end_month INT,
    end_day INT,
    total_deaths INT,
    no_injured INT,
    no_affected INT,
    no_homeless INT,
    total_affected INT,
    reconstruction_cost_usd NUMERIC(15, 2),
    reconstruction_cost_adjusted_usd NUMERIC(15, 2),
    insured_damage_usd NUMERIC(15, 2),
    insured_damage_adjusted_usd NUMERIC(15, 2),
    total_damage_usd NUMERIC(15, 2),
    total_damage_adjusted_usd NUMERIC(15, 2)
);

-- Comando COPY para importar dados de um arquivo CSV
COPY disasters FROM 'dataset.csv' 
WITH (FORMAT csv, DELIMITER ';', NULL '', HEADER true);

-- Criação da tabela 'popularity'
CREATE TABLE popularity (
    disno VARCHAR(20),
    week DATE,
    popularity NUMERIC,
    factor INT,
    FOREIGN KEY (disno) REFERENCES disasters(DisNo) ON DELETE CASCADE
);
