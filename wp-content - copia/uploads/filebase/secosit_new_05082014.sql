--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.12
-- Dumped by pg_dump version 9.1.1
-- Started on 2014-08-05 15:08:53

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 198 (class 3079 OID 11645)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2050 (class 0 OID 0)
-- Dependencies: 198
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 210 (class 1255 OID 58917)
-- Dependencies: 6
-- Name: _group_concat(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _group_concat(text, text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
    SELECT CASE
    WHEN $2 IS NULL THEN $1
    WHEN $1 IS NULL THEN $2
    ELSE $1 operator(pg_catalog.||) ',' operator(pg_catalog.||) $2
    END
    $_$;


ALTER FUNCTION public._group_concat(text, text) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 58918)
-- Dependencies: 6
-- Name: array_accum(anyelement); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE array_accum(anyelement) (
    SFUNC = array_append,
    STYPE = anyarray,
    INITCOND = '{}'
);


ALTER AGGREGATE public.array_accum(anyelement) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 58919)
-- Dependencies: 6 210
-- Name: group_concat(text); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE group_concat(text) (
    SFUNC = _group_concat,
    STYPE = text
);


ALTER AGGREGATE public.group_concat(text) OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 58920)
-- Dependencies: 6
-- Name: sec_id_administrativo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_administrativo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_administrativo OWNER TO postgres;

--
-- TOC entry 2051 (class 0 OID 0)
-- Dependencies: 161
-- Name: sec_id_administrativo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_administrativo', 33, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 58922)
-- Dependencies: 1949 6
-- Name: administrativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE administrativo (
    id_administrativo integer DEFAULT nextval('sec_id_administrativo'::regclass) NOT NULL,
    const_empresa text,
    seguro text,
    dep_mpptt character(6),
    dep_regional character(150),
    obs_administrativo text,
    organo_adscripcion character varying(50)
);


ALTER TABLE public.administrativo OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 58929)
-- Dependencies: 6
-- Name: sec_id_cargo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_cargo
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_cargo OWNER TO postgres;

--
-- TOC entry 2052 (class 0 OID 0)
-- Dependencies: 163
-- Name: sec_id_cargo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_cargo', 3, true);


--
-- TOC entry 164 (class 1259 OID 58931)
-- Dependencies: 1950 1951 6
-- Name: cargos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cargos (
    id_cargo integer DEFAULT nextval('sec_id_cargo'::regclass) NOT NULL,
    desc_cargo character(30),
    estatus_cargo boolean DEFAULT true NOT NULL
);


ALTER TABLE public.cargos OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 58936)
-- Dependencies: 6
-- Name: sec_id_detalle_ficha; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_detalle_ficha
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_detalle_ficha OWNER TO postgres;

--
-- TOC entry 2053 (class 0 OID 0)
-- Dependencies: 165
-- Name: sec_id_detalle_ficha; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_detalle_ficha', 41, true);


--
-- TOC entry 166 (class 1259 OID 58938)
-- Dependencies: 1952 6
-- Name: detalle_ficha; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalle_ficha (
    id_detalle_ficha integer DEFAULT nextval('sec_id_detalle_ficha'::regclass) NOT NULL,
    id_municipio integer,
    id_ficha integer,
    id_estado integer
);


ALTER TABLE public.detalle_ficha OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 58942)
-- Dependencies: 6
-- Name: sec_id_estado; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_estado
    START WITH 25
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_estado OWNER TO postgres;

--
-- TOC entry 2054 (class 0 OID 0)
-- Dependencies: 167
-- Name: sec_id_estado; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_estado', 25, false);


--
-- TOC entry 168 (class 1259 OID 58944)
-- Dependencies: 1953 1954 6
-- Name: estados; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estados (
    id_estado smallint DEFAULT nextval('sec_id_estado'::regclass) NOT NULL,
    desc_estado character varying(80),
    estatus_estado boolean DEFAULT true
);


ALTER TABLE public.estados OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 58949)
-- Dependencies: 6
-- Name: sec_id_ficha; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_ficha
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_ficha OWNER TO postgres;

--
-- TOC entry 2055 (class 0 OID 0)
-- Dependencies: 169
-- Name: sec_id_ficha; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_ficha', 33, true);


--
-- TOC entry 170 (class 1259 OID 58951)
-- Dependencies: 1955 6
-- Name: fichas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fichas (
    id_ficha integer DEFAULT nextval('sec_id_ficha'::regclass) NOT NULL,
    id_estado integer,
    id_municipio integer,
    id_operadora integer NOT NULL,
    id_financiero integer NOT NULL,
    id_operativo integer,
    id_administrativo integer,
    id_social integer,
    ubicacion text,
    desc_sistema text,
    id_sistema_transporte integer NOT NULL
);


ALTER TABLE public.fichas OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 58958)
-- Dependencies: 6
-- Name: sec_id_financiero; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_financiero
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_financiero OWNER TO postgres;

--
-- TOC entry 2056 (class 0 OID 0)
-- Dependencies: 171
-- Name: sec_id_financiero; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_financiero', 33, true);


--
-- TOC entry 172 (class 1259 OID 58960)
-- Dependencies: 1956 6
-- Name: financiero; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE financiero (
    id_financiero integer DEFAULT nextval('sec_id_financiero'::regclass) NOT NULL,
    sist_recaudacion text,
    destino text,
    obs_financiero text,
    monto character varying(50)
);


ALTER TABLE public.financiero OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 58967)
-- Dependencies: 6
-- Name: sec_id_modalidad_transporte; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_modalidad_transporte
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_modalidad_transporte OWNER TO postgres;

--
-- TOC entry 2057 (class 0 OID 0)
-- Dependencies: 173
-- Name: sec_id_modalidad_transporte; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_modalidad_transporte', 6, true);


--
-- TOC entry 174 (class 1259 OID 58969)
-- Dependencies: 1957 6
-- Name: modalidad_transporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE modalidad_transporte (
    id_modalidad_transporte integer DEFAULT nextval('sec_id_modalidad_transporte'::regclass) NOT NULL,
    nombre_modalidad_transporte character varying(50) NOT NULL
);


ALTER TABLE public.modalidad_transporte OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 58973)
-- Dependencies: 6
-- Name: sec_id_operador; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_operador
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_operador OWNER TO postgres;

--
-- TOC entry 2058 (class 0 OID 0)
-- Dependencies: 175
-- Name: sec_id_operador; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_operador', 33, true);


--
-- TOC entry 176 (class 1259 OID 58975)
-- Dependencies: 1958 1959 6
-- Name: operadora; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operadora (
    id_operadora integer DEFAULT nextval('sec_id_operador'::regclass) NOT NULL,
    nombre_operadora character varying(50) NOT NULL,
    estatus_operador boolean DEFAULT true NOT NULL
);


ALTER TABLE public.operadora OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 58980)
-- Dependencies: 6
-- Name: sec_id_operativo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_operativo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_operativo OWNER TO postgres;

--
-- TOC entry 2059 (class 0 OID 0)
-- Dependencies: 177
-- Name: sec_id_operativo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_operativo', 33, true);


--
-- TOC entry 178 (class 1259 OID 58982)
-- Dependencies: 1960 6
-- Name: operativo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operativo (
    id_operativo integer DEFAULT nextval('sec_id_operativo'::regclass) NOT NULL,
    nro_pasajero integer,
    nro_rutas text,
    tiempo text,
    nro_unidades integer,
    combustible character varying(30),
    nro_operadores integer,
    horario text,
    patio text,
    unidad_op integer,
    unidad_inop integer,
    placa_identif character varying(150),
    tipo_ruta text,
    nro_pasajero_unidad text,
    obs_operativo text,
    tipo_flota character varying(50),
    cant_flota_mpptt character varying(128),
    cant_flota_otros character varying(128),
    nro_uni_linea_ruta text,
    km_rec_linea_ruta text
);


ALTER TABLE public.operativo OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 58989)
-- Dependencies: 6
-- Name: sec_id_sistema_transporte; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_sistema_transporte
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_sistema_transporte OWNER TO postgres;

--
-- TOC entry 2060 (class 0 OID 0)
-- Dependencies: 179
-- Name: sec_id_sistema_transporte; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_sistema_transporte', 53, true);


--
-- TOC entry 180 (class 1259 OID 58991)
-- Dependencies: 6
-- Name: sec_id_social; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_social
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_social OWNER TO postgres;

--
-- TOC entry 2061 (class 0 OID 0)
-- Dependencies: 180
-- Name: sec_id_social; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_social', 33, true);


--
-- TOC entry 181 (class 1259 OID 58993)
-- Dependencies: 1961 1962 6
-- Name: sistema_transporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sistema_transporte (
    id_sistema_transporte integer DEFAULT nextval('sec_id_sistema_transporte'::regclass) NOT NULL,
    nombre_sistema_transporte character varying(50) NOT NULL,
    estatus_sistema_transporte boolean DEFAULT true NOT NULL,
    id_modalidad_transporte integer,
    id_operadora integer,
    id_tipo_vehiculo integer,
    id_operadora_mod_transp integer
);


ALTER TABLE public.sistema_transporte OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 58998)
-- Dependencies: 1963 6
-- Name: social; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE social (
    id_social integer DEFAULT nextval('sec_id_social'::regclass) NOT NULL,
    poblacion_benef text,
    emp_directo integer,
    emp_indirecto integer,
    obs_social text
);


ALTER TABLE public.social OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 59005)
-- Dependencies: 1948 6
-- Name: ficha_all; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW ficha_all AS
    SELECT fichas.id_ficha, fichas.ubicacion, fichas.desc_sistema, financiero.sist_recaudacion, financiero.destino, financiero.monto, operativo.nro_rutas, operativo.tiempo, operativo.combustible, operativo.horario, operativo.patio, operativo.tipo_ruta, operativo.nro_pasajero_unidad, operativo.tipo_flota, operativo.cant_flota_mpptt, operativo.cant_flota_otros, operativo.nro_uni_linea_ruta, operativo.km_rec_linea_ruta, administrativo.const_empresa, administrativo.seguro, administrativo.organo_adscripcion, social.poblacion_benef, social.emp_directo, social.emp_indirecto, sistema_transporte.nombre_sistema_transporte, modalidad_transporte.nombre_modalidad_transporte, sistema_transporte.id_sistema_transporte, operadora.nombre_operadora, operativo.nro_unidades, operadora.id_operadora FROM (((((((fichas JOIN financiero ON ((fichas.id_financiero = financiero.id_financiero))) JOIN operativo ON ((fichas.id_operativo = operativo.id_operativo))) JOIN administrativo ON ((fichas.id_administrativo = administrativo.id_administrativo))) JOIN social ON ((fichas.id_social = social.id_social))) JOIN sistema_transporte ON ((fichas.id_sistema_transporte = sistema_transporte.id_sistema_transporte))) JOIN modalidad_transporte ON ((sistema_transporte.id_modalidad_transporte = modalidad_transporte.id_modalidad_transporte))) JOIN operadora ON ((sistema_transporte.id_operadora = operadora.id_operadora)));


ALTER TABLE public.ficha_all OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 59010)
-- Dependencies: 1964 6
-- Name: grupo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE grupo (
    id_grupo integer DEFAULT nextval(('sec_id_grupo'::text)::regclass) NOT NULL,
    nombre_grupo character varying(64),
    descripcion_grupo character varying(255)
);


ALTER TABLE public.grupo OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 59014)
-- Dependencies: 6
-- Name: sec_id_municipio; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_municipio
    START WITH 344
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_municipio OWNER TO postgres;

--
-- TOC entry 2062 (class 0 OID 0)
-- Dependencies: 185
-- Name: sec_id_municipio; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_municipio', 345, true);


--
-- TOC entry 186 (class 1259 OID 59016)
-- Dependencies: 1965 1966 6
-- Name: municipios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE municipios (
    id_municipio smallint DEFAULT nextval('sec_id_municipio'::regclass) NOT NULL,
    id_estado smallint NOT NULL,
    desc_municipio character varying(150),
    estatus_municipio boolean DEFAULT true
);


ALTER TABLE public.municipios OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 59021)
-- Dependencies: 6
-- Name: sec_id_operacion_diaria; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_operacion_diaria
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_operacion_diaria OWNER TO postgres;

--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 187
-- Name: sec_id_operacion_diaria; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_operacion_diaria', 94, true);


--
-- TOC entry 188 (class 1259 OID 59023)
-- Dependencies: 1967 6
-- Name: operaciones_diarias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operaciones_diarias (
    id_operacion_diaria integer DEFAULT nextval('sec_id_operacion_diaria'::regclass) NOT NULL,
    id_operadora integer NOT NULL,
    unidades_arranque integer,
    unidades_inoperativas integer,
    pasajeros_transportados integer,
    maximo_uni_operativas integer,
    total_recaudado double precision,
    kilometros_recorridos double precision,
    unidades_operativas_cierre integer,
    eventos_resaltantes character varying(300),
    fecha_operacion date,
    id_usuario integer NOT NULL,
    id_sistema_transporte integer,
    fecha_dia_curso date,
    fecha_dia_anterior date,
    estatus_operacion_diaria boolean,
    servicios_especiales character varying(10)
);


ALTER TABLE public.operaciones_diarias OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 59027)
-- Dependencies: 6
-- Name: sec_id_operadora_mod_transp; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_operadora_mod_transp
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_operadora_mod_transp OWNER TO postgres;

--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 189
-- Name: sec_id_operadora_mod_transp; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_operadora_mod_transp', 42, true);


--
-- TOC entry 190 (class 1259 OID 59029)
-- Dependencies: 1968 6
-- Name: operadora_mod_transp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operadora_mod_transp (
    id_operadora_mod_transp integer DEFAULT nextval('sec_id_operadora_mod_transp'::regclass) NOT NULL,
    id_operadora integer,
    id_modalidad_transporte integer,
    nombre_operadora_mod_transp character varying(50)
);


ALTER TABLE public.operadora_mod_transp OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 59033)
-- Dependencies: 6
-- Name: sec_id_pers_contacto; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_pers_contacto
    START WITH 5
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_pers_contacto OWNER TO postgres;

--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 191
-- Name: sec_id_pers_contacto; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_pers_contacto', 63, true);


--
-- TOC entry 192 (class 1259 OID 59035)
-- Dependencies: 1969 6
-- Name: pers_contacto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pers_contacto (
    id_pers_contacto integer DEFAULT nextval('sec_id_pers_contacto'::regclass) NOT NULL,
    id_operadora integer,
    id_cargo integer,
    nombre_contacto character(150),
    telefono character(30),
    correo text,
    id_sistema_transporte integer
);


ALTER TABLE public.pers_contacto OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 59042)
-- Dependencies: 6
-- Name: sec_id_grupo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_grupo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_grupo OWNER TO postgres;

--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 193
-- Name: sec_id_grupo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_grupo', 3, true);


--
-- TOC entry 194 (class 1259 OID 59044)
-- Dependencies: 6
-- Name: sec_id_tipo_vehiculo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_tipo_vehiculo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_tipo_vehiculo OWNER TO postgres;

--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 194
-- Name: sec_id_tipo_vehiculo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_tipo_vehiculo', 6, true);


--
-- TOC entry 195 (class 1259 OID 59046)
-- Dependencies: 6
-- Name: sec_id_usuario; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sec_id_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sec_id_usuario OWNER TO postgres;

--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 195
-- Name: sec_id_usuario; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sec_id_usuario', 25, true);


--
-- TOC entry 196 (class 1259 OID 59048)
-- Dependencies: 1970 6
-- Name: tipo_vehiculo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_vehiculo (
    id_tipo_vehiculo integer DEFAULT nextval('sec_id_tipo_vehiculo'::regclass) NOT NULL,
    nombre_tipo_vehiculo character varying(25) NOT NULL
);


ALTER TABLE public.tipo_vehiculo OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 59052)
-- Dependencies: 1971 6
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer DEFAULT nextval('sec_id_usuario'::regclass) NOT NULL,
    nombre_usuario character varying(64),
    clave character varying(32),
    nombre_completo character varying(255),
    id_grupo integer,
    id_operadora integer,
    id_sistema_transporte integer
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2027 (class 0 OID 58922)
-- Dependencies: 162
-- Data for Name: administrativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO administrativo VALUES (1, '08 DE AGOSTO DE 1977', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (2, '9 DE AGOSTO DE 1977', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (3, '10 DE AGOSTO DE 1977', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (4, '11 DE AGOSTO DE 1977', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (5, '12 DE AGOSTO DE 1977', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (6, '31-JULIO-2008,  MEDIANTE DECRETO IAFE PASÓ A LLAMARSE INSTITUTO DE FERROCARRILES DEL ESTADO', 'SEGURO RESPONSABILIDAD CIVIL, TODO RIESGO: SEGUROS CONSTITUCIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (7, 'TROMERCA:  SEPTIEMBRE 2009
TROLCABLE: INAUGURADO 14 DICIEMBRE 2012', 'HASTA 2013 SEGURO PATRIMONIAL  CON STAR SEGURO', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (8, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (9, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (10, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (11, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (12, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (13, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (14, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (15, 'SITSSA', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (16, 'REGISTRADA EN EL REGISTRO MERCANTIL SEGUNDO BAJO EL Nº 33, TOMO 53-A DE FECHA 27/08/2004. ULTIMA MODIFICACION BAJO EN Nº 15, TOMO 214-A DE FECHA 13/12/2013', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (17, 'EL 13 DE MARZO DE 2013', 'SOLO YUTONG CON SEGUROS CATATUMBO ', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (18, 'DECRETO 0467 DE LA GOBERNACIÓN DEL ESTADO SUCRE, DE FECHA 19-12-13', 'NO DISPONE', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (19, 'SIN INFORMACIÓN', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (21, NULL, NULL, NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (23, NULL, 'SIN INFORMACIÓN', NULL, NULL, NULL, NULL);
INSERT INTO administrativo VALUES (25, 'DECRETO EJECUTIVO REGIONAL  30/5/2008', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (26, 'COMO SOCIEDAD ANÓNIMA EN MARZO 2014', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (27, NULL, 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (29, NULL, 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (33, 'ESTAN CONSTITUIDOS COMO EMPRESA DE TRANSPORTE', 'UNIDADES YUTONG, SEGUROS CATATUMBO, BIELORRUSAS, SEGUROS FEDERAL Y LAS INTERNACIONAL POE SEGUROS LA PREVISORA', NULL, NULL, NULL, 'MPPTT Y GOBERNACIÓN DEL ESTADO ARAGUA');
INSERT INTO administrativo VALUES (20, '05/12/2013', 'POLIZA RESPONSABILIDAD CIVIL SEGUROS LA PREVISORA', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (22, '20/07/1993', 'NO CUENTAN CON RECURSOS', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (24, '10/05/1991', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (28, '06/11/2013', 'SIN INFORMACIÓN', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (30, '21/09/2009', 'STAR SEGURO', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (31, '10/05/1991', 'CONTRATACIÓN DE SEGURO POR FONTUR', NULL, NULL, NULL, 'MPPTT');
INSERT INTO administrativo VALUES (32, '01/11/2013', 'EN TRÁMITES', NULL, NULL, NULL, 'CORPOAMAZONAS');


--
-- TOC entry 2028 (class 0 OID 58931)
-- Dependencies: 164
-- Data for Name: cargos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cargos VALUES (1, 'GERENTE GENERAL               ', true);
INSERT INTO cargos VALUES (2, 'GERENTE DE OPERACIONES        ', true);
INSERT INTO cargos VALUES (3, 'CONTACTO DIRECTO              ', true);


--
-- TOC entry 2029 (class 0 OID 58938)
-- Dependencies: 166
-- Data for Name: detalle_ficha; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO detalle_ficha VALUES (1, 194, 1, 14);
INSERT INTO detalle_ficha VALUES (2, 1, 2, 1);
INSERT INTO detalle_ficha VALUES (3, 194, 3, 14);
INSERT INTO detalle_ficha VALUES (4, 1, 4, 1);
INSERT INTO detalle_ficha VALUES (5, 182, 4, 14);
INSERT INTO detalle_ficha VALUES (6, 194, 4, 14);
INSERT INTO detalle_ficha VALUES (7, 185, 5, 14);
INSERT INTO detalle_ficha VALUES (8, 181, 5, 14);
INSERT INTO detalle_ficha VALUES (9, 188, 5, 14);
INSERT INTO detalle_ficha VALUES (10, 1, 6, 1);
INSERT INTO detalle_ficha VALUES (11, 183, 6, 14);
INSERT INTO detalle_ficha VALUES (12, 195, 6, 14);
INSERT INTO detalle_ficha VALUES (13, 164, 7, 13);
INSERT INTO detalle_ficha VALUES (14, 192, 8, 14);
INSERT INTO detalle_ficha VALUES (15, 1, 9, 1);
INSERT INTO detalle_ficha VALUES (16, 336, 10, 22);
INSERT INTO detalle_ficha VALUES (17, 185, 11, 14);
INSERT INTO detalle_ficha VALUES (18, 189, 12, 14);
INSERT INTO detalle_ficha VALUES (19, 179, 12, 14);
INSERT INTO detalle_ficha VALUES (20, 186, 13, 14);
INSERT INTO detalle_ficha VALUES (21, 146, 16, 12);
INSERT INTO detalle_ficha VALUES (22, 345, 17, 8);
INSERT INTO detalle_ficha VALUES (23, 249, 18, 18);
INSERT INTO detalle_ficha VALUES (24, 300, 19, 20);
INSERT INTO detalle_ficha VALUES (25, 57, 20, 5);
INSERT INTO detalle_ficha VALUES (26, 240, 21, 18);
INSERT INTO detalle_ficha VALUES (27, 327, 22, 23);
INSERT INTO detalle_ficha VALUES (28, 327, 23, 23);
INSERT INTO detalle_ficha VALUES (29, 90, 24, 7);
INSERT INTO detalle_ficha VALUES (30, 66, 25, 6);
INSERT INTO detalle_ficha VALUES (31, 70, 25, 6);
INSERT INTO detalle_ficha VALUES (32, 117, 26, 10);
INSERT INTO detalle_ficha VALUES (33, 108, 26, 10);
INSERT INTO detalle_ficha VALUES (34, 327, 27, 23);
INSERT INTO detalle_ficha VALUES (35, 87, 28, 7);
INSERT INTO detalle_ficha VALUES (36, 158, 29, 13);
INSERT INTO detalle_ficha VALUES (37, 158, 30, 13);
INSERT INTO detalle_ficha VALUES (38, 90, 31, 7);
INSERT INTO detalle_ficha VALUES (39, 86, 31, 7);
INSERT INTO detalle_ficha VALUES (40, 4, 32, 2);
INSERT INTO detalle_ficha VALUES (41, 46, 33, 24);


--
-- TOC entry 2030 (class 0 OID 58944)
-- Dependencies: 168
-- Data for Name: estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estados VALUES (1, 'DISTRITO CAPITAL', true);
INSERT INTO estados VALUES (2, 'AMAZONAS', true);
INSERT INTO estados VALUES (3, 'ANZOATEGUI', true);
INSERT INTO estados VALUES (4, 'APURE', true);
INSERT INTO estados VALUES (5, 'BARINAS', true);
INSERT INTO estados VALUES (6, 'BOLIVAR', true);
INSERT INTO estados VALUES (7, 'CARABOBO', true);
INSERT INTO estados VALUES (8, 'COJEDES', true);
INSERT INTO estados VALUES (9, 'DELTA AMACURO', true);
INSERT INTO estados VALUES (10, 'FALCON', true);
INSERT INTO estados VALUES (11, 'GUARICO', true);
INSERT INTO estados VALUES (12, 'LARA', true);
INSERT INTO estados VALUES (13, 'MERIDA', true);
INSERT INTO estados VALUES (14, 'MIRANDA', true);
INSERT INTO estados VALUES (15, 'MONAGAS', true);
INSERT INTO estados VALUES (16, 'NUEVA ESPARTA', true);
INSERT INTO estados VALUES (17, 'PORTUGUESA', true);
INSERT INTO estados VALUES (18, 'SUCRE', true);
INSERT INTO estados VALUES (19, 'TACHIRA', true);
INSERT INTO estados VALUES (20, 'TRUJILLO', true);
INSERT INTO estados VALUES (21, 'YARACUY', true);
INSERT INTO estados VALUES (22, 'VARGAS', true);
INSERT INTO estados VALUES (23, 'ZULIA', true);
INSERT INTO estados VALUES (24, 'ARAGUA', true);
INSERT INTO estados VALUES (25, 'DEPENDENCIAS FEDERALES', true);


--
-- TOC entry 2031 (class 0 OID 58951)
-- Dependencies: 170
-- Data for Name: fichas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO fichas VALUES (13, NULL, NULL, 6, 13, 13, 13, 13, 'CARTANAL - SANTA TERESA (VALLES DEL TUY)', 'BUS TUY ES UN SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS, CONSEBIDO PARA MOVILIZAR A LA MASA LABORAL DEL MUNICIPIO INDEPENDENCIA (SANTA TERESA) A LA CAPITAL DE LA REPÚBLICA. ', 35);
INSERT INTO fichas VALUES (14, NULL, NULL, 1, 14, 14, 14, 14, NULL, NULL, 7);
INSERT INTO fichas VALUES (15, NULL, NULL, 1, 15, 15, 15, 15, NULL, NULL, 6);
INSERT INTO fichas VALUES (1, NULL, NULL, 1, 1, 1, 1, 1, 'FINAL DE LA AV. LECUNA. ESTACIÓN PARQUE CENTRAL, MUNICIPIO BOLIVARIANO LIBERTADOR CARACAS ', 'SISTEMA DE TREN LIVIANO ELEVADO,  QUE CONECTARÁ LÍNEA 1 CON EL SISTEMA DE TREN GUARENAS - GUATIRE Y LÍNEA 5, CON LA FINALIDAD DE ATENDER A LA POBLACIÓN DE LA PARROQUIA PETARE.', 3);
INSERT INTO fichas VALUES (2, NULL, NULL, 1, 2, 2, 2, 2, 'SAN AGUSTIN', 'EL METROCABLE SAN AGUSTIN ES UN SISTEMA DE TELEFÉRICO INTEGRADO AL METRO DE CARACAS, CONCEBIDO DE FORMA QUE HABITANTES DE LOS BARRIOS DE CARACAS (SAN AGUSTIN, EL MANGUITO, HORNO DE CAL, LA CEIBA) UBICADOS HABITUALMENTE EN SECTORES MONTAÑOSOS PUEDAN TRANSPORTARSE DE MANERA MÁS RÁPIDA Y SEGURA AL CENTRO DE LA CIUDAD. FUNCIONA COMO UNA RUTA ALIMENTADORA AL ESTILO DEL METROBÚS. CONSTA DE 5 ESTACIONES A SABER: PARQUE CENTRAL, HORNO DE CAL, CEIBA, MANGUITO Y SAN AGUSTIN)', 5);
INSERT INTO fichas VALUES (3, NULL, NULL, 1, 3, 3, 3, 3, 'MUNICIPIO SUCRE', 'EL METROCABLE MARICHE ES UN SISTEMA DE TELEFÉRICO INTEGRADO AL METRO DE CARACAS, CONCEBIDO DE FORMA QUE HABITANTES DE LOS BARRIOS DE CARACAS (MARICHE) UBICADOS HABITUALMENTE EN SECTORES MONTAÑOSOS PUEDAN TRANSPORTARSE DE MANERA MÁS RÁPIDA Y SEGURA AL CENTRO DE LA CIUDAD. FUNCIONA COMO UNA RUTA ALIMENTADORA AL ESTILO DEL METROBÚS. CONSTA DE 2 ESTACIONES A SABER: MARICHE Y PALO VERDE I', 4);
INSERT INTO fichas VALUES (4, NULL, NULL, 1, 4, 4, 4, 4, 'AV. FRANCISCO DE MIRANDA, MULTICENTRO EMPRESARIAL DEL ESTE, TORRE MIRANDA, NÚCLEO B, PISOS 1-7 ', 'SISTEMA DE TRANSPORTE MASIVO, QUE  CONECTA EL ÁREA METROPOLITANA DE CARACAS, EN SENTIDO OESTE - ESTE Y SUR - NORTE A TRAVÉS DE SUS CUATRO (04) LÍNEAS CONSTRUIDAS Y EN OPERACIÓN COMERCIAL, POSEE 53,51 KM DE VÍA FERREA, CUENTA CON  48 ESTACIONES. ', 1);
INSERT INTO fichas VALUES (5, NULL, NULL, 1, 5, 5, 5, 5, 'AV. BICENTENARIA, EDIFICIO SEDE DE LA ESTACIÓN ALÍ PRIMERA, LOS TEQUES, EDO. MIRANDA', 'SISTEMA DE TRANSPORTE MASIVO METROPOLITANO, QUE CONECTA A LOS ALTOS MIRANDINOS CON LA CIUDAD DE CARACAS, CONSTA DE TRES (03) LÍNEAS PARA UN TOTAL DE 42 KM DE VÍA FERREA CON 15 ESTACIONES.', 2);
INSERT INTO fichas VALUES (6, NULL, NULL, 2, 6, 6, 6, 6, 'AV. PERIMETRAL DE CHARALLAVE, EDIFICIO 34, SECTOR LA PEÑITA, CHARALLAVE-ESTADO MIRANDA', 'SISTEMA FERROVIARIO DE TRENES DE CERCANÍA', 13);
INSERT INTO fichas VALUES (7, NULL, NULL, 5, 7, 7, 7, 7, 'PASEO DE LA FERIA DOMINGO PEÑA', 'SISTEMA DE TELECABINAS, QUE CONECTA LA MESETA DE MÉRIDA CON LA CUENCA DEL RÍO CHAMA, EN LA POBLACIÓN DE LA PARROQUIA JACINTO PLAZA, DE SAN JACINTO, VENCIENDO UN DESNIVEL DE 147 MTS, CON UN RECORRIDO DE 443,34 MTS LINEALES', 15);
INSERT INTO fichas VALUES (8, NULL, NULL, 6, 8, 8, 8, 8, 'GUARENAS - GUATIRE', 'EL BUS GUARENAS-GUATIRE ES UN SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS, CONSEBIDO PARA MOVILIZAR A LA MASA LABORAL DEL VALLE DE PACARIGUA A LA CAPITAL DE LA REPUBLICA. ', 34);
INSERT INTO fichas VALUES (9, NULL, NULL, 6, 9, 9, 9, 9, 'CIUDAD CARIBIA-PARROQUIA SUCRE', ' BUS CARIBIA ES UN SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS, CONSEBIDO PARA MOVILIZAR A LA MASA LABORAL DE LA CIUDAD SOCIALISTA CARIBIA  A LA CAPITAL DE LA REPUBLICA. ', 38);
INSERT INTO fichas VALUES (10, NULL, NULL, 6, 10, 10, 10, 10, 'CATIA LA MAR -TANAGUARENAS', ' BUS VARGAS ES UN SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS, CONSEBIDO PARA MOVILIZAR A LA MASA LABORAL DEL ESTADO VARGAS A LA CAPITAL DE LA REPUBLICA. ', 37);
INSERT INTO fichas VALUES (11, NULL, NULL, 6, 11, 11, 11, 11, 'LOS TEQUES', ' BUS LOS TEQUES ES UN SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS, CONSEBIDO PARA MOVILIZAR A LA MASA LABORAL ESTADO MIRANDA  A LOS DISTINTOS POLOS DE DESARROLLO DENTRO DE LA REGIÓN. ', 33);
INSERT INTO fichas VALUES (12, NULL, NULL, 6, 12, 12, 12, 12, 'RIO CHICO - HIGUEROTE (BARLOVENTO)', 'BUS BARLOVENTO ES UN SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS, CONSEBIDO PARA MOVILIZAR A LA MASA LABORAL DE LA MANCOMUNIDAD DE BARLOVENTO  A LA CAPITAL DE LA REPÚBLICA. ', 36);
INSERT INTO fichas VALUES (16, NULL, NULL, 7, 16, 16, 16, 16, 'BARQUISIMETO, PARROQUIA JUAN DE VILLEGAS, AV. FLORENCIO JIMENEZ ESQUINA DEL CEMENTERIO NUEVO MUNICIPAL. ESTACION CENTRAL "SIMON BOLIVAR" (ECSB)', 'EL SISTEMA DE TRANSPORTE MASIVO DE BARQUSISMETO FUE CREADO EN EL AÑO 2004, INICIANDO LOS TRABAJOS DE OBRA EN EL AÑO 2005 CON LA CONSTRUCCION DEL SISTEMA DE TRANSPORTE MASIVO Y EL TERMINAL DE PASAJEROS, SIN EMBARGO NOS ES SI NO HASTA EL AÑO 2012 QUE SE INICIAN LAS PRUEBAS DEL SISTEMA UTILIZANDO UNIDADES ARTICULADAS TROLEBUS ELECTRICAS Y UNIDADES YUTONG A GAS PARA ALIMENTADORAS, EL 14 DE SEPTIEMBRE DE 2013 GRACIAS A LA INICIATIVA DEL PRESIDENTE NICOLAS MADURO IMPULSADO POR LA POLITICA DE GOBIENO DE EFICIENCIA EN LA CALLE, SE IMPLEMENTA UNA ALTERNATIVA PARA EL SISTEMA DE TRANSPORTE QUE INCLUYE LA CREACION DE 2 LINEAS TRONCALES Y 6 RUTAS ALIMENTADORAS OPERADAS ATRAVES DE CANALES EXCLUSIVOS Y COMPARTIDOS CON UNIDADES YUTONG A GAS, CON UNA LONGITUD TOTAL DE 245 KM PARA TODAS LAS RUTAS.  ', 20);
INSERT INTO fichas VALUES (17, NULL, NULL, 10, 17, 17, 17, 17, 'FINAL DE LA AVE. RICAURTE, CRUCE CON  CALLE JOSE LAURENCIO SILVA, SAN CARLOS', 'TRNSPORTE TERRESTRE BAJO LA FIGURA DE EMPRESA DE PROPIEDAD SOCIAL DE TRANSPORTE BUSTAGUANES , INICIADO EL 13 DE MARZO DEL 2013', 39);
INSERT INTO fichas VALUES (18, NULL, NULL, 9, 18, 18, 18, 18, 'AVENIDA ROTARIA, COMPLEJO PETROLERO CUMANÁ (CPC), SALA TÉCNICA II, CUMANÁ, PARROQUIA SAN VALENTÍN VALIENTE ', 'EL SISTEMA ACTUALMENTE CUENTA CON TRES (3) RUTAS PARA EL TRANSPORTE DE PASAJEROS, LAS CUALES PARTEN DEL TERMINAL DE FERRYS HACIA LAS COMUNIDADES DE BRASIL, EL PEÑÓN Y LA LLANADA, SE CUENTA CON UN TOTAL DE 25 UNIDADES A DIESEL ADEMÁS DE  86 TRABAJADORES ENTRE PERSONAL OPERATIVO Y ADMINISTRATIVO ', 44);
INSERT INTO fichas VALUES (19, NULL, NULL, 33, 19, 19, 19, 19, 'URB.MIRABEL (PLATA I) AV. INDEPENDENCIA, EDIFICIO DON RAMIRO, PLANTA BAJA,VALERA EDO. TTRUJILLO', 'BUS TRUJILLO REPRESENTA UNA ALTERNATIVA REVOLUCIONARIA DE TRANSPORTE URBANO E INTER-URBANO, ÓPTIMO, SEGURO Y CONFIABLE, QUE RESPONDE A LAS POLITICAS DE DESARROLLO DISEÑADAS  POR EL COMANDANTE SUPREMO HUGO CHAVEZ, EN LA LEY PLAN DE LA PATRIA 2013-2019; QUE SE SUMA A LAS ESTRATEGIAS ASERTIVAS QUE EL GOBIERNO BOLIVARIANO HA ASUMIDO EN PRO DE CONSOLIDAR EL VIVIR BIEN EN  EL  PUEBLO TRUJILLANO.', 46);
INSERT INTO fichas VALUES (20, NULL, NULL, 8, 20, 20, 20, 20, 'AV CODAZZI CON AV JUÁN ANDRÉS VARELA GALPONES DE INTRAVIAL', 'EMPRESA DE PROPIEDAD SOCIAL, DESTINADA AL TRANSPORTE PÚBLICO DE PASAJEROS ', 26);
INSERT INTO fichas VALUES (21, NULL, NULL, 7, 21, 21, 21, 21, 'MINI TERMINAL, ENTRE CALLE CARABOBO Y C/CALVARIO', 'SISTEMA DE TRANSPORTE TERRESTRE QUE CONECTA A LAS ZONAS NORTE, SUR, ESTE Y OESTE DEL MUNICIPIO BERMÚDEZ.', 19);
INSERT INTO fichas VALUES (22, NULL, NULL, 4, 22, 22, 22, 22, 'CORREDOR VIAL SABANETA, CALLE 100 CON AV. DON MANUEL BELLOSO (DESDE EL SECTOR ALTOS VANEGA HASTA EL CENTRO CENTRO COMERCIAL LAS PLAYITAS)', 'SISTEMA METRO LIGERO, LONGITUD 6.5 KMS. COMPRENDE 4 ESTACIONES SUPERFICIALES, 2 ELEVADAS SOBRE UN VIADUCTO', 10);
INSERT INTO fichas VALUES (23, NULL, NULL, 4, 23, 23, 23, 23, 'AV. DON MANUEL BELLOSO, VÍA AEROPUERTO, SECTOR ALTOS DE LA VANEGA, EDIFICIO METRO DE MARACAIBO', 'LA EMPRESA SOCIALISTA METRO DE MARACAIBO OPERA LA LINEA 1 DE TRANSPORTE MASIVO DE MARACAIBO,  ASIMISMO, SE LE DIO LA TAREA A TRAVÉS DE LA GERENCIA GENERAL DE TRANSPORTE SUPERFICIAL DE OPERAR LAS RUTAS ALIMENTADORAS DE LA LINEA 1 ', 11);
INSERT INTO fichas VALUES (24, NULL, NULL, 3, 24, 24, 24, 24, 'AV. SEQUICENTENARIA, LOCAL PARQUE RECREACIONAL SUR, PARTE SUR-OESTE-ESTADO CARABOBO', 'SISTEMA METRO LIGERO, LONGITUD 6.3 KMS. COMPRENDE 7 ESTACIONES Y 1 SUBESTACIÓN  ELÉCTRICA', 8);
INSERT INTO fichas VALUES (25, NULL, NULL, 12, 25, 25, 25, 25, 'AV. NORTE SUR 1, UNARE I, AL LADO DEL  TERMINAL DE PASAJEROS, CENTRO DE OPERACIONES Y MANTENIMIENTO TRANSBOLIVAR', 'SISTEMA DE TRANSPORTE PÚBLICO URBANO E INTERURBANO EN CONDICIONES SEGURAS, CONFORTABLES Y OPORTUNAS, EN TODO EL TERRITORIO DEL ESTADO BOLÍVAR.', 27);
INSERT INTO fichas VALUES (26, NULL, NULL, 14, 26, 26, 26, 26, 'TERMINAL DE PASAJEROS DE PUNTO FIJO', 'SISTEMA DE TRANSPORTE SUPERFICIAL QUE RECORRE AVENIDAS Y CALLES PRINCIPALES DE DOS MUNICIPIOS DEL ESTADO FALCÓN, ATIENDE A DIVERSOS TIPOS DE USUARIOS.', 41);
INSERT INTO fichas VALUES (27, NULL, NULL, 19, 27, 27, 27, 27, 'AV. DON MANUEL BELLOSO, VÍA AEROPUERTO, SECTOR ALTOS DE LA VANEGA, EDIFICIO METRO DE MARACAIBO', 'EMPRESA TRANZULIA PROVEERÁ DEL SERVICIO DE TRANSPORTE PÚBLICO TRONCO ALIMENTADOR  A LOS MUNICIPIOS MARA, GUAJIRA Y ALMIRANTE PADILLA', 47);
INSERT INTO fichas VALUES (28, NULL, NULL, 15, 28, 28, 28, 28, 'TERMINAL DE PASAJEROS JUÁN JOSÉ FLORES, AV. LA PAZ, CASCO CENTRAL', 'TRANSPORPUERTO ES UN SISTEMA POPULAR, MODERNO, RÁPIDO, CÓMODO Y ECONÓMICO, PRESTA SERVICIO EN RUTAS URBANAS, SUBURBANAS E INTERURBANAS.', 29);
INSERT INTO fichas VALUES (29, NULL, NULL, 5, 29, 29, 29, 29, 'AV CENTENARIO, SECTOR POZO HONDO, EDIFICIO ADMINISTRATIVO, EJIDO, MÉRIDA', 'SISTEMA  MASIVO, QUE CONECTA A LOS MUNICIPIOS CAMPO ELIAS, LIBERTADOR, ALBERTO ADRIANI, ANTONIO PINTO SALINAS, TOVAR, RANGEL Y CÉSAR JULIO SALAS, ATRAVÉS DE LA INCORPORACIÓN DE CINCO RUTAS INTERURBANAS Y DOS RUTAS URBANAS', 16);
INSERT INTO fichas VALUES (30, NULL, NULL, 5, 30, 30, 30, 30, NULL, NULL, 14);
INSERT INTO fichas VALUES (31, NULL, NULL, 3, 31, 31, 31, 31, 'AVE SEQUICENTENARIA, LOCAL, PARQUE RECREACIONAL SUR, PARTE SUROESTE,S/N, ZONA SUR DE VALENCIA, EDO. CARABOBO', 'AMPLIACION DEL SISTEMA DE TRANSPORTE SUPERFICIAL EN ZONAS SIN SERVICIO SUBTERRÁNEO, CONECTANDO Y ALIMENTANDO AL SISTEMA METRO DE VALENCIA. ESTARÁ CONFORMADO POR 12 RUTAS CON 190 UNIDADES HACIA LAS DIFERENTES ZONAS DEL ÁREA METROPOLITANA DE VALENCIA, ESTRUCTURADAS DE LA SIGUIENTE FORMA: 10 RUTAS TIPO RADIAL Y 2 TIPO CIRCULAR, CON LOS QUE SE MOVILIZARÁN LOS PASAJEROS HACIA LAS DIFERENTES ESTACIONES DE LA LINEA 1 DEL METRO DE VALENCIA Y VICEVERSA.ACTUALMENTE SE HAN CREADO 7 RUTAS PILOTOS DE TRANSPORTE SUPERFICIAL ', 9);
INSERT INTO fichas VALUES (32, NULL, NULL, 11, 32, 32, 32, 32, 'AVE. LA PROSPERIDAD MALECÓN DEL MUELLE P.C.', 'TRANSAMAZONAS ES UN SISTEMA DE TRANSPORTE SUPERFICIAL QUE FUE INAUGURADO EL 20 DE NOVIEMBRE DEL 2013, CON UNA EJECUCIÓN DE 3 MESES, CON ALCANCE AL MUNICIPIO ATURES, CAPITAL DEL ESTADO AMAZONAS', 22);
INSERT INTO fichas VALUES (33, NULL, NULL, 13, 33, 33, 33, 33, 'ASENTAMIENTO 21, SECTOR 4, CALLE PRINCIPAL, ELTIERRAL, EDO. ARAGUA', 'EMPRESA DE TRANSPORTE TERRESTRE SUPERFICIAL', 25);


--
-- TOC entry 2032 (class 0 OID 58960)
-- Dependencies: 172
-- Data for Name: financiero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO financiero VALUES (1, 'BOLETO METRO', 'NO APLICA', NULL, 'SERVICIO GRATUITO (TEMPORALMENTE)');
INSERT INTO financiero VALUES (2, 'TARJETA DE CONTACTO Y BOLETO METRO', 'CUBRIR GASTOS DE FUNCIONAMIENTO', NULL, '1,5 BS');
INSERT INTO financiero VALUES (3, 'TARJETA DE CONTACTO Y BOLETO METRO', 'CUBRIR GASTOS DE FUNCIONAMIENTO', NULL, '1,5 BS');
INSERT INTO financiero VALUES (4, 'TARJETA SIN CONTACTO Y BOLETO', 'GASTOS OPERATIVOS', NULL, '1,5 BS');
INSERT INTO financiero VALUES (5, 'BOLETO', 'GASTOS OPERATIVOS', NULL, '1,5 BS');
INSERT INTO financiero VALUES (6, 'TARJETA (TSC)  Y  TOKEN', 'GASTOS OPERATIVOS', NULL, '2,6 BS y 1,0 Bs ENTRE CHAALLAVE Y CUA');
INSERT INTO financiero VALUES (7, 'BOLETO', 'NO APLICA', NULL, 'SERVICIO GRATUITO (TEMPORALMENTE)');
INSERT INTO financiero VALUES (8, 'BOLETOS EXPENDIDOS POR EL OPERADOR DE LA UNIDAD', 'UTILIZADOS PARA GASTOS DE FUNCIONAMIENTO Y DE INVERSIÓN', NULL, '10 BS');
INSERT INTO financiero VALUES (9, 'BOLETOS EXPENDIDOS POR EL OPERADOR DE LA UNIDAD', 'UTILIZADOS PARA GASTOS DE FUNCIONAMIENTO Y DE INVERSIÓN', NULL, '6 BS');
INSERT INTO financiero VALUES (10, 'BOLETOS EXPENDIDOS POR EL OPERADOR DE LA UNIDAD', 'UTILIZADOS PARA GASTOS DE FUNCIONAMIENTO Y DE INVERSIÓN', NULL, '15 BS');
INSERT INTO financiero VALUES (11, 'BOLETOS EXPENDIDOS POR EL OPERADOR DE LA UNIDAD', 'UTILIZADOS PARA GASTOS DE FUNCIONAMIENTO Y DE INVERSIÓN', NULL, '6 BS RUTA SAN PEDRO, EL RESTO DE RUTAS 20 BS');
INSERT INTO financiero VALUES (12, 'BOLETOS EXPENDIDOS POR EL OPERADOR DE LA UNIDAD', 'UTILIZADOS PARA GASTOS DE FUNCIONAMIENTO Y DE INVERSIÓN', NULL, '25 BS RUTA HIGUEROTE Y 30 BS RUTA RIO CHICO');
INSERT INTO financiero VALUES (13, 'BUS ESTADAR YUTONG 12 MTS', 'UTILIZADOS PARA GASTOS DE FUNCIONAMIENTO Y DE INVERSIÓN', NULL, '20 BS');
INSERT INTO financiero VALUES (14, 'BOLETO', 'GASTOS OPERATIVOS', NULL, '1,5 BS');
INSERT INTO financiero VALUES (15, 'BOLETO', 'GASTOS OPERATIVOS', NULL, '1,5 BS');
INSERT INTO financiero VALUES (16, 'TARJETA SIN CONTACTO', 'GASTOS OPERATIVOS', NULL, '4 BS. ');
INSERT INTO financiero VALUES (17, 'EFECTIVO', 'GASTOS OPERATIVOS', NULL, '6 BS. Y ESTUDIANTES BS. 2.');
INSERT INTO financiero VALUES (18, 'SERVICIO GRATUITO', 'SERVICIO GRATUITO', NULL, 'SERVICIO GRATUITO');
INSERT INTO financiero VALUES (19, 'EFECTIVO', 'GASTOS DE INVERSION Y GASTO DE OPERATIVIDAD', NULL, NULL);
INSERT INTO financiero VALUES (20, 'EFECTIVO', 'GASTOS OPERATIVOS', NULL, 'BS. 5,00');
INSERT INTO financiero VALUES (21, 'EFECTIVO', 'GASTOS OPERATIVOS', NULL, 'BS. 4,00');
INSERT INTO financiero VALUES (22, 'TARJETAS  CONTACLESS', 'GASTOS OPERATIVOS', NULL, '0,5  Bs. BOLETO  GENERAL
0,15 Bs. BOLETO ESTUDIANT');
INSERT INTO financiero VALUES (23, 'TICKET', 'GASTOS OPERATIVOS', NULL, ' 7,00   BS.');
INSERT INTO financiero VALUES (24, 'FICHAS Y TARJETAS SIN CONTACTO', 'GASTOS OPERATIVOS', NULL, '0,5  Bs. BOLETO  GENERAL
0,15 Bs. BOLETO ESTUDIANT');
INSERT INTO financiero VALUES (25, 'EFECTIVO', 'GASTOS OPERATIVOS', NULL, 'MUNICIPIO CARONI  6  BS
MUNICIPIO HERES      5  BS');
INSERT INTO financiero VALUES (26, NULL, 'SERVICIO GRATUITO', NULL, 'SERVICIO GRATUITO');
INSERT INTO financiero VALUES (27, 'TICKET', 'GASTOS OPERATIVOS', NULL, ' 18,00   BS.');
INSERT INTO financiero VALUES (28, 'EFECTIVO', 'GASTOS OPERATIVOS', NULL, '5  BS');
INSERT INTO financiero VALUES (29, 'SERVICIO GRATUITO', NULL, NULL, 'SERVICIO GRATUITO');
INSERT INTO financiero VALUES (30, 'SERVICIO GRATUITO', NULL, NULL, 'SERVICIO GRATUITO');
INSERT INTO financiero VALUES (31, 'EN PROYECTO', 'GASTOS OPERATIVOS CUANDO SE IMPLEMENTE', NULL, 'EN PROYECTO');
INSERT INTO financiero VALUES (32, 'EFECTIVO', 'PERSONAL DE TRANSAMAZONAS,COSTO DE MANTENIMIENTO, GASTOS OPERATIVOS', NULL, 'BS 4,5');
INSERT INTO financiero VALUES (33, 'TARJETA SIN CONTACTO', 'A DISPOSICIÓN DE LA GOBERNACIÓN', NULL, '5 BS');


--
-- TOC entry 2038 (class 0 OID 59010)
-- Dependencies: 184
-- Data for Name: grupo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO grupo VALUES (1, 'ADMINISTRADOR', 'GRUPO ADMINISTRADOR');
INSERT INTO grupo VALUES (2, 'DIRECTOR', 'GRUPO DIRECTOR');
INSERT INTO grupo VALUES (3, 'OPERADOR', 'GRUPO OPERADOR');


--
-- TOC entry 2033 (class 0 OID 58969)
-- Dependencies: 174
-- Data for Name: modalidad_transporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO modalidad_transporte VALUES (5, 'SISTEMAS SUPERFICIALES');
INSERT INTO modalidad_transporte VALUES (6, 'SISTEMAS NO CONVENCIONALES');
INSERT INTO modalidad_transporte VALUES (1, 'SISTEMAS METRO PESADO');
INSERT INTO modalidad_transporte VALUES (2, 'SISTEMAS METRO LIGERO');
INSERT INTO modalidad_transporte VALUES (3, 'SISTEMA DE CERCANÍA');
INSERT INTO modalidad_transporte VALUES (4, 'SISTEMA ATR (AUTOBUSES DE TRÁNSITO RÁPIDO)');


--
-- TOC entry 2039 (class 0 OID 59016)
-- Dependencies: 186
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO municipios VALUES (36, 24, 'BOLIVAR                                                                                             ', true);
INSERT INTO municipios VALUES (37, 24, 'CAMATAGUA                                                                                           ', true);
INSERT INTO municipios VALUES (38, 24, 'GIRARDOT                                                                                            ', true);
INSERT INTO municipios VALUES (39, 24, 'JOSE ANGEL LAMAS                                                                                    ', true);
INSERT INTO municipios VALUES (40, 24, 'JOSE FELIX RIBAS                                                                                    ', true);
INSERT INTO municipios VALUES (41, 24, 'JOSE RAFAEL REVENGA                                                                                 ', true);
INSERT INTO municipios VALUES (42, 24, 'LIBERTADOR                                                                                          ', true);
INSERT INTO municipios VALUES (43, 24, 'MARIO BRICEÑO IRAGORRY                                                                              ', true);
INSERT INTO municipios VALUES (44, 24, 'SAN CASIMIRO                                                                                        ', true);
INSERT INTO municipios VALUES (45, 24, 'SAN SEBASTIAN                                                                                       ', true);
INSERT INTO municipios VALUES (46, 24, 'SANTIAGO MARIÑO                                                                                     ', true);
INSERT INTO municipios VALUES (47, 24, 'SANTOS MICHELENA                                                                                    ', true);
INSERT INTO municipios VALUES (48, 24, 'SUCRE                                                                                               ', true);
INSERT INTO municipios VALUES (49, 24, 'TOVAR                                                                                               ', true);
INSERT INTO municipios VALUES (50, 24, 'URDANETA                                                                                            ', true);
INSERT INTO municipios VALUES (51, 24, 'ZAMORA                                                                                              ', true);
INSERT INTO municipios VALUES (52, 24, 'FRANCISCO LINARES ALCANTARA                                                                         ', true);
INSERT INTO municipios VALUES (53, 24, 'OCUMARE DE LA COSTA DE ORO                                                                          ', true);
INSERT INTO municipios VALUES (2, 2, 'ALTO ORINOCO', true);
INSERT INTO municipios VALUES (3, 2, 'ATABAPO', true);
INSERT INTO municipios VALUES (4, 2, 'ATURES', true);
INSERT INTO municipios VALUES (5, 2, 'AUTANA ', true);
INSERT INTO municipios VALUES (6, 2, 'MAROA', true);
INSERT INTO municipios VALUES (7, 2, 'MANAPIARE', true);
INSERT INTO municipios VALUES (8, 2, 'RIO NEGRO', true);
INSERT INTO municipios VALUES (9, 3, 'ANACO', true);
INSERT INTO municipios VALUES (10, 3, 'ARAGUA', true);
INSERT INTO municipios VALUES (11, 3, 'FRANCISCO DEL CARMEN CARVAJAL', true);
INSERT INTO municipios VALUES (12, 3, 'FRANCISCO DE MIRANDA', true);
INSERT INTO municipios VALUES (13, 3, 'GUANTA', true);
INSERT INTO municipios VALUES (14, 3, 'INDEPENDENCIA', true);
INSERT INTO municipios VALUES (15, 3, 'JUAN ANTONIO SOTILLO', true);
INSERT INTO municipios VALUES (16, 3, 'JUAN MANUEL CAJIGAL', true);
INSERT INTO municipios VALUES (17, 3, 'JOSE GREGORIO MONAGAS', true);
INSERT INTO municipios VALUES (18, 3, 'LIBERTAD', true);
INSERT INTO municipios VALUES (19, 3, 'MANUEL EZEQUIEL BRUZUAL', true);
INSERT INTO municipios VALUES (20, 3, 'PEDRO MARIA FREITES', true);
INSERT INTO municipios VALUES (21, 3, 'PIRITU', true);
INSERT INTO municipios VALUES (22, 3, 'SAN JOSE DE GUANIPA', true);
INSERT INTO municipios VALUES (23, 3, 'SAN JUAN DE CAPISTRANO', true);
INSERT INTO municipios VALUES (24, 3, 'SANTA ANA', true);
INSERT INTO municipios VALUES (25, 3, 'SIMON BOLIVAR', true);
INSERT INTO municipios VALUES (26, 3, 'SIMON RODRIGUEZ', true);
INSERT INTO municipios VALUES (27, 3, 'SIR ARTUR MC GREGOR', true);
INSERT INTO municipios VALUES (28, 3, 'TURISTICO DIEGO BAUTISTA URBANEJA', true);
INSERT INTO municipios VALUES (29, 4, 'ACHAGUAS', true);
INSERT INTO municipios VALUES (30, 4, 'BIRUACA', true);
INSERT INTO municipios VALUES (31, 4, 'MUÑOZ', true);
INSERT INTO municipios VALUES (32, 4, 'PAEZ', true);
INSERT INTO municipios VALUES (33, 4, 'PEDRO CAMEJO', true);
INSERT INTO municipios VALUES (34, 4, 'ROMULO GALLEGOS', true);
INSERT INTO municipios VALUES (35, 4, 'SAN FERNANDO DE APURE', true);
INSERT INTO municipios VALUES (54, 5, 'ALBERTO ARVELO TORREALBA', true);
INSERT INTO municipios VALUES (55, 5, 'ANTONIO JOSE DE SUCRE', true);
INSERT INTO municipios VALUES (56, 5, 'ARISMENDI', true);
INSERT INTO municipios VALUES (57, 5, 'BARINAS', true);
INSERT INTO municipios VALUES (58, 5, 'BOLIVAR', true);
INSERT INTO municipios VALUES (59, 5, 'CRUZ PAREDES', true);
INSERT INTO municipios VALUES (60, 5, 'EZEQUIEL ZAMORA', true);
INSERT INTO municipios VALUES (66, 6, 'CARONI', true);
INSERT INTO municipios VALUES (67, 6, 'CEDEÑO', true);
INSERT INTO municipios VALUES (68, 6, 'EL CALLAO', true);
INSERT INTO municipios VALUES (69, 6, 'GRAN SABANA', true);
INSERT INTO municipios VALUES (71, 6, 'PIAR', true);
INSERT INTO municipios VALUES (72, 6, 'RAUL LEONI', true);
INSERT INTO municipios VALUES (73, 6, 'ROSCIO', true);
INSERT INTO municipios VALUES (74, 6, 'SIFONTES', true);
INSERT INTO municipios VALUES (75, 6, 'SUCRE', true);
INSERT INTO municipios VALUES (76, 6, 'PADRE PEDRO CHIEN', true);
INSERT INTO municipios VALUES (61, 5, 'OBISPOS', true);
INSERT INTO municipios VALUES (62, 5, 'PEDRAZA', true);
INSERT INTO municipios VALUES (63, 5, 'ROJAS', true);
INSERT INTO municipios VALUES (64, 5, 'SOSA', true);
INSERT INTO municipios VALUES (65, 5, 'ANDRES ELOY BLANCO', true);
INSERT INTO municipios VALUES (77, 7, 'BEJUMA', true);
INSERT INTO municipios VALUES (78, 7, 'CARLOS ARVELO', true);
INSERT INTO municipios VALUES (79, 7, 'DIEGO IBARRA', true);
INSERT INTO municipios VALUES (80, 7, 'GUACARA', true);
INSERT INTO municipios VALUES (81, 7, 'JUAN JOSE MORA', true);
INSERT INTO municipios VALUES (82, 7, 'LIBERTADOR', true);
INSERT INTO municipios VALUES (83, 7, 'LOS GUAYOS', true);
INSERT INTO municipios VALUES (84, 7, 'MIRANDA', true);
INSERT INTO municipios VALUES (85, 7, 'MONTALBAN', true);
INSERT INTO municipios VALUES (86, 7, 'NAGUANAGUA', true);
INSERT INTO municipios VALUES (87, 7, 'PUERTO CABELLO', true);
INSERT INTO municipios VALUES (88, 7, 'SAN DIEGO', true);
INSERT INTO municipios VALUES (89, 7, 'SAN JOAQUIN', true);
INSERT INTO municipios VALUES (90, 7, 'VALENCIA', true);
INSERT INTO municipios VALUES (91, 8, 'ANZOATEGUI', true);
INSERT INTO municipios VALUES (92, 8, 'FALCON', true);
INSERT INTO municipios VALUES (93, 8, 'GIRARDOT', true);
INSERT INTO municipios VALUES (94, 8, 'LIMA BLANCO', true);
INSERT INTO municipios VALUES (95, 8, 'EL PAO DE SAN JUAN BAUTISTA', true);
INSERT INTO municipios VALUES (96, 8, 'RICAURTE', true);
INSERT INTO municipios VALUES (97, 8, 'ROMULO GALLEGOS', true);
INSERT INTO municipios VALUES (98, 8, 'SAN CARLOS DE AUSTRIA', true);
INSERT INTO municipios VALUES (99, 8, 'TINACO', true);
INSERT INTO municipios VALUES (100, 9, 'ANTONIO DIAZ', true);
INSERT INTO municipios VALUES (101, 9, 'CASACOIMA', true);
INSERT INTO municipios VALUES (102, 9, 'PEDERNALES', true);
INSERT INTO municipios VALUES (103, 9, 'TUCUPITA', true);
INSERT INTO municipios VALUES (104, 10, 'ACOSTA', true);
INSERT INTO municipios VALUES (105, 10, 'BOLIVAR', true);
INSERT INTO municipios VALUES (106, 10, 'BUCHIVACOA', true);
INSERT INTO municipios VALUES (107, 10, 'CACIQUE MANAURE', true);
INSERT INTO municipios VALUES (108, 10, 'CARIRUBANA', true);
INSERT INTO municipios VALUES (109, 10, 'COLINA', true);
INSERT INTO municipios VALUES (110, 10, 'DABAJURO', true);
INSERT INTO municipios VALUES (111, 10, 'DEMOCRACIA', true);
INSERT INTO municipios VALUES (112, 10, 'FALCON', true);
INSERT INTO municipios VALUES (113, 10, 'FEDERACION', true);
INSERT INTO municipios VALUES (114, 10, 'JACURA', true);
INSERT INTO municipios VALUES (115, 10, 'LOS TAQUES', true);
INSERT INTO municipios VALUES (116, 10, 'MAUROA', true);
INSERT INTO municipios VALUES (117, 10, 'MIRANDA', true);
INSERT INTO municipios VALUES (118, 10, 'MONSEÑOR ITURRIZA', true);
INSERT INTO municipios VALUES (119, 10, 'PALMASOLA', true);
INSERT INTO municipios VALUES (120, 10, 'PETIT', true);
INSERT INTO municipios VALUES (122, 10, 'SAN FRANCISCO', true);
INSERT INTO municipios VALUES (123, 10, 'SILVA', true);
INSERT INTO municipios VALUES (124, 10, 'SUCRE', true);
INSERT INTO municipios VALUES (125, 10, 'TOCOPERO', true);
INSERT INTO municipios VALUES (126, 10, 'UNION', true);
INSERT INTO municipios VALUES (127, 10, 'URUMACO', true);
INSERT INTO municipios VALUES (128, 10, 'ZAMORA', true);
INSERT INTO municipios VALUES (129, 11, 'CAMAGUAN', true);
INSERT INTO municipios VALUES (130, 11, 'CHAGUARAMAS', true);
INSERT INTO municipios VALUES (131, 11, 'EL SOCORRO', true);
INSERT INTO municipios VALUES (132, 11, 'SAN GERONIMO DE GUAYABAL', true);
INSERT INTO municipios VALUES (133, 11, 'LEONARDO INFANTE', true);
INSERT INTO municipios VALUES (134, 11, 'LAS MERCEDES', true);
INSERT INTO municipios VALUES (135, 11, 'JULIAN MECHADO', true);
INSERT INTO municipios VALUES (136, 11, 'FRANCISCO DE MIRANDA', true);
INSERT INTO municipios VALUES (137, 11, 'JOSE TADEO MONAGAS', true);
INSERT INTO municipios VALUES (138, 11, 'ORTIZ', true);
INSERT INTO municipios VALUES (139, 11, 'JOSE FELIX RIBAS', true);
INSERT INTO municipios VALUES (140, 11, 'JUAN GERMAN ROSCIO', true);
INSERT INTO municipios VALUES (141, 11, 'SAN JOSE DE GUARIBE', true);
INSERT INTO municipios VALUES (142, 11, 'SANTA MARIA DE IPIRE', true);
INSERT INTO municipios VALUES (143, 11, 'PEDRO ZARAZA', true);
INSERT INTO municipios VALUES (144, 12, 'ANDRES ELOY BLANCO', true);
INSERT INTO municipios VALUES (145, 12, 'CRESPO', true);
INSERT INTO municipios VALUES (146, 12, 'IRIBARREN', true);
INSERT INTO municipios VALUES (147, 12, 'JIMENEZ', true);
INSERT INTO municipios VALUES (148, 12, 'MORAN', true);
INSERT INTO municipios VALUES (149, 12, 'PALAVECINO', true);
INSERT INTO municipios VALUES (150, 12, 'SIMON PLANAS', true);
INSERT INTO municipios VALUES (151, 12, 'TORRES', true);
INSERT INTO municipios VALUES (152, 12, 'URDANETA', true);
INSERT INTO municipios VALUES (153, 13, 'ALBERTO ADRIANI', true);
INSERT INTO municipios VALUES (154, 13, 'ANDRES BELLO', true);
INSERT INTO municipios VALUES (155, 13, 'ANTONIO PINTO SALINAS', true);
INSERT INTO municipios VALUES (156, 13, 'ARICAGUA', true);
INSERT INTO municipios VALUES (157, 13, 'ARZOBISPO CHACON', true);
INSERT INTO municipios VALUES (158, 13, 'CAMPO ELIAS', true);
INSERT INTO municipios VALUES (162, 13, 'JULIO CESAR SALAS', true);
INSERT INTO municipios VALUES (159, 13, 'CARACCIOLO PARRA OLMEDO', true);
INSERT INTO municipios VALUES (160, 13, 'CARDENAL QUINTERO', true);
INSERT INTO municipios VALUES (161, 13, 'GUARAQUE', true);
INSERT INTO municipios VALUES (163, 13, 'JUSTO BRICEÑO', true);
INSERT INTO municipios VALUES (164, 13, 'LIBERTADOR', true);
INSERT INTO municipios VALUES (165, 13, 'MIRANDA', true);
INSERT INTO municipios VALUES (166, 13, 'OBISPO RAMOS DE LORA', true);
INSERT INTO municipios VALUES (167, 13, 'PADRE NOGUERA', true);
INSERT INTO municipios VALUES (168, 13, 'PUEBLO LLANO', true);
INSERT INTO municipios VALUES (169, 13, 'RANGEL', true);
INSERT INTO municipios VALUES (170, 13, 'RIVAS DAVILA', true);
INSERT INTO municipios VALUES (171, 13, 'SANTOS MARQUINA', true);
INSERT INTO municipios VALUES (172, 13, 'SUCRE', true);
INSERT INTO municipios VALUES (173, 13, 'TOVAR', true);
INSERT INTO municipios VALUES (174, 13, 'TULIO FEBRES CORDERO', true);
INSERT INTO municipios VALUES (175, 13, 'ZEA', true);
INSERT INTO municipios VALUES (176, 14, 'ACEVEDO', true);
INSERT INTO municipios VALUES (177, 14, 'ANDRES BELLO', true);
INSERT INTO municipios VALUES (178, 14, 'BARUTA', true);
INSERT INTO municipios VALUES (179, 14, 'BRION', true);
INSERT INTO municipios VALUES (180, 14, 'BUROZ', true);
INSERT INTO municipios VALUES (182, 14, 'CHACAO', true);
INSERT INTO municipios VALUES (183, 14, 'CRISTOBAL ROJAS', true);
INSERT INTO municipios VALUES (184, 14, 'EL HATILLO', true);
INSERT INTO municipios VALUES (185, 14, 'GUAICAIPURO', true);
INSERT INTO municipios VALUES (186, 14, 'INDEPENDENCIA', true);
INSERT INTO municipios VALUES (187, 14, 'LANDER', true);
INSERT INTO municipios VALUES (188, 14, 'LOS SALIAS', true);
INSERT INTO municipios VALUES (189, 14, 'PAEZ', true);
INSERT INTO municipios VALUES (190, 14, 'PAZ CASTILLO', true);
INSERT INTO municipios VALUES (191, 14, 'PEDRO GUAL', true);
INSERT INTO municipios VALUES (192, 14, 'PLAZA', true);
INSERT INTO municipios VALUES (193, 14, 'SIMON BOLIVAR', true);
INSERT INTO municipios VALUES (194, 14, 'SUCRE', true);
INSERT INTO municipios VALUES (195, 14, 'URDANETA', true);
INSERT INTO municipios VALUES (196, 14, 'ZAMORA', true);
INSERT INTO municipios VALUES (197, 15, 'ACOSTA', true);
INSERT INTO municipios VALUES (198, 15, 'AGUASAY', true);
INSERT INTO municipios VALUES (199, 15, 'BOLIVAR', true);
INSERT INTO municipios VALUES (200, 15, 'CARIPE', true);
INSERT INTO municipios VALUES (201, 15, 'CEDEÑO', true);
INSERT INTO municipios VALUES (202, 15, 'EZEQUIEL ZAMORA', true);
INSERT INTO municipios VALUES (203, 15, 'LIBERTADOR', true);
INSERT INTO municipios VALUES (204, 15, 'MATURIN', true);
INSERT INTO municipios VALUES (205, 15, 'PIAR', true);
INSERT INTO municipios VALUES (206, 15, 'PUNCERES', true);
INSERT INTO municipios VALUES (207, 15, 'SANTA BARBARA', true);
INSERT INTO municipios VALUES (208, 15, 'SOTILLO ', true);
INSERT INTO municipios VALUES (209, 15, 'URACOA', true);
INSERT INTO municipios VALUES (210, 16, 'ANTOLIN DEL CAMPO', true);
INSERT INTO municipios VALUES (211, 16, 'ARISMENDI', true);
INSERT INTO municipios VALUES (212, 16, 'DIAZ', true);
INSERT INTO municipios VALUES (213, 16, 'GARCIA', true);
INSERT INTO municipios VALUES (214, 16, 'GOMEZ', true);
INSERT INTO municipios VALUES (215, 16, 'MANEIRO', true);
INSERT INTO municipios VALUES (216, 16, 'MARCANO', true);
INSERT INTO municipios VALUES (217, 16, 'MARIÑO', true);
INSERT INTO municipios VALUES (218, 16, 'PENINSULA DE MACANAO', true);
INSERT INTO municipios VALUES (219, 16, 'TUBORES', true);
INSERT INTO municipios VALUES (220, 16, 'VILLALBA', true);
INSERT INTO municipios VALUES (221, 17, 'AGUA BLANCA', true);
INSERT INTO municipios VALUES (222, 17, 'ARAURE', true);
INSERT INTO municipios VALUES (223, 17, 'ESTELLER', true);
INSERT INTO municipios VALUES (224, 17, 'GUANARE', true);
INSERT INTO municipios VALUES (225, 17, 'GUANARITO', true);
INSERT INTO municipios VALUES (226, 17, 'GUANARITO', true);
INSERT INTO municipios VALUES (227, 17, 'MONSEÑOR JOSE VICENTE DE UNDA', true);
INSERT INTO municipios VALUES (228, 17, 'OSPINO', true);
INSERT INTO municipios VALUES (229, 17, 'PAEZ', true);
INSERT INTO municipios VALUES (230, 17, 'PAPELON', true);
INSERT INTO municipios VALUES (231, 17, 'SAN GENARO DE BOCONOITO', true);
INSERT INTO municipios VALUES (232, 17, 'SAN RAFAEL DE ONOTO', true);
INSERT INTO municipios VALUES (233, 17, 'SANTA ROSALIA', true);
INSERT INTO municipios VALUES (234, 17, 'SUCRE', true);
INSERT INTO municipios VALUES (235, 17, 'TUREN', true);
INSERT INTO municipios VALUES (236, 18, 'ANDRES ELOY BLANCO', true);
INSERT INTO municipios VALUES (237, 18, 'ANDRES MATA', true);
INSERT INTO municipios VALUES (238, 18, 'ARISMENDI', true);
INSERT INTO municipios VALUES (239, 18, 'BENITEZ', true);
INSERT INTO municipios VALUES (240, 18, 'BERMUDEZ', true);
INSERT INTO municipios VALUES (242, 18, 'CAJIGAL', true);
INSERT INTO municipios VALUES (243, 18, 'CRUZ SALMERON ACOSTA', true);
INSERT INTO municipios VALUES (244, 18, 'LIBERTADOR', true);
INSERT INTO municipios VALUES (245, 18, 'MARIÑO', true);
INSERT INTO municipios VALUES (246, 18, 'MEJIA', true);
INSERT INTO municipios VALUES (247, 18, 'MONTES', true);
INSERT INTO municipios VALUES (248, 18, 'RIBERO', true);
INSERT INTO municipios VALUES (249, 18, 'SUCRE', true);
INSERT INTO municipios VALUES (250, 18, 'VALDEZ', true);
INSERT INTO municipios VALUES (251, 19, 'ANDRES BELLO', true);
INSERT INTO municipios VALUES (252, 19, 'ANTONIO ROMULO COSTA', true);
INSERT INTO municipios VALUES (253, 19, 'AYACUCHO', true);
INSERT INTO municipios VALUES (254, 19, 'BOLIVAR', true);
INSERT INTO municipios VALUES (255, 19, 'CARDENAS', true);
INSERT INTO municipios VALUES (256, 19, 'CORDOBA', true);
INSERT INTO municipios VALUES (257, 19, 'FERNANDEZ FEO', true);
INSERT INTO municipios VALUES (258, 19, 'FRANCISCO DE MIRANDA', true);
INSERT INTO municipios VALUES (259, 19, 'GARCIA DE HEVIA', true);
INSERT INTO municipios VALUES (260, 19, 'GUASIMOS', true);
INSERT INTO municipios VALUES (261, 19, 'INDEPENDENCIA', true);
INSERT INTO municipios VALUES (262, 19, 'JAUREGUI', true);
INSERT INTO municipios VALUES (263, 19, 'JOSE MARIA VARGAS', true);
INSERT INTO municipios VALUES (264, 19, 'JUNIN', true);
INSERT INTO municipios VALUES (265, 19, 'LIBERTAD', true);
INSERT INTO municipios VALUES (266, 19, 'LIBERTADOR', true);
INSERT INTO municipios VALUES (267, 19, 'LOBATERA', true);
INSERT INTO municipios VALUES (268, 19, 'MICHELENA', true);
INSERT INTO municipios VALUES (269, 19, 'PANAMERICANO', true);
INSERT INTO municipios VALUES (270, 19, 'PEDRO MARIA UREÑA', true);
INSERT INTO municipios VALUES (271, 19, 'RAFAEL URDANETA', true);
INSERT INTO municipios VALUES (272, 19, 'SAMUEL DARIO MALDONADO', true);
INSERT INTO municipios VALUES (273, 19, 'SAN CRISTOBAL', true);
INSERT INTO municipios VALUES (274, 19, 'SEBORUCO', true);
INSERT INTO municipios VALUES (275, 19, 'SIMON RODRIGUEZ', true);
INSERT INTO municipios VALUES (276, 19, 'SUCRE', true);
INSERT INTO municipios VALUES (277, 19, 'TORBES', true);
INSERT INTO municipios VALUES (278, 19, 'URIBANTE', true);
INSERT INTO municipios VALUES (279, 19, 'SAN JUDAS TADEO', true);
INSERT INTO municipios VALUES (280, 19, 'SAN ANTONIO DE TACHIRA', true);
INSERT INTO municipios VALUES (281, 20, 'ANDRES BELLO', true);
INSERT INTO municipios VALUES (282, 20, 'BOCONO', true);
INSERT INTO municipios VALUES (283, 20, 'BOLIVAR', true);
INSERT INTO municipios VALUES (284, 20, 'CANDELARIA', true);
INSERT INTO municipios VALUES (285, 20, 'CARACHE', true);
INSERT INTO municipios VALUES (286, 20, 'ESCUQUE', true);
INSERT INTO municipios VALUES (287, 20, 'JOSE FELIPE MARQUEZ CAÑIZALES', true);
INSERT INTO municipios VALUES (288, 20, 'JOSE VICENTE CAMPO ELIAS', true);
INSERT INTO municipios VALUES (289, 20, 'LA CEIBA', true);
INSERT INTO municipios VALUES (290, 20, 'MIRANDA', true);
INSERT INTO municipios VALUES (291, 20, 'MONTE CARMELO', true);
INSERT INTO municipios VALUES (292, 20, 'MOTATAN', true);
INSERT INTO municipios VALUES (293, 20, 'PAMPAN', true);
INSERT INTO municipios VALUES (294, 20, 'PAMPANITO', true);
INSERT INTO municipios VALUES (295, 20, 'RAFAEL RANGEL', true);
INSERT INTO municipios VALUES (296, 20, 'SAN RAFAEL DE CARVAJAL', true);
INSERT INTO municipios VALUES (297, 20, 'SUCRE', true);
INSERT INTO municipios VALUES (298, 20, 'TRUJILLO', true);
INSERT INTO municipios VALUES (299, 20, 'URDANETA', true);
INSERT INTO municipios VALUES (300, 20, 'VALERA', true);
INSERT INTO municipios VALUES (345, 8, 'EZEQUIEL ZAMORA', true);
INSERT INTO municipios VALUES (1, 1, 'LIBERTADOR', true);
INSERT INTO municipios VALUES (70, 6, 'HERES', true);
INSERT INTO municipios VALUES (337, 3, 'FERNANDO DE PEÑALVER', true);
INSERT INTO municipios VALUES (121, 10, 'PIRITU', true);
INSERT INTO municipios VALUES (181, 14, 'CARRIZAL', true);
INSERT INTO municipios VALUES (241, 18, 'BOLIVAR', true);
INSERT INTO municipios VALUES (301, 21, 'ARISTIDES BASTIDAS', true);
INSERT INTO municipios VALUES (302, 21, 'BOLIVAR', true);
INSERT INTO municipios VALUES (303, 21, 'BRUZUAL', true);
INSERT INTO municipios VALUES (304, 21, 'COCOROTE', true);
INSERT INTO municipios VALUES (305, 21, 'INDEPENDENCIA', true);
INSERT INTO municipios VALUES (306, 21, 'JOSE ANTONIO PAEZ', true);
INSERT INTO municipios VALUES (307, 21, 'LA TRINIDAD', true);
INSERT INTO municipios VALUES (308, 21, 'MANUEL MONGE', true);
INSERT INTO municipios VALUES (309, 21, 'NIRGUA', true);
INSERT INTO municipios VALUES (310, 21, 'PEÑA', true);
INSERT INTO municipios VALUES (311, 21, 'SAN FELIPE', true);
INSERT INTO municipios VALUES (312, 21, 'SUCRE', true);
INSERT INTO municipios VALUES (313, 21, 'URACHICHE', true);
INSERT INTO municipios VALUES (314, 21, 'VEROES', true);
INSERT INTO municipios VALUES (336, 22, 'VARGAS', true);
INSERT INTO municipios VALUES (315, 23, 'ALMIRANTE PADILLA', true);
INSERT INTO municipios VALUES (316, 23, 'BARALT', true);
INSERT INTO municipios VALUES (317, 23, 'CABIMAS', true);
INSERT INTO municipios VALUES (318, 23, 'CATATUMBO', true);
INSERT INTO municipios VALUES (319, 23, 'COLON', true);
INSERT INTO municipios VALUES (320, 23, 'FRANCISCO JAVIER PULGAR', true);
INSERT INTO municipios VALUES (321, 23, 'JESUS ENRIQUE LOSSADA', true);
INSERT INTO municipios VALUES (322, 23, 'JESUS MARIA SEMPRUN', true);
INSERT INTO municipios VALUES (323, 23, 'LA CAÑADA DE URDANETA', true);
INSERT INTO municipios VALUES (324, 23, 'LAGUNILLAS', true);
INSERT INTO municipios VALUES (325, 23, 'MACHIQUES DE PERIJA', true);
INSERT INTO municipios VALUES (326, 23, 'MARA', true);
INSERT INTO municipios VALUES (327, 23, 'MARACAIBO', true);
INSERT INTO municipios VALUES (328, 23, 'MIRANDA', true);
INSERT INTO municipios VALUES (329, 23, 'PAEZ', true);
INSERT INTO municipios VALUES (330, 23, 'ROSARIO DE PERIJA', true);
INSERT INTO municipios VALUES (331, 23, 'SAN FRANCISCO', true);
INSERT INTO municipios VALUES (332, 23, 'SANTA RITA', true);
INSERT INTO municipios VALUES (333, 23, 'SIMON BOLIVAR', true);
INSERT INTO municipios VALUES (334, 23, 'SUCRE', true);
INSERT INTO municipios VALUES (335, 23, 'VALMORE RODRIGUEZ', true);
INSERT INTO municipios VALUES (338, 25, 'ARCHIPIELAGO LOS ROQUES', true);
INSERT INTO municipios VALUES (339, 25, 'LOS TESTIGOS', true);
INSERT INTO municipios VALUES (340, 25, 'CHIMANAS', true);
INSERT INTO municipios VALUES (341, 25, 'GRUPO 4', true);
INSERT INTO municipios VALUES (342, 25, 'GRUPO 5', true);
INSERT INTO municipios VALUES (343, 25, 'GRUPO 6', true);
INSERT INTO municipios VALUES (344, 25, 'GRUPO 7', true);


--
-- TOC entry 2040 (class 0 OID 59023)
-- Dependencies: 188
-- Data for Name: operaciones_diarias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO operaciones_diarias VALUES (9, 1, 44, 5, 4462, 44, 5560, NULL, 44, '', '2014-04-28', 19, 5, '2014-04-28', '2014-04-27', false, NULL);
INSERT INTO operaciones_diarias VALUES (11, 1, 6, 0, 500000, 6, 800000, 2250, 6, ' Falsa ocupacion
Puerta Abierta
Falla en ZM ALP
falsa ocupacion ', '2014-04-28', 16, 2, '2014-04-28', '2014-04-27', true, NULL);
INSERT INTO operaciones_diarias VALUES (13, 1, 7, 0, 530000, 7, 815000, 2300, 6, ' tren sin traccion', '2014-04-28', 16, 2, '2014-04-25', '2014-04-24', true, NULL);
INSERT INTO operaciones_diarias VALUES (15, 1, 45, 30, 1600000, 30, 1200000, 250, 25, 'puert abierta contraria', '2014-04-28', 15, 1, '2014-04-28', '2014-04-27', true, NULL);
INSERT INTO operaciones_diarias VALUES (16, 1, 25, 20, 600000, 20, 650000, 150, 15, 'evento 1', '2014-04-28', 15, 1, '2014-04-27', '2014-04-26', true, NULL);
INSERT INTO operaciones_diarias VALUES (23, 1, 5, 1, 700000, 5, 950000, 3000, 6, '', '2014-04-28', 16, 2, '2014-04-27', '2014-04-26', true, NULL);
INSERT INTO operaciones_diarias VALUES (27, 1, 8, 2, NULL, NULL, NULL, NULL, NULL, 'prueba con cambios', '2014-04-29', 16, 2, '2014-04-29', '2014-04-28', false, NULL);
INSERT INTO operaciones_diarias VALUES (30, 11, 89, 25, 859600, 5, NULL, 2693, NULL, '', '2014-05-02', 1, 22, '2014-05-02', '2014-05-01', false, NULL);
INSERT INTO operaciones_diarias VALUES (52, 11, 152, 26, 314253, NULL, 62565.6015625, 1515, NULL, '', '2014-05-07', 1, 22, '2014-05-06', '2014-05-05', false, '65');
INSERT INTO operaciones_diarias VALUES (53, 11, 45, 22, 252536, NULL, 5225.5, 42452, NULL, '', '2014-05-07', 1, 22, '2014-05-07', '2014-05-06', false, '5');
INSERT INTO operaciones_diarias VALUES (57, 6, 7, 8, NULL, NULL, NULL, NULL, NULL, '', '2014-05-12', 4, 28, '2014-05-12', '2014-05-11', false, '');
INSERT INTO operaciones_diarias VALUES (59, 2, 8, 2, 78978, 2, 89898.296875, 9898, NULL, '', '2014-05-12', 1, 8, '2014-05-12', '2014-05-11', false, '3');
INSERT INTO operaciones_diarias VALUES (65, 11, 14, 14, 6046, 14, 24186, 45, 14, 'Sin novedad', '2014-05-15', 1, 22, '2014-05-15', '2014-05-14', true, '3');
INSERT INTO operaciones_diarias VALUES (75, 15, 23, 2, 10748, 23, 41152, 284, 23, 'Sin novedad', '2014-05-21', 1, 22, '2014-05-21', '2014-05-20', true, '0');
INSERT INTO operaciones_diarias VALUES (17, 1, 2, 2, 12238, 2, NULL, NULL, 2, 'prueba', '2014-04-30', 1, 3, '2014-01-01', '2013-12-31', false, NULL);
INSERT INTO operaciones_diarias VALUES (18, 1, 2, 2, 9376, 2, NULL, NULL, 2, '', '2014-04-28', 21, 3, '2014-01-02', '2014-01-01', false, NULL);
INSERT INTO operaciones_diarias VALUES (19, 1, 2, 2, 13610, 2, NULL, NULL, 2, '', '2014-04-28', 21, 3, '2014-01-03', '2014-01-02', false, NULL);
INSERT INTO operaciones_diarias VALUES (20, 1, 2, 2, 10503, 2, NULL, NULL, 2, '', '2014-04-28', 21, 3, '2014-01-04', '2014-01-03', false, NULL);
INSERT INTO operaciones_diarias VALUES (21, 1, 2, 2, 5246, 2, NULL, NULL, 2, '', '2014-04-28', 21, 3, '2014-01-05', '2014-01-04', false, NULL);
INSERT INTO operaciones_diarias VALUES (22, 1, 2, 2, 12797, 2, NULL, NULL, 2, '', '2014-04-28', 21, 3, '2014-01-06', '2014-01-05', false, NULL);
INSERT INTO operaciones_diarias VALUES (33, 1, 5, 3, 15200, 2, 7854.89013671875, 2300, NULL, 'prueba dia 30-12-2013', '2014-05-06', 21, 3, '2013-12-30', '2013-12-29', false, NULL);
INSERT INTO operaciones_diarias VALUES (1, 6, 12, 16, 236, 14, NULL, NULL, NULL, '  bus caribia por modificar', '2014-04-28', 12, 38, '2014-04-22', '2014-04-21', false, NULL);
INSERT INTO operaciones_diarias VALUES (7, 6, 12, 6, NULL, NULL, NULL, NULL, NULL, 'admin sitssa como bus caribia', '2014-04-25', 4, 38, '2014-04-25', '2014-04-24', false, NULL);
INSERT INTO operaciones_diarias VALUES (10, 6, 10, 3, 2774, 12, 7740, 1224, 6, '', '2014-04-28', 12, 38, '2014-04-28', '2014-04-27', true, NULL);
INSERT INTO operaciones_diarias VALUES (2, 6, 1, 2, NULL, NULL, NULL, NULL, NULL, 'prueba sitssa interurbano', '2014-04-25', 1, 31, '2014-04-25', '2014-04-24', false, NULL);
INSERT INTO operaciones_diarias VALUES (5, 6, 2, 4, NULL, NULL, NULL, NULL, NULL, 'admin sitssa como interurbano', '2014-04-25', 4, 31, '2014-04-24', '2014-04-23', false, NULL);
INSERT INTO operaciones_diarias VALUES (8, 6, 9, 7, 9, NULL, NULL, NULL, NULL, ' ', '2014-04-25', 4, 31, '2014-04-22', '2014-04-21', false, NULL);
INSERT INTO operaciones_diarias VALUES (24, 6, 16, 8, 865, NULL, NULL, NULL, NULL, '', '2014-04-28', 5, 31, '2014-04-28', '2014-04-27', false, NULL);
INSERT INTO operaciones_diarias VALUES (40, 6, 78, 5, NULL, NULL, NULL, NULL, NULL, 'modificar servicio especial de 2 a 28', '2014-05-06', 4, 31, '2014-05-06', '2014-05-05', false, '2');
INSERT INTO operaciones_diarias VALUES (66, 6, 6, 6, 329, 9, 71915, NULL, 9, 'SIN NOVEDAD ', '2014-05-15', 1, 31, '2014-05-12', '2014-05-11', false, 'N/A');
INSERT INTO operaciones_diarias VALUES (3, 6, 89, 2, 7989, 454, 454.299987792968977, 151, 21, 'servicios especiales sitssa', '2014-04-25', 1, 32, '2014-04-25', '2014-04-24', true, NULL);
INSERT INTO operaciones_diarias VALUES (6, 6, 4, 5, 2, 7, 7, 7, 7, '  admin sitssa como servicios especiales modificar', '2014-04-25', 4, 32, '2014-04-24', '2014-04-23', true, NULL);
INSERT INTO operaciones_diarias VALUES (25, 6, 46, 8, 1256, NULL, NULL, NULL, NULL, 'PRUEBA', '2014-04-28', 6, 32, '2014-04-28', '2014-04-27', false, NULL);
INSERT INTO operaciones_diarias VALUES (4, 6, 6, 2, 8, 8, 5, 9, 10, ' ', '2014-04-25', 11, 34, '2014-04-25', '2014-04-24', true, NULL);
INSERT INTO operaciones_diarias VALUES (47, 1, 125, 25, 1248, NULL, 2456.60009765625, 3000, NULL, '', '2014-05-07', 1, 7, '2014-05-07', '2014-05-06', false, '5');
INSERT INTO operaciones_diarias VALUES (60, 3, 89, 98, 97780, 9090, 878.090026855468977, 1236, NULL, '', '2014-05-12', 1, 8, '2014-05-12', '2014-05-11', false, '9');
INSERT INTO operaciones_diarias VALUES (28, 10, 8, 2, NULL, NULL, NULL, NULL, NULL, 'admin como bus taguanes', '2014-04-29', 1, 39, '2014-04-29', '2014-04-28', false, NULL);
INSERT INTO operaciones_diarias VALUES (64, 10, 11, 29, 3294, 11, 8114, NULL, 11, 'Sin novedad', '2014-05-15', 1, 39, '2014-05-15', '2014-05-14', false, 'n/a');
INSERT INTO operaciones_diarias VALUES (26, 6, 26, 4, 89500, 4522, 121, 251, 85, ' ', '2014-04-29', 7, 37, '2014-04-28', '2014-04-27', true, NULL);
INSERT INTO operaciones_diarias VALUES (29, 6, 8, 2, NULL, NULL, NULL, NULL, NULL, ' admin sitssa como bus vargas modificar de 2 a 28 servicio especial', '2014-05-06', 4, 37, '2014-04-29', '2014-04-28', false, '28');
INSERT INTO operaciones_diarias VALUES (31, 6, 40, 2, 50000, 45, 500000, 600, 40, 'sin novedad', '2014-05-02', 7, 37, '2014-05-02', '2014-05-01', true, NULL);
INSERT INTO operaciones_diarias VALUES (41, 6, 45, 354, 5324, 45, NULL, NULL, NULL, '', '2014-05-06', 4, 37, '2014-05-05', '2014-05-04', false, 'N/A');
INSERT INTO operaciones_diarias VALUES (42, 6, 100, 78, 52752, NULL, 5272.5498046875, 25252, NULL, '', '2014-05-07', 4, 37, '2014-05-06', '2014-05-05', false, '2');
INSERT INTO operaciones_diarias VALUES (43, 6, 75, 58, 76786, NULL, 757855.625, 767676, NULL, '', '2014-05-07', 4, 37, '2014-05-07', '2014-05-06', false, '12');
INSERT INTO operaciones_diarias VALUES (32, 12, 100, 19, 700000, 10, NULL, 2360, NULL, '', '2014-05-05', 24, 27, '2014-05-05', '2014-05-04', false, NULL);
INSERT INTO operaciones_diarias VALUES (35, 12, 85, 8, NULL, NULL, NULL, NULL, NULL, 'evento 22/04/2014', '2014-05-09', 24, 27, '2014-04-22', '2014-04-21', false, '');
INSERT INTO operaciones_diarias VALUES (34, 12, 23, 23, NULL, NULL, NULL, NULL, NULL, 'evento 21/04/2014', '2014-05-06', 24, 27, '2014-04-21', '2014-04-20', false, NULL);
INSERT INTO operaciones_diarias VALUES (36, 12, 63, 6, 85236, 585, 5252, 2525, 52, '23/04/2014', '2014-05-09', 24, 27, '2014-04-23', '2014-04-22', true, '');
INSERT INTO operaciones_diarias VALUES (37, 12, 89, 8, NULL, NULL, NULL, NULL, NULL, '25/04/2014', '2014-05-06', 24, 27, '2014-04-25', '2014-04-24', false, NULL);
INSERT INTO operaciones_diarias VALUES (38, 12, 25, 12, NULL, NULL, NULL, NULL, NULL, '26/04/2014', '2014-05-06', 24, 27, '2014-04-26', '2014-04-25', false, NULL);
INSERT INTO operaciones_diarias VALUES (39, 12, 25, 21, NULL, NULL, NULL, NULL, NULL, '27/04/2014', '2014-05-06', 24, 27, '2014-04-27', '2014-04-26', false, NULL);
INSERT INTO operaciones_diarias VALUES (50, 12, 88, 58, 425257, NULL, 2525.6298828125, 4242, NULL, '', '2014-05-07', 1, 27, '2014-05-06', '2014-05-05', false, '47');
INSERT INTO operaciones_diarias VALUES (51, 12, 151, 25, 151510, NULL, 12000.099609375, 5656, NULL, '', '2014-05-07', 1, 27, '2014-05-07', '2014-05-06', false, '2');
INSERT INTO operaciones_diarias VALUES (56, 12, 58, 20, 543545, 345, 34534, 45, NULL, '', '2014-05-09', 24, 27, '2014-05-09', '2014-05-08', false, '3');
INSERT INTO operaciones_diarias VALUES (63, 12, 14, 2, NULL, NULL, NULL, NULL, NULL, '', '2014-05-13', 24, 27, '2014-05-12', '2014-05-11', false, '');
INSERT INTO operaciones_diarias VALUES (68, 12, 41, 20, 19251, 82, NULL, NULL, 82, 'Dato de Recaudación suministrado al final de la semana', '2014-05-21', 1, 27, '2014-05-21', '2014-05-20', false, '0');
INSERT INTO operaciones_diarias VALUES (12, 1, 144, 10, 25000, 144, 32563, NULL, 144, '', '2014-04-28', 20, 7, '2014-04-28', '2014-04-27', false, NULL);
INSERT INTO operaciones_diarias VALUES (48, 1, 78, 25, 15516, 5524, 5242.5, 5645, NULL, '', '2014-05-07', 1, 7, '2014-05-05', '2014-05-04', false, '2');
INSERT INTO operaciones_diarias VALUES (58, 1, 54, 6, 78980, 8, 78978.296875, 2500, NULL, '', '2014-05-12', 1, 7, '2014-05-12', '2014-05-11', false, '8');
INSERT INTO operaciones_diarias VALUES (61, 1, 25, 25, 700000, 3, 25896.19921875, 2587, NULL, '', '2014-05-13', 1, 7, '2014-05-13', '2014-05-12', false, '23');
INSERT INTO operaciones_diarias VALUES (73, 1, 25, 2, 2345, 25, 3945, NULL, 25, 'sin novedad', '2014-05-21', 1, 7, '2014-05-21', '2014-05-20', false, 'n/a');
INSERT INTO operaciones_diarias VALUES (70, 3, 4, 0, 63977, 4, NULL, 7, 4, 'El monto recaudado es suministrado al final de la semana', '2014-05-21', 1, 8, '2014-05-21', '2014-05-20', false, '0');
INSERT INTO operaciones_diarias VALUES (44, 5, 45, 2, 15458, NULL, 265.299987792968977, 12545, NULL, '', '2014-05-07', 1, 16, '2014-05-05', '2014-05-04', false, '2');
INSERT INTO operaciones_diarias VALUES (45, 5, 12, 23, 154812, NULL, 23326.400390625, 212125, NULL, '', '2014-05-07', 1, 16, '2014-05-06', '2014-05-05', false, '12');
INSERT INTO operaciones_diarias VALUES (46, 5, 85, 70, 287527, 252, 752, 5272, NULL, ' ', '2014-05-07', 1, 16, '2014-05-07', '2014-05-06', false, '2');
INSERT INTO operaciones_diarias VALUES (49, 7, 102, 23, 600000, NULL, 78956.1015625, 25695, NULL, '', '2014-05-07', 1, 20, '2014-05-05', '2014-05-04', false, '3');
INSERT INTO operaciones_diarias VALUES (54, 7, 256, 55, 256398, NULL, 583.599975585937955, 58589, NULL, '', '2014-05-07', 1, 20, '2014-05-06', '2014-05-05', false, '2');
INSERT INTO operaciones_diarias VALUES (69, 7, 107, 9, 84945, 109, 140928, NULL, 109, 'Sin novedad, ', '2014-05-21', 1, 20, '2014-05-21', '2014-05-20', false, '0');
INSERT INTO operaciones_diarias VALUES (55, 7, 89, 2, 256321, NULL, 12589.2998046875, 26565, NULL, '', '2014-05-07', 1, 20, '2014-05-07', '2014-05-06', false, '1');
INSERT INTO operaciones_diarias VALUES (67, 13, 39, 75, 13842, 43, 54575, 133, 43, 'Sin Novedad ', '2014-05-21', 1, 25, '2014-05-21', '2014-05-20', true, '3');
INSERT INTO operaciones_diarias VALUES (76, 13, 34, 78, 14479, 60, 57070, 133, 42, ' Prueba_2', '2014-05-22', 1, 25, '2014-05-22', '2014-05-21', true, '5');
INSERT INTO operaciones_diarias VALUES (72, 8, 18, 0, 14218, 20, 35546, 60, 20, 'Sin Novedad', '2014-05-21', 1, 26, '2014-05-21', '2014-05-20', true, '2');
INSERT INTO operaciones_diarias VALUES (71, 5, 19, 0, 2365, 19, NULL, NULL, NULL, 'sin novedad', '2014-05-21', 1, 15, '2014-05-21', '2014-05-20', false, '0');
INSERT INTO operaciones_diarias VALUES (77, 5, 77, 77, 7777, 42412, NULL, 145, 144, 'Prueba 22/05/14', '2014-05-22', 1, 15, '2014-05-22', '2014-05-21', false, '777');
INSERT INTO operaciones_diarias VALUES (78, 5, 456786, 686, 6876876, 8678678, NULL, 678678, 56786, 'Prueba de 22/05/14', '2014-05-22', 1, 15, '2014-05-22', '2014-05-21', false, '68686');
INSERT INTO operaciones_diarias VALUES (80, 1, 78, 2, 535388, 78, NULL, 44, 78, 'Prueba_22/05/14', '2014-05-22', 1, 2, '2014-05-22', '2014-05-21', false, 'n/a');
INSERT INTO operaciones_diarias VALUES (81, 11, 25, 3, 10000, 25, 40000, 200, 25, 'NINGUNO', '2014-05-22', 1, 22, '2014-05-22', '2014-05-21', true, '25');
INSERT INTO operaciones_diarias VALUES (82, 11, 5, 6, 78, 85, 0, 88, 55, '   ', '2014-05-23', 1, 22, '2014-05-23', '2014-05-22', true, '0');
INSERT INTO operaciones_diarias VALUES (83, 11, 1, 1, 1, 1, NULL, NULL, NULL, 'probando recaudación cero', '2014-05-26', 1, 22, '2014-05-26', '2014-05-25', false, '1');
INSERT INTO operaciones_diarias VALUES (84, 1, 72, 8, 2986, 78, 3587, 595, 37, 'Prueba', '2014-05-27', 1, 1, '2014-05-27', '2014-05-26', true, 'N/A');
INSERT INTO operaciones_diarias VALUES (85, 11, 1, 1, 895, 65, -1, 52252, 1, '', '2014-06-02', 1, 22, '2014-06-02', '2014-06-01', false, '1');
INSERT INTO operaciones_diarias VALUES (79, 10, 8, 12, 2889, 12, 6411, 40, 12, 'prueba 22/', '2014-05-22', 1, 39, '2014-05-22', '2014-05-21', true, '0');
INSERT INTO operaciones_diarias VALUES (62, 12, 85, 5, 21350, 78, NULL, NULL, 85, ' Sin Novedad', '2014-05-15', 1, 27, '2014-05-13', '2014-05-12', false, 'N/A');
INSERT INTO operaciones_diarias VALUES (74, 5, 20, 14, 22428, 19, NULL, 13, 22, '  El dia 19 en horas de la tarde, se presentó cercano a la estación carrizal una protesta pacifica de al rededor 15 personas, sin daños mayores en las instalaciones del sistema. ', '2014-05-22', 1, 16, '2014-05-21', '2014-05-20', false, '0');
INSERT INTO operaciones_diarias VALUES (86, 4, 6, 0, 45678, 6, 28456, 86, 3, 'prueba', '2014-06-06', 1, 10, '2014-06-06', '2014-06-05', true, 'N/A');
INSERT INTO operaciones_diarias VALUES (14, 1, 2, 2, 21400, 2, 5560, 256, 2, ' ', '2014-06-09', 21, 3, '2014-04-28', '2014-04-27', true, 'N/A');
INSERT INTO operaciones_diarias VALUES (88, 28, 26, 26, NULL, NULL, 58.3999999999999986, 25.3599999999999994, NULL, ' preba km float', '2014-06-10', 1, 50, '2014-06-10', '2014-06-09', false, 'n/a');
INSERT INTO operaciones_diarias VALUES (87, 1, 19, 5, 2346, 5, 1567, 456, 8, 'prueba', '2014-06-16', 1, 7, '2014-06-16', '2014-06-15', true, '8');
INSERT INTO operaciones_diarias VALUES (89, 30, 20, 0, 23568, 20, 2356858, 145.22999999999999, 20, 'Modelo para Guia de Ussuario ', '2014-06-25', 1, 24, '2014-06-25', '2014-06-24', true, '21');
INSERT INTO operaciones_diarias VALUES (90, 30, 20, 2, 2356, 20, 235648, 23.1999999999999993, 20, 'Modelo para seguimiento semanal con desglose diario Lunes ', '2014-06-25', 1, 24, '2014-06-16', '2014-06-15', true, '21');
INSERT INTO operaciones_diarias VALUES (91, 30, 20, 2, 23145, 20, 12345, 23.1999999999999993, 20, 'Modelo para Seguimiento Semanal con Desglose Diário Martes ', '2014-06-25', 1, 24, '2014-06-17', '2014-06-16', true, '21');
INSERT INTO operaciones_diarias VALUES (92, 30, 20, 2, 23457, 20, 234587, 23.1999999999999993, 20, 'Modelo para Seguimiento Semanal con desgose Diario Miercoles', '2014-06-25', 1, 24, '2014-06-18', '2014-06-17', true, '21');
INSERT INTO operaciones_diarias VALUES (93, 30, 20, 2, 124587, 20, 212457, 23.1999999999999993, 20, 'Modelo para Seguimiento semanal con Desglose diario Jueves ', '2014-06-25', 1, 24, '2014-06-19', '2014-06-18', true, '21');
INSERT INTO operaciones_diarias VALUES (94, 30, 20, 2, 232458, 20, 212454, 23.1999999999999993, 20, 'Modelo para Seguimiento Semanal con Desglose Diario Viernes ', '2014-06-25', 1, 24, '2014-06-20', '2014-06-19', true, '21');


--
-- TOC entry 2034 (class 0 OID 58975)
-- Dependencies: 176
-- Data for Name: operadora; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO operadora VALUES (11, 'TRANSAMAZONAS', true);
INSERT INTO operadora VALUES (2, 'INSTITUTOS DE FERROCARRILES DEL ESTADO', true);
INSERT INTO operadora VALUES (3, 'METRO DE VALENCIA C.A.', true);
INSERT INTO operadora VALUES (4, 'METRO MARACAIBO C.A.', true);
INSERT INTO operadora VALUES (1, 'METRO DE CARACAS C.A.', true);
INSERT INTO operadora VALUES (5, 'TROMERCA', true);
INSERT INTO operadora VALUES (10, 'BUS TAGUANES', true);
INSERT INTO operadora VALUES (12, 'TRANSBOLIVAR', true);
INSERT INTO operadora VALUES (7, 'TRANSBARCA', true);
INSERT INTO operadora VALUES (6, 'SITSSA', true);
INSERT INTO operadora VALUES (8, 'BUS BARINAS', true);
INSERT INTO operadora VALUES (9, 'BUS CUMANA', true);
INSERT INTO operadora VALUES (14, 'TRANSFALCON', true);
INSERT INTO operadora VALUES (15, 'TRANSPOPUERTO ', true);
INSERT INTO operadora VALUES (16, 'BUS YARACUY', true);
INSERT INTO operadora VALUES (17, 'TRANSMONAGAS', true);
INSERT INTO operadora VALUES (19, 'TRANSGUAJIRA', true);
INSERT INTO operadora VALUES (20, 'TRANSCOL', true);
INSERT INTO operadora VALUES (21, 'TRANSSUR', true);
INSERT INTO operadora VALUES (23, 'TRANSCARABOBO', true);
INSERT INTO operadora VALUES (25, 'BUS MARGARITA', true);
INSERT INTO operadora VALUES (27, 'BUS CARUPANO', true);
INSERT INTO operadora VALUES (29, 'BUS GUARICO', true);
INSERT INTO operadora VALUES (30, 'BUS APURE ', true);
INSERT INTO operadora VALUES (32, 'BUS PORTUGUESA', true);
INSERT INTO operadora VALUES (26, 'TRANSDELTA', true);
INSERT INTO operadora VALUES (33, 'BUS TRUJILLO', true);
INSERT INTO operadora VALUES (22, 'TRANSANZOATEGUI', true);
INSERT INTO operadora VALUES (13, 'TRANSARAGUA', true);
INSERT INTO operadora VALUES (28, 'TRANSTÁCHIRA', true);


--
-- TOC entry 2041 (class 0 OID 59029)
-- Dependencies: 190
-- Data for Name: operadora_mod_transp; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO operadora_mod_transp VALUES (2, 1, 4, 'SISTEMA ATR (AUTOBUSES DE TRÁNSITO RÁPIDO)');
INSERT INTO operadora_mod_transp VALUES (4, 1, 6, 'SISTEMAS NO CONVENCIONALES');
INSERT INTO operadora_mod_transp VALUES (5, 2, 3, 'SISTEMA DE CERCANÍA');
INSERT INTO operadora_mod_transp VALUES (6, 3, 2, 'SISTEMAS METRO LIGERO');
INSERT INTO operadora_mod_transp VALUES (7, 3, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (8, 4, 2, 'SISTEMAS METRO LIGERO');
INSERT INTO operadora_mod_transp VALUES (9, 4, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (10, 5, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (11, 5, 6, 'SISTEMAS NO CONVENCIONALES');
INSERT INTO operadora_mod_transp VALUES (12, 5, 4, 'SISTEMA ATR (AUTOBUSES DE TRÁNSITO RÁPIDO)');
INSERT INTO operadora_mod_transp VALUES (1, 1, 1, 'SISTEMAS METRO PESADO');
INSERT INTO operadora_mod_transp VALUES (3, 1, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (13, 6, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (14, 7, 4, 'SISTEMA ATR (AUTOBUSES DE TRÁNSITO RÁPIDO)');
INSERT INTO operadora_mod_transp VALUES (15, 8, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (16, 9, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (17, 10, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (18, 11, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (19, 12, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (20, 13, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (21, 14, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (22, 15, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (23, 16, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (24, 17, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (25, 18, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (26, 19, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (27, 20, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (28, 21, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (29, 22, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (30, 23, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (31, 24, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (32, 25, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (33, 26, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (34, 27, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (35, 28, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (36, 29, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (37, 30, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (38, 31, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (39, 32, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (40, 7, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (41, 33, 5, 'SISTEMAS SUPERFICIALES');
INSERT INTO operadora_mod_transp VALUES (42, 34, 5, 'SISTEMAS SUPERFICIALES');


--
-- TOC entry 2035 (class 0 OID 58982)
-- Dependencies: 178
-- Data for Name: operativo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO operativo VALUES (1, NULL, 'UNICA LÍNEA PARTIENDO DE PETARE II HASTA WARAIRAREPANO', '3 MINUTOS 30 SEG APROX', 4, 'ALIMENTACIÓN ELÉCTRICA', NULL, '05:30 AM - 10:00 PM', 'ACTUALMENTE SE RESGUARDA UN TREN EN LA ESTACIÓN PETARE II Y OTRO EN LA ESATCIÓN 5 DE JULIO. EL PROYECTO FINAL CONTEMPLA LA CONSTRUCCIÓN DE UN PATIO EN LA ESTACIÓN WARAIRA REPANO DE CABLETREN BOLIVARIANO', NULL, NULL, NULL, 'SISTEMA QUE CONSTA DE 5 ESTACIONES CON TECNOLOGÍA DE CIRCULACIÓN CONTINUA', '200 PASAJEROS', NULL, 'TREN DE 4 VAGONES', 'NO APLICA', '4 TRENES', 'DOS (2)', '1,8 KM');
INSERT INTO operativo VALUES (2, NULL, 'OPERA EN DOS TRAMOS PARQUE CENTRAL - CEIBA Y CEIBA - SAN AGUSTIN', '20 MINUTOS APROX', 50, 'ALIMENTACIÓN ELÉCTRICA', NULL, '6:00 AM - 10:00 PM', '1 PATIO Y TALLER UBICADO EN PARQUE CENTRAL', NULL, NULL, NULL, 'SISTEMA TIPO TELEFERICO, UN TRAMO QUE CONSTA CON 5 ESTACIONES', '8 PASAJEROS POR CABINAS', NULL, 'FUNICULARES O CABINAS', 'NO APLICA', '50 CABINAS', 'UNA (1) ', '2,1 KM');
INSERT INTO operativo VALUES (3, NULL, 'EL SISTEMA CONSTA DE (2) DOS TRAMOS: UN TRAMO EXPRESO Y OTRO QUE CONSTA DE 4 ESTACIONES', '17 MINUTOS APROX', 144, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'DE LUN A SAB: 05:30 AM A 22:00 PM
DOMINGO: 13:00 PM A 22:00 PM', '1 PATIO Y TALLER UBICADO EN MARICHE', NULL, NULL, NULL, 'SISTEMA TIPO TELEFERICO, CONSTA DE DOS TRAMOS: 1 TRAMO LOCAL QUE CONSTA DE 5 ESTACIONES Y UN TRAMO EXPRESO', '8 PASAJEROS POR CABINAS', NULL, 'FUNICULARES O CABINAS', 'NO APLICA', '144 CABINAS', 'EL SISTEMA CONSTA DE (2) DOS TRAMOS: UN TRAMO EXPRESO Y OTRO QUE CONSTA DE 4 ESTACIONES', '4,84 KM');
INSERT INTO operativo VALUES (4, NULL, 'LÍNEA 1: PROPATRIA - PALOVERDE
LÍNEA 2: ZONA RENTAL - LAS ADJUNTAS/ ZONA RENTAL - ZOOLÓGICO
LÍNEA 3: ZONA RENTAL - LA RINCONADA
LÍNEA 4: ZONA RENTAL', 'LÍNEA 1: 75 MIN
LÍNEA 2: 63 MIN
LÍNEA 3: 41 MIN
LÍNEA 4: 21 MIN', 57, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'DE LUNES A DOMINGO DE 05:30 AM - 11:00 PM', '2 PATIOS Y TALLERES: ESTACIÓN PROPATRIA (AV. SIMÓN BOLIVAR - CATIA). ESTACIÓN LAS ADJUNTAS: (AV. PRINCIPAL DE RUIZ PINEDA)  ', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE MASIVO, QUE  CONECTA EL ÁREA METROPOLITANA DE CARACAS, EN SENTIDO OESTE - ESTE Y SUR - NORTE A TRAVÉS DE SUS CUATRO (04) LÍNEAS CONSTRUIDAS Y EN OPERACIÓN COMERCIAL', 'LÍNEA 1: 1.260 PASAJEROS
LÍNEA 2,3 Y 4: 1.080', NULL, 'TREN DE 7 VAGONES', 'NO APLICA', '57 TRENES', 'LÍNEA 1: 22 ESTACIONES
LÍNEA 2: 13 ESTACIONES
LÍNEA 3: 8 ESTACIONES
LÍNEA 4: 4 ESTACIONES', 'LÍNEA 1: 20,36 KM
LÍNEA 2 Y 4: 22,68 KM
LÍNEA 3: 10,47 KM');
INSERT INTO operativo VALUES (5, NULL, 'LÍNEA 1: 2 ESTACIONES
LÍNEA 2: 2 ESTACIONES (5 EN CONSTRUCCIÓN)
LÍNEA 3: 5 ESTACIONES (EN CONSTRUCCIÓN)', 'LÍNEA 1: 10 MIN
LÍNEA 2: 3 MIN
LÍNEA 3: N/A', 6, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'DE LUNES A DOMINGO DE 05:30 AM - 11:00 PM', 'ACTUALMENTE, RESGUARDAN LOS TRENES EN EL PATIO LAS ADJUNTAS DE LÍNEA 2 DEL METRO DE CARACAS. PATIO PARA ESTE SISTEMA PROYECTADO EN EL SECTOR EL CHORRITO FUTURA ESTACIÓN AYACUCHO', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE MASIVO METROPOLITANO, QUE CONECTA A LOS ALTOS MIRANDINOS CON LA CIUDAD DE CARACAS, CONSTA DE TRES (03) LÍNEAS PARA UN TOTAL DE 42 KM DE VÍA FERREA CON 15 ESTACIONES.', '1.696 PASAJEROS', NULL, 'TREN DE 4 VAGONES', 'NO APLICA', '6 TRENES', 'LÍNEA 1: LAS ADJUNTAS - ALÍ PRIMERA
LÍNEA 2: GUAICAIPURO -  SAN ANTONIO (5 ESTACIONES EN CONSTRUCCIÓN)
LÍNEA 3: ROSALITO - PANAMERICANA (NO OPERATIVA - EN CONSTRUCCIÓN)', 'LÍNEA 1: 9,5 KM
LÍNEA 2 y LÍNEA 3: 32,5 KM');
INSERT INTO operativo VALUES (7, NULL, 'UNA LÍNEA: 3 ESTACIONES
ESTACIÓN DE CONEXIÓN CON LÍNEA 1: LOS CONQUISTADORES
ESTACIÓN MÉRIDA Y
ESTACIÓN SAN JACINTO', '2,45 MINUTOS, A UNA VELOCIDAD DE 4,5MTS/SEG', 21, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'LUNEA -VIERNES: 6:00 a 9:30 AM/ 11:00 AM a 2:00 PM/ 5:00 PM a 8:00 PM                                                                                                                           SÁBADO: 7:00 AM a 12:00 PM
FERIADOS: 10:00 AM a 4:00 PM', 'CUENTAN CON UN PARKING QUE PERMITE EL RESGUARDO DE LAS CABINAS,  SE ENCUENTRA EN ETAPA DE DISEÑO EL ÁREA DE TALLER.', NULL, NULL, NULL, 'SISTEMA TIPO TELEFERICO, CONSTA DE TRES ESTACIONES', 'OCHO (8) PERSONAS POR CABINA', NULL, 'FUNICULARES O CABINAS', 'NO APLICA', '21 CABINAS', 'UNA LÍNEA: 3 ESTACIONES', '443,34 MTS');
INSERT INTO operativo VALUES (8, NULL, '1- 00200 Tamarindo-California 
2- 00201  La Vaquera- La California
3- 00202 27 de Febrero-California
4- 00203 Terminal de Trapichito-California 
5- 00204 Nueva Casarapa-California
6- 00205 Terminal de Guatire-California
7- 00206 Terrinca-California
8- 00207 Miranda-Guarenas', '113'' (1h 53'')
107'' (1h 47'')
114'' (1h  54'')
120'' (2h)
142'' (2h 22'')
150'' (2h 30'')
157'' (2h 37'')
138'' (2h 18'')', 48, 'DIESEL', NULL, 'LUNES A VIERNES DE 05:30 AM A 9:00AM Y DE 16:00 PM A 21:00 PM.', 'PATIO EL INGENIO, GUATIRE, MUNPO. ZAMORA', NULL, NULL, NULL, 'RUTAS URBANAS', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '48', '-', 'OCHO RUTAS (8)', '-');
INSERT INTO operativo VALUES (9, NULL, 'UNA RUTA: 00100 BUS CARIBIA-GATO NEGRO', '135'' (2H 15'')', 13, 'DIESEL', NULL, 'LUNES A VIERNES DE 05:30 AM A 9:00AM Y DE 16:00 PM A 21:00 PM.', 'PATIO DE CAÑO AMARILLO', NULL, NULL, NULL, 'SUBURBANO', '50 PASAJEROS', NULL, 'MINIBUS 8 MTS', '13', '-', 'UNA RUTA', '-');
INSERT INTO operativo VALUES (10, NULL, '1- 00101 CATIA LA MAR - EL SILENCIO
2- 00102 TANAGUARENAS - EL SILENCIO
3- 00103 AEROPUERTO NACIONAL-PARQUE CENTRA', '135 min (2h 15'')
323 min. (5h 23'')
145 min. (2h 25'')', 45, 'DIESEL', NULL, 'LUNES A VIERNES DE 05:30 AM A 9:00AM Y DE 16:00 PM A 21:00 PM.', 'PATIO DE CAMURÍ CHICO', NULL, NULL, NULL, 'URBANA Y SUBURBANA', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '45', '-', 'TRES RUTAS (3)', '-');
INSERT INTO operativo VALUES (11, NULL, '1- 00300  LA VICTORIA - INDEPENDENCIA 
2- 00301  PARACOTO -INDEPENDENCIA 
3- 00302  ALÍ PRIMERA-SAN PEDRO-EL PLACER
4- 00303 AYACUCHO - ALÍ PRIMERA', '262 min. (4h 22'')
248 min. (4h 08'')
86 min. (1h 26'')
54 min. (0h 54'')', 29, 'DIESEL', NULL, 'LUNES A VIERNES DE 05:30 AM A 9:00AM Y DE 16:00 PM A 21:00 PM.', 'PATIO EL PASO, LOS TEQUES', NULL, NULL, NULL, '3 RUTAS URBANAS Y 1 RUTA INTERURBANA', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '29', '-', 'CUATRO RUTAS (4)', '-');
INSERT INTO operativo VALUES (12, NULL, '1- 00400  HIGUEROTE-PARQUE MIRANDA
2- 00401  RIO CHICO-PARQUE MIRANDA', '273 min. (4h 33'')
300 min. (5 h)', 30, 'DIESEL', NULL, 'LUNES A VIERNES DE 05:30 AM A 9:00AM Y DE 16:00 PM A 21:00 PM.', 'PATIO DE MAMPORAL', NULL, NULL, NULL, 'SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS ', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '30', '-', 'DOS (2)', NULL);
INSERT INTO operativo VALUES (13, NULL, '00601 SANTA TERESA-NUEVO CIRCO
00602  CARTANAL-NUEVO CIRCO', '236 min.  (3h 56'')
210 min. (3h 30'')', 29, 'DIESEL', NULL, 'LUNES A VIERNES DE 05:30 AM A 9:00AM Y DE 16:00 PM A 21:00 PM.', 'PATIO DE CHARALLAVE', NULL, NULL, NULL, 'SERVICIO SUBURBANO EXTERNO AL AREA METROPOLITANA DE CARACAS ', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '29', '-', 'DOS (2)', NULL);
INSERT INTO operativo VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO operativo VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO operativo VALUES (16, NULL, 'LINEA 1 (ECSB-LAS TRINITARIAS)
LINEA 2 (ECSB - STA. ROSA) - 
101 (CALLE 51 - TAMACA) - 
201 (CALLE 51 - ECSB) -
601 (ECSB - VILLA CREPUSCULAR) - 
801 (CALLE 51 - CABUDARE CENTRO) - 
802 (CALLE 51 - LA PIEDAD) - 
901 (CALLE 51 - LA CARUCIEÑA)', 'LÍNEA 1: 160    MINUTOS
RUTA 101: 160 MINUTOS
RUTA 201: 100 MINUTOS
RUTA 601: 135 MINUTOS', 166, 'GAS', NULL, '6:00 AM - 10:30 PM', '3 PATIOS, 1 ÁREA DE LAVADO, EL TALLER ESTÁ EN CONSTRUCCIÓN', NULL, NULL, NULL, '2 RUTAS TRONCALES,
6 RUTAS ALIMENTADORAS  URBANAS,
2 DE LAS RUTAS ALIMENTADORAS 801 Y 802 SON HACIA OTRO MUNICIPIO) ', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '166', '0', 'RUTAS TRONCALES: DE 15 A 20 UNIDADES
ALIMENTADORAS DE 6 A 12 UNIDADES
RUTAS FORANEAS 4 UNIDADES', '245 KMS  APROXIMADAMENTE TODAS LAS RUTAS');
INSERT INTO operativo VALUES (17, NULL, '16 RUTAS ', 'VARIABLE DEPENDIENDO SI LA RUTA ES URBANA E INTERURBANA', 68, 'DIESEL', NULL, 'DE 6 am a 11am y de 2pm a 7pm', 'EN CONSTRUCCIÓN ', NULL, NULL, NULL, 'RUTAS INTERURBANAS Y SUBURBANAS', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '50', '18', '16 RUTAS', '321,2 KM APROX. ');
INSERT INTO operativo VALUES (18, NULL, 'UN TOTAL DE 3
1 FERRY- BRASIL 
2 FERRY- EL PEÑÓN
3 FERRY-LA LLANADA ', NULL, 42, 'DIESEL Y GAS', NULL, '06:30 AM - 7:30 PM', 'EN CONSTRUCCIÓN', NULL, NULL, NULL, 'RUTAS INTERURBANAS Y SUBURBANAS', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '42', '0', '3 RUTAS', 'LINEA 1: 31,76 KM
LINEA 2: 18,4 KM
LÍNEA 3: 16 KM');
INSERT INTO operativo VALUES (20, NULL, 'RUTA 1:   CIUDAD TAVACARE-UNELLEZ-CENTRO
RUTA 2:   CIUDAD VARYNA -AV. CUATRICENTENARIO-CENTRO
RUTA 3:   TERRAZA SANTO DOMINGO-CENTRO PUNTA GORDA', 'UNA HORA POR CADA RUTA APROXIMADAMENTE', 20, 'DIESEL', NULL, 'DE LUNES A VIERVES 5:30 AM  8:00 PM', 'UN PATIO Y UN TALLER PRESTADO POR EL INSTITUTO DE VIALIDAD DEL ESTADO BARINAS', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE SUPERIFICIAL URBANO ', '25 PASAJEROS SENTADOS
25 PASAJEROS DE PIE', NULL, 'MINIYUTONG', '20', NULL, 'RUTA 1:  7  UNIDADES
RUTA 2:  5  UNIDADES
RUTA 3:  6  UNIDADES', 'LÍNEA 1:  13,00KMS.
LINEA 2:   18,3 KMS.
LINEA 3:   39,5 KMS.');
INSERT INTO operativo VALUES (21, NULL, '6  RUTAS', 'RUTA 1: 2 HORAS
RUTA 2: 1 HORA 30 MINUTOS
RUTA 3: 3 HORAS
RUTA 4: 50 MINUTOS
RUTA 5: 1 HORA 49 MINUTOS
RUTA 6: 55 MINUTOS', 25, 'DIESEL', NULL, '6:00 AM  HASTA 9:00 PM', 'NO SE CUENTA AÚN', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE SUPERIFICIAL URBANO ', '80 PASAJEROS', NULL, 'BUSES YUTONG', '25', NULL, 'RUTA 1:  5  UNIDADES
RUTA 2:  4  UNIDADES
RUTA 3:  4  UNIDADES
RUTA 4:  4   UNIDADES
RUTA 5:  4   UNIDADES
RUTA 6:  4   UNIDADES', 'LÍNEA 1:   25,8,KMS.
LINEA 2:   18,5 KMS.
LINEA 3:   53,90 KMS.
LINEA 4:   12,20 KMS.
LINEA 5:    27,6  KMS.
LINEA 6:    19,80 KMS.');
INSERT INTO operativo VALUES (22, NULL, ' UNA LÍNEA  (ALTOS DE LA VANEGA HASTA  LIBERTADOR)', '12   MINUTOS', 6, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'LUNES A VIERNES:  06:00AM - 8:00 PM 
SÁB.-DOM. FERIADO:   8:OOAM A 6:00PM', 'UN ÁREA DE PATIOS Y TALLERES UBICADOS EN AV. DON MANUEL BELLOSO, SECTOR ALTOS DE LA VANEGA', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE MASIVO QUE CONSTA DE 4 ESTACIONES SUPERICIALES Y  2 ELEVADAS SOBRE VIADUCTO (URDANETA Y LIBERTADOR)', '600 PASAJEROS POR TREN', NULL, 'TREN 3 VAGONES', NULL, '6  TRENES', '6  ESTACIONES', '6,5   KM ');
INSERT INTO operativo VALUES (23, NULL, 'RUTA 1:   ALTOS VANEGAS-KMS 4
RUTA 2:   TERMINAL SIMÓN BOLIVAR-SAN FRANCISCO
RUTA 3:   ESTACIÓN URDANETA-CUATRICENTENARIO', 'UNA HORA POR CADA RUTA APROXIMADAMENTE', 85, 'GAS -DIESEL

DIESEL', NULL, 'LUNES A VIERNES:  5:30 AM  HASTA 8:30 PM
SÁBADO-DOMINGO: 7:30 AM HASTA 60:00 PM', 'PATIO Y TALLER, PROVISIONAL,   DE ESTACIONAMIENTO EDIFICIO METRO DE MARACAIBO', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE SUPERIFICIAL URBANO ', '80 PASAJEROS

50 PASAJEROS', NULL, 'BUS YUTONG 
   
MINIBUSES YUTONG', '65

20', NULL, 'RUTA 1:  15  UNIDADES
RUTA 2:  15  UNIDADES
RUTA 3:  15  UNIDADES', 'LÍNEA 1:  28,00 KMS.
LINEA 2:   17,00 KMS.
LINEA 3:   24,00  KMS.');
INSERT INTO operativo VALUES (24, NULL, 'LÍNEA UNO  (MONUMENTAL -LAS FERIAS-PALOTAL-SANTA ROSA-MICHELENA- LARA- CEDEÑO)', '16 MINUTOS', 4, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'LUNES A VIERNES:  06:00AM - 8:30 PM 
SÁB.-DOM. 6:OOAM A 7:30PM', '1 PATIO CON SU TALLER INTEGRAL DE MANTENIMIENTO, UBICADO EN LA AV. SEQUICENTENARIA, LOCAL PARQUE RECREACIONAL SUR, PARTE SUR-OESTE S/N, SUR VALENCIA.', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE MASIVO QUE CONSTA DE 7 ESTACIONES, 1 SUBESTACIÓN ELÉCTRICA', '500 PASAJEROS POR TREN', NULL, 'TREN 4 VAGONES', NULL, '4  TRENES', '4 TRENES', '6,3 KM DESDE PATIO ');
INSERT INTO operativo VALUES (25, NULL, '11 RUTAS URBANAS  ( 6 MUNICIPIO CARONI, 5 MUNICIPIO HERES)
3 RUTAS INTERURBANAS (CIUDAD BOLIVAR -SANTA ELENA DE UAIREN / UPATA-CIUDAD BOLIVAR / CIUDAD BOLIVAR -TUMEREMO)', 'URBANAS:  PROMEDIO   1 1/2 HORA', 214, '
DIESEL
DIESEL
DIESEL
DIESEL /', NULL, 'LUNES A SÁBADO:  05:00AM - 12:00 M / 
12:00 M A 7:30 PM', '1 PATIO Y TALLER, TALLER CON 2 FOSAS ÁREA LAVADO PARA 4 UNIDADES,  PATIO ESTACIONAR 170 UNIDADES, UBICADO EN AV. NORTE SUR I,  AL LADO TERMINAL PASAJEROS UNARE I, PUERTO ORDAZ.', NULL, NULL, NULL, ' SISTEMA SUPERFICIAL RUTAS URBANAS E INTERURBANAS', '
45 PUESTOS
50 PUESTOS
50 PUESTOS
39 SENTADOS, 30 DE PIE', NULL, 'VIALES
PULLMAN
VOLARES
YUTONG', '



62

', '
20
60
10
62

', '64 UNIDADES RUTAS URBANAS
5 RUTAS INTERURBANAS
4 COMERCIALES
4 TRANSPORTE
18 RESERVA', 'RUTAS URBANAS: MAX: 80 KMS, MIN. 17,6 KMS
RUTAS INTERURBANAS:  MAX. 735 KMS,   MIN. 92 KMS');
INSERT INTO operativo VALUES (26, NULL, 'RUTA 1:   BICENTENARIO
RUTA 2:   LIBERTADOR
RUTA 3:   MARAVEN
RUTA 4:    FEDERACIÓN', 'RUTA 1:  90 MINUTOS
RUTA 2:  30 MINUTOS
RUTA 3:  40 MINUTOS
RUTA 4:  90 MINUTOS', 14, 'DIESEL', NULL, 'LUNES A VIERNES:  6:00 AM  HASTA 8:00 PM
SÁBADO: 6:00 AM  HASTA 6:00 PM
DÓMINGO: 6:00 AM HASTA 1:00 PM', '2 PATIOS PROVISIONALES: 
AV. 6 SECTOR MARAVEN, MUNICIPIO CARIRUBANA, TERMINAL PASAJEROS CIUDAD DE PUNTO FIJO, EN ANDENES HABILITADOS PARA LAS UNIDADES, MUNICIPIO MIRANDA EN CORO.
INSTALACIONES DEL BATALLÓN GIRARDOT, MUNICIPIO MIRANDA EN CORO.', NULL, NULL, NULL, 'URBANA  E INTERURBANA', '80 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS', '14', '0', 'RUTA 1:   2  UNIDADES
RUTA 2:   2  UNIDADES
RUTA 3:   2  UNIDADES
RUTA 4:   2 UNIDADES', 'LÍNEA 1:   35  KMS.
LINEA 2:    25 KMS.
LINEA 3:   29  KMS.
LINEA 4:   30  KMS.');
INSERT INTO operativo VALUES (27, NULL, 'RUTA 1:   MARACAIBO-SANTA CRUZ DE MARA-NUEVA LUCHA EL MOJÁN
RUTA 2:   EL MOJÁN-SINAMAICA-LAS GUARDIAS-PARAGUAIPOA
RUTA 3:   MARACAIBO-SANTA CRUZ-NUEVA LUCHA- CARRASQUERO', 'RUTA 1:  3, HORAS, 7 MINUTOS
RUTA 2:  3  HORAS,  3 MINUTOS
RUTA 3:  3   HORAS, 77 MINUTOS', 10, '


DIESEL

', NULL, 'LUNES A VIERNES:  5:30 AM  HASTA 8:30 PM
SÁBADO-DOMINGO: 7:30 AM HASTA 6:00 PM', 'PATIO Y TALLER, PROVISIONAL,   DE ESTACIONAMIENTO EDIFICIO METRO DE MARACAIBO', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE SUPERFICIAL  INTERURBANO', '50 PASAJEROS', NULL, '
   
MINIBUSES YUTONG', '


10', NULL, 'RUTA 1:  22  UNIDADES
RUTA 2:  21  UNIDADES
RUTA 3:  37  UNIDADES', 'LÍNEA 1:   KMS.
LINEA 2:    KMS.
LINEA 3:    KMS.');
INSERT INTO operativo VALUES (28, NULL, 'RUTA 1: SANTA CRUZ-LAS LLAVES-SAN ESTEBAN-AV PAZ TERMINAL CENTRO
RUTA 2: SAN JOSÉ-SORPRESA-LIBERTAD
RUTA 3: EL CAMBUR Y LOS LANCEROS-EL PALITO-AV LA PAZ CENTRO TERMINAL
RUTA 4 TURÍSTICA:  GAÑANGO-BORBURATA-GAÑANGO', 'LINEA 1: 1 HORA 50 MINUTOS
LINEA 2: 1 HORA 40 MINUTOS
LINEA 3: 1 HORA 30 MINUTOS
LINEA 4: 1 HORA 30 MINUTOS', 28, '
DIESEL
DIESEL
', NULL, NULL, 'EN EL TERMINAL DE PASAJEROS JUÁN JOSÉ FLORES ', NULL, NULL, NULL, 'URBANO-SUBURBANO-INTERURBANO', '80 PASAJEROS
50 PASAJEROS', NULL, 'BUSES YUTONG
MINIYUTONG
', '20
8
', NULL, 'LINEA 1:  5 UNIDADES
LINEA 2:  3 UNIDADES
LINEA 3:  5 UNIDADES
LINEA 4:  2 UNIDADES', 'LÍNEA 1: 22 KMS
LINEA 2: 22 KMS
LINEA 3: 55 KMS
LINEA 4: 30 KMS');
INSERT INTO operativo VALUES (29, NULL, 'RUTAS ALIMENTADORAS:  5 INTERURBANAS Y 2 RUTAS URBANAS', 'LAS 7 RUTAS ALIMENTADORAS:  
110   MINUTOS PROMEDIO ', 54, 'DIESEL

DIESEL', NULL, 'LUNES A VIERNES:  06:00AM HASTA 6:00 PM RUTAS INTERURBANAS
LUNES A VIERNES:
06:00 AM HASTA  9:00 PM, RUTAS URBANAS', '1 PATIO Y TALLER UBICADO AV CENTENARIO, SECTOR POZO HONDO', NULL, NULL, NULL, 'RUTAS ALIMENTADORAS: 5 INTERURBANAS (EJIDO, VIGIA, TOVAR, SANTA CRUZ DE MORA, MUCUBAJI Y AROPUEY);  2 URBANAS (SAN JACINTO, EL CHAMA, DON PERUCHO)', '24  PASAJEROS MINIYUTONG

39 PASAJEROS  BUS YUTONG', NULL, 'MINIYUTONG

BUS YUTONG', '24

30', '


', '5  RUTAS SUBURBANAS,  2   URBANAS ', 'INTERURBANAS: EJIDO-ARAPUEY 140 KMS;  EJIDO-SANTA CRUZ DE MORA 56 KMS; EJIDO EL VIGIA 61 KMS; EJIDO-TOVAR 86KMS; EJIDO-MUCUBAJI 79KMS.
URBANAS: DON PERUCHO-TROLCABLE 8 KMS;  CHAMA-TROLCABLE 10 KMS.');
INSERT INTO operativo VALUES (30, NULL, 'UNA LÍNEA ELÉCTRICA:   EJIDO HASTA MERCADO PERIFÉRICO', '90   MINUTOS TROLEBUS', 45, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'LUNES A SÁBADO:  06:00AM - 11:00 AM / 3:00 PM A 8:30 PM
DOM. FERIADO:   12:OOM A 7:30PM', '1 PATIO Y TALLER UBICADO AV CENTENARIO, SECTOR POZO HONDO', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE MASIVO INTEGRAL:  
TROLEBUS:  DESDE EJIDO HASTA MERCADO PERIFÉRICO ', '150 PASAJEROS TROLEBUS', NULL, '
TROLEBUS
   

', '




', '
45

', '1   LÍNEA ELÉCTRICA  (ARTICULA MUNICIPIO CAMPO ELIAS  Y LIBERTADOR)', '1 LÍNEA ELÉCTRICA :  12,66 KMS.');
INSERT INTO operativo VALUES (31, NULL, '12 RUTAS ALIMENTADORAS EN PROYECTO
ACTUALMENTE 7 RUTAS PILOTO (AV. CEDEÑO HASTA LOMAS DE FUNVAL)', '87 MIN POR RUTA', 30, 'DIESEL', NULL, 'LUNES A VIERNES:  06:00AM - 8:00 PM,RUTA PILOTO: 6:OO AM- 9:00 AM/ 4:00PM-7:OO PM.POSTERIORMENTE OPERARÁ CON EL HORARIO DEL SUBTERRÁNEO
SÁB.-DOM. FERIADO:   8:OOAM A 6:00PM', 'EN PROYECTO', NULL, NULL, NULL, 'URBANA', '37 PASAJEROS SENTADOS Y 10 PASAJEROS DE PIE', NULL, 'BUSES', '30 UNIDADES YUTONG', NULL, NULL, '21 KM APROX EN EL CIRCUITO PARA LA RUTA PILOTO');
INSERT INTO operativo VALUES (32, NULL, '3 CIRCUNVALACIONES: 1.- AVE. 23 DE ENERO. 2.- ORINOCO, AVE. ORINOCO-AVE. CONSTITUCIÓN,3.- MUELLE-PLAZA SUCRE, EJE NORTE PVON, EJER SUR (SAMARIAPO Y COROMOTO)', '80 MIN', 31, 'DIESEL', NULL, 'DE LUNES A VIERNES DE 6:30 AM A 19:30 PM', 'UN PATIO EN PROYECTO', NULL, NULL, NULL, 'SISTEMA DE TRANSPORTE MASIVO QUE CONSTA DE 4 ESTACIONES SUPERFICIALES Y  2 ELEVADAS SOBRE VIADUCTO (URDANETA Y LIBERTADOR)', 'EN IVECO: 26 SENTADOS, 26 DE PIE . YUTONG: 39 SENTADOS, 30 DE PIE', NULL, 'BUSES', '4 YUTONG, 27 IVECOS', NULL, '10 UNIDADES', '80 MIN');
INSERT INTO operativo VALUES (33, NULL, '4 RUTAS: SAN JACINTO, CAGUA, PALO NEGRO, TAPA-TAPA EN AMBOS SENTIDOS', 'EN PROMEDIO 2 HORAS Y 25 MINUTOS', 85, 'GAS', NULL, 'DE LUNES A SABADO DE 5:30 AM A 8:30 PM', 'UN PATIO EN CALIDAD DE PRÉSTAMO', NULL, NULL, NULL, 'URBANAS Y SUBURBANAS', '37 SENTADOS, 39 DE PIE', NULL, 'BUSES', '37 UNIDADES', '48', '10 UNIDADES', '40 KM');
INSERT INTO operativo VALUES (6, NULL, 'CARACAS - CÚA  ( UNA LÍNEA)', '36 MINUTOS APROX', 12, 'ALIMENTACIÓN ELÉCTRICA', NULL, 'LUNES -VIERNES: 4:30 AM 10:26 PM SÁBADO-DOMINGO-FERIADOS: 6:OO AM a 10:26 PM', 'UN PATIO Y UN TALLER CENTRAL DE REPARACIÓN', NULL, NULL, NULL, 'SISTEMA FERROVIARIO DE TRENES DE CERCANÍA', '922 PERSONAS', NULL, 'TREN DE 4 VAGONES', 'NO APLICA', '12 TRENES', 'UNICA LÍNEA: 4 ESTACIONES', '36,16 KMS');
INSERT INTO operativo VALUES (19, NULL, '1- RUTA VALERA - TRUJILLO
2- VALERA SABANA GRANDE 
3- TRUJILLO-VALERA-LA PUERTA', 'VALERA-TRUJILLO 55 MIN, 
VALERA-SABANA GRANDE 1 HORA 40 MIN 
TRUJILLO-VALERA-LA PUERTA 1 HORA Y 1/2', 50, 'DIESEL', NULL, 'DE 6:00 AM A 10:00 PM TRUJILLO-VALERA-LA PUERTA SABADOS, DOMINGOS Y DIAS FERIADOS 9:00AM Y 11:00AM, 4:00PM, 5:00PM Y 6:00PM', 'AV. PRINCIPAL DE BELLA VISTA, SEDE MPPTT', NULL, NULL, NULL, 'INTERURBANA', '80 PASAJEROS

50 PASAJEROS', NULL, 'BUS ESTADAR YUTONG 12 MTS y 

MINIBUSES YUTONG', '30 

20', '0', '10', 'VALERA-TRUJILLO 66 KM,  VALERA- SABANA GRANDE 124 KM 
TRUJILLO-VALERA-LA PUERTA 58 KM ');


--
-- TOC entry 2042 (class 0 OID 59035)
-- Dependencies: 192
-- Data for Name: pers_contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO pers_contacto VALUES (41, NULL, 1, 'VICTOR MORENO                                                                                                                                         ', '0241/874-04-00                ', 'pcontroldegestion@gmail.com', 8);
INSERT INTO pers_contacto VALUES (42, NULL, 2, 'CÉSAR BOLÍVAR                                                                                                                                         ', '0241/874-05-00                ', 'pcontroldegestion@gmail.com', 8);
INSERT INTO pers_contacto VALUES (43, NULL, 3, 'RICARDO PAPARONI                                                                                                                                      ', '0414/747-89-91                ', 'pcontroldegestion@gmail.com', 8);
INSERT INTO pers_contacto VALUES (56, NULL, 1, 'VICTOR MORENO                                                                                                                                         ', '0412-2363810                  ', 'gplanificacion@metrovalencia.gob.ve', 9);
INSERT INTO pers_contacto VALUES (57, NULL, 2, 'JESÚS ANCCIANI                                                                                                                                        ', '0412-8305011                  ', 'gplanificacion@metrovalencia.gob.ve', 9);
INSERT INTO pers_contacto VALUES (58, NULL, 3, 'JOHNNY CABRERA                                                                                                                                        ', '0426-4435739/0416-4152473     ', 'gplanificacion@metrovalencia.gob.ve', 9);
INSERT INTO pers_contacto VALUES (35, NULL, 1, 'RAFAEL COLMENAREZ                                                                                                                                     ', '0261/735-51-19                ', 'metrodemaracaibo@gmail.com', 10);
INSERT INTO pers_contacto VALUES (36, NULL, 2, 'JESÚS ANCCIANI                                                                                                                                        ', '0261/735-51-19                ', 'metrodemaracaibo@gmail.com', 10);
INSERT INTO pers_contacto VALUES (37, NULL, 3, 'JOHNNY CABRERA                                                                                                                                        ', '0416/664-06-41                ', 'metrodemaracaibo@gmail.com', 10);
INSERT INTO pers_contacto VALUES (38, NULL, 1, 'RAFAEL COLMENAREZ                                                                                                                                     ', '0416/666-67-45                ', 'colmenare09@gmail.com', 11);
INSERT INTO pers_contacto VALUES (39, NULL, 2, 'NALLIVE ESPINOZA                                                                                                                                      ', '0416/650-17-10                ', 'nallivespinoza@gmail.com', 11);
INSERT INTO pers_contacto VALUES (40, NULL, 3, 'NALLIVE ESPINOZA                                                                                                                                      ', '0416/650-17-10                ', 'nallivespinoza@gmail.com', 11);
INSERT INTO pers_contacto VALUES (53, NULL, 1, 'SIMÓN FIGUEROA                                                                                                                                        ', '0416/676-55-19                ', 'tromerca.ggeneral@gmail.com', 16);
INSERT INTO pers_contacto VALUES (54, NULL, 2, 'JAVIER PEÑA                                                                                                                                           ', '0416/676-55-01                ', 'tromerca.ggeneral@gmail.com', 16);
INSERT INTO pers_contacto VALUES (55, NULL, 3, 'ADOLFO APOLINAR                                                                                                                                       ', '0426/573-13-87                ', 'tromerca.ggeneral@gmail.com', 16);
INSERT INTO pers_contacto VALUES (32, NULL, 1, 'TONY ZAPATA                                                                                                                                           ', '0426/782-76-61                ', 'tonyzapatapsuv@hotmail.com', 19);
INSERT INTO pers_contacto VALUES (33, NULL, 2, 'SIXTO MARTÍNEZ                                                                                                                                        ', '0416/323-91-76                ', 'tonyzapatapsuv@hotmail.com', 19);
INSERT INTO pers_contacto VALUES (34, NULL, 3, 'TONY ZAPATA                                                                                                                                           ', '0426/782-76-61                ', 'tonyzapatapsuv@hotmail.com', 19);
INSERT INTO pers_contacto VALUES (19, NULL, 1, 'ING. NELSON TORCATE                                                                                                                                   ', '0416-5011733                  ', ' ', 20);
INSERT INTO pers_contacto VALUES (20, NULL, 2, 'ING. FREDDY COURI                                                                                                                                     ', '0414-5031563                  ', 'OPERACIONESTRANSBARCA@GMAIL.COM', 20);
INSERT INTO pers_contacto VALUES (59, NULL, 1, 'YHON APOSTOL                                                                                                                                          ', '0426-8471391                  ', 'jluiscorpoamazonas@gmail.com', 22);
INSERT INTO pers_contacto VALUES (60, NULL, 2, 'PEDRO LUIS CABELLO                                                                                                                                    ', '0416-3389464                  ', 'pedroluiscabello@hotmail.com', 22);
INSERT INTO pers_contacto VALUES (61, NULL, 1, 'REINALDO PONCE                                                                                                                                        ', '0416-6462162                  ', 'PONCE.REINALDO@GMAIL.COM', 25);
INSERT INTO pers_contacto VALUES (62, NULL, 2, 'VICTOR MASTROLEONARDO                                                                                                                                 ', '0416-6250491                  ', 'GOMTT@GMAIL.COM', 25);
INSERT INTO pers_contacto VALUES (63, NULL, 3, 'AICHEL UGAS                                                                                                                                           ', '0412-4490024                  ', 'LACATIRAJAI@HOTMAIL.COM', 25);
INSERT INTO pers_contacto VALUES (29, NULL, 1, 'CARLOS RAMÍREZ                                                                                                                                        ', '0414/569-08-54                ', 'busbarinasenmovimiento@gmail.com', 26);
INSERT INTO pers_contacto VALUES (30, NULL, 2, 'JOSE RODRÍGUEZ                                                                                                                                        ', '0412/156-58-01                ', 'busbarinasenmovimiento@gmail.com', 26);
INSERT INTO pers_contacto VALUES (31, NULL, 3, 'WALTER QUINTANA                                                                                                                                       ', '0416/502-74-35                ', 'busbarinasenmovimiento@gmail.com', 26);
INSERT INTO pers_contacto VALUES (44, NULL, 1, 'ALMEIDA JULIO                                                                                                                                         ', '0416/686-56-44                ', 'jcafo11@hotmail.com', 27);
INSERT INTO pers_contacto VALUES (45, NULL, 2, 'ZAIDA CANO                                                                                                                                            ', '0414/897-21-77                ', 'karinacano09@gmail.com', 27);
INSERT INTO pers_contacto VALUES (46, NULL, 3, 'ZAIDA CANO                                                                                                                                            ', '0414/897-21-77                ', 'karinacano09@gmail.com', 27);
INSERT INTO pers_contacto VALUES (51, NULL, 1, 'ALEXANDER SUÁREZ                                                                                                                                      ', '0416/940-72-15                ', 'transpopuerto@gmail.com', 29);
INSERT INTO pers_contacto VALUES (52, NULL, 2, 'JHOFERVIS MORALES                                                                                                                                     ', NULL, 'transpopuerto@gmail.com', 29);
INSERT INTO pers_contacto VALUES (10, NULL, 1, 'JAVIER SANCHEZ                                                                                                                                        ', NULL, 'sitssa.ppo.est@gmail.com', 33);
INSERT INTO pers_contacto VALUES (11, NULL, 2, 'MIGUEL RAMIREZ                                                                                                                                        ', '0416 9115832                  ', NULL, 33);
INSERT INTO pers_contacto VALUES (12, NULL, 3, 'JEIMI MAESTRE                                                                                                                                         ', '0416-618.43.96                ', 'ogesitssa@gmail.com', 33);
INSERT INTO pers_contacto VALUES (1, NULL, 1, 'JAVIER SANCHEZ                                                                                                                                        ', NULL, 'sitssa.ppo.est@gmail.com', 34);
INSERT INTO pers_contacto VALUES (2, NULL, 2, 'MIGUEL RAMIREZ                                                                                                                                        ', '0416 9115832                  ', NULL, 34);
INSERT INTO pers_contacto VALUES (3, NULL, 3, 'JESUS YEGUEZ                                                                                                                                          ', '0416-618.44.97                ', 'ogesitssa@gmail.com', 34);
INSERT INTO pers_contacto VALUES (16, NULL, 1, 'JAVIER SANCHEZ                                                                                                                                        ', NULL, 'sitssa.ppo.est@gmail.com', 35);
INSERT INTO pers_contacto VALUES (17, NULL, 2, 'MIGUEL RAMIREZ                                                                                                                                        ', '0416 9115832                  ', NULL, 35);
INSERT INTO pers_contacto VALUES (18, NULL, 3, 'TOMAS PARRAGA                                                                                                                                         ', '0416-618.45.03                ', 'ogesitssa@gmail.com', 35);
INSERT INTO pers_contacto VALUES (13, NULL, 1, 'JAVIER SANCHEZ                                                                                                                                        ', NULL, 'sitssa.ppo.est@gmail.com', 36);
INSERT INTO pers_contacto VALUES (14, NULL, 2, 'MIGUEL RAMIREZ                                                                                                                                        ', '0416 9115832                  ', NULL, 36);
INSERT INTO pers_contacto VALUES (15, NULL, 3, 'TOMAS PARRAGA                                                                                                                                         ', '0416-618.45.03                ', 'ogesitssa@gmail.com', 36);
INSERT INTO pers_contacto VALUES (7, NULL, 1, 'JAVIER SANCHEZ                                                                                                                                        ', NULL, 'sitssa.ppo.est@gmail.com', 37);
INSERT INTO pers_contacto VALUES (8, NULL, 2, 'MIGUEL RAMIREZ                                                                                                                                        ', '0416 9115832                  ', NULL, 37);
INSERT INTO pers_contacto VALUES (9, NULL, 3, 'GABRIEL SANOJA                                                                                                                                        ', '0426-511.22.92                ', 'ogesitssa@gmail.com', 37);
INSERT INTO pers_contacto VALUES (4, NULL, 1, 'JAVIER SANCHEZ                                                                                                                                        ', NULL, 'sitssa.ppo.est@gmail.com', 38);
INSERT INTO pers_contacto VALUES (5, NULL, 2, 'MIGUEL RAMIREZ                                                                                                                                        ', '0416 9115832                  ', NULL, 38);
INSERT INTO pers_contacto VALUES (6, NULL, 3, 'GABRIEL SANOJA                                                                                                                                        ', '0426-511.22.92                ', 'ogesitssa@gmail.com', 38);
INSERT INTO pers_contacto VALUES (21, NULL, 1, 'JOSE RIVAS                                                                                                                                            ', '0426-9035917                  ', 'BUSTAGUANES200@GMAIL.COM', 39);
INSERT INTO pers_contacto VALUES (22, NULL, 2, 'YULEXI TARAZONA                                                                                                                                       ', '0424-4534786                  ', 'YULETARAZONA@GMAIL.COM', 39);
INSERT INTO pers_contacto VALUES (47, NULL, 1, 'ANDRÉS MALDONADO                                                                                                                                      ', '0414/693-32-73                ', 'andrepsuv@gmail.com', 41);
INSERT INTO pers_contacto VALUES (23, NULL, 1, 'DAVID VELÁSQUEZ TORRES                                                                                                                                ', '416-58030123                  ', 'velasquezdt@gmail.com', 44);
INSERT INTO pers_contacto VALUES (24, NULL, 2, 'DAVID MAGO                                                                                                                                            ', '416-0393792                   ', 'magoarayero@gmail.com', 44);
INSERT INTO pers_contacto VALUES (25, NULL, 3, 'ELVIS SALAZAR                                                                                                                                         ', '0426-5805179                  ', 'salazareaj@pdvsa.com', 44);
INSERT INTO pers_contacto VALUES (26, NULL, 1, 'ING. RAFAEL UZCATEGUI                                                                                                                                 ', '0416-6741779                  ', 'rufinanzas@hotmail.com ', 46);
INSERT INTO pers_contacto VALUES (27, NULL, 2, 'ING. RAFAEL HERNANDEZ                                                                                                                                 ', '0416-7723228                  ', 'rufinanzas@hotmail.com ', 46);
INSERT INTO pers_contacto VALUES (28, NULL, 3, 'ING. GERMAN SALCEDO                                                                                                                                   ', '0414-7326037                  ', 'rufinanzas@hotmail.com ', 46);
INSERT INTO pers_contacto VALUES (48, NULL, 1, 'RAFAEL COLMENAREZ                                                                                                                                     ', '0416/666-67-45                ', 'colmenare09@gmail.com', 47);
INSERT INTO pers_contacto VALUES (49, NULL, 2, 'NALLIVE ESPINOZA                                                                                                                                      ', '0416/650-17-10                ', 'nallivespinoza@gmail.com', 47);
INSERT INTO pers_contacto VALUES (50, NULL, 3, 'NALLIVE ESPINOZA                                                                                                                                      ', '0416/650-17-10                ', 'nallivespinoza@gmail.com', 47);


--
-- TOC entry 2036 (class 0 OID 58993)
-- Dependencies: 181
-- Data for Name: sistema_transporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sistema_transporte VALUES (51, 'BUS PORTUGUESA', true, 5, 32, NULL, 39);
INSERT INTO sistema_transporte VALUES (50, 'TRANSTACHIRA ', true, 5, 28, NULL, 35);
INSERT INTO sistema_transporte VALUES (20, 'TRANSBARCA (BTR)', true, 4, 7, NULL, 14);
INSERT INTO sistema_transporte VALUES (1, 'METRO DE CARACAS (MASIVO)', true, 1, 1, NULL, 1);
INSERT INTO sistema_transporte VALUES (2, 'METRO DE LOS TEQUES (MASIVO)', true, 1, 1, NULL, 1);
INSERT INTO sistema_transporte VALUES (4, 'CABLE MARICHE', true, 6, 1, NULL, 4);
INSERT INTO sistema_transporte VALUES (5, 'CABLE SAN AGUSTÍN', true, 6, 1, NULL, 4);
INSERT INTO sistema_transporte VALUES (6, 'METRO BUS', true, 5, 1, NULL, 3);
INSERT INTO sistema_transporte VALUES (7, 'BUS CARACAS', true, 4, 1, NULL, 2);
INSERT INTO sistema_transporte VALUES (8, 'METRO DE VALENCIA (MASIVO)', true, 2, 3, NULL, 6);
INSERT INTO sistema_transporte VALUES (9, 'METRO DE VALENCIA (SISTEMA ALIMENTADOR)', true, 5, 3, NULL, 7);
INSERT INTO sistema_transporte VALUES (10, 'METRO MARACAIBO (MASIVO)', true, 2, 4, NULL, 8);
INSERT INTO sistema_transporte VALUES (11, 'METRO MARACAIBO (SISTEMA ALIMENTADOR SUPERFICIAL)', true, 5, 4, NULL, 9);
INSERT INTO sistema_transporte VALUES (12, 'RUTAS ALIMENTADORAS MARACAIBO', true, 5, 4, NULL, 9);
INSERT INTO sistema_transporte VALUES (13, 'IFE', true, 3, 2, NULL, 5);
INSERT INTO sistema_transporte VALUES (14, 'TROLEBUS-TROMERCA', true, 4, 5, NULL, 12);
INSERT INTO sistema_transporte VALUES (15, 'TROLCABLE- TROMERCA', true, 6, 5, NULL, 11);
INSERT INTO sistema_transporte VALUES (16, 'BUS MERIDA', true, 5, 5, NULL, 10);
INSERT INTO sistema_transporte VALUES (17, 'RUTAS ALIMENTADORAS', true, 5, 5, NULL, 10);
INSERT INTO sistema_transporte VALUES (18, 'SISTEMA ALIMENTADOR SUPERFICIAL', true, 5, 7, NULL, 40);
INSERT INTO sistema_transporte VALUES (19, 'BUS CARORA', true, 5, 7, NULL, 40);
INSERT INTO sistema_transporte VALUES (21, 'RUTAS ALIMENTADORAS', true, 5, 7, NULL, 40);
INSERT INTO sistema_transporte VALUES (22, 'TRANSAMAZONAS', true, 5, 11, NULL, 18);
INSERT INTO sistema_transporte VALUES (24, 'BUS APURE', true, 5, 30, NULL, 37);
INSERT INTO sistema_transporte VALUES (25, 'TRANSARAGUA', true, 5, 13, NULL, 20);
INSERT INTO sistema_transporte VALUES (27, 'TRANS-BOLIVAR', true, 5, 12, NULL, 19);
INSERT INTO sistema_transporte VALUES (28, 'TRANSCARABOBO', true, 5, 23, NULL, 30);
INSERT INTO sistema_transporte VALUES (29, 'TRANSPOPUERTO', true, 5, 15, NULL, 22);
INSERT INTO sistema_transporte VALUES (30, 'SITSSA-URBANA', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (31, 'SITSSA-INTERURBANA', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (32, 'SITSSA-SUBURBANA', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (33, 'BUS LOS TEQUES', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (34, 'GUARENAS-GUATIRE', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (35, 'BUS TUY', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (36, 'BUS BARLOVENTO', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (37, 'BUS VARGAS', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (38, 'BUS CARIBIA', true, 5, 6, NULL, 13);
INSERT INTO sistema_transporte VALUES (39, 'BUSTAGUANES', true, 5, 10, NULL, 17);
INSERT INTO sistema_transporte VALUES (40, 'TRANSDELTA', true, 5, 26, NULL, 33);
INSERT INTO sistema_transporte VALUES (41, 'TRANSFALCÓN', true, 5, 14, NULL, 21);
INSERT INTO sistema_transporte VALUES (42, 'BUS GUARICO', true, 5, 29, NULL, 36);
INSERT INTO sistema_transporte VALUES (43, 'TRANSMONAGAS', true, 5, 17, NULL, 24);
INSERT INTO sistema_transporte VALUES (44, 'BUS CUMANÁ', true, 5, 9, NULL, 16);
INSERT INTO sistema_transporte VALUES (45, 'BUS CARÚPANO', true, 5, 27, NULL, 34);
INSERT INTO sistema_transporte VALUES (46, 'BUS TRUJILLO ', true, 5, 33, NULL, 41);
INSERT INTO sistema_transporte VALUES (47, 'TRANSGUAJIRA', true, 5, 19, NULL, 26);
INSERT INTO sistema_transporte VALUES (48, 'TRANSSUR', true, 5, 21, NULL, 28);
INSERT INTO sistema_transporte VALUES (49, 'TRANSCOL (COSTA ORIENTAL)', true, 5, 20, NULL, 27);
INSERT INTO sistema_transporte VALUES (52, 'BUS YARACUY', true, 5, 16, NULL, 23);
INSERT INTO sistema_transporte VALUES (53, 'BUS MARGARITA', true, 5, 25, NULL, 32);
INSERT INTO sistema_transporte VALUES (23, 'TRANSANZOATEGUI', true, 5, 22, NULL, 29);
INSERT INTO sistema_transporte VALUES (3, 'CABLETREN - BOLIVARIANO', true, 6, 1, NULL, 4);
INSERT INTO sistema_transporte VALUES (26, 'BUS BARINAS', true, 5, 8, NULL, 15);


--
-- TOC entry 2037 (class 0 OID 58998)
-- Dependencies: 182
-- Data for Name: social; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO social VALUES (1, '115.810 HABITANTES', 150, 300, NULL);
INSERT INTO social VALUES (2, ' 5.399 HABITANTES', 200, 250, NULL);
INSERT INTO social VALUES (3, ' 90.000 HABITANTES', 1000, 1890, NULL);
INSERT INTO social VALUES (4, '6.450.000 HABITANTES', NULL, NULL, NULL);
INSERT INTO social VALUES (5, '800.000 HABITANTES', 1093, 4372, NULL);
INSERT INTO social VALUES (6, '1.000.00O HABITANTES', 3046, NULL, NULL);
INSERT INTO social VALUES (7, '60.000 HABITANTES', 53, NULL, NULL);
INSERT INTO social VALUES (8, '25.997 HABITANTES', 168, 96, NULL);
INSERT INTO social VALUES (9, '6.000 HABITANTES', 46, 0, NULL);
INSERT INTO social VALUES (10, '4.500 HAB', 156, 90, NULL);
INSERT INTO social VALUES (11, '5.800 HABITANTES', 102, 58, NULL);
INSERT INTO social VALUES (12, '3.600 HAB', 105, 60, NULL);
INSERT INTO social VALUES (13, 'BUS ESTADAR YUTONG 12 MTS', 88, 50, NULL);
INSERT INTO social VALUES (14, NULL, NULL, NULL, NULL);
INSERT INTO social VALUES (15, NULL, NULL, NULL, NULL);
INSERT INTO social VALUES (16, 'BUS ESTADAR YUTONG 12 MTS', 436, 1309, NULL);
INSERT INTO social VALUES (17, 'BUS ESTADAR YUTONG 12 MTS', 110, 0, NULL);
INSERT INTO social VALUES (18, 'BUS ESTADAR YUTONG 12 MTS', 56, 258, NULL);
INSERT INTO social VALUES (20, '150000', 49, NULL, NULL);
INSERT INTO social VALUES (21, '70000', 40, NULL, NULL);
INSERT INTO social VALUES (23, 'BUS YUTONG 
   
MINIBUSES YUTONG', 234, 527, NULL);
INSERT INTO social VALUES (26, NULL, 180, 830, NULL);
INSERT INTO social VALUES (31, '1600 HABITANTES', 640, 1920, NULL);
INSERT INTO social VALUES (32, '8000 HOGARES ', 46, 1920, NULL);
INSERT INTO social VALUES (33, '300.000 HOGARES', 219, 100, NULL);
INSERT INTO social VALUES (22, '1.265.670', 2000, 3000, NULL);
INSERT INTO social VALUES (24, '1.500.000', 2826, 8478, NULL);
INSERT INTO social VALUES (25, '3.309.600', 219, 100, NULL);
INSERT INTO social VALUES (27, '320.000', 220, 480, NULL);
INSERT INTO social VALUES (28, '12.000', 98, 3, NULL);
INSERT INTO social VALUES (29, '513.000', 50, 40, NULL);
INSERT INTO social VALUES (30, '400.000', 480, 1300, NULL);
INSERT INTO social VALUES (19, 'BUS ESTADAR YUTONG 12 MTS y MINIBUSES YUTONG', 50, 350, NULL);


--
-- TOC entry 2043 (class 0 OID 59048)
-- Dependencies: 196
-- Data for Name: tipo_vehiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_vehiculo VALUES (1, 'METRO');
INSERT INTO tipo_vehiculo VALUES (2, 'BUS');
INSERT INTO tipo_vehiculo VALUES (3, 'METRO CABLE');
INSERT INTO tipo_vehiculo VALUES (4, 'TREN');
INSERT INTO tipo_vehiculo VALUES (5, 'TELECABINAS');
INSERT INTO tipo_vehiculo VALUES (6, 'BUS Y MINIBUS');


--
-- TOC entry 2044 (class 0 OID 59052)
-- Dependencies: 197
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (1, 'admin', '1', 'Administrador', 1, NULL, NULL);
INSERT INTO usuario VALUES (2, 'asrodriguez', '2', 'Adriana Rodriguez', 3, 4, 10);
INSERT INTO usuario VALUES (5, 'interurbano', 'interurbano', 'Interurbano', 3, 6, 31);
INSERT INTO usuario VALUES (7, 'busvargas', 'busvargas', 'Bus Vargas', 3, 6, 37);
INSERT INTO usuario VALUES (12, 'buscaribia', 'buscaribia', 'Bus Caribia', 3, 6, 38);
INSERT INTO usuario VALUES (8, 'busbarlovento', 'busbarlovento', 'Bus Barlovento', 3, 6, 36);
INSERT INTO usuario VALUES (9, 'bustuy', 'bustuy', 'Bus Tuy', 3, 6, 35);
INSERT INTO usuario VALUES (11, 'busguarenasguatire', 'busguarenasguatire', 'Bus Guarenas - Guatire', 3, 6, 34);
INSERT INTO usuario VALUES (13, 'busteques', 'busteques', 'Bus Los Teques', 3, 6, 33);
INSERT INTO usuario VALUES (6, 'urbana ', 'urbana', 'Urbana', 3, 6, 30);
INSERT INTO usuario VALUES (10, 'suburbana', 'suburbana', 'Suburbana', 3, 6, 32);
INSERT INTO usuario VALUES (4, 'adminsitssa', 'adminsitssa', 'Supervisor Sitssa', 1, 6, NULL);
INSERT INTO usuario VALUES (14, 'adminmetrocaracas', 'adminmetrocaracas', 'Supervisor Metro de Caracas', 1, 1, NULL);
INSERT INTO usuario VALUES (15, 'metrocaracas', 'metrocaracas', 'Metro Caracas', 3, 1, 1);
INSERT INTO usuario VALUES (16, 'metroteques', 'metroteques', 'Metro Los Teques', 3, 1, 2);
INSERT INTO usuario VALUES (17, 'metrobus', 'metrobus', 'Metro Bus', 3, 1, 6);
INSERT INTO usuario VALUES (18, 'busccs', 'busccs', 'Bus Ccs', 3, 1, 7);
INSERT INTO usuario VALUES (19, 'mcsanagustin', 'mcsanagustin', 'Metro Cable San Agustín', 3, 1, 5);
INSERT INTO usuario VALUES (20, 'mcmariche', 'mcmariche', 'Metro Cable Mariche', 3, 1, 4);
INSERT INTO usuario VALUES (21, 'cabletren', 'cabletren', 'Cable Tren Bolivariano', 3, 1, 3);
INSERT INTO usuario VALUES (3, 'cevasquez', '3', 'Cesar Vasquez', 3, 6, 31);
INSERT INTO usuario VALUES (24, 'transbolivar', 'transbolivar', 'Transbolivar', 3, 12, 27);
INSERT INTO usuario VALUES (25, 'admintransbolivar', 'admintransbolivar', 'Supervisor Transbolivar', 1, 12, NULL);


--
-- TOC entry 1973 (class 2606 OID 59057)
-- Dependencies: 162 162
-- Name: administrativo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administrativo
    ADD CONSTRAINT administrativo_pkey PRIMARY KEY (id_administrativo);


--
-- TOC entry 1975 (class 2606 OID 59059)
-- Dependencies: 164 164
-- Name: cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id_cargo);


--
-- TOC entry 1979 (class 2606 OID 59061)
-- Dependencies: 168 168
-- Name: estados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 1981 (class 2606 OID 59063)
-- Dependencies: 170 170
-- Name: fichas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_pkey PRIMARY KEY (id_ficha);


--
-- TOC entry 1983 (class 2606 OID 59065)
-- Dependencies: 172 172
-- Name: financiero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY financiero
    ADD CONSTRAINT financiero_pkey PRIMARY KEY (id_financiero);


--
-- TOC entry 2005 (class 2606 OID 59067)
-- Dependencies: 196 196
-- Name: flota_operadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_vehiculo
    ADD CONSTRAINT flota_operadora_pkey PRIMARY KEY (id_tipo_vehiculo);


--
-- TOC entry 1995 (class 2606 OID 59069)
-- Dependencies: 184 184
-- Name: grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 1977 (class 2606 OID 59071)
-- Dependencies: 166 166
-- Name: id_detalle_id_municipio_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalle_ficha
    ADD CONSTRAINT id_detalle_id_municipio_pk PRIMARY KEY (id_detalle_ficha);


--
-- TOC entry 1999 (class 2606 OID 59073)
-- Dependencies: 188 188
-- Name: id_operacion_diaria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operaciones_diarias
    ADD CONSTRAINT id_operacion_diaria_pkey PRIMARY KEY (id_operacion_diaria);


--
-- TOC entry 2007 (class 2606 OID 59075)
-- Dependencies: 197 197
-- Name: id_usuario; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 1985 (class 2606 OID 59077)
-- Dependencies: 174 174
-- Name: modalidad_transporte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY modalidad_transporte
    ADD CONSTRAINT modalidad_transporte_pkey PRIMARY KEY (id_modalidad_transporte);


--
-- TOC entry 1997 (class 2606 OID 59079)
-- Dependencies: 186 186
-- Name: municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (id_municipio);


--
-- TOC entry 2001 (class 2606 OID 59081)
-- Dependencies: 190 190
-- Name: operadora_mod_transp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operadora_mod_transp
    ADD CONSTRAINT operadora_mod_transp_pkey PRIMARY KEY (id_operadora_mod_transp);


--
-- TOC entry 1987 (class 2606 OID 59083)
-- Dependencies: 176 176
-- Name: operadora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operadora
    ADD CONSTRAINT operadora_pkey PRIMARY KEY (id_operadora);


--
-- TOC entry 1989 (class 2606 OID 59085)
-- Dependencies: 178 178
-- Name: operativo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operativo
    ADD CONSTRAINT operativo_pkey PRIMARY KEY (id_operativo);


--
-- TOC entry 2003 (class 2606 OID 59087)
-- Dependencies: 192 192
-- Name: pers_contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pers_contacto
    ADD CONSTRAINT pers_contacto_pkey PRIMARY KEY (id_pers_contacto);


--
-- TOC entry 1991 (class 2606 OID 59089)
-- Dependencies: 181 181
-- Name: sistema_transporte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sistema_transporte
    ADD CONSTRAINT sistema_transporte_pkey PRIMARY KEY (id_sistema_transporte);


--
-- TOC entry 1993 (class 2606 OID 59091)
-- Dependencies: 182 182
-- Name: social_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY social
    ADD CONSTRAINT social_pkey PRIMARY KEY (id_social);


--
-- TOC entry 2008 (class 2606 OID 59092)
-- Dependencies: 162 170 1972
-- Name: fichas_id_administrativo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_administrativo_fkey FOREIGN KEY (id_administrativo) REFERENCES administrativo(id_administrativo);


--
-- TOC entry 2009 (class 2606 OID 59097)
-- Dependencies: 170 168 1978
-- Name: fichas_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES estados(id_estado);


--
-- TOC entry 2010 (class 2606 OID 59102)
-- Dependencies: 170 1982 172
-- Name: fichas_id_financiero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_financiero_fkey FOREIGN KEY (id_financiero) REFERENCES financiero(id_financiero);


--
-- TOC entry 2011 (class 2606 OID 59107)
-- Dependencies: 170 186 1996
-- Name: fichas_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES municipios(id_municipio);


--
-- TOC entry 2012 (class 2606 OID 59112)
-- Dependencies: 176 1986 170
-- Name: fichas_id_operadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_operadora_fkey FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora);


--
-- TOC entry 2013 (class 2606 OID 59117)
-- Dependencies: 170 178 1988
-- Name: fichas_id_operativo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_operativo_fkey FOREIGN KEY (id_operativo) REFERENCES operativo(id_operativo);


--
-- TOC entry 2014 (class 2606 OID 59122)
-- Dependencies: 181 1990 170
-- Name: fichas_id_sistema_transporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_sistema_transporte_fkey FOREIGN KEY (id_sistema_transporte) REFERENCES sistema_transporte(id_sistema_transporte);


--
-- TOC entry 2015 (class 2606 OID 59127)
-- Dependencies: 182 1992 170
-- Name: fichas_id_social_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fichas
    ADD CONSTRAINT fichas_id_social_fkey FOREIGN KEY (id_social) REFERENCES social(id_social);


--
-- TOC entry 2024 (class 2606 OID 59132)
-- Dependencies: 197 1994 184
-- Name: id_grupo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_grupo_fkey FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo);


--
-- TOC entry 2025 (class 2606 OID 59137)
-- Dependencies: 197 176 1986
-- Name: id_operadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_operadora_fkey FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora);


--
-- TOC entry 2019 (class 2606 OID 59142)
-- Dependencies: 1986 176 188
-- Name: id_operadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operaciones_diarias
    ADD CONSTRAINT id_operadora_fkey FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora);


--
-- TOC entry 2026 (class 2606 OID 59147)
-- Dependencies: 181 1990 197
-- Name: id_sistema_transporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_sistema_transporte_fkey FOREIGN KEY (id_sistema_transporte) REFERENCES sistema_transporte(id_sistema_transporte);


--
-- TOC entry 2020 (class 2606 OID 59152)
-- Dependencies: 1990 188 181
-- Name: id_sistema_transporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operaciones_diarias
    ADD CONSTRAINT id_sistema_transporte_fkey FOREIGN KEY (id_sistema_transporte) REFERENCES sistema_transporte(id_sistema_transporte);


--
-- TOC entry 2021 (class 2606 OID 59157)
-- Dependencies: 197 2006 188
-- Name: id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY operaciones_diarias
    ADD CONSTRAINT id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2016 (class 2606 OID 59162)
-- Dependencies: 174 1984 181
-- Name: modalidad_transporte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sistema_transporte
    ADD CONSTRAINT modalidad_transporte_fkey FOREIGN KEY (id_modalidad_transporte) REFERENCES modalidad_transporte(id_modalidad_transporte);


--
-- TOC entry 2018 (class 2606 OID 59167)
-- Dependencies: 168 1978 186
-- Name: municipios_id_estado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT municipios_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES estados(id_estado);


--
-- TOC entry 2017 (class 2606 OID 59172)
-- Dependencies: 181 1986 176
-- Name: operadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sistema_transporte
    ADD CONSTRAINT operadora_fkey FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora);


--
-- TOC entry 2022 (class 2606 OID 59177)
-- Dependencies: 192 164 1974
-- Name: pers_contacto_id_cargo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pers_contacto
    ADD CONSTRAINT pers_contacto_id_cargo_fkey FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo);


--
-- TOC entry 2023 (class 2606 OID 59182)
-- Dependencies: 1986 192 176
-- Name: pers_contacto_id_operadora_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pers_contacto
    ADD CONSTRAINT pers_contacto_id_operadora_fkey FOREIGN KEY (id_operadora) REFERENCES operadora(id_operadora);


--
-- TOC entry 2049 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-08-05 15:08:55

--
-- PostgreSQL database dump complete
--

