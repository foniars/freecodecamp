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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (33, 2018, 'Final', 87, 88, 2, 4);
INSERT INTO public.games VALUES (34, 2018, 'Third Place', 89, 90, 0, 2);
INSERT INTO public.games VALUES (35, 2018, 'Semi-Final', 88, 90, 1, 2);
INSERT INTO public.games VALUES (36, 2018, 'Semi-Final', 87, 89, 0, 1);
INSERT INTO public.games VALUES (37, 2018, 'Quarter-Final', 88, 91, 2, 3);
INSERT INTO public.games VALUES (38, 2018, 'Quarter-Final', 90, 92, 0, 2);
INSERT INTO public.games VALUES (39, 2018, 'Quarter-Final', 89, 93, 1, 2);
INSERT INTO public.games VALUES (40, 2018, 'Quarter-Final', 87, 94, 0, 2);
INSERT INTO public.games VALUES (41, 2018, 'Eighth-Final', 90, 95, 1, 2);
INSERT INTO public.games VALUES (42, 2018, 'Eighth-Final', 92, 96, 0, 1);
INSERT INTO public.games VALUES (43, 2018, 'Eighth-Final', 89, 97, 2, 3);
INSERT INTO public.games VALUES (44, 2018, 'Eighth-Final', 93, 98, 0, 2);
INSERT INTO public.games VALUES (45, 2018, 'Eighth-Final', 88, 99, 1, 2);
INSERT INTO public.games VALUES (46, 2018, 'Eighth-Final', 91, 100, 1, 2);
INSERT INTO public.games VALUES (47, 2018, 'Eighth-Final', 94, 101, 1, 2);
INSERT INTO public.games VALUES (48, 2018, 'Eighth-Final', 87, 102, 3, 4);
INSERT INTO public.games VALUES (49, 2014, 'Final', 103, 102, 0, 1);
INSERT INTO public.games VALUES (50, 2014, 'Third Place', 104, 93, 0, 3);
INSERT INTO public.games VALUES (51, 2014, 'Semi-Final', 102, 104, 0, 1);
INSERT INTO public.games VALUES (52, 2014, 'Semi-Final', 103, 93, 1, 7);
INSERT INTO public.games VALUES (53, 2014, 'Quarter-Final', 104, 105, 0, 1);
INSERT INTO public.games VALUES (54, 2014, 'Quarter-Final', 102, 89, 0, 1);
INSERT INTO public.games VALUES (55, 2014, 'Quarter-Final', 93, 95, 1, 2);
INSERT INTO public.games VALUES (56, 2014, 'Quarter-Final', 103, 87, 0, 1);
INSERT INTO public.games VALUES (57, 2014, 'Eighth-Final', 93, 106, 1, 2);
INSERT INTO public.games VALUES (58, 2014, 'Eighth-Final', 95, 94, 0, 2);
INSERT INTO public.games VALUES (59, 2014, 'Eighth-Final', 87, 107, 0, 2);
INSERT INTO public.games VALUES (60, 2014, 'Eighth-Final', 103, 108, 1, 2);
INSERT INTO public.games VALUES (61, 2014, 'Eighth-Final', 104, 98, 1, 2);
INSERT INTO public.games VALUES (62, 2014, 'Eighth-Final', 105, 109, 1, 2);
INSERT INTO public.games VALUES (63, 2014, 'Eighth-Final', 102, 96, 0, 1);
INSERT INTO public.games VALUES (64, 2014, 'Eighth-Final', 89, 110, 1, 2);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (87, 'France');
INSERT INTO public.teams VALUES (88, 'Croatia');
INSERT INTO public.teams VALUES (89, 'Belgium');
INSERT INTO public.teams VALUES (90, 'England');
INSERT INTO public.teams VALUES (91, 'Russia');
INSERT INTO public.teams VALUES (92, 'Sweden');
INSERT INTO public.teams VALUES (93, 'Brazil');
INSERT INTO public.teams VALUES (94, 'Uruguay');
INSERT INTO public.teams VALUES (95, 'Colombia');
INSERT INTO public.teams VALUES (96, 'Switzerland');
INSERT INTO public.teams VALUES (97, 'Japan');
INSERT INTO public.teams VALUES (98, 'Mexico');
INSERT INTO public.teams VALUES (99, 'Denmark');
INSERT INTO public.teams VALUES (100, 'Spain');
INSERT INTO public.teams VALUES (101, 'Portugal');
INSERT INTO public.teams VALUES (102, 'Argentina');
INSERT INTO public.teams VALUES (103, 'Germany');
INSERT INTO public.teams VALUES (104, 'Netherlands');
INSERT INTO public.teams VALUES (105, 'Costa Rica');
INSERT INTO public.teams VALUES (106, 'Chile');
INSERT INTO public.teams VALUES (107, 'Nigeria');
INSERT INTO public.teams VALUES (108, 'Algeria');
INSERT INTO public.teams VALUES (109, 'Greece');
INSERT INTO public.teams VALUES (110, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 64, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 110, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

