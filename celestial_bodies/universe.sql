--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    distance_from_earth numeric(5,2),
    description text,
    fun_fact text
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
    name character varying(60) NOT NULL,
    planet_id integer,
    distance_from_planet numeric(5,2),
    fun_fact text
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
    habitable boolean NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    moon_count integer NOT NULL,
    has_water boolean
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
-- Name: planet_prev_star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_prev_star (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(60),
    planet_prev_star_id integer NOT NULL
);


ALTER TABLE public.planet_prev_star OWNER TO freecodecamp;

--
-- Name: planet_prev_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_prev_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_prev_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_prev_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_prev_star_id_seq OWNED BY public.planet_prev_star.planet_prev_star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planets integer,
    galaxy_id integer,
    fun_fact text
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
-- Name: planet_prev_star planet_prev_star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_prev_star ALTER COLUMN planet_prev_star_id SET DEFAULT nextval('public.planet_prev_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 0.00, 'Home galaxy', NULL);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0.00, 'The spiral galaxy containing our Solar System.', 'It is estimated to contain 100–400 billion stars.');
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 2.54, 'The closest major galaxy to the Milky Way.', 'It is approaching us at about 110 kilometers per second.');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 2.73, 'A spiral galaxy in the constellation Triangulum.', 'It is the third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 23.00, 'An interacting grand-design spiral galaxy.', 'It was the first galaxy to be classified as a spiral.');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 28.00, 'Features a bright nucleus and a large central bulge.', 'Its thick dust lane gives it the appearance of a hat.');
INSERT INTO public.galaxy VALUES (7, 'Black Eye', 17.00, 'Known for the dark band of absorbing dust in front of its nucleus.', 'It is famous among amateur astronomers for its unique look.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'The Moon', 1, 384.40, 'The only place outside Earth where humans have set foot.');
INSERT INTO public.moon VALUES (3, 'Phobos', 2, 9.37, 'It orbits Mars three times a day.');
INSERT INTO public.moon VALUES (4, 'Deimos', 2, 23.46, 'It is one of the smallest moons in the solar system.');
INSERT INTO public.moon VALUES (5, 'Io', 3, 421.70, 'The most volcanically active body in the solar system.');
INSERT INTO public.moon VALUES (6, 'Europa', 3, 670.90, 'Has a salty ocean beneath its icy shell.');
INSERT INTO public.moon VALUES (7, 'Ganymede', 3, 999.99, 'The largest moon in our solar system.');
INSERT INTO public.moon VALUES (8, 'Callisto', 3, 999.99, 'The most heavily cratered object in the solar system.');
INSERT INTO public.moon VALUES (9, 'Metis', 3, 128.00, 'The innermost known moon of Jupiter.');
INSERT INTO public.moon VALUES (10, 'Adrastea', 3, 129.00, 'The smallest of the four inner moons of Jupiter.');
INSERT INTO public.moon VALUES (11, 'Amalthea', 3, 181.00, 'It has an irregular shape and is very red.');
INSERT INTO public.moon VALUES (12, 'Thebe', 3, 221.00, 'The fourth of Jupiter''s moons by distance.');
INSERT INTO public.moon VALUES (13, 'Prox-B-Moon 1', 5, 50.00, 'A hypothetical moon of Proxima Centauri b.');
INSERT INTO public.moon VALUES (14, 'Prox-B-Moon 2', 5, 85.50, 'Potential for liquid water due to tidal heating.');
INSERT INTO public.moon VALUES (15, 'Alpha Moon', 8, 12.00, 'Orbits its planet extremely fast.');
INSERT INTO public.moon VALUES (16, 'Beta Moon', 8, 45.00, 'Composed mostly of silicate rock.');
INSERT INTO public.moon VALUES (17, 'Gamma Moon', 8, 150.00, 'Has a very thin oxygen atmosphere.');
INSERT INTO public.moon VALUES (18, 'Mirach Moon A', 9, 30.00, 'Locked in a synchronous orbit.');
INSERT INTO public.moon VALUES (19, 'Mirach Moon B', 10, 15.00, 'Possesses large impact basins.');
INSERT INTO public.moon VALUES (20, 'Delta Major Moon', 11, 200.00, 'Covered in a layer of fine space dust.');
INSERT INTO public.moon VALUES (21, 'Delta Minor Moon', 12, 10.00, 'So close to its planet it may eventually break apart.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, 'earth', 1, 1, true);
INSERT INTO public.planet VALUES (2, true, 'Earth', 1, 1, true);
INSERT INTO public.planet VALUES (3, false, 'Mars', 1, 2, true);
INSERT INTO public.planet VALUES (4, false, 'Jupiter', 1, 95, false);
INSERT INTO public.planet VALUES (5, false, 'Venus', 1, 0, false);
INSERT INTO public.planet VALUES (6, true, 'Proxima Centauri b', 2, 0, true);
INSERT INTO public.planet VALUES (7, false, 'Proxima Centauri c', 2, 0, false);
INSERT INTO public.planet VALUES (8, false, 'Sirius b Companion', 3, 0, false);
INSERT INTO public.planet VALUES (9, false, 'Alpheratz Prime', 4, 3, false);
INSERT INTO public.planet VALUES (10, false, 'Mirach Alpha', 5, 5, true);
INSERT INTO public.planet VALUES (11, false, 'Mirach Beta', 5, 1, false);
INSERT INTO public.planet VALUES (12, false, 'Delta Tri Major', 6, 0, false);
INSERT INTO public.planet VALUES (13, false, 'Delta Tri Minor', 6, 12, true);


--
-- Data for Name: planet_prev_star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_prev_star VALUES (1, 2, 'The Ancient Shift', 1);
INSERT INTO public.planet_prev_star VALUES (2, 3, 'Mars Migration', 2);
INSERT INTO public.planet_prev_star VALUES (5, 1, 'Proxima Displacement', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 8, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sun', 8, 1, 'The center of our solar system and a G-type main-sequence star.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 1, 'The closest known star to the Sun.');
INSERT INTO public.star VALUES (4, 'Sirius', 0, 1, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (5, 'Alpheratz', 0, 2, 'The brightest star in the Andromeda constellation.');
INSERT INTO public.star VALUES (6, 'Mirach', 0, 2, 'A red giant star located in the Andromeda constellation.');
INSERT INTO public.star VALUES (7, 'Delta Trianguli', 0, 3, 'A spectroscopic binary star system in Triangulum.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_prev_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_prev_star_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_prev_star planet_prev_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_prev_star
    ADD CONSTRAINT planet_prev_star_id_key UNIQUE (planet_prev_star_id);


--
-- Name: planet_prev_star planet_prev_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_prev_star
    ADD CONSTRAINT planet_prev_star_pkey PRIMARY KEY (planet_prev_star_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_prev_star planet_prev_star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_prev_star
    ADD CONSTRAINT planet_prev_star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_prev_star planet_prev_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_prev_star
    ADD CONSTRAINT planet_prev_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- PostgreSQL database dump complete
--

