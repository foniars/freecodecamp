--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    guesses integer
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
    username character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (34, 13, 452);
INSERT INTO public.games VALUES (35, 13, 690);
INSERT INTO public.games VALUES (36, 14, 532);
INSERT INTO public.games VALUES (37, 14, 973);
INSERT INTO public.games VALUES (38, 13, 135);
INSERT INTO public.games VALUES (39, 13, 569);
INSERT INTO public.games VALUES (40, 13, 251);
INSERT INTO public.games VALUES (41, 15, 14);
INSERT INTO public.games VALUES (42, 16, 65);
INSERT INTO public.games VALUES (43, 16, 326);
INSERT INTO public.games VALUES (44, 17, 8);
INSERT INTO public.games VALUES (45, 17, 704);
INSERT INTO public.games VALUES (46, 16, 140);
INSERT INTO public.games VALUES (47, 16, 689);
INSERT INTO public.games VALUES (48, 16, 540);
INSERT INTO public.games VALUES (49, 18, 41);
INSERT INTO public.games VALUES (50, 18, 522);
INSERT INTO public.games VALUES (51, 19, 735);
INSERT INTO public.games VALUES (52, 19, 158);
INSERT INTO public.games VALUES (53, 18, 780);
INSERT INTO public.games VALUES (54, 18, 98);
INSERT INTO public.games VALUES (55, 18, 154);
INSERT INTO public.games VALUES (56, 20, 281);
INSERT INTO public.games VALUES (57, 20, 628);
INSERT INTO public.games VALUES (58, 21, 183);
INSERT INTO public.games VALUES (59, 21, 646);
INSERT INTO public.games VALUES (60, 20, 572);
INSERT INTO public.games VALUES (61, 20, 554);
INSERT INTO public.games VALUES (62, 20, 463);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (13, 'user_1746557213605');
INSERT INTO public.users VALUES (14, 'user_1746557213604');
INSERT INTO public.users VALUES (15, 'user');
INSERT INTO public.users VALUES (16, 'user_1746557301792');
INSERT INTO public.users VALUES (17, 'user_1746557301791');
INSERT INTO public.users VALUES (18, 'user_1746557318834');
INSERT INTO public.users VALUES (19, 'user_1746557318833');
INSERT INTO public.users VALUES (20, 'user_1746557358504');
INSERT INTO public.users VALUES (21, 'user_1746557358503');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 62, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 21, true);


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

