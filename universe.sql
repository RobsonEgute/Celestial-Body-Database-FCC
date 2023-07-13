--
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
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_billion_years integer NOT NULL,
    description text
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
-- Name: interstellar_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.interstellar_objects (
    interstellar_objects_id integer NOT NULL,
    name character varying(50) NOT NULL,
    size numeric(2,1),
    has_life boolean
);


ALTER TABLE public.interstellar_objects OWNER TO freecodecamp;

--
-- Name: interstellar_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.interstellar_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interstellar_objects_id_seq OWNER TO freecodecamp;

--
-- Name: interstellar_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.interstellar_objects_id_seq OWNED BY public.interstellar_objects.interstellar_objects_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer
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
    name character varying(50) NOT NULL,
    age_billion_years integer NOT NULL,
    has_life boolean,
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
    name character varying(50) NOT NULL,
    age_million_years integer NOT NULL,
    distance_light_years integer NOT NULL,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: interstellar_objects interstellar_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.interstellar_objects ALTER COLUMN interstellar_objects_id SET DEFAULT nextval('public.interstellar_objects_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Barred spiral galaxy', 14, 'The milky way galaxy is a huge collection of stars, dust, and gas. It is called spiral because if we were to view it from the top or bottom it would look like a spinning wheel');
INSERT INTO public.galaxy VALUES (2, 'Andromeda galaxy', 'spiral galaxy', 10, 'Also known as Messier 31 (M31), is a spiral galaxy located about 2.5 million years from earth');
INSERT INTO public.galaxy VALUES (3, 'SagDEG', 'Elliptical Lopped-shaped', 8, 'SagDEG is a small elliptical looped-shaped galaxy of our milky way that lies 70,000 million years away from earth which lies in the sagittarius constellation');
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', 10, 'Spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'spiral', 11, 'spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'sombrero', 'spiral', 11, 'spiral galaxy');


--
-- Data for Name: interstellar_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.interstellar_objects VALUES (1, 'Asteroid', 8.0, false);
INSERT INTO public.interstellar_objects VALUES (2, 'Comet', 5.0, false);
INSERT INTO public.interstellar_objects VALUES (3, 'black-holes', 9.0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 2, 'Earths moon', 'Only moon to earth', NULL);
INSERT INTO public.moon VALUES (2, 5, 'Phobos', 'Mars moon', 1);
INSERT INTO public.moon VALUES (3, 5, 'Deimos', 'Mars moon', 1);
INSERT INTO public.moon VALUES (4, 6, 'Metis', 'Jupiiters moon', 1);
INSERT INTO public.moon VALUES (5, 6, 'Adrastea', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (6, 6, 'Callisto', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (7, 6, 'Io', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (8, 6, 'Thebe', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (9, 6, 'Europa', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (10, 6, 'Amalthea', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (11, 6, 'Ganymede', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (12, 6, 'Themisto', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (13, 6, 'Leda', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (14, 6, 'Himalia', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (15, 6, 'Lysithea', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (16, 6, 'Elara', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (17, 6, 'Ananke', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (18, 6, 'Carme', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (19, 6, 'Phasiphae', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (20, 6, 'Sinope', 'Jupiters moon', 1);
INSERT INTO public.moon VALUES (21, 7, 'Pan', 'Sarturn moon', 1);
INSERT INTO public.moon VALUES (22, 7, 'Atlas', 'Sarturn moon', 1);
INSERT INTO public.moon VALUES (23, 7, 'Prometheus', 'Saturns moon', 1);
INSERT INTO public.moon VALUES (24, 7, 'Pandora', 'Saturns moon', 1);
INSERT INTO public.moon VALUES (25, 7, 'Epimetheus', 'Sartuns moon', 1);
INSERT INTO public.moon VALUES (26, 7, 'Janus', 'Sartuns moon', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 4, true, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 4, false, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 4, false, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 4, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 4, false, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 4, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, false, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', 4, false, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 4, false, 1);
INSERT INTO public.planet VALUES (11, 'Eris', 4, false, 1);
INSERT INTO public.planet VALUES (12, 'Ceres', 4, false, 1);
INSERT INTO public.planet VALUES (13, 'Haumer', 4, false, 1);
INSERT INTO public.planet VALUES (14, 'Makemake', 4, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4, 0, 'The sun is the nearest star to the earth', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 230, 9, 'Emits a higher than expected level of infrared radiation', 1);
INSERT INTO public.star VALUES (3, 'Alpha-Andromedae', 70, 96, 'Brightest star in its constellation', 2);
INSERT INTO public.star VALUES (4, 'Pistol star', 5, 3, 'One of the biggest stars in the milky way', 1);
INSERT INTO public.star VALUES (5, 'R136a1', 5, 5, 'One of the biggest stars in the milky way', 1);
INSERT INTO public.star VALUES (6, 'Eta Carinae', 6, 5, 'One of the lagest stars in the milky way', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: interstellar_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.interstellar_objects_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: interstellar_objects interstellar_objects_interstellar_objects_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.interstellar_objects
    ADD CONSTRAINT interstellar_objects_interstellar_objects_id_key UNIQUE (interstellar_objects_id);


--
-- Name: interstellar_objects interstellar_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.interstellar_objects
    ADD CONSTRAINT interstellar_objects_pkey PRIMARY KEY (interstellar_objects_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- PostgreSQL database dump complete
--

