--
-- PostgreSQL database dump
--

\restrict sKkmzvIUPGFU46M8O1DiWb8AMA7CXjpduWMVz50tPBSuQ6fbwTcwMqbzoBRK86E

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-23 20:19:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 16451)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer NOT NULL,
    title character varying(100)
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16450)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 219
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 4856 (class 2604 OID 16454)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 4858 (class 2606 OID 16457)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


-- Completed on 2026-10-23 20:19:40

--
-- PostgreSQL database dump complete
--

\unrestrict sKkmzvIUPGFU46M8O1DiWb8AMA7CXjpduWMVz50tPBSuQ6fbwTcwMqbzoBRK86E

