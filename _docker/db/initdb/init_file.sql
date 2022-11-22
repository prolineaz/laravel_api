--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-22 10:59:56 UTC

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

-- DROP DATABASE softlightt3;
--
-- TOC entry 3392 (class 1262 OID 16388)
-- Name: softlightt3; Type: DATABASE; Schema: -; Owner: postgres
--

-- CREATE DATABASE IF NOT EXISTS softlightt3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE softlightt3 OWNER TO postgres;


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
-- TOC entry 226 (class 1259 OID 16572)
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    comment text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16571)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 225
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 220 (class 1259 OID 16539)
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16538)
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 219
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- TOC entry 215 (class 1259 OID 16390)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16389)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 214
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 218 (class 1259 OID 16532)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16551)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16550)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 221
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 224 (class 1259 OID 16563)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16562)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 223
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- TOC entry 217 (class 1259 OID 16522)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16521)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3211 (class 2604 OID 16581)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 16582)
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 16583)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 16584)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 16585)
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 16586)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3386 (class 0 OID 16572)
-- Dependencies: 226
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (1, 5, 56, 'Animi fugit maiores temporibus amet expedita iusto accusantium rerum.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (2, 2, 6, 'Voluptatem animi qui modi fugit fugit molestiae sit in quaerat.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (3, 2, 48, 'Voluptatem dolores perferendis corrupti distinctio et beatae omnis.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (4, 5, 55, 'Ut cum non a placeat ut aliquam officia aut placeat voluptate et maxime recusandae.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (5, 2, 96, 'Rerum perferendis eius officiis voluptas magni et consequatur a est similique nobis nemo.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (6, 5, 51, 'Quas cupiditate incidunt temporibus at voluptatem dolor incidunt laborum.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (7, 4, 92, 'Dolorem est distinctio eveniet nobis dolores quos sapiente.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (8, 2, 78, 'Quia sit ipsam vero minus nisi repudiandae ut nihil error.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (9, 1, 20, 'Sed enim voluptatum porro minima maxime voluptates consectetur dolor sed et maxime sed quas.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (10, 1, 8, 'Libero nihil velit eius a sit provident dolores.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (11, 3, 74, 'Modi repellendus dolore esse adipisci qui cum aut optio vero voluptate qui voluptate.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (12, 4, 16, 'Similique consequatur consequatur nisi optio quia quod harum qui ipsa a aut expedita fuga.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (13, 4, 94, 'Voluptates ullam qui aut aut quos unde placeat fugit eum animi beatae voluptatem adipisci.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (14, 2, 75, 'Explicabo ut ut sunt id dignissimos neque incidunt.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (15, 3, 56, 'Aut a iste consequatur eligendi est aliquid voluptatem.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (16, 2, 40, 'Autem voluptatem eligendi voluptates fugit non officia suscipit.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (17, 2, 29, 'Voluptas quis nam quos quos odit consectetur sunt aut reiciendis earum enim voluptas nulla.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (18, 2, 32, 'Sint sint cumque incidunt alias nobis accusamus repellat inventore impedit dolorem in est.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (19, 3, 1, 'Repellat consequatur suscipit laudantium laborum provident et blanditiis aut.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (20, 2, 21, 'Non nobis minima accusamus est libero eos nulla eum perferendis animi in porro.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (21, 4, 10, 'Ut repudiandae non quas vero consequatur velit omnis voluptas quos neque ut voluptas.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (22, 4, 32, 'Perferendis atque et nesciunt iste ea debitis assumenda ex quae expedita quos provident.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (23, 3, 70, 'Sequi qui qui omnis consequatur ea magni sunt tenetur neque repellendus.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (24, 2, 43, 'Molestias vel eum tenetur veritatis qui et est est unde sed.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (25, 2, 31, 'Vero blanditiis adipisci non dolorum fuga odio ex et ut.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (26, 5, 25, 'Voluptates dolorem officiis doloribus quae ducimus soluta tempora provident molestiae et unde.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (27, 5, 85, 'Voluptate eaque animi quae vel magni voluptatem velit rerum eos aut tenetur.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (28, 1, 15, 'Praesentium accusamus ut animi aut quasi omnis in odio sint et.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (29, 2, 28, 'Et modi pariatur fuga culpa natus et ut dolorem repellendus.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (30, 2, 11, 'Et eum a est dolore quaerat voluptates.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (31, 2, 77, 'Repellat ipsam repudiandae eius odit omnis assumenda corrupti laudantium aut ut voluptatem saepe.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (32, 2, 94, 'Officia cumque earum ad dolores error modi.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (33, 3, 46, 'Sed voluptatum voluptatem enim iusto iure nulla dolores qui modi.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (34, 5, 86, 'Vel et possimus quibusdam est totam rem sunt nulla temporibus vitae vel nihil.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (35, 5, 58, 'Vel beatae cumque cupiditate ducimus dolor ut architecto.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (36, 5, 79, 'Similique cumque voluptatum illo veritatis voluptate eaque sit placeat accusantium.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (37, 1, 18, 'Assumenda labore aperiam id ullam est ut doloribus consequuntur laudantium consequuntur tenetur.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (38, 1, 16, 'A inventore architecto asperiores aspernatur assumenda placeat beatae.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (39, 2, 63, 'Ea quibusdam corrupti velit incidunt maxime nam cum minus.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (40, 1, 30, 'Quidem aliquid accusantium velit mollitia placeat corporis impedit cupiditate omnis et eos tempore.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (41, 3, 17, 'Nulla eveniet distinctio maxime aut et quidem facere labore.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (42, 4, 21, 'Dolores consequuntur quas molestiae suscipit quia quibusdam id occaecati qui beatae sunt pariatur.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (43, 3, 40, 'Unde esse sit et harum esse dolor.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (44, 5, 74, 'Excepturi minima sint veniam vero minima recusandae aut explicabo cumque inventore.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (45, 3, 62, 'Quas aliquam quis quam beatae et est doloribus quia dolorem veniam.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (46, 4, 14, 'Necessitatibus non ex dolor provident dolores veniam.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (47, 5, 16, 'Nostrum modi veniam sequi aspernatur nobis voluptas dolores ad.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (48, 5, 52, 'Ad reiciendis eius reiciendis corporis accusamus veniam provident libero.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (49, 3, 59, 'Qui commodi unde quia et ducimus ut sapiente.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (50, 3, 8, 'Molestias voluptates similique fugiat quia et in dignissimos.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (51, 4, 50, 'Et voluptates est quis quo est quia aliquam quam aliquid est distinctio voluptatem enim.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (52, 4, 39, 'Atque officia in mollitia nisi velit ut.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (53, 5, 78, 'Perspiciatis sapiente aspernatur est veniam veniam perferendis autem reprehenderit itaque cupiditate incidunt aliquid reiciendis tenetur.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (54, 5, 51, 'Natus temporibus ratione nostrum cupiditate porro saepe porro molestias quo qui blanditiis.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (55, 1, 32, 'Est est quas nam tempora voluptatum nulla reprehenderit at.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (56, 3, 28, 'Illo et maxime doloribus quibusdam omnis eum tempora quis consectetur aut.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (57, 1, 61, 'Deserunt eaque et et quasi voluptatibus necessitatibus ut debitis.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (58, 4, 44, 'Omnis sint nobis quis sunt odit expedita voluptas expedita dignissimos doloremque tempore saepe neque.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (59, 4, 77, 'Voluptas repudiandae tempore ipsa amet alias vero illo nihil dignissimos repellat ea quia.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (60, 5, 11, 'Eum quo voluptatem nisi quia distinctio velit aut ea.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (61, 1, 64, 'Architecto cumque labore in vel officia delectus tempore repellat suscipit aut aut incidunt.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (62, 2, 22, 'Aut inventore rerum quo et facilis quia.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (63, 3, 71, 'Blanditiis voluptatem aut ducimus ad possimus perspiciatis officiis ratione omnis amet adipisci adipisci cumque.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (64, 5, 50, 'Sapiente exercitationem est ut fugit tempora quia adipisci in qui.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (65, 1, 23, 'Hic maxime veritatis sint odio dolor placeat delectus rerum.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (66, 2, 57, 'Nisi at suscipit enim explicabo ut aut tenetur nihil officia quo quae sunt.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (67, 4, 34, 'Quia dolorum illo dolores modi ea aut.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (68, 2, 45, 'Totam culpa in et qui ut qui.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (69, 3, 67, 'Tempora assumenda eveniet qui sapiente beatae ut voluptas modi et aut quia tenetur doloremque.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (70, 2, 77, 'Provident dicta provident excepturi nihil magnam omnis molestiae optio numquam molestiae rerum eos id.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (71, 5, 23, 'Sunt amet voluptas aut inventore velit placeat vitae est delectus quia autem repudiandae.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (72, 5, 54, 'Quisquam adipisci voluptates consequuntur minima et fugit.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (73, 3, 11, 'Blanditiis non reiciendis corrupti est voluptatem nobis dicta modi perferendis qui qui sit fugit.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (74, 1, 9, 'Eos sunt dolor accusamus voluptas veritatis debitis aut tenetur nisi reiciendis quam.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (75, 5, 83, 'Qui est aut voluptatem non eveniet quis eos.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (76, 3, 17, 'Nisi sit ut nulla consectetur nihil id autem nostrum.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (77, 1, 53, 'Recusandae porro qui quis reprehenderit aliquam voluptas unde atque.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (78, 4, 29, 'Ut consequatur omnis libero quaerat consequatur quas dolor.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (79, 3, 100, 'Et aliquid veniam omnis neque necessitatibus blanditiis aspernatur.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (80, 5, 80, 'Quas error explicabo rerum impedit molestiae amet molestias nihil vel pariatur ipsum.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (81, 2, 29, 'Id officia rerum voluptatem dicta rerum ducimus sed dolor.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (82, 2, 73, 'Et rerum incidunt excepturi sit architecto et impedit delectus.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (83, 5, 14, 'Consequatur sit asperiores voluptates ullam quod error nemo consequatur suscipit suscipit.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (84, 3, 91, 'Ut iusto quas qui libero aliquid et magnam dolores quos voluptatibus.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (85, 5, 92, 'Ipsa ullam dolores a consequatur reprehenderit a.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (86, 3, 14, 'Ducimus sapiente voluptas enim exercitationem autem eaque aliquam et modi corrupti.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (87, 4, 100, 'Doloribus omnis suscipit accusamus fuga quis fuga impedit est aut totam molestias.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (88, 3, 78, 'Ex voluptas id minus nesciunt ipsam excepturi dolores odio rerum.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (89, 4, 88, 'Laudantium et doloremque voluptates ratione nobis tempora in.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (90, 1, 6, 'Et quo et iste ab fuga ut.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (91, 1, 29, 'Nesciunt maiores laborum sed aut ducimus deserunt quisquam sit repudiandae labore exercitationem architecto non.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (92, 3, 22, 'Facere et qui tempore magni unde provident labore.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (93, 4, 90, 'Libero fugit ut et deserunt cupiditate recusandae reprehenderit ratione delectus aut aut alias.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (94, 2, 16, 'Qui officia quis possimus aut quam velit dolores saepe qui aliquid quaerat eveniet sed.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (95, 2, 24, 'Odio sed itaque vero accusamus placeat mollitia sint corporis quidem.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (96, 5, 13, 'Vero consequatur voluptatibus impedit eveniet et est.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (97, 4, 94, 'Est ut et eos dolorem voluptas sunt quo consequatur.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (98, 4, 51, 'Id totam sint atque consequatur perferendis voluptatem atque placeat nihil numquam optio.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (99, 3, 70, 'Corporis sint in ut iure fuga quae voluptas quod alias laborum assumenda nam et occaecati.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');
INSERT INTO public.comments (id, user_id, post_id, comment, created_at, updated_at) VALUES (100, 5, 5, 'Totam eos quo consequatur quo et culpa repudiandae dolores numquam.', '2022-11-22 10:58:19', '2022-11-22 10:58:19');


--
-- TOC entry 3380 (class 0 OID 16539)
-- Dependencies: 220
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3375 (class 0 OID 16390)
-- Dependencies: 215
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.migrations (id, migration, batch) VALUES (7, '2014_10_12_000000_create_users_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (8, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (9, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (10, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (11, '2022_11_21_202755_create_posts_table', 1);
INSERT INTO public.migrations (id, migration, batch) VALUES (12, '2022_11_21_202804_create_comments_table', 1);


--
-- TOC entry 3378 (class 0 OID 16532)
-- Dependencies: 218
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3382 (class 0 OID 16551)
-- Dependencies: 222
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3384 (class 0 OID 16563)
-- Dependencies: 224
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (1, 3, 'Consectetur magnam iste repellat.', 'Facilis voluptas nisi id eos totam tempore enim omnis qui sunt voluptates.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (2, 3, 'Placeat est.', 'Cupiditate aperiam error illum dolores omnis sint corporis culpa quis commodi sunt quae enim.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (3, 1, 'Omnis hic praesentium sunt.', 'Ducimus nihil dolores rerum voluptatibus iure ipsa reiciendis occaecati a qui.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (4, 3, 'Nemo minima rerum.', 'Facilis et et fugiat sunt occaecati repellendus saepe itaque eos.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (5, 2, 'Ipsam sed fugit fuga.', 'Laudantium placeat nihil sed omnis nemo maiores labore.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (6, 5, 'Eum occaecati consequatur debitis.', 'Autem sunt aut veniam rem qui facilis voluptas eum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (7, 4, 'Necessitatibus odio est.', 'Reiciendis nemo quas quam occaecati nobis veniam debitis praesentium.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (8, 4, 'Laboriosam ut exercitationem.', 'Illum vel nihil eligendi vel et sequi ipsum aliquid unde fuga.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (9, 3, 'Cupiditate et quisquam nemo.', 'A veniam tenetur voluptas exercitationem accusantium facilis quia.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (10, 5, 'Error molestias explicabo.', 'Quia voluptatibus sed et consectetur sunt voluptas pariatur.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (11, 3, 'Rerum sed ut sed.', 'Aut laudantium excepturi aut culpa est error ut.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (12, 3, 'Aliquam id et ullam sed.', 'Hic quo dolorem quidem possimus veritatis rerum harum sit consequatur libero aut necessitatibus.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (13, 1, 'Sed delectus ut repudiandae.', 'Rerum vitae neque ut sed quis atque blanditiis facere vitae non aut quasi eaque.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (14, 2, 'Sed est quod.', 'Et occaecati soluta delectus omnis maiores eius neque eum debitis exercitationem nostrum aperiam alias.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (15, 5, 'Qui quod ducimus quis.', 'Nihil facere consequuntur earum voluptatem magnam minima perspiciatis ipsa animi nulla sit odio.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (16, 2, 'Vel inventore quaerat.', 'Dolores quia itaque aut corrupti est nobis modi nobis esse voluptas deserunt deserunt.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (17, 1, 'Est ut qui.', 'Quod sed quia eum et reiciendis sed nihil numquam et numquam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (18, 2, 'Libero deserunt hic.', 'Repellendus aut aut maiores aut aliquam dolorem enim voluptas rerum recusandae quam est est.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (19, 2, 'Fugit facilis suscipit assumenda.', 'Nam laboriosam delectus deleniti aliquid doloribus et tenetur.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (20, 1, 'Occaecati similique porro.', 'Necessitatibus quo eos repudiandae eos aut nisi maxime.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (21, 1, 'Rerum est incidunt dolor.', 'Ducimus quo dolor et tenetur asperiores est ab ut vero non officia magnam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (22, 2, 'Facere non animi voluptatum.', 'Velit quod consequatur est nihil quo voluptatem eveniet consectetur aut officia.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (23, 1, 'Deleniti eaque autem eveniet.', 'Repellat dolores recusandae aliquam quidem voluptatem a aut praesentium rerum accusantium voluptatem.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (24, 3, 'Non ipsa vel adipisci.', 'Ut maxime qui consequatur dolor ad nesciunt omnis dolores veniam alias fugiat.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (25, 5, 'Sint soluta nisi.', 'Sed consequuntur qui est qui minus mollitia ex cum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (26, 4, 'Iure et.', 'Sed molestiae veritatis est possimus id distinctio.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (27, 3, 'Necessitatibus inventore sint minima.', 'Laboriosam et doloribus dolor autem officia deleniti voluptas.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (28, 5, 'Et omnis laboriosam qui.', 'Atque fuga voluptatem maxime modi magni error asperiores expedita nisi et.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (29, 4, 'Veniam ea nihil.', 'Harum explicabo aliquam saepe architecto quis exercitationem quis odio totam consequuntur aut.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (30, 2, 'Sint incidunt ipsam.', 'Natus iusto nulla tempore distinctio et blanditiis ab dicta placeat maiores eos in.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (31, 2, 'Natus odio voluptas nisi eaque.', 'Sequi maxime qui quasi laudantium corrupti nemo ut tempore.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (32, 2, 'Similique ab dignissimos blanditiis.', 'Sapiente magnam doloribus temporibus vel beatae suscipit et dicta.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (33, 3, 'Magni sit quidem rerum.', 'Tempora quibusdam quod aut magni reprehenderit quia corporis.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (34, 2, 'Iste recusandae praesentium.', 'Facere odit est autem eaque ea ipsam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (35, 1, 'Quis earum quod.', 'Laborum autem rerum dolorem voluptatem labore suscipit.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (36, 5, 'Possimus optio perspiciatis.', 'Magnam esse quis vel nisi quia et autem aut adipisci labore magnam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (37, 2, 'Ab ut.', 'Fugit corrupti dolor facilis quasi atque corporis repudiandae quia eveniet nostrum sit rerum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (38, 3, 'Tenetur qui voluptas est.', 'Harum rerum perferendis consectetur culpa necessitatibus recusandae ut dolorem dolores et similique reiciendis.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (39, 5, 'Voluptates nihil porro.', 'Dolor sit qui aliquam in inventore officiis harum dignissimos nostrum dolorem sunt ea.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (40, 5, 'Est quos eius.', 'Sed dicta deserunt dolor inventore quo laudantium et explicabo commodi vel.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (41, 4, 'Quidem sint repellat.', 'Sapiente deleniti reprehenderit rerum distinctio voluptas dolores molestias et rem molestiae ut aut.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (42, 2, 'Eos laboriosam repellat.', 'Aliquam aliquid adipisci fugit molestias autem sit earum suscipit dolorum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (43, 2, 'Corporis nemo nostrum.', 'Facere consequuntur fugiat eos dolor et voluptas dolorem deserunt quo quae libero assumenda illum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (44, 2, 'Et nesciunt doloremque.', 'Ex qui quia eius cupiditate dolorum iure consequuntur ipsum dolores non temporibus.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (45, 2, 'Similique qui.', 'Aperiam quod odio sit similique ipsum voluptatibus vel non eveniet.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (46, 2, 'Soluta odit et.', 'Exercitationem corrupti odit voluptas perspiciatis itaque id tempore officiis et cumque iste.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (47, 5, 'Illo aut a laudantium.', 'Vero est eum sit vero error quam dignissimos quo ad provident culpa sit.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (48, 1, 'Sed natus.', 'Voluptate occaecati sed ut consequatur voluptatum asperiores incidunt provident voluptatem ut qui.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (49, 3, 'Dolores nihil et.', 'Maxime debitis et laudantium eaque perferendis eligendi aut debitis aliquam eligendi.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (50, 3, 'Ut libero consequatur tempore.', 'Eaque sunt sapiente ab nemo iusto porro.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (51, 3, 'Sed repellendus quia nihil.', 'Repellat sed dolores vel ex eum enim eos voluptas iusto quia.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (52, 2, 'Suscipit ducimus architecto.', 'Facilis nobis error similique quasi sunt consectetur natus hic rerum nisi et.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (53, 3, 'Vel et ea.', 'Laboriosam libero corporis consequatur quam aliquam autem.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (54, 4, 'Non laboriosam doloribus esse.', 'Voluptates mollitia et sequi architecto eos necessitatibus quaerat ipsa quo tenetur.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (55, 2, 'Sit veritatis aut ut.', 'Qui voluptatem nesciunt vitae voluptas et id rerum enim nesciunt id facilis.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (56, 2, 'Nesciunt ut provident est.', 'Ipsam qui nemo recusandae quod quia doloribus vel et et sed temporibus illo.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (57, 3, 'Sit nam labore aliquam.', 'Laborum ut voluptatem in et sit sit error mollitia ipsa minus vero et et.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (58, 5, 'Ut aut ea.', 'Ipsa laboriosam sunt ratione quaerat occaecati iusto laudantium.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (59, 4, 'Error deserunt repellat laborum.', 'Libero et fugit consequatur et fugiat asperiores similique aperiam distinctio atque facilis illo.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (60, 4, 'Illo quis et animi natus.', 'Quae debitis error unde quaerat accusamus ut quia dolor repudiandae sed et vel voluptas.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (61, 4, 'Neque blanditiis laudantium qui.', 'Sit iure aut minus et similique et minus quo sed consequatur eveniet cupiditate quibusdam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (62, 3, 'Consequatur sit.', 'Atque dolorem id culpa autem numquam et qui doloremque ratione.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (63, 3, 'Qui deserunt nemo reprehenderit.', 'Dignissimos odio temporibus numquam dicta veniam dolor vel.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (64, 4, 'Rerum rerum omnis consequatur.', 'Dolor iure dolores est aut nostrum non est necessitatibus et amet.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (65, 1, 'Placeat cumque aspernatur.', 'Ut non esse ducimus molestiae hic et voluptatem.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (66, 5, 'Optio eum sit voluptatibus.', 'Sint doloribus blanditiis rerum impedit perspiciatis dicta ut non quia labore laborum minima voluptatem.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (67, 1, 'Molestiae non similique quae.', 'Numquam harum repellendus sit velit corporis quos modi tempore earum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (68, 4, 'Id et eaque.', 'Magnam sint eaque maiores dolorem quia dolorem exercitationem.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (69, 1, 'Et consequatur est.', 'Iure vero qui ipsa provident autem et expedita ut consequatur.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (70, 3, 'Magnam qui aliquam.', 'Sequi omnis maxime quo natus at et eligendi consectetur dolores veritatis dignissimos eveniet.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (71, 4, 'Sit id aliquam.', 'Repellendus quae ab repudiandae sunt ipsam dolor.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (72, 4, 'Explicabo ut ut.', 'Necessitatibus vero iusto amet id quisquam nisi facilis quis voluptatem velit incidunt voluptas aut.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (73, 5, 'Dolorum ducimus labore dicta.', 'Voluptatem omnis magni eius in labore possimus illum qui eveniet vel saepe voluptas.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (74, 2, 'Quia nisi debitis ad.', 'Ad et voluptatem et sapiente amet mollitia.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (75, 2, 'Non totam quidem.', 'Consectetur et nobis consectetur vero nemo aperiam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (76, 5, 'Et animi odio.', 'Rerum repellendus numquam numquam qui iste nobis provident et nam in vel voluptatum itaque.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (77, 3, 'Reprehenderit dolores vel perferendis.', 'Quia quam suscipit magni fuga perferendis aspernatur quos debitis.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (78, 4, 'Magni omnis aut.', 'Voluptas molestias mollitia et odio in molestias vero.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (79, 2, 'Debitis ipsam enim.', 'Aliquid qui odit cupiditate quia aut corporis qui.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (80, 5, 'Exercitationem recusandae vero nisi officiis.', 'Praesentium temporibus sunt praesentium pariatur qui iste sint praesentium dolorem architecto qui consequatur fugit.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (81, 5, 'Molestiae neque.', 'Velit doloremque eum alias unde deserunt et ut voluptatem aspernatur corporis.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (82, 1, 'Facilis quas et a.', 'Est eligendi aliquid ad est tempore eveniet ratione eligendi ut numquam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (83, 5, 'Id sint qui.', 'Ipsum ipsum vero voluptatem eum ut quas dolorem veritatis nihil id dolores odio.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (84, 1, 'Inventore qui ad vel.', 'Ex facilis praesentium perferendis minima velit iusto quia officia accusantium fugiat optio enim dolorem.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (85, 5, 'Qui quis illo sed.', 'Officiis dolor dolor asperiores qui ut consequuntur hic cupiditate.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (86, 4, 'Adipisci earum quaerat.', 'Dolorum quis ut impedit velit incidunt dolor.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (87, 4, 'Nostrum corporis dolore voluptatem.', 'Beatae excepturi voluptas officia consequatur vitae veritatis occaecati et dignissimos deleniti atque ea.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (88, 2, 'Cum et sit.', 'Alias impedit doloribus optio aut et aperiam soluta officiis vero.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (89, 2, 'Aut ea at.', 'Quia est qui adipisci voluptatibus quia sit esse unde ea quis qui.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (90, 3, 'Est dicta et.', 'Reprehenderit suscipit possimus nesciunt voluptas aut dolore eveniet cum.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (91, 3, 'Voluptatem omnis molestiae.', 'Recusandae voluptatem pariatur placeat molestiae natus veniam non dolorem libero ad aperiam explicabo.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (92, 2, 'Aut hic nihil.', 'Voluptatem nulla dignissimos nisi totam consequuntur provident aut qui.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (93, 4, 'Ipsam quaerat esse libero.', 'Sit nisi recusandae saepe architecto voluptas culpa earum facilis autem non rerum veniam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (94, 4, 'Veniam exercitationem totam placeat.', 'Veritatis dolorem eius a sed saepe velit non neque ullam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (95, 4, 'Architecto commodi autem.', 'Veritatis vel ratione et porro sunt id itaque omnis accusantium.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (96, 2, 'Consequuntur eligendi.', 'Fugiat nulla aut nostrum sit et aut voluptate provident quibusdam nulla quisquam.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (97, 2, 'Amet et sequi sunt.', 'Animi tempore veniam porro ut amet odio similique.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (98, 2, 'Error excepturi dolorem.', 'Ullam ex odit aliquid veritatis qui reiciendis eligendi quia.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (99, 4, 'Quibusdam aperiam minima ab non.', 'Nemo non nam velit unde quo libero dignissimos et sequi libero voluptatem nihil.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (100, 3, 'Id consectetur impedit delectus.', 'Amet recusandae voluptates doloremque iure exercitationem aut cupiditate quasi ut quas et perspiciatis.', '2022-11-22 10:58:17', '2022-11-22 10:58:17');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (101, 1, 'Any title', 'Any description', '2022-11-22 10:58:42', '2022-11-22 10:58:42');
INSERT INTO public.posts (id, user_id, title, description, created_at, updated_at) VALUES (102, 1, 'Any title', 'Any description', '2022-11-22 10:58:47', '2022-11-22 10:58:47');


--
-- TOC entry 3377 (class 0 OID 16522)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (1, 'Test', 'demouser@gmail.com', NULL, '$2y$10$E8CBdf2zFmCfpDoHHY2YFevO5JygD5ErqlINDc9BQTjo772yJgW9.', NULL, '2022-11-22 12:57:23', '2022-11-22 12:57:23');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (2, 'Curtis Rolfson', 'kathryn57@example.org', '2022-11-22 10:58:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8XvUcqKIQn', '2022-11-22 10:58:16', '2022-11-22 10:58:16');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (3, 'Lynn Hoppe', 'abby.von@example.org', '2022-11-22 10:58:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hZHak2v0nw', '2022-11-22 10:58:16', '2022-11-22 10:58:16');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (4, 'Kameron Jacobs', 'mabel49@example.com', '2022-11-22 10:58:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AaGRQecvSm', '2022-11-22 10:58:16', '2022-11-22 10:58:16');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (5, 'Ada McGlynn', 'hayley47@example.net', '2022-11-22 10:58:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Q3XrOljsfm', '2022-11-22 10:58:16', '2022-11-22 10:58:16');
INSERT INTO public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) VALUES (6, 'Duane Reichert', 'lbeer@example.com', '2022-11-22 10:58:16', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LC1Ws7h0c8', '2022-11-22 10:58:16', '2022-11-22 10:58:16');


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 225
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 100, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 219
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 214
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 12, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 221
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 223
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 102, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- TOC entry 3231 (class 2606 OID 16579)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 16547)
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16549)
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- TOC entry 3213 (class 2606 OID 16395)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16558)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 16561)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3229 (class 2606 OID 16570)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 2606 OID 16531)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3217 (class 2606 OID 16529)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3218 (class 1259 OID 16537)
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- TOC entry 3227 (class 1259 OID 16559)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- Completed on 2022-11-22 10:59:56 UTC

--
-- PostgreSQL database dump complete
--

