--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-15 16:20:59

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16413)
-- Name: athletes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.athletes (
    id integer NOT NULL,
    nom character varying(255),
    gender character(1),
    dob date
);


ALTER TABLE public.athletes OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16418)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    migration character varying(255) NOT NULL,
    migrated_at time without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 3310 (class 0 OID 16413)
-- Dependencies: 209
-- Data for Name: athletes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.athletes (id, nom, gender, dob) FROM stdin;
1	Andrew	m	1975-12-01
2	Ayana	F	1998-06-11
3	Hayden	m	1996-07-24
4	August	m	1999-09-09
\.


--
-- TOC entry 3311 (class 0 OID 16418)
-- Dependencies: 210
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (migration, migrated_at) FROM stdin;
20220215135100-create-athletes.sql	13:51:00
20220215142800-create-migrations.sql	14:28:00
20220215143800-create-athletes.sql	14:38:00
\.


--
-- TOC entry 3168 (class 2606 OID 16417)
-- Name: athletes athletes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.athletes
    ADD CONSTRAINT athletes_pkey PRIMARY KEY (id);


--
-- TOC entry 3170 (class 2606 OID 16422)
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (migration);


-- Completed on 2022-02-15 16:20:59

--
-- PostgreSQL database dump complete
--

