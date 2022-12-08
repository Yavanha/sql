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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    to_guess integer,
    score integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (69, 6, 158, 1);
INSERT INTO public.games VALUES (70, 6, 693, 2);
INSERT INTO public.games VALUES (71, 27, 637, 638);
INSERT INTO public.games VALUES (72, 27, 596, 597);
INSERT INTO public.games VALUES (73, 28, 642, 643);
INSERT INTO public.games VALUES (74, 28, 16, 17);
INSERT INTO public.games VALUES (75, 27, 595, 598);
INSERT INTO public.games VALUES (76, 27, 9, 11);
INSERT INTO public.games VALUES (77, 27, 181, 182);
INSERT INTO public.games VALUES (78, 29, 236, 237);
INSERT INTO public.games VALUES (79, 29, 326, 327);
INSERT INTO public.games VALUES (80, 30, 808, 809);
INSERT INTO public.games VALUES (81, 30, 455, 456);
INSERT INTO public.games VALUES (82, 29, 295, 298);
INSERT INTO public.games VALUES (83, 29, 869, 871);
INSERT INTO public.games VALUES (84, 29, 676, 677);
INSERT INTO public.games VALUES (85, 31, 835, 836);
INSERT INTO public.games VALUES (86, 31, 636, 637);
INSERT INTO public.games VALUES (87, 32, 86, 87);
INSERT INTO public.games VALUES (88, 32, 16, 17);
INSERT INTO public.games VALUES (89, 31, 548, 551);
INSERT INTO public.games VALUES (90, 31, 998, 1000);
INSERT INTO public.games VALUES (91, 31, 452, 453);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (6, 'k4rb0w');
INSERT INTO public.users VALUES (7, 'user_1670531915930');
INSERT INTO public.users VALUES (8, 'user_1670531915929');
INSERT INTO public.users VALUES (9, 'qdskdqsfqdsfmkjqdsfmlkqdsfmlqkdsjfmlkdsjfq');
INSERT INTO public.users VALUES (10, 'klmdfdqlksjfqdslkfjqdsqdslkfqmdslkfjdsfq');
INSERT INTO public.users VALUES (11, 'user_1670532364838');
INSERT INTO public.users VALUES (12, 'user_1670532364837');
INSERT INTO public.users VALUES (13, 'user_1670532391597');
INSERT INTO public.users VALUES (14, 'user_1670532391596');
INSERT INTO public.users VALUES (15, 'user_1670532676208');
INSERT INTO public.users VALUES (16, 'user_1670532676207');
INSERT INTO public.users VALUES (17, 'user_1670532763690');
INSERT INTO public.users VALUES (18, 'user_1670532763689');
INSERT INTO public.users VALUES (19, 'user_1670532931618');
INSERT INTO public.users VALUES (20, 'user_1670532931617');
INSERT INTO public.users VALUES (21, 'user_1670532937226');
INSERT INTO public.users VALUES (22, 'user_1670532937225');
INSERT INTO public.users VALUES (23, 'user_1670533025509');
INSERT INTO public.users VALUES (24, 'user_1670533025508');
INSERT INTO public.users VALUES (25, 'user_1670533136638');
INSERT INTO public.users VALUES (26, 'user_1670533136637');
INSERT INTO public.users VALUES (27, 'user_1670533405194');
INSERT INTO public.users VALUES (28, 'user_1670533405193');
INSERT INTO public.users VALUES (29, 'user_1670533451376');
INSERT INTO public.users VALUES (30, 'user_1670533451375');
INSERT INTO public.users VALUES (31, 'user_1670533508033');
INSERT INTO public.users VALUES (32, 'user_1670533508032');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 91, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 32, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

