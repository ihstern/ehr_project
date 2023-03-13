--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: allergies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.allergies (
    id integer NOT NULL,
    reaction text NOT NULL,
    anaphylaxis boolean,
    medications_id integer NOT NULL
);


ALTER TABLE public.allergies OWNER TO postgres;

--
-- Name: allergies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.allergies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.allergies_id_seq OWNER TO postgres;

--
-- Name: allergies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.allergies_id_seq OWNED BY public.allergies.id;


--
-- Name: medical_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medical_conditions (
    id integer NOT NULL,
    diagnosis text NOT NULL,
    symptoms text,
    start_date date,
    patient_mrn integer NOT NULL
);


ALTER TABLE public.medical_conditions OWNER TO postgres;

--
-- Name: medical_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medical_conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medical_conditions_id_seq OWNER TO postgres;

--
-- Name: medical_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medical_conditions_id_seq OWNED BY public.medical_conditions.id;


--
-- Name: medications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medications (
    id integer NOT NULL,
    medication text NOT NULL,
    active boolean NOT NULL,
    dosage text NOT NULL,
    route text NOT NULL,
    frequency text NOT NULL,
    patient_mrn integer NOT NULL
);


ALTER TABLE public.medications OWNER TO postgres;

--
-- Name: medications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medications_id_seq OWNER TO postgres;

--
-- Name: medications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medications_id_seq OWNED BY public.medications.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    mrn integer NOT NULL,
    pt_name text NOT NULL,
    pt_surname text NOT NULL,
    dob date NOT NULL
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: patients_mrn_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_mrn_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_mrn_seq OWNER TO postgres;

--
-- Name: patients_mrn_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_mrn_seq OWNED BY public.patients.mrn;


--
-- Name: surgeries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surgeries (
    id integer NOT NULL,
    procedure text NOT NULL,
    date_of_surgery date NOT NULL,
    patient_mrn integer NOT NULL
);


ALTER TABLE public.surgeries OWNER TO postgres;

--
-- Name: surgeries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.surgeries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surgeries_id_seq OWNER TO postgres;

--
-- Name: surgeries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.surgeries_id_seq OWNED BY public.surgeries.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    credentials text NOT NULL,
    department text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_patients (
    user_id integer NOT NULL,
    patient_mrn integer NOT NULL
);


ALTER TABLE public.users_patients OWNER TO postgres;

--
-- Name: vital_signs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vital_signs (
    id integer NOT NULL,
    time_taken timestamp without time zone NOT NULL,
    heart_rate integer,
    systolic_bp integer,
    diastolic_bp integer,
    temp_f real,
    spo2 integer,
    respirations integer,
    patient_mrn integer NOT NULL
);


ALTER TABLE public.vital_signs OWNER TO postgres;

--
-- Name: vital_signs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vital_signs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vital_signs_id_seq OWNER TO postgres;

--
-- Name: vital_signs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vital_signs_id_seq OWNED BY public.vital_signs.id;


--
-- Name: allergies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allergies ALTER COLUMN id SET DEFAULT nextval('public.allergies_id_seq'::regclass);


--
-- Name: medical_conditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_conditions ALTER COLUMN id SET DEFAULT nextval('public.medical_conditions_id_seq'::regclass);


--
-- Name: medications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications ALTER COLUMN id SET DEFAULT nextval('public.medications_id_seq'::regclass);


--
-- Name: patients mrn; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN mrn SET DEFAULT nextval('public.patients_mrn_seq'::regclass);


--
-- Name: surgeries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surgeries ALTER COLUMN id SET DEFAULT nextval('public.surgeries_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vital_signs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vital_signs ALTER COLUMN id SET DEFAULT nextval('public.vital_signs_id_seq'::regclass);


--
-- Data for Name: allergies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.allergies (id, reaction, anaphylaxis, medications_id) FROM stdin;
1	Nausea	f	5
2	Itching, hives, throat swelling	t	9
3	Cough	f	14
4	Mouth swelling	t	15
\.


--
-- Data for Name: medical_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medical_conditions (id, diagnosis, symptoms, start_date, patient_mrn) FROM stdin;
1	Narcissistic Personality Disorder	Entitlement, fear, lack of boundaries, need for validation	2002-01-20	1
2	Moderate to Severe Asthma	Wheezing, shortness of breath	1990-04-03	1
3	Right Mandible Fracture	Bruising, swelling of right mandible	2015-11-02	2
4	Polysubstance Abuse	Positive for cocaine, opioids	2023-02-12	2
5	Acute Appendicitis	RUQ pain with rebound tenderness, nausea, vomiting	2019-04-02	3
6	Impacted Wisdom Teeth x4	Unspecified jaw pain	2021-11-20	3
7	Gastroenteritis	Nausea, vomiting, dehydration	2023-02-12	3
8	Right abdominal lipoma	RLQ pain, bloating, constipation	2023-01-12	4
9	Hypertension	\N	1989-03-03	5
10	GERD	Heartburn	1995-07-12	5
11	Bilateral cataracts	Bilateral vision difficulty	2018-06-02	5
12	Open left ankle fracture	\N	2011-02-23	5
13	Left parietal meningioma	Headaches, seizures, change of personality	2023-01-28	5
14	Hyperlipidemia	\N	1995-07-12	5
\.


--
-- Data for Name: medications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medications (id, medication, active, dosage, route, frequency, patient_mrn) FROM stdin;
1	Albuterol	t	2.5mg (3-4 puffs)	inhaled	q6 hrs	1
2	Prednisone	t	30mg	oral	q.d.	1
3	Hydrocodone/Acetaminophen	f	10mg/325mg	oral	q6 hrs	2
4	Naloxone	t	1mg	IV	once	2
5	Ibuprofen	f	400mg	oral	q4-6	2
6	Lorazepam	t	2mg	IV bolus	PRN	2
7	Hydrocodone/Acetaminophen	f	10mg/325mg	oral	q6 hrs	3
8	Ondansetron	t	10mg	IV bolus	q8 hrs	3
9	Amoxicillin	f	500mg	oral	q12 hrs	3
10	0.9% NaCl	t	60ml/kg/hr	IV	continuous	3
11	Hydrocodone/Acetaminophen	t	10mg/325mg	oral	q6 hrs	4
12	Hydrocodone/Acetaminophen	f	10mg/325mg	oral	q6 hrs	5
13	Metoprolol	t	25mg	oral	q12 hrs	5
14	Lisinopril	f	10mg	oral	q.d.	5
15	Topiramate	f	25mg	oral	q.d.	5
16	Levetiracetam	t	500mg	oral	q12 hrs	5
17	Omeprazole	t	40mg	oral	q.d.	5
18	Morphine	t	2mg	IV bolus	q2h PRN	5
19	Nicardipine	t	2.5mg/hr	IV	continuous PRN	5
20	Ondansetron	t	4mg	IV bolus	q6h PRN	5
21	Mannitol	t	25gm	IV bolus	q12h	5
22	D5W NaCl 0.9% KCl 20mEq	t	100ml/hr	IV	continuous	5
23	Dopamine	t	10mcg/kg/min	IV	continuous PRN	5
24	Nitroprusside	t	o.5mcg/kg/min	IV	continuous PRN	5
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (mrn, pt_name, pt_surname, dob) FROM stdin;
1	Dorian	Gray	1902-11-12
2	Sherlock	Holmes	1981-02-27
3	Leia	Organa	2003-07-19
4	Dana	Scully	1995-04-04
5	Ronald	McDonald	1945-01-13
\.


--
-- Data for Name: surgeries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.surgeries (id, procedure, date_of_surgery, patient_mrn) FROM stdin;
1	Craniotomy for meningioma	2023-02-10	5
2	Laparoscopic appendectomy	2019-04-02	3
3	ORIF left ankle	2011-02-23	5
4	Bilateral cataract removal	2018-07-07	5
5	Lipoma resection	2023-02-11	4
6	ORIF right mandible	2015-11-03	2
7	Wisdom tooth removal x4	2021-12-15	3
8	Arthroscopic right carpal tunnel release	1999-10-02	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, credentials, department, name, surname, password) FROM stdin;
1	spepper	MD	Critical Care	Spicy	Pepper	23flavors
2	mgrey	MD	General Surgery	Meredith	Grey	mcdreamy
3	aperkins	RN	Medical Floor	Ann	Perkins	thepitsucks
4	cespinosa	RN	Emergency Room	Carla	Espinosa	janitorsfriend
5	jcarter	MD	Emergency Room	John	Carter	whoneedssleep
\.


--
-- Data for Name: users_patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_patients (user_id, patient_mrn) FROM stdin;
1	5
2	3
3	2
3	3
3	4
3	5
4	1
4	2
4	3
4	5
5	1
5	2
5	3
\.


--
-- Data for Name: vital_signs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vital_signs (id, time_taken, heart_rate, systolic_bp, diastolic_bp, temp_f, spo2, respirations, patient_mrn) FROM stdin;
1	1990-04-03 13:25:06	121	132	92	98.5	89	22	1
2	1995-04-01 15:02:14	76	126	86	98.8	97	\N	1
3	1999-02-23 11:13:03	72	118	78	98.8	98	\N	1
4	2002-01-20 12:42:25	68	110	72	98.7	99	\N	1
5	2011-09-02 09:30:23	64	104	68	98.8	98	\N	1
6	2023-02-12 10:12:15	112	116	74	98.6	92	20	1
7	1999-10-02 14:12:04	70	96	64	98.6	99	16	2
8	2007-04-16 09:15:09	74	98	66	98.7	98	16	2
9	2015-11-02 14:03:17	78	104	72	98.5	99	14	2
10	2018-04-23 11:55:32	80	110	76	98.7	97	18	2
11	2023-02-12 01:21:32	46	84	50	97.4	88	8	2
12	2023-02-12 03:21:03	70	96	66	97.5	94	12	2
13	2023-02-12 05:20:54	80	112	78	97.8	97	16	2
14	2023-02-11 06:03:12	74	100	68	98.5	98	16	3
15	2023-02-11 08:03:12	70	98	68	98.6	98	16	3
16	2023-02-11 12:05:12	72	96	66	98.5	99	16	3
17	2023-02-11 16:13:12	74	100	70	98.6	98	16	3
18	2023-02-11 20:03:12	72	98	64	98.5	97	16	3
19	2023-02-12 00:21:12	74	100	68	98.7	98	16	3
20	2023-02-12 04:09:12	70	94	62	98.6	99	16	3
21	2023-02-12 08:14:12	74	96	66	98.5	99	16	3
22	2020-01-10 14:06:33	60	88	58	98.8	\N	\N	4
23	2021-01-12 14:06:33	62	94	60	\N	99	\N	4
24	2022-01-11 14:06:33	66	96	62	\N	\N	\N	4
25	2023-01-09 14:06:33	70	96	64	98.8	99	\N	4
26	2023-01-28 11:34:27	72	98	62	98.7	98	16	4
27	2023-02-11 15:43:22	92	134	96	98.8	98	16	5
28	2023-02-10 06:02:45	98	138	98	98.7	97	18	5
29	2023-02-10 08:01:40	66	110	76	97.6	99	14	5
30	2023-02-10 10:02:43	64	86	58	97.8	97	14	5
31	2023-02-10 12:03:05	68	92	60	97.7	98	14	5
32	2023-02-10 14:02:22	54	84	58	97.7	98	14	5
33	2023-02-10 16:08:53	68	94	62	98	97	16	5
34	2023-02-10 18:06:07	76	112	70	98.3	98	16	5
35	2023-02-10 20:09:13	74	122	90	98.7	99	16	5
36	2023-02-10 22:02:35	76	126	94	98.7	98	16	5
\.


--
-- Name: allergies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.allergies_id_seq', 4, true);


--
-- Name: medical_conditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medical_conditions_id_seq', 14, true);


--
-- Name: medications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medications_id_seq', 24, true);


--
-- Name: patients_mrn_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_mrn_seq', 5, true);


--
-- Name: surgeries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.surgeries_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: vital_signs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vital_signs_id_seq', 36, true);


--
-- Name: allergies allergies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allergies
    ADD CONSTRAINT allergies_pkey PRIMARY KEY (id);


--
-- Name: medical_conditions medical_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_conditions
    ADD CONSTRAINT medical_conditions_pkey PRIMARY KEY (id);


--
-- Name: medications medications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications
    ADD CONSTRAINT medications_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (mrn);


--
-- Name: surgeries surgeries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surgeries
    ADD CONSTRAINT surgeries_pkey PRIMARY KEY (id);


--
-- Name: users_patients users_patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_patients
    ADD CONSTRAINT users_patients_pkey PRIMARY KEY (user_id, patient_mrn);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: vital_signs vital_signs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vital_signs
    ADD CONSTRAINT vital_signs_pkey PRIMARY KEY (id);


--
-- Name: allergies fk_allergies_medications; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.allergies
    ADD CONSTRAINT fk_allergies_medications FOREIGN KEY (medications_id) REFERENCES public.medications(id);


--
-- Name: medical_conditions fk_medical_conditions_patients; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medical_conditions
    ADD CONSTRAINT fk_medical_conditions_patients FOREIGN KEY (patient_mrn) REFERENCES public.patients(mrn);


--
-- Name: medications fk_medications_patients; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medications
    ADD CONSTRAINT fk_medications_patients FOREIGN KEY (patient_mrn) REFERENCES public.patients(mrn);


--
-- Name: surgeries fk_surgeries_patients; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surgeries
    ADD CONSTRAINT fk_surgeries_patients FOREIGN KEY (patient_mrn) REFERENCES public.patients(mrn);


--
-- Name: users_patients fk_users_patients_patients; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_patients
    ADD CONSTRAINT fk_users_patients_patients FOREIGN KEY (patient_mrn) REFERENCES public.patients(mrn);


--
-- Name: users_patients fk_users_patients_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_patients
    ADD CONSTRAINT fk_users_patients_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vital_signs fk_vital_signs_patients; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vital_signs
    ADD CONSTRAINT fk_vital_signs_patients FOREIGN KEY (patient_mrn) REFERENCES public.patients(mrn);


--
-- PostgreSQL database dump complete
--

