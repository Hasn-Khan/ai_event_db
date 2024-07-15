--
-- PostgreSQL database dump
--

-- Dumped from database version 13.14
-- Dumped by pg_dump version 13.14

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
-- Name: companies; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.companies (
    homepage_base_url text NOT NULL,
    company_name text,
    company_revenue text,
    company_industry text,
    number_of_employees integer
);


ALTER TABLE public.companies OWNER TO dev;

--
-- Name: events; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.events (
    event_url text NOT NULL,
    event_name text,
    event_date date,
    event_location text,
    event_industry text
);


ALTER TABLE public.events OWNER TO dev;

--
-- Name: merged_data; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.merged_data (
    event_url text,
    homepage_base_url text,
    event_name text,
    event_date date,
    event_location text,
    event_industry text,
    company_name text,
    company_revenue text,
    company_industry text,
    number_of_employees integer,
    person_id integer NOT NULL,
    person_name text,
    job_title text,
    email text
);


ALTER TABLE public.merged_data OWNER TO dev;

--
-- Name: merged_data_person_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.merged_data_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.merged_data_person_id_seq OWNER TO dev;

--
-- Name: merged_data_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.merged_data_person_id_seq OWNED BY public.merged_data.person_id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: dev
--

CREATE TABLE public.people (
    person_id integer NOT NULL,
    person_name text,
    job_title text,
    email text,
    homepage_base_url text
);


ALTER TABLE public.people OWNER TO dev;

--
-- Name: people_person_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE public.people_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.people_person_id_seq OWNER TO dev;

--
-- Name: people_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE public.people_person_id_seq OWNED BY public.people.person_id;


--
-- Name: merged_data person_id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.merged_data ALTER COLUMN person_id SET DEFAULT nextval('public.merged_data_person_id_seq'::regclass);


--
-- Name: people person_id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.people ALTER COLUMN person_id SET DEFAULT nextval('public.people_person_id_seq'::regclass);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (homepage_base_url);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_url);


--
-- Name: merged_data merged_data_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.merged_data
    ADD CONSTRAINT merged_data_pkey PRIMARY KEY (person_id);


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (person_id);


--
-- Name: merged_data merged_data_event_url_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.merged_data
    ADD CONSTRAINT merged_data_event_url_fkey FOREIGN KEY (event_url) REFERENCES public.events(event_url);


--
-- Name: merged_data merged_data_homepage_base_url_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.merged_data
    ADD CONSTRAINT merged_data_homepage_base_url_fkey FOREIGN KEY (homepage_base_url) REFERENCES public.companies(homepage_base_url);


--
-- Name: people people_homepage_base_url_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_homepage_base_url_fkey FOREIGN KEY (homepage_base_url) REFERENCES public.companies(homepage_base_url);


--
-- PostgreSQL database dump complete
--

