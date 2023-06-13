-
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    penemu character varying(30) NOT NULL,
    bentuk character varying(20) NOT NULL,
    deskripsi text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    penemu character varying(30) NOT NULL,
    berbentuk_bulat boolean,
    kemiringan_sumbu integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    penemu character varying(30) NOT NULL,
    jenis_planet character varying(20),
    memiliki_kehidupan boolean NOT NULL,
    kecepatan_rotasi_km_jam integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    penemu character varying(30) NOT NULL,
    warna character varying(20),
    massa numeric NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: tata_surya; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.tata_surya (
    tata_surya_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer,
    galaxy_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.tata_surya OWNER TO freecodecamp;

--
-- Name: tata_surya_tata_surya_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.tata_surya_tata_surya_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tata_surya_tata_surya_id_seq OWNER TO freecodecamp;

--
-- Name: tata_surya_tata_surya_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.tata_surya_tata_surya_id_seq OWNED BY public.tata_surya.tata_surya_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: tata_surya tata_surya_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya ALTER COLUMN tata_surya_id SET DEFAULT nextval('public.tata_surya_tata_surya_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'bimasakti', 'cak bim', 'elips', 'sebuah galaksi tempat planet kita berada');
INSERT INTO public.galaxy VALUES (2, 'andromeda', 'indro', 'spiral', 'dekat dengan galaxy bimasakti, dapat dilihat dengan mata telanjang');
INSERT INTO public.galaxy VALUES (3, 'arpiji', 'sijipi', 'tak beraturan', 'sebuah galaksi imajiner yang tidak ada hubungannya dengan dunia nyata');
INSERT INTO public.galaxy VALUES (4, 'gosip', 'gabur', 'tak beraturan', 'galaksi yang diisi dengan ketidakjelasan duniawi');
INSERT INTO public.galaxy VALUES (5, 'moba', 'antok', 'bulat', 'galaksi dengan campur tangan makhluk astral dari dunia dua dimensi');
INSERT INTO public.galaxy VALUES (6, 'apa aja yang penting ada', 'saya sendiri', 'ora karuan', 'ya gini.. biar lengkap saja');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'crimson', 'alpha', true, 1324, 3);
INSERT INTO public.moon VALUES (3, 'tenebrion', 'kamui', false, 100, 3);
INSERT INTO public.moon VALUES (1, 'luna', 'tak-diketahui', true, 2, 1);
INSERT INTO public.moon VALUES (4, 'veritas', 'bianca', true, 5, 4);
INSERT INTO public.moon VALUES (5, 'glory', 'crume', false, 288, 5);
INSERT INTO public.moon VALUES (6, 'pulse', 'nanami', false, 531, 5);
INSERT INTO public.moon VALUES (7, 'amber', 'kaenina', false, 385, 6);
INSERT INTO public.moon VALUES (8, 'palefire', 'lee', false, 113, 6);
INSERT INTO public.moon VALUES (9, 'luminance', 'lux', true, 998, 7);
INSERT INTO public.moon VALUES (10, 'qilin', 'cangh', false, 111, 7);
INSERT INTO public.moon VALUES (11, 'bastion', 'kamui', false, 114, 8);
INSERT INTO public.moon VALUES (12, 'entropy', 'lee', false, 442, 8);
INSERT INTO public.moon VALUES (13, 'rozen', 'vera', true, 362, 9);
INSERT INTO public.moon VALUES (14, 'crocotta', 'camu', false, 734, 9);
INSERT INTO public.moon VALUES (15, 'ngihtblade', 'wata', false, 886, 10);
INSERT INTO public.moon VALUES (16, 'garnet', 'vera', true, 736, 10);
INSERT INTO public.moon VALUES (17, 'falembeu', 'roland', false, 270, 11);
INSERT INTO public.moon VALUES (18, 'empyera', 'liv', true, 539, 11);
INSERT INTO public.moon VALUES (19, 'vieled', 'haick', true, 953, 12);
INSERT INTO public.moon VALUES (20, 'vitrum', 'sei', true, 758, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'bumi', 'tek_diketahui', 'inferior', true, 1670, 1);
INSERT INTO public.planet VALUES (2, 'mars', 'amar', 'inferior', false, 868, 1);
INSERT INTO public.planet VALUES (3, 'dangdut', 'bilar', 'inferior', true, 1599, 2);
INSERT INTO public.planet VALUES (4, 'bumer', 'boom-noom', 'superior', false, 8756, 2);
INSERT INTO public.planet VALUES (5, 'ban', 'komar', 'superior', false, 9978, 3);
INSERT INTO public.planet VALUES (6, 'namek', 'bejita', 'inferior', false, 4311, 3);
INSERT INTO public.planet VALUES (7, 'antaris', 'sugeng', 'superior', false, 1600, 4);
INSERT INTO public.planet VALUES (8, 'zero-down', 'budi', 'superior', false, 3288, 4);
INSERT INTO public.planet VALUES (9, 'valoris', 'polkatod', 'inferior', false, 5539, 5);
INSERT INTO public.planet VALUES (10, 'veda', 'anas', 'inferior', false, 1109, 5);
INSERT INTO public.planet VALUES (11, 'relpek', 'duno', 'inferior', false, 1167, 6);
INSERT INTO public.planet VALUES (12, 'avata', 'ratamahatta', 'superior', false, 8907, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'matahari', 'cak har', 'kuning-putih', 1.7, 1);
INSERT INTO public.star VALUES (2, 'kejora', 'lesti', 'putih', 3.2, 2);
INSERT INTO public.star VALUES (3, 'proxima', 'samik', 'biru', 60, 3);
INSERT INTO public.star VALUES (5, 'kuro', 'kongstu', 'hitam', 4.2, 3);
INSERT INTO public.star VALUES (6, 'montoon', 'kopet', 'hijau', 1.1, 5);
INSERT INTO public.star VALUES (4, 'kecil', 'daljono', 'biru', 4.5, 6);


--
-- Data for Name: tata_surya; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.tata_surya VALUES (1, 1, 1, 1, 1, NULL);
INSERT INTO public.tata_surya VALUES (3, 1, 2, NULL, 1, NULL);
INSERT INTO public.tata_surya VALUES (4, 2, 3, NULL, 4, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: tata_surya_tata_surya_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.tata_surya_tata_surya_id_seq', 4, true);


--
-- Name: galaxy galaxy_nama_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_nama_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_nama_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_nama_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_nama_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_nama_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_nama_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_nama_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: tata_surya tata_surya_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya
    ADD CONSTRAINT tata_surya_name_key UNIQUE (name);


--
-- Name: tata_surya tata_surya_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya
    ADD CONSTRAINT tata_surya_pkey PRIMARY KEY (tata_surya_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: tata_surya tata_surya_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya
    ADD CONSTRAINT tata_surya_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: tata_surya tata_surya_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya
    ADD CONSTRAINT tata_surya_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: tata_surya tata_surya_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya
    ADD CONSTRAINT tata_surya_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: tata_surya tata_surya_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tata_surya
    ADD CONSTRAINT tata_surya_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
