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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    meaning text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    has_life integer,
    name character varying(30) NOT NULL,
    description text,
    constellation character varying(30),
    galaxy_type character varying(30)
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
    scale character varying(30),
    color character varying(30),
    planet_id integer NOT NULL
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
    eccentricity_of_orbit numeric(5,4),
    is_spherical boolean,
    age_in_million_of_years integer,
    has_life boolean NOT NULL,
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
    constellation character varying(30),
    designation character varying(40),
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromedae', 'Andromeda (The chained maiden or princess)');
INSERT INTO public.constellation VALUES (2, 'Antlia', 'air pump');
INSERT INTO public.constellation VALUES (3, 'Apus', 'Bird-of-paradise/Exotic Bird/Extraordinary Bird');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 0, 'Andromeda Galaxy', 'Andromeda, which is is the closest big galaxy to the Milky Way and is expected to collide the Milky Way around 4.5 billion years from now. The two will eventually merge into a single a n galaxy called Milkdromeda', 'Andromeda', 'spiral');
INSERT INTO public.galaxy VALUES (2, 1, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth', 'Sagittarius', 'spiral');
INSERT INTO public.galaxy VALUES (3, 0, 'Backward Galaxy', 'The spiral galaxy, NGC 4622 (also called Backward galaxy), lies approximately 111 million light years away from Earth in the constellation Centaurus. NGC 4622 is an example of a galaxy with leading spiral arms.[2]', 'Centaurus', 'spiral');
INSERT INTO public.galaxy VALUES (4, 0, 'Condor Galaxy', 'The largest known spiral galaxy, it has a diameter of over 665,300 light-years (204.0 kiloparsecs).[3] It is tidally disturbed by the smaller lenticular galaxy IC 4970.[4]', 'Pavo', 'spiral');
INSERT INTO public.galaxy VALUES (5, 0, 'Coma Pinwheel Galaxy', 'Messier 99 or M99, also known as NGC 4254, is a grand design spiral galaxy in the northern constellation Coma Berenices approximately 15,000,000 parsecs (49,000,000 light-years) from the Milky Way.[5] It was discovered by Pierre Méchain on 17 March 1781. The discovery was then reported to Charles Messier, who included the object in the Messier Catalogue of comet-like objects. It was one of the first galaxies in which a spiral pattern was seen. This pattern was first identified by Lord Rosse in the spring of 1846.[10]', 'Coma Benerices', 'spiral');
INSERT INTO public.galaxy VALUES (6, 0, 'Cartwheel Galaxy', 'The Cartwheel Galaxy (also known as ESO 350-40 or PGC 2248) is a lenticular ring galaxy about 500 million light-years away in the constellation Sculptor.[1] It has a D25 isophotal diameter of 44.23 kiloparsecs (144,300 light-years), and a mass of about 2.9–4.8 × 109 solar masses; its outer ring has a circular velocity of 217 km/s.[5] It was discovered by Fritz Zwicky in 1941.[6] Zwicky considered his discovery "one of the most complicated structures awaiting its explanation on the basis of stellar dynamics."[6][7]', 'Sculptor', 'spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'very very small', 'gray', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'very small', 'gray', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'very small', 'gray', 4);
INSERT INTO public.moon VALUES (4, 'Io', 'big', 'gold yellow white', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'big', 'white', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Huge', 'dark gray', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'very big', 'black white', 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 'small', 'gray', 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'small', 'gray', 6);
INSERT INTO public.moon VALUES (10, 'Tethys', 'normal', 'gray', 6);
INSERT INTO public.moon VALUES (11, 'Dione', 'normal', 'gray', 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Large', 'gray', 6);
INSERT INTO public.moon VALUES (13, 'Titan', 'Huge', 'yellow', 6);
INSERT INTO public.moon VALUES (14, 'Hyperion', 'small', 'gray', 6);
INSERT INTO public.moon VALUES (15, 'Lapetus', 'Large', 'gray', 6);
INSERT INTO public.moon VALUES (16, 'Phoebe', 'very small', 'gray', 6);
INSERT INTO public.moon VALUES (17, 'Puck', 'very small', 'gray', 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 'small', 'gray', 7);
INSERT INTO public.moon VALUES (19, 'Ariel', 'normal', 'gray', 7);
INSERT INTO public.moon VALUES (20, 'Umbriel', 'normal', 'gray', 7);
INSERT INTO public.moon VALUES (21, 'Titania', 'large', 'gray', 7);
INSERT INTO public.moon VALUES (22, 'Oberon', 'large', 'gray', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.2056, true, 4600, false, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 0.0070, true, 4600, false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 0.0167, true, 4600, true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 0.0930, true, 4600, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 0.0480, true, 4600, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 0.0540, true, 4600, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, true, 4600, false, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, true, 4600, false, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, true, 4600, false, 2);
INSERT INTO public.planet VALUES (10, 'Makemake', NULL, true, 4600, false, 2);
INSERT INTO public.planet VALUES (11, 'Eris', NULL, true, 4600, false, 2);
INSERT INTO public.planet VALUES (12, 'Haumea', NULL, true, 4600, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Absolutno', 'Lynx', 'XO-5', 2);
INSERT INTO public.star VALUES (2, 'Acamar', 'Eridanus', 'θ1 Eridani A', 2);
INSERT INTO public.star VALUES (3, 'Achird', 'Cassiopeia', 'η Cassiopeiae A', 2);
INSERT INTO public.star VALUES (4, 'Acrab', 'Scorpius', 'β1 Scorpii Aa', 2);
INSERT INTO public.star VALUES (5, 'Ain', 'Taurus', 'ε Tauri Aa1', 2);
INSERT INTO public.star VALUES (6, 'Sun', NULL, NULL, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, false);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

