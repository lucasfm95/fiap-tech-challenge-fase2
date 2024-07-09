﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;

CREATE TABLE "Contacts" (
    "Id" bigint GENERATED BY DEFAULT AS IDENTITY,
    "Name" character varying(200) NOT NULL,
    "Email" character varying(50) NOT NULL,
    "PhoneNumber" character varying(9) NOT NULL,
    "DddNumber" integer NOT NULL,
    CONSTRAINT "PK_Contacts" PRIMARY KEY ("Id")
);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20240501131711_InitialMigration', '8.0.5');

COMMIT;

START TRANSACTION;

ALTER TABLE "Contacts" ALTER COLUMN "DddNumber" TYPE smallint;

CREATE TABLE "DddState" (
    "DddNumber" smallint GENERATED BY DEFAULT AS IDENTITY,
    "StateName" character varying(200) NOT NULL,
    "StateAbbreviation" character varying(2) NOT NULL,
    CONSTRAINT "PK_DddState" PRIMARY KEY ("DddNumber")
);

CREATE INDEX "IX_Contacts_DddNumber" ON "Contacts" ("DddNumber");

ALTER TABLE "Contacts" ADD CONSTRAINT "FK_Contacts_DddState_DddNumber" FOREIGN KEY ("DddNumber") REFERENCES "DddState" ("DddNumber");

INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (68, 'Acre', 'AC');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (82, 'Alagoas', 'AL');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (97, 'Amazonas', 'AM');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (92, 'Amazonas', 'AM');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (96, 'Amapá', 'AP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (77, 'Bahia', 'BA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (75, 'Bahia', 'BA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (73, 'Bahia', 'BA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (74, 'Bahia', 'BA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (71, 'Bahia', 'BA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (88, 'Ceará', 'CE');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (85, 'Ceará', 'CE');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (61, 'Distrito Federal', 'DF');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (28, 'Espírito Santo', 'ES');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (27, 'Espírito Santo', 'ES');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (62, 'Goiás', 'GO');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (64, 'Goiás', 'GO');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (99, 'Maranhão', 'MA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (98, 'Maranhão', 'MA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (34, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (37, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (31, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (33, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (35, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (38, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (32, 'Minas Gerais', 'MG');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (67, 'Mato Grosso do Sul', 'MS');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (65, 'Mato Grosso', 'MT');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (66, 'Mato Grosso', 'MT');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (91, 'Pará', 'PA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (94, 'Pará', 'PA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (93, 'Pará', 'PA');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (83, 'Paraíba', 'PB');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (81, 'Pernambuco', 'PE');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (87, 'Pernambuco', 'PE');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (89, 'Piauí', 'PI');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (86, 'Piauí', 'PI');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (43, 'Paraná', 'PR');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (41, 'Paraná', 'PR');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (42, 'Paraná', 'PR');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (44, 'Paraná', 'PR');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (45, 'Paraná', 'PR');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (46, 'Paraná', 'PR');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (24, 'Rio de Janeiro', 'RJ');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (22, 'Rio de Janeiro', 'RJ');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (21, 'Rio de Janeiro', 'RJ');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (84, 'Rio Grande do Norte', 'RN');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (53, 'Rio Grande do Sul', 'RS');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (54, 'Rio Grande do Sul', 'RS');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (55, 'Rio Grande do Sul', 'RS');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (51, 'Rio Grande do Sul', 'RS');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (47, 'Santa Catarina', 'SC');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (48, 'Santa Catarina', 'SC');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (49, 'Santa Catarina', 'SC');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (79, 'Sergipe', 'SE');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (11, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (12, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (13, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (14, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (15, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (16, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (17, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (18, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (19, 'São Paulo', 'SP');
INSERT INTO "DddState" ("DddNumber", "StateName", "StateAbbreviation")
VALUES (63, 'Tocantins', 'TO');

SELECT setval(
    pg_get_serial_sequence('"DddState"', 'DddNumber'),
    GREATEST(
        (SELECT MAX("DddNumber") FROM "DddState") + 1,
        nextval(pg_get_serial_sequence('"DddState"', 'DddNumber'))),
    false);

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20240501145307_AddDddStateTable', '8.0.5');

COMMIT;
