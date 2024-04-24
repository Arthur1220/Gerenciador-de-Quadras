-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: quadras | type: DATABASE --
-- DROP DATABASE IF EXISTS quadras;
CREATE DATABASE quadras
	ENCODING = 'UTF8'
	LC_COLLATE = 'pt_BR.UTF-8'
	LC_CTYPE = 'pt_BR.UTF-8'
	TABLESPACE = pg_default
	OWNER = postgres;
-- ddl-end --


-- object: public."TBL_Proprietario" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Proprietario" CASCADE;
CREATE TABLE public."TBL_Proprietario" (
	"ID_Proprietario" integer NOT NULL,
	"ID_pessoa_TBL_pessoa" numeric NOT NULL,
	CONSTRAINT "Proprietario_pk" PRIMARY KEY ("ID_Proprietario")
);
-- ddl-end --
ALTER TABLE public."TBL_Proprietario" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Clube" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Clube" CASCADE;
CREATE TABLE public."TBL_Clube" (
	"ID_Clube" numeric NOT NULL,
	"horarioAbertura" time NOT NULL,
	"horarioFechamento" time NOT NULL,
	"nomeFantasia" character varying(50) NOT NULL,
	"ID_Proprietario_TBL_Proprietario" integer,
	"ID_endereco_TBL_endereco" numeric NOT NULL,
	"ID_telefone_TBL_telefone" numeric NOT NULL,
	saldo numeric(10,2) NOT NULL,
	CONSTRAINT "Clube_pk" PRIMARY KEY ("ID_Clube")
);
-- ddl-end --
ALTER TABLE public."TBL_Clube" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Materiais" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Materiais" CASCADE;
CREATE TABLE public."TBL_Materiais" (
	"ID_Materiais" integer NOT NULL,
	quantidade integer NOT NULL,
	"valorUN" numeric(10,2) NOT NULL,
	"ID_Clube_TBL_Clube" numeric,
	"ID_tipoMateriais_TBL_tipoMateriais" integer,
	CONSTRAINT "Materiais_pk" PRIMARY KEY ("ID_Materiais")
);
-- ddl-end --
ALTER TABLE public."TBL_Materiais" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Funcionarios" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Funcionarios" CASCADE;
CREATE TABLE public."TBL_Funcionarios" (
	"ID_Funcionarios" integer NOT NULL,
	"dataAdmissao" date NOT NULL,
	"ID_Clube_TBL_Clube" numeric,
	"ID_pessoa_TBL_pessoa" numeric NOT NULL,
	"ID_tipoFuncionarios_TBL_tipoFuncionarios" integer,
	CONSTRAINT "Funcionarios_pk" PRIMARY KEY ("ID_Funcionarios")
);
-- ddl-end --
ALTER TABLE public."TBL_Funcionarios" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Evento" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Evento" CASCADE;
CREATE TABLE public."TBL_Evento" (
	"ID_Evento" integer NOT NULL,
	nome character varying(50) NOT NULL,
	"desc" character varying(100) NOT NULL,
	"valor/taxa" numeric(10,2) NOT NULL,
	"dataInicio" date NOT NULL,
	"dataFim" date NOT NULL,
	"ID_Clube_TBL_Clube" numeric,
	"ID_tipoEvento_TBL_tipoEvento" integer,
	CONSTRAINT "Evento_pk" PRIMARY KEY ("ID_Evento")
);
-- ddl-end --
ALTER TABLE public."TBL_Evento" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Financeiro" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Financeiro" CASCADE;
CREATE TABLE public."TBL_Financeiro" (
	"ID_Financeiro" integer NOT NULL,
	nome character varying(50) NOT NULL,
	"desc" character varying(100) NOT NULL,
	data date NOT NULL,
	"ID_Clube_TBL_Clube" numeric NOT NULL,
	"ID_tipoFinanceiro_TBL_tipoFinanceiro" integer NOT NULL,
	"ID_Professor_TBL_Professor" integer,
	"ID_Clientes_TBL_Clientes" integer,
	"ID_Evento_TBL_Evento" integer,
	"ID_Funcionarios_TBL_Funcionarios" integer,
	CONSTRAINT "Financeiro_pk" PRIMARY KEY ("ID_Financeiro")
);
-- ddl-end --
ALTER TABLE public."TBL_Financeiro" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Clientes" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Clientes" CASCADE;
CREATE TABLE public."TBL_Clientes" (
	"ID_Clientes" integer NOT NULL,
	"dataAdmissao" date NOT NULL,
	"ID_Clube_TBL_Clube" numeric,
	"ID_pessoa_TBL_pessoa" numeric NOT NULL,
	"ID_tipoCliente_TBL_tipoCliente" integer,
	CONSTRAINT "Clientes_pk" PRIMARY KEY ("ID_Clientes")
);
-- ddl-end --
ALTER TABLE public."TBL_Clientes" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Aulas" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Aulas" CASCADE;
CREATE TABLE public."TBL_Aulas" (
	"ID_Aulas" integer NOT NULL,
	valor numeric(10,2) NOT NULL,
	"horarioInicio" time NOT NULL,
	"horarioFim" time NOT NULL,
	data date NOT NULL,
	"ID_Quadra_TBL_Quadra" integer NOT NULL,
	"ID_Professor_TBL_Professor" integer NOT NULL,
	"ID_Materiais_TBL_Materiais" integer NOT NULL,
	CONSTRAINT "Aulas_pk" PRIMARY KEY ("ID_Aulas")
);
-- ddl-end --
ALTER TABLE public."TBL_Aulas" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Reserva" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Reserva" CASCADE;
CREATE TABLE public."TBL_Reserva" (
	"ID_Reserva" integer NOT NULL,
	data date NOT NULL,
	"horarioInicio" time NOT NULL,
	"horarioFIm" time NOT NULL,
	"statusPagamento" boolean NOT NULL,
	"ID_Financeiro_TBL_Financeiro" integer NOT NULL,
	"ID_Clientes_TBL_Clientes" integer NOT NULL,
	"ID_Quadra_TBL_Quadra" integer NOT NULL,
	"ID_Clube_TBL_Clube" numeric NOT NULL,
	"ID_Materiais_TBL_Materiais" integer,
	CONSTRAINT "Reserva_pk" PRIMARY KEY ("ID_Reserva")
);
-- ddl-end --
ALTER TABLE public."TBL_Reserva" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Quadra" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Quadra" CASCADE;
CREATE TABLE public."TBL_Quadra" (
	"ID_Quadra" integer NOT NULL,
	nome character varying(50) NOT NULL,
	valor numeric(10,2) NOT NULL,
	"ID_Clube_TBL_Clube" numeric,
	"ID_tipoQuadra_TBL_tipoQuadra" integer,
	CONSTRAINT "Quadra_pk" PRIMARY KEY ("ID_Quadra")
);
-- ddl-end --
ALTER TABLE public."TBL_Quadra" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Problemas" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Problemas" CASCADE;
CREATE TABLE public."TBL_Problemas" (
	"ID_Problemas" integer NOT NULL,
	nome character varying(50) NOT NULL,
	"desc" character varying(100) NOT NULL,
	data date NOT NULL,
	"statusProblema" boolean NOT NULL,
	"ID_Quadra_TBL_Quadra" integer NOT NULL,
	CONSTRAINT "Problemas_pk" PRIMARY KEY ("ID_Problemas")
);
-- ddl-end --
ALTER TABLE public."TBL_Problemas" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Professor" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Professor" CASCADE;
CREATE TABLE public."TBL_Professor" (
	"ID_Professor" integer NOT NULL,
	"dataAdmissao" date NOT NULL,
	"ID_pessoa_TBL_pessoa" numeric NOT NULL,
	"ID_Clube_TBL_Clube" numeric,
	"ID_tipoProfessor_TBL_tipoProfessor" integer,
	CONSTRAINT "Professor_pk" PRIMARY KEY ("ID_Professor")
);
-- ddl-end --
ALTER TABLE public."TBL_Professor" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Funcionarios" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Funcionarios" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Professor" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Professor" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clientes" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Clientes" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Proprietario_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clube" DROP CONSTRAINT IF EXISTS "TBL_Proprietario_fk" CASCADE;
ALTER TABLE public."TBL_Clube" ADD CONSTRAINT "TBL_Proprietario_fk" FOREIGN KEY ("ID_Proprietario_TBL_Proprietario")
REFERENCES public."TBL_Proprietario" ("ID_Proprietario") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clube" DROP CONSTRAINT IF EXISTS "TBL_Clube_uq" CASCADE;
ALTER TABLE public."TBL_Clube" ADD CONSTRAINT "TBL_Clube_uq" UNIQUE ("ID_Proprietario_TBL_Proprietario");
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Materiais" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Materiais" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Quadra" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Quadra" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Evento" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Evento" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Quadra_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Problemas" DROP CONSTRAINT IF EXISTS "TBL_Quadra_fk" CASCADE;
ALTER TABLE public."TBL_Problemas" ADD CONSTRAINT "TBL_Quadra_fk" FOREIGN KEY ("ID_Quadra_TBL_Quadra")
REFERENCES public."TBL_Quadra" ("ID_Quadra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_endereco" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_endereco" CASCADE;
CREATE TABLE public."TBL_endereco" (
	"ID_endereco" numeric NOT NULL,
	"CEP" numeric(8) NOT NULL,
	rua varchar(50) NOT NULL,
	numero numeric NOT NULL,
	bairro varchar(50) NOT NULL,
	"ID_cidade_TBL_cidade" numeric,
	CONSTRAINT endereco_pk PRIMARY KEY ("ID_endereco")
);
-- ddl-end --
ALTER TABLE public."TBL_endereco" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_cidade" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_cidade" CASCADE;
CREATE TABLE public."TBL_cidade" (
	"ID_cidade" numeric NOT NULL,
	cidade varchar(50) NOT NULL,
	estado varchar(50) NOT NULL,
	CONSTRAINT cidade_pk PRIMARY KEY ("ID_cidade")
);
-- ddl-end --
ALTER TABLE public."TBL_cidade" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_telefone" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_telefone" CASCADE;
CREATE TABLE public."TBL_telefone" (
	"ID_telefone" numeric NOT NULL,
	ddd numeric(3) NOT NULL,
	telefone numeric(9) NOT NULL,
	CONSTRAINT telefone_pk PRIMARY KEY ("ID_telefone")
);
-- ddl-end --
ALTER TABLE public."TBL_telefone" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_Turma" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_Turma" CASCADE;
CREATE TABLE public."TBL_Turma" (
	"ID_Turma" numeric NOT NULL,
	CONSTRAINT "Turma_pk" PRIMARY KEY ("ID_Turma")
);
-- ddl-end --
ALTER TABLE public."TBL_Turma" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_pessoa" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_pessoa" CASCADE;
CREATE TABLE public."TBL_pessoa" (
	"ID_pessoa" numeric NOT NULL,
	nome varchar(155) NOT NULL,
	"dataNascimento" date NOT NULL,
	email varchar(155) NOT NULL,
	"CPF" varchar(14) NOT NULL,
	"ID_endereco_TBL_endereco" numeric,
	"ID_telefone_TBL_telefone" numeric,
	CONSTRAINT "TBL_pessoa_pk" PRIMARY KEY ("ID_pessoa")
);
-- ddl-end --
ALTER TABLE public."TBL_pessoa" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_cidade_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_endereco" DROP CONSTRAINT IF EXISTS "TBL_cidade_fk" CASCADE;
ALTER TABLE public."TBL_endereco" ADD CONSTRAINT "TBL_cidade_fk" FOREIGN KEY ("ID_cidade_TBL_cidade")
REFERENCES public."TBL_cidade" ("ID_cidade") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_pessoa_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Proprietario" DROP CONSTRAINT IF EXISTS "TBL_pessoa_fk" CASCADE;
ALTER TABLE public."TBL_Proprietario" ADD CONSTRAINT "TBL_pessoa_fk" FOREIGN KEY ("ID_pessoa_TBL_pessoa")
REFERENCES public."TBL_pessoa" ("ID_pessoa") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Proprietario_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Proprietario" DROP CONSTRAINT IF EXISTS "TBL_Proprietario_uq" CASCADE;
ALTER TABLE public."TBL_Proprietario" ADD CONSTRAINT "TBL_Proprietario_uq" UNIQUE ("ID_pessoa_TBL_pessoa");
-- ddl-end --

-- object: "TBL_pessoa_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clientes" DROP CONSTRAINT IF EXISTS "TBL_pessoa_fk" CASCADE;
ALTER TABLE public."TBL_Clientes" ADD CONSTRAINT "TBL_pessoa_fk" FOREIGN KEY ("ID_pessoa_TBL_pessoa")
REFERENCES public."TBL_pessoa" ("ID_pessoa") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clientes_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clientes" DROP CONSTRAINT IF EXISTS "TBL_Clientes_uq" CASCADE;
ALTER TABLE public."TBL_Clientes" ADD CONSTRAINT "TBL_Clientes_uq" UNIQUE ("ID_pessoa_TBL_pessoa");
-- ddl-end --

-- object: "TBL_pessoa_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Professor" DROP CONSTRAINT IF EXISTS "TBL_pessoa_fk" CASCADE;
ALTER TABLE public."TBL_Professor" ADD CONSTRAINT "TBL_pessoa_fk" FOREIGN KEY ("ID_pessoa_TBL_pessoa")
REFERENCES public."TBL_pessoa" ("ID_pessoa") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Professor_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Professor" DROP CONSTRAINT IF EXISTS "TBL_Professor_uq" CASCADE;
ALTER TABLE public."TBL_Professor" ADD CONSTRAINT "TBL_Professor_uq" UNIQUE ("ID_pessoa_TBL_pessoa");
-- ddl-end --

-- object: "TBL_pessoa_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Funcionarios" DROP CONSTRAINT IF EXISTS "TBL_pessoa_fk" CASCADE;
ALTER TABLE public."TBL_Funcionarios" ADD CONSTRAINT "TBL_pessoa_fk" FOREIGN KEY ("ID_pessoa_TBL_pessoa")
REFERENCES public."TBL_pessoa" ("ID_pessoa") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Funcionarios_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Funcionarios" DROP CONSTRAINT IF EXISTS "TBL_Funcionarios_uq" CASCADE;
ALTER TABLE public."TBL_Funcionarios" ADD CONSTRAINT "TBL_Funcionarios_uq" UNIQUE ("ID_pessoa_TBL_pessoa");
-- ddl-end --

-- object: "TBL_endereco_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clube" DROP CONSTRAINT IF EXISTS "TBL_endereco_fk" CASCADE;
ALTER TABLE public."TBL_Clube" ADD CONSTRAINT "TBL_endereco_fk" FOREIGN KEY ("ID_endereco_TBL_endereco")
REFERENCES public."TBL_endereco" ("ID_endereco") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_uq1" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clube" DROP CONSTRAINT IF EXISTS "TBL_Clube_uq1" CASCADE;
ALTER TABLE public."TBL_Clube" ADD CONSTRAINT "TBL_Clube_uq1" UNIQUE ("ID_endereco_TBL_endereco");
-- ddl-end --

-- object: "TBL_telefone_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clube" DROP CONSTRAINT IF EXISTS "TBL_telefone_fk" CASCADE;
ALTER TABLE public."TBL_Clube" ADD CONSTRAINT "TBL_telefone_fk" FOREIGN KEY ("ID_telefone_TBL_telefone")
REFERENCES public."TBL_telefone" ("ID_telefone") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_pagamento" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_pagamento" CASCADE;
CREATE TABLE public."TBL_pagamento" (
	"ID_pagamento" integer NOT NULL,
	valor numeric(10,2) NOT NULL,
	"statusPagamento" boolean NOT NULL,
	"ID_Financeiro_TBL_Financeiro" integer NOT NULL,
	CONSTRAINT "TBL_pagamento_pk" PRIMARY KEY ("ID_pagamento")
);
-- ddl-end --
ALTER TABLE public."TBL_pagamento" OWNER TO postgres;
-- ddl-end --

-- object: public."TBL_tipoFinanceiro" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoFinanceiro" CASCADE;
CREATE TABLE public."TBL_tipoFinanceiro" (
	"ID_tipoFinanceiro" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(155) NOT NULL,
	CONSTRAINT "TBL_tipoFinanceiro_pk" PRIMARY KEY ("ID_tipoFinanceiro")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoFinanceiro" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoFinanceiro_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Financeiro" DROP CONSTRAINT IF EXISTS "TBL_tipoFinanceiro_fk" CASCADE;
ALTER TABLE public."TBL_Financeiro" ADD CONSTRAINT "TBL_tipoFinanceiro_fk" FOREIGN KEY ("ID_tipoFinanceiro_TBL_tipoFinanceiro")
REFERENCES public."TBL_tipoFinanceiro" ("ID_tipoFinanceiro") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Financeiro_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_pagamento" DROP CONSTRAINT IF EXISTS "TBL_Financeiro_fk" CASCADE;
ALTER TABLE public."TBL_pagamento" ADD CONSTRAINT "TBL_Financeiro_fk" FOREIGN KEY ("ID_Financeiro_TBL_Financeiro")
REFERENCES public."TBL_Financeiro" ("ID_Financeiro") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_pagamento_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_pagamento" DROP CONSTRAINT IF EXISTS "TBL_pagamento_uq" CASCADE;
ALTER TABLE public."TBL_pagamento" ADD CONSTRAINT "TBL_pagamento_uq" UNIQUE ("ID_Financeiro_TBL_Financeiro");
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Financeiro" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Financeiro" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Financeiro_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Reserva" DROP CONSTRAINT IF EXISTS "TBL_Financeiro_fk" CASCADE;
ALTER TABLE public."TBL_Reserva" ADD CONSTRAINT "TBL_Financeiro_fk" FOREIGN KEY ("ID_Financeiro_TBL_Financeiro")
REFERENCES public."TBL_Financeiro" ("ID_Financeiro") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Reserva_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Reserva" DROP CONSTRAINT IF EXISTS "TBL_Reserva_uq" CASCADE;
ALTER TABLE public."TBL_Reserva" ADD CONSTRAINT "TBL_Reserva_uq" UNIQUE ("ID_Financeiro_TBL_Financeiro");
-- ddl-end --

-- object: "TBL_Clientes_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Reserva" DROP CONSTRAINT IF EXISTS "TBL_Clientes_fk" CASCADE;
ALTER TABLE public."TBL_Reserva" ADD CONSTRAINT "TBL_Clientes_fk" FOREIGN KEY ("ID_Clientes_TBL_Clientes")
REFERENCES public."TBL_Clientes" ("ID_Clientes") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Quadra_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Reserva" DROP CONSTRAINT IF EXISTS "TBL_Quadra_fk" CASCADE;
ALTER TABLE public."TBL_Reserva" ADD CONSTRAINT "TBL_Quadra_fk" FOREIGN KEY ("ID_Quadra_TBL_Quadra")
REFERENCES public."TBL_Quadra" ("ID_Quadra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clube_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Reserva" DROP CONSTRAINT IF EXISTS "TBL_Clube_fk" CASCADE;
ALTER TABLE public."TBL_Reserva" ADD CONSTRAINT "TBL_Clube_fk" FOREIGN KEY ("ID_Clube_TBL_Clube")
REFERENCES public."TBL_Clube" ("ID_Clube") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Quadra_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Aulas" DROP CONSTRAINT IF EXISTS "TBL_Quadra_fk" CASCADE;
ALTER TABLE public."TBL_Aulas" ADD CONSTRAINT "TBL_Quadra_fk" FOREIGN KEY ("ID_Quadra_TBL_Quadra")
REFERENCES public."TBL_Quadra" ("ID_Quadra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Professor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Aulas" DROP CONSTRAINT IF EXISTS "TBL_Professor_fk" CASCADE;
ALTER TABLE public."TBL_Aulas" ADD CONSTRAINT "TBL_Professor_fk" FOREIGN KEY ("ID_Professor_TBL_Professor")
REFERENCES public."TBL_Professor" ("ID_Professor") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Turma_has_many_TBL_Aulas" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Turma_has_many_TBL_Aulas" CASCADE;
CREATE TABLE public."many_TBL_Turma_has_many_TBL_Aulas" (
	"ID_Turma_TBL_Turma" numeric NOT NULL,
	"ID_Aulas_TBL_Aulas" integer NOT NULL,
	CONSTRAINT "many_TBL_Turma_has_many_TBL_Aulas_pk" PRIMARY KEY ("ID_Turma_TBL_Turma","ID_Aulas_TBL_Aulas")
);
-- ddl-end --

-- object: "TBL_Turma_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Turma_has_many_TBL_Aulas" DROP CONSTRAINT IF EXISTS "TBL_Turma_fk" CASCADE;
ALTER TABLE public."many_TBL_Turma_has_many_TBL_Aulas" ADD CONSTRAINT "TBL_Turma_fk" FOREIGN KEY ("ID_Turma_TBL_Turma")
REFERENCES public."TBL_Turma" ("ID_Turma") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Aulas_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Turma_has_many_TBL_Aulas" DROP CONSTRAINT IF EXISTS "TBL_Aulas_fk" CASCADE;
ALTER TABLE public."many_TBL_Turma_has_many_TBL_Aulas" ADD CONSTRAINT "TBL_Aulas_fk" FOREIGN KEY ("ID_Aulas_TBL_Aulas")
REFERENCES public."TBL_Aulas" ("ID_Aulas") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Materiais_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Aulas" DROP CONSTRAINT IF EXISTS "TBL_Materiais_fk" CASCADE;
ALTER TABLE public."TBL_Aulas" ADD CONSTRAINT "TBL_Materiais_fk" FOREIGN KEY ("ID_Materiais_TBL_Materiais")
REFERENCES public."TBL_Materiais" ("ID_Materiais") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_TBL_Clientes_has_many_TBL_Turma" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_TBL_Clientes_has_many_TBL_Turma" CASCADE;
CREATE TABLE public."many_TBL_Clientes_has_many_TBL_Turma" (
	"ID_Clientes_TBL_Clientes" integer NOT NULL,
	"ID_Turma_TBL_Turma" numeric NOT NULL,
	CONSTRAINT "many_TBL_Clientes_has_many_TBL_Turma_pk" PRIMARY KEY ("ID_Clientes_TBL_Clientes","ID_Turma_TBL_Turma")
);
-- ddl-end --

-- object: "TBL_Clientes_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Clientes_has_many_TBL_Turma" DROP CONSTRAINT IF EXISTS "TBL_Clientes_fk" CASCADE;
ALTER TABLE public."many_TBL_Clientes_has_many_TBL_Turma" ADD CONSTRAINT "TBL_Clientes_fk" FOREIGN KEY ("ID_Clientes_TBL_Clientes")
REFERENCES public."TBL_Clientes" ("ID_Clientes") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Turma_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_TBL_Clientes_has_many_TBL_Turma" DROP CONSTRAINT IF EXISTS "TBL_Turma_fk" CASCADE;
ALTER TABLE public."many_TBL_Clientes_has_many_TBL_Turma" ADD CONSTRAINT "TBL_Turma_fk" FOREIGN KEY ("ID_Turma_TBL_Turma")
REFERENCES public."TBL_Turma" ("ID_Turma") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_endereco_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_pessoa" DROP CONSTRAINT IF EXISTS "TBL_endereco_fk" CASCADE;
ALTER TABLE public."TBL_pessoa" ADD CONSTRAINT "TBL_endereco_fk" FOREIGN KEY ("ID_endereco_TBL_endereco")
REFERENCES public."TBL_endereco" ("ID_endereco") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_pessoa_uq" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_pessoa" DROP CONSTRAINT IF EXISTS "TBL_pessoa_uq" CASCADE;
ALTER TABLE public."TBL_pessoa" ADD CONSTRAINT "TBL_pessoa_uq" UNIQUE ("ID_endereco_TBL_endereco");
-- ddl-end --

-- object: "TBL_telefone_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_pessoa" DROP CONSTRAINT IF EXISTS "TBL_telefone_fk" CASCADE;
ALTER TABLE public."TBL_pessoa" ADD CONSTRAINT "TBL_telefone_fk" FOREIGN KEY ("ID_telefone_TBL_telefone")
REFERENCES public."TBL_telefone" ("ID_telefone") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_pessoa_uq1" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_pessoa" DROP CONSTRAINT IF EXISTS "TBL_pessoa_uq1" CASCADE;
ALTER TABLE public."TBL_pessoa" ADD CONSTRAINT "TBL_pessoa_uq1" UNIQUE ("ID_telefone_TBL_telefone");
-- ddl-end --

-- object: "TBL_Evento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Financeiro" DROP CONSTRAINT IF EXISTS "TBL_Evento_fk" CASCADE;
ALTER TABLE public."TBL_Financeiro" ADD CONSTRAINT "TBL_Evento_fk" FOREIGN KEY ("ID_Evento_TBL_Evento")
REFERENCES public."TBL_Evento" ("ID_Evento") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Clientes_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Financeiro" DROP CONSTRAINT IF EXISTS "TBL_Clientes_fk" CASCADE;
ALTER TABLE public."TBL_Financeiro" ADD CONSTRAINT "TBL_Clientes_fk" FOREIGN KEY ("ID_Clientes_TBL_Clientes")
REFERENCES public."TBL_Clientes" ("ID_Clientes") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Professor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Financeiro" DROP CONSTRAINT IF EXISTS "TBL_Professor_fk" CASCADE;
ALTER TABLE public."TBL_Financeiro" ADD CONSTRAINT "TBL_Professor_fk" FOREIGN KEY ("ID_Professor_TBL_Professor")
REFERENCES public."TBL_Professor" ("ID_Professor") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Funcionarios_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Financeiro" DROP CONSTRAINT IF EXISTS "TBL_Funcionarios_fk" CASCADE;
ALTER TABLE public."TBL_Financeiro" ADD CONSTRAINT "TBL_Funcionarios_fk" FOREIGN KEY ("ID_Funcionarios_TBL_Funcionarios")
REFERENCES public."TBL_Funcionarios" ("ID_Funcionarios") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "TBL_Materiais_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Reserva" DROP CONSTRAINT IF EXISTS "TBL_Materiais_fk" CASCADE;
ALTER TABLE public."TBL_Reserva" ADD CONSTRAINT "TBL_Materiais_fk" FOREIGN KEY ("ID_Materiais_TBL_Materiais")
REFERENCES public."TBL_Materiais" ("ID_Materiais") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_tipoProfessor" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoProfessor" CASCADE;
CREATE TABLE public."TBL_tipoProfessor" (
	"ID_tipoProfessor" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(100) NOT NULL,
	salario numeric(10,2) NOT NULL,
	CONSTRAINT "TBL_tipoProfessor___pk" PRIMARY KEY ("ID_tipoProfessor")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoProfessor" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoProfessor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Professor" DROP CONSTRAINT IF EXISTS "TBL_tipoProfessor_fk" CASCADE;
ALTER TABLE public."TBL_Professor" ADD CONSTRAINT "TBL_tipoProfessor_fk" FOREIGN KEY ("ID_tipoProfessor_TBL_tipoProfessor")
REFERENCES public."TBL_tipoProfessor" ("ID_tipoProfessor") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_tipoCliente" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoCliente" CASCADE;
CREATE TABLE public."TBL_tipoCliente" (
	"ID_tipoCliente" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(100) NOT NULL,
	"dataVencimento" date NOT NULL,
	"valorMensalidade" numeric(10,2) NOT NULL,
	CONSTRAINT "TBL_tipoClient_pk" PRIMARY KEY ("ID_tipoCliente")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoCliente" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoCliente_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Clientes" DROP CONSTRAINT IF EXISTS "TBL_tipoCliente_fk" CASCADE;
ALTER TABLE public."TBL_Clientes" ADD CONSTRAINT "TBL_tipoCliente_fk" FOREIGN KEY ("ID_tipoCliente_TBL_tipoCliente")
REFERENCES public."TBL_tipoCliente" ("ID_tipoCliente") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_tipoFuncionarios" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoFuncionarios" CASCADE;
CREATE TABLE public."TBL_tipoFuncionarios" (
	"ID_tipoFuncionarios" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(100) NOT NULL,
	salario numeric(10,2) NOT NULL,
	CONSTRAINT "TBL_tipoFuncionario_pk" PRIMARY KEY ("ID_tipoFuncionarios")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoFuncionarios" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoFuncionarios_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Funcionarios" DROP CONSTRAINT IF EXISTS "TBL_tipoFuncionarios_fk" CASCADE;
ALTER TABLE public."TBL_Funcionarios" ADD CONSTRAINT "TBL_tipoFuncionarios_fk" FOREIGN KEY ("ID_tipoFuncionarios_TBL_tipoFuncionarios")
REFERENCES public."TBL_tipoFuncionarios" ("ID_tipoFuncionarios") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_tipoMateriais" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoMateriais" CASCADE;
CREATE TABLE public."TBL_tipoMateriais" (
	"ID_tipoMateriais" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(100) NOT NULL,
	CONSTRAINT "TBL_tipoMateriai_pk" PRIMARY KEY ("ID_tipoMateriais")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoMateriais" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoMateriais_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Materiais" DROP CONSTRAINT IF EXISTS "TBL_tipoMateriais_fk" CASCADE;
ALTER TABLE public."TBL_Materiais" ADD CONSTRAINT "TBL_tipoMateriais_fk" FOREIGN KEY ("ID_tipoMateriais_TBL_tipoMateriais")
REFERENCES public."TBL_tipoMateriais" ("ID_tipoMateriais") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_tipoQuadra" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoQuadra" CASCADE;
CREATE TABLE public."TBL_tipoQuadra" (
	"ID_tipoQuadra" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(100) NOT NULL,
	CONSTRAINT "TBL_tipoQuadr_pk" PRIMARY KEY ("ID_tipoQuadra")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoQuadra" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoQuadra_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Quadra" DROP CONSTRAINT IF EXISTS "TBL_tipoQuadra_fk" CASCADE;
ALTER TABLE public."TBL_Quadra" ADD CONSTRAINT "TBL_tipoQuadra_fk" FOREIGN KEY ("ID_tipoQuadra_TBL_tipoQuadra")
REFERENCES public."TBL_tipoQuadra" ("ID_tipoQuadra") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TBL_tipoEvento" | type: TABLE --
-- DROP TABLE IF EXISTS public."TBL_tipoEvento" CASCADE;
CREATE TABLE public."TBL_tipoEvento" (
	"ID_tipoEvento" integer NOT NULL,
	nome varchar(50) NOT NULL,
	"desc" varchar(100) NOT NULL,
	CONSTRAINT "TBL_tipoEvent_pk" PRIMARY KEY ("ID_tipoEvento")
);
-- ddl-end --
ALTER TABLE public."TBL_tipoEvento" OWNER TO postgres;
-- ddl-end --

-- object: "TBL_tipoEvento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TBL_Evento" DROP CONSTRAINT IF EXISTS "TBL_tipoEvento_fk" CASCADE;
ALTER TABLE public."TBL_Evento" ADD CONSTRAINT "TBL_tipoEvento_fk" FOREIGN KEY ("ID_tipoEvento_TBL_tipoEvento")
REFERENCES public."TBL_tipoEvento" ("ID_tipoEvento") MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "grant_CU_eb94f049ac" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO postgres;
-- ddl-end --

-- object: "grant_CU_cd8e46e7b6" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --


