-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2024-11-12 19:23:23 BRST
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g


CREATE SEQUENCE sq_empresa 
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE SEQUENCE sq_industria 
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE SEQUENCE sq_sitio 
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE SEQUENCE sq_endereco 
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE SEQUENCE sq_gerador 
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE SEQUENCE sq_maquina 
START WITH 1 
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE TABLE t_gl_aparelho_gerador (
    id_fonte             NUMBER(8) NOT NULL,
    potencia             NUMBER(2) NOT NULL,
    tipo                 NUMBER(1) NOT NULL,
    id_sitio  NUMBER(8) NOT NULL
);

ALTER TABLE t_gl_aparelho_gerador
    ADD CHECK ( tipo IN (
        1,
        2
    ) );

ALTER TABLE t_gl_aparelho_gerador ADD CONSTRAINT t_gl_aparelho_gerador_pk PRIMARY KEY ( id_fonte );

ALTER TABLE t_gl_aparelho_gerador MODIFY id_fonte DEFAULT sq_gerador.NEXTVAL;

CREATE TABLE t_gl_empresa (
    id_empresa                 NUMBER(8) NOT NULL,
    nm_empresa                 VARCHAR2(100) NOT NULL,
    nr_cnpj                    NUMBER(14) NOT NULL,
    email                      VARCHAR2(35) NOT NULL,
    senha                      VARCHAR2(12) NOT NULL,
    id_endereco                NUMBER(8) NOT NULL
);

ALTER TABLE t_gl_empresa ADD CONSTRAINT t_gl_empresa_pk PRIMARY KEY ( id_empresa );

ALTER TABLE t_gl_empresa MODIFY id_empresa DEFAULT sq_empresa.NEXTVAL;


CREATE TABLE t_gl_endereco (
    id_endereco     NUMBER(8) NOT NULL,
    cep             NUMBER(8) NOT NULL,
    nm_logradouro   VARCHAR(150),
    cidade          VARCHAR(150),
    bairro          VARCHAR(150),
    uf              VARCHAR(150),
    nr_logradouro   VARCHAR(15),
    ds_complemento  VARCHAR2(35) NOT NULL
);

ALTER TABLE t_gl_endereco ADD CONSTRAINT t_gl_endereco_pk PRIMARY KEY ( id_endereco );

ALTER TABLE t_gl_endereco MODIFY id_endereco DEFAULT sq_endereco.NEXTVAL;


CREATE TABLE t_gl_industria (
    id_industria             NUMBER(8) NOT NULL,
    nm_industria             VARCHAR2(150) NOT NULL,
    id_empresa  NUMBER(8) NOT NULL
);

ALTER TABLE t_gl_industria ADD CONSTRAINT t_gl_industria_pk PRIMARY KEY ( id_industria );

ALTER TABLE t_gl_industria MODIFY id_industria DEFAULT sq_industria.NEXTVAL;


CREATE TABLE t_gl_maquina (
    id_maquina           NUMBER(8) NOT NULL,
    consumo              NUMBER(5) NOT NULL,
    ds_maquina           VARCHAR2(50) NOT NULL,
    id_sitio             NUMBER(8) NOT NULL
);

COMMENT ON COLUMN t_gl_maquina.ds_maquina IS
    '					';

ALTER TABLE t_gl_maquina ADD CONSTRAINT t_gl_maquina_pk PRIMARY KEY ( id_maquina );

ALTER TABLE t_gl_maquina MODIFY id_maquina DEFAULT sq_maquina.NEXTVAL;


CREATE TABLE t_gl_sitio (
    id_sitio                     NUMBER(8) NOT NULL,
    tp_fonte                     NUMBER(1),
    id_industria                 NUMBER(8) NOT NULL,
    id_endereco                  NUMBER(8) NOT NULL
);

ALTER TABLE t_gl_sitio
    ADD CHECK ( tp_fonte IN (
        0,
        1,
        2
    ) );

ALTER TABLE t_gl_sitio ADD CONSTRAINT t_gl_sitio_pk PRIMARY KEY ( id_sitio );

ALTER TABLE t_gl_sitio MODIFY id_sitio DEFAULT sq_sitio.NEXTVAL;

ALTER TABLE t_gl_aparelho_gerador
    ADD CONSTRAINT t_gl_gerador_t_gl_sitio_fk FOREIGN KEY ( id_sitio )
        REFERENCES t_gl_sitio ( id_sitio );

ALTER TABLE t_gl_empresa
    ADD CONSTRAINT t_gl_empresa_t_gl_endereco_fk FOREIGN KEY ( id_endereco )
        REFERENCES t_gl_endereco ( id_endereco );

ALTER TABLE t_gl_industria
    ADD CONSTRAINT t_gl_industria_t_gl_empresa_fk FOREIGN KEY ( id_empresa )
        REFERENCES t_gl_empresa ( id_empresa );

ALTER TABLE t_gl_maquina
    ADD CONSTRAINT t_gl_maquina_t_gl_sitio_fk FOREIGN KEY ( id_sitio )
        REFERENCES t_gl_sitio ( id_sitio );

ALTER TABLE t_gl_sitio
    ADD CONSTRAINT t_gl_sitio_t_gl_endereco_fk FOREIGN KEY ( id_endereco )
        REFERENCES t_gl_endereco ( id_endereco );

ALTER TABLE t_gl_sitio
    ADD CONSTRAINT t_gl_sitio_t_gl_industria_fk FOREIGN KEY ( id_industria )
        REFERENCES t_gl_industria ( id_industria );

commit;

-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
