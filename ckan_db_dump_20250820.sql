--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8
-- Dumped by pg_dump version 16.8

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
-- Name: activity; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.activity (
    id text NOT NULL,
    "timestamp" timestamp without time zone,
    user_id text,
    object_id text,
    revision_id text,
    activity_type text,
    data text
);


ALTER TABLE public.activity OWNER TO ckandbuser;

--
-- Name: activity_detail; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.activity_detail (
    id text NOT NULL,
    activity_id text,
    object_id text,
    object_type text,
    activity_type text,
    data text
);


ALTER TABLE public.activity_detail OWNER TO ckandbuser;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO ckandbuser;

--
-- Name: api_token; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.api_token (
    id text NOT NULL,
    name text,
    user_id text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_access timestamp without time zone,
    plugin_extras jsonb
);


ALTER TABLE public.api_token OWNER TO ckandbuser;

--
-- Name: dashboard; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.dashboard (
    user_id text NOT NULL,
    activity_stream_last_viewed timestamp without time zone NOT NULL,
    email_last_sent timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL
);


ALTER TABLE public.dashboard OWNER TO ckandbuser;

--
-- Name: group; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public."group" (
    id text NOT NULL,
    name text NOT NULL,
    title text,
    description text,
    created timestamp without time zone,
    state text,
    type text NOT NULL,
    approval_status text,
    image_url text,
    is_organization boolean DEFAULT false
);


ALTER TABLE public."group" OWNER TO ckandbuser;

--
-- Name: group_extra; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.group_extra (
    id text NOT NULL,
    group_id text,
    key text,
    value text,
    state text
);


ALTER TABLE public.group_extra OWNER TO ckandbuser;

--
-- Name: group_extra_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.group_extra_revision (
    id text NOT NULL,
    group_id text,
    key text,
    value text,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.group_extra_revision OWNER TO ckandbuser;

--
-- Name: group_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.group_revision (
    id text NOT NULL,
    name text NOT NULL,
    title text,
    description text,
    created timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    type text NOT NULL,
    approval_status text,
    image_url text,
    is_organization boolean DEFAULT false
);


ALTER TABLE public.group_revision OWNER TO ckandbuser;

--
-- Name: member; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.member (
    id text NOT NULL,
    group_id text,
    table_id text NOT NULL,
    state text,
    table_name text NOT NULL,
    capacity text NOT NULL
);


ALTER TABLE public.member OWNER TO ckandbuser;

--
-- Name: member_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.member_revision (
    id text NOT NULL,
    table_id text NOT NULL,
    group_id text,
    state text,
    revision_id text NOT NULL,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    table_name text NOT NULL,
    capacity text NOT NULL
);


ALTER TABLE public.member_revision OWNER TO ckandbuser;

--
-- Name: package; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    title text,
    version character varying(100),
    url text,
    notes text,
    author text,
    author_email text,
    maintainer text,
    maintainer_email text,
    state text,
    license_id text,
    type text,
    owner_org text,
    private boolean DEFAULT false,
    metadata_modified timestamp without time zone,
    creator_user_id text,
    metadata_created timestamp without time zone,
    plugin_data jsonb
);


ALTER TABLE public.package OWNER TO ckandbuser;

--
-- Name: package_extra; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_extra (
    id text NOT NULL,
    key text,
    value text,
    state text,
    package_id text
);


ALTER TABLE public.package_extra OWNER TO ckandbuser;

--
-- Name: package_extra_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_extra_revision (
    id text NOT NULL,
    key text,
    value text,
    revision_id text NOT NULL,
    state text,
    package_id text,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_extra_revision OWNER TO ckandbuser;

--
-- Name: package_member; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_member (
    package_id text NOT NULL,
    user_id text NOT NULL,
    capacity text NOT NULL,
    modified timestamp without time zone NOT NULL
);


ALTER TABLE public.package_member OWNER TO ckandbuser;

--
-- Name: package_relationship; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_relationship (
    id text NOT NULL,
    subject_package_id text,
    object_package_id text,
    type text,
    comment text,
    state text
);


ALTER TABLE public.package_relationship OWNER TO ckandbuser;

--
-- Name: package_relationship_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_relationship_revision (
    id text NOT NULL,
    subject_package_id text,
    object_package_id text,
    type text,
    comment text,
    revision_id text NOT NULL,
    continuity_id text,
    state text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_relationship_revision OWNER TO ckandbuser;

--
-- Name: package_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_revision (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    title text,
    version character varying(100),
    url text,
    notes text,
    author text,
    author_email text,
    maintainer text,
    maintainer_email text,
    revision_id text NOT NULL,
    state text,
    continuity_id text,
    license_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    type text,
    owner_org text,
    private boolean DEFAULT false,
    metadata_modified timestamp without time zone,
    creator_user_id text,
    metadata_created timestamp without time zone
);


ALTER TABLE public.package_revision OWNER TO ckandbuser;

--
-- Name: package_tag; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_tag (
    id text NOT NULL,
    state text,
    package_id text,
    tag_id text
);


ALTER TABLE public.package_tag OWNER TO ckandbuser;

--
-- Name: package_tag_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.package_tag_revision (
    id text NOT NULL,
    revision_id text NOT NULL,
    state text,
    package_id text,
    tag_id text,
    continuity_id text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.package_tag_revision OWNER TO ckandbuser;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.resource (
    id text NOT NULL,
    url text NOT NULL,
    format text,
    description text,
    "position" integer,
    hash text,
    state text,
    extras text,
    name text,
    resource_type text,
    mimetype text,
    mimetype_inner text,
    size bigint,
    last_modified timestamp without time zone,
    cache_url text,
    cache_last_updated timestamp without time zone,
    created timestamp without time zone,
    url_type text,
    package_id text DEFAULT ''::text NOT NULL,
    metadata_modified timestamp without time zone
);


ALTER TABLE public.resource OWNER TO ckandbuser;

--
-- Name: resource_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.resource_revision (
    id text NOT NULL,
    url text NOT NULL,
    format text,
    description text,
    "position" integer,
    revision_id text NOT NULL,
    hash text,
    state text,
    continuity_id text,
    extras text,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean,
    name text,
    resource_type text,
    mimetype text,
    mimetype_inner text,
    size bigint,
    last_modified timestamp without time zone,
    cache_url text,
    cache_last_updated timestamp without time zone,
    webstore_url text,
    webstore_last_updated timestamp without time zone,
    created timestamp without time zone,
    url_type text,
    package_id text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.resource_revision OWNER TO ckandbuser;

--
-- Name: resource_view; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.resource_view (
    id text NOT NULL,
    resource_id text,
    title text,
    description text,
    view_type text NOT NULL,
    "order" integer NOT NULL,
    config text
);


ALTER TABLE public.resource_view OWNER TO ckandbuser;

--
-- Name: revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.revision (
    id text NOT NULL,
    "timestamp" timestamp without time zone,
    author character varying(200),
    message text,
    state text,
    approved_timestamp timestamp without time zone
);


ALTER TABLE public.revision OWNER TO ckandbuser;

--
-- Name: system_info; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.system_info (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    state text DEFAULT 'active'::text NOT NULL
);


ALTER TABLE public.system_info OWNER TO ckandbuser;

--
-- Name: system_info_id_seq; Type: SEQUENCE; Schema: public; Owner: ckandbuser
--

CREATE SEQUENCE public.system_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.system_info_id_seq OWNER TO ckandbuser;

--
-- Name: system_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ckandbuser
--

ALTER SEQUENCE public.system_info_id_seq OWNED BY public.system_info.id;


--
-- Name: system_info_revision; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.system_info_revision (
    id integer NOT NULL,
    key character varying(100) NOT NULL,
    value text,
    revision_id text NOT NULL,
    continuity_id integer,
    state text DEFAULT 'active'::text NOT NULL,
    expired_id text,
    revision_timestamp timestamp without time zone,
    expired_timestamp timestamp without time zone,
    current boolean
);


ALTER TABLE public.system_info_revision OWNER TO ckandbuser;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.tag (
    id text NOT NULL,
    name character varying(100) NOT NULL,
    vocabulary_id character varying(100)
);


ALTER TABLE public.tag OWNER TO ckandbuser;

--
-- Name: task_status; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.task_status (
    id text NOT NULL,
    entity_id text NOT NULL,
    entity_type text NOT NULL,
    task_type text NOT NULL,
    key text NOT NULL,
    value text NOT NULL,
    state text,
    error text,
    last_updated timestamp without time zone
);


ALTER TABLE public.task_status OWNER TO ckandbuser;

--
-- Name: term_translation; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.term_translation (
    term text NOT NULL,
    term_translation text NOT NULL,
    lang_code text NOT NULL
);


ALTER TABLE public.term_translation OWNER TO ckandbuser;

--
-- Name: tracking_raw; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.tracking_raw (
    user_key character varying(100) NOT NULL,
    url text NOT NULL,
    tracking_type character varying(10) NOT NULL,
    access_timestamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tracking_raw OWNER TO ckandbuser;

--
-- Name: tracking_summary; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.tracking_summary (
    url text NOT NULL,
    package_id text,
    tracking_type character varying(10) NOT NULL,
    count integer NOT NULL,
    running_total integer DEFAULT 0 NOT NULL,
    recent_views integer DEFAULT 0 NOT NULL,
    tracking_date date
);


ALTER TABLE public.tracking_summary OWNER TO ckandbuser;

--
-- Name: user; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public."user" (
    id text NOT NULL,
    name text NOT NULL,
    apikey text,
    created timestamp without time zone,
    about text,
    password text,
    fullname text,
    email text,
    reset_key text,
    sysadmin boolean DEFAULT false,
    activity_streams_email_notifications boolean DEFAULT false,
    state text DEFAULT 'active'::text NOT NULL,
    plugin_extras jsonb,
    image_url text,
    last_active timestamp without time zone
);


ALTER TABLE public."user" OWNER TO ckandbuser;

--
-- Name: user_following_dataset; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.user_following_dataset (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_dataset OWNER TO ckandbuser;

--
-- Name: user_following_group; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.user_following_group (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_group OWNER TO ckandbuser;

--
-- Name: user_following_user; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.user_following_user (
    follower_id text NOT NULL,
    object_id text NOT NULL,
    datetime timestamp without time zone NOT NULL
);


ALTER TABLE public.user_following_user OWNER TO ckandbuser;

--
-- Name: vocabulary; Type: TABLE; Schema: public; Owner: ckandbuser
--

CREATE TABLE public.vocabulary (
    id text NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.vocabulary OWNER TO ckandbuser;

--
-- Name: system_info id; Type: DEFAULT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info ALTER COLUMN id SET DEFAULT nextval('public.system_info_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.activity (id, "timestamp", user_id, object_id, revision_id, activity_type, data) FROM stdin;
\.


--
-- Data for Name: activity_detail; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.activity_detail (id, activity_id, object_id, object_type, activity_type, data) FROM stdin;
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.alembic_version (version_num) FROM stdin;
4a5e3465beb6
\.


--
-- Data for Name: api_token; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.api_token (id, name, user_id, created_at, last_access, plugin_extras) FROM stdin;
UTVWdjbv2YiytV3OXiFVuBygT4dSFJOBSs0ihbMQ88Q	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-08 13:35:36.133314	\N	\N
fQdtR3YE8sx4xhWmnykMMpX98KVqzTSGRtAy8Taq58k	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-14 09:26:22.606213	\N	\N
4iq9iPGo0S0K754khN0_UREpkMAKKTXFgXhOJwbmB1A	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-14 13:54:08.958691	\N	\N
5w6wX2xXqDtKWDKnRt-XqblgGwIPV2bDpwwrk4RakLs	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-15 12:55:53.045302	\N	\N
sIi0SuiJ01ybGQhzdWP6PCxJIQIaK2MDfLqMg2ZESiI	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-15 13:15:37.389383	\N	\N
aUbfi1xe9anE6swU8x_ZBkBO7PONA0rybJV9qqFSvT0	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-16 05:37:02.225814	\N	\N
SKVET0EY-Sb8EDD0UhXITV88_6fSvpsbdj4KEqu5tFM	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-16 06:20:38.592951	\N	\N
5snex9fCIZExIzp5_FTQn_Llyx1iMWn52EsOgdNSjDk	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 07:52:07.859922	\N	\N
BypzZ2xvA6giwWzLEKtorTh49d36EEbn9H-_YtgKxJU	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 07:43:44.085136	\N	\N
XKTE1G3T2F71lO2_F3WVfyTbN5nN-5AtCW0-s0ZRUU0	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 08:34:38.244781	\N	\N
3cGOrNHFArYQeUY6vXHmeNJqf4r0F4-742afgxvAklg	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 07:58:00.17611	2025-05-21 08:11:25.801923	\N
3aJAxzwiS47asCo-WFXvkezhxsSHn3SEEqS_m-XorXc	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 08:26:20.626233	\N	\N
Lb25zIgiR1XPfYaWzqysF-kt7zCFtRwdswqJWGXgdBE	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 08:38:58.876386	\N	\N
GxNBMrMRreVQbh2Ga-vLlNOJn0XoWmlw41n8YjpWbqo	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 08:43:24.598458	\N	\N
eaD_8enJfj0pxDy4bE4bWU3mUihfSn7IcnrDRpnjMO4	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 12:15:09.613505	\N	\N
TmrzE59YNJZWeyWo5HatyAbF_OM0WfRoRVXriN3GgfY	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 17:36:31.112826	\N	\N
FNMfsrHCDi0zYCQhLIftQeOVbVtkxMlV6u6GlU5F9s8	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 10:38:53.968718	\N	\N
hs-RV9_FJfQoJzfEamyXpinfouJgQ6miv_L0E3lPVg4	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-18 06:22:55.753757	\N	\N
IhZSjFHpywzR4WL423Lroy9s-pyPlC1Mxn-K1Q-7zJc	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 18:15:47.99981	2025-05-21 18:19:26.329296	\N
zkdW0wCV590Y7DHpihvQThLB4_Y6nPK1MlS1gDpoPFg	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-02 13:21:50.841871	\N	\N
h54ScGAtMaPlmK-LYtfZ29DEJ0a4s1l-25aCDLzwDN4	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-09 08:06:20.603435	\N	\N
vhP9UugPmXsPjBt_Ay8BASFPMvehzU9UT2tyWN0qJro	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-09 08:09:09.520402	\N	\N
JghHnldeIWN9M_mzbbHJJaY84cVYS6nGi7yyBKjfV_A	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-09 11:28:02.484448	\N	\N
RohergI6bPP2Bzx4_Ui4nGx8KAq2Up9I3Zg2i4owSG8	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-09 11:48:10.615573	\N	\N
jK8mvUvqfVxGHaST86Jbr8jHtMEgqqL35kV0Nw3UwWc	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-09 13:49:56.340974	\N	\N
wUCwC3EkFZsgqX28tjWUMkWIpKYKE0bI3dzJEQxsc3A	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-09 14:06:50.022498	\N	\N
QJZmoSVNCZ9-HIjFGV2uDKdYhWmuWaeFqZa623JVXB0	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-10 07:58:41.811241	\N	\N
uFqzb-F-vg8rgZfG2SLUuTeVbggpUTOJf-NZzEXXOYM	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 06:17:59.86842	\N	\N
-JArvG9mA1gpZgk6k7tTospK56_NY9p8Ns48IuBux7s	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 06:26:07.060395	\N	\N
7frv0sftByZSMN4e_sjHubY5f14wPFqWD46XHDAb3uU	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 10:19:04.664074	\N	\N
WwIT9E6uDe9P7dic9TnLc1d1qJCOt-LT1aZ-Znv26mo	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 12:05:24.667262	\N	\N
s-Pg2BOh-_bERnMXknKM4YACJPwRP13dixI8-bSwg3s	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 12:31:55.489696	\N	\N
isUKAKOPpUJj88h8VdT6-LPPinmWpmgo4x42a90QSZE	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 12:37:26.278255	\N	\N
NBvIFP8ajlcSpG-y-yBwgbaRQvhktsffhsZ7oi1C8a0	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 14:30:44.848615	2025-07-16 15:53:16.140599	\N
NaRIsySu9MW9sq_7LqZlTEUuqX3m50wBBxVzmufjPcI	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-05 06:55:25.940785	\N	\N
GphCj2PLUZBw1SItVi183BS4STqm2YpfICDJXFeOd3I	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-05 07:21:55.570991	\N	\N
FYpJz-pxYlwJHTTjQXBkiZY7j-bbPYBuNi6KGElRJH8	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-05 10:35:00.55546	\N	\N
S7ciSdzFFvEN-ThpC_FGQBVSf6MBg2ghjA56HhYGJGo	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-05 13:44:39.224342	\N	\N
328Tzs4jVaJMqhpq3O7ZpnbBBNQRDRpAeAe24ShIP3g	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-07 05:45:03.979376	\N	\N
YpvGWbcamrSCn4MYIczZ3aziWJl2VBR4chOcjqwRH7c	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 16:10:28.729889	2025-07-16 16:35:41.74298	\N
4ux2f1in-n8ZlZHjeC7DjMejTDYUEtDQfPxeQK_pJyA	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 04:58:47.077618	\N	\N
iR9iA5VUF4eZ48BzYnYx4IXF7srSL25b6MqYvpENLS4	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 12:48:40.653356	2025-07-16 14:06:31.648894	\N
yTq__MioVbR44sC5rs5rpAMZrehrI2qizt_4vyDRy2E	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 14:23:25.565676	\N	\N
IM_d6mDdg7vGeZuwXP9JgDe0JPLETTKxj1LYB9aD1dc	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-07 06:41:54.995606	\N	\N
c3HRCTIeSk1PUlsOcwi2_fqWkltmppYPp005Y3PuPw8	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-07 13:27:46.117668	\N	\N
LMVN7eij5d17weySCR6iGBR0yCFg2iJM3Ovl9YCS3JM	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-08 06:59:53.281862	\N	\N
dmUVTKT4YlDIXA69ZZDUwlf4lD9UEbcOqCYSucraHxY	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-18 11:16:35.697929	\N	\N
rS_QGKseQLmDn-6ZnTFT7Gr5NBQFCAxRn0bG2XsUvFQ	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-18 11:39:00.309378	\N	\N
dvfKAOlFrD82YlAwWD8_PQ7G1MJWcylDwyYkbWZXP0A	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-08-19 13:41:30.403461	\N	\N
3PUi9S12uKATP9xZIgVy1AFJOiddHFnrPdvDysfGW_c	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 06:03:33.466539	2025-07-17 06:41:01.333418	\N
-n685mr9bx07gKmGgqVkqeLj1bn7163FDmntA9-OHws	datapusher	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 07:14:01.952954	\N	\N
\.


--
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.dashboard (user_id, activity_stream_last_viewed, email_last_sent) FROM stdin;
0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-08 13:35:30.325659	2025-05-08 13:35:30.325684
caa0894d-2dfd-4921-9ccf-e4a8b86d1ef5	2025-07-17 07:52:54.715962	2025-07-17 07:52:54.715983
afaa4e59-3fd7-4c43-b40c-59accbb8799e	2025-07-17 09:08:20.995464	2025-07-17 09:08:20.995472
7da14275-8ca1-42ad-8362-37ee54c25653	2025-07-17 10:40:39.151827	2025-07-17 10:40:39.151839
88577cae-15ec-48b2-9f57-889b0d1a5c8d	2025-07-18 06:45:12.179909	2025-07-18 06:45:12.179919
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public."group" (id, name, title, description, created, state, type, approval_status, image_url, is_organization) FROM stdin;
23e28c95-8953-493c-a0e3-fb460c516687	environmental-data	environmental data		2025-05-21 08:03:35.826845	deleted	group	approved		f
2a5f2193-234f-46f2-8220-6cdad1ed045b	climate-data	Climate data	This collection groups together various climate datasets that provide information on **temperature, precipitation, evapotranspiration, runoff**, and other key climatic variables.  \r\nThe datasets come from global sources such as **WorldClim** and **ECMWF/ERA5** and have been processed and aggregated at administrative levels—**communes and fokontany**—for easier integration into territorial analyses and decision-making processes.\r\n\r\nThe data span different time periods:\r\n- **Static climatological averages** for **1970–2000** (WorldClim, Bioclim)\r\n- **Dynamic monthly datasets** from **2000 to 2023** (ERA5)\r\n\r\nThe original data were spatially aggregated using **Google Earth Engine (GEE)**, applying a **weighted mean** based on the area of each pixel intersecting the administrative units.	2025-07-10 08:15:40.174747	active	group	approved	2025-07-10-081540.064194climate-data.png	f
91ec9df9-73d4-41eb-a76f-fda6e4418371	administrative-data	Administrative data	The administrative data provide a comprehensive and standardized view of the **territorial divisions** within the **Ifanadiana district**, across three levels: **district**, **commune**, and **fokontany**.  \r\nThese static datasets, primarily sourced from **OCHA** and curated by **Pivot**, reflect both **current and historical administrative boundaries**, including changes introduced in **2019–2020**.	2025-07-10 08:17:15.851506	active	group	approved	2025-07-10-081715.742702administrative-data.png	f
7734d401-8ed2-462c-afde-8dfdc2b90796	health-system-data	Health System data	This dataset group provides key **geospatial information** on **health infrastructure and services** in the **Ifanadiana district**, **Vatovavy region**, Madagascar.  \r\nIt includes the **locations and characteristics** of health facilities and community-based service sites, supporting **analysis and planning of healthcare access** at the local level.	2025-07-10 08:18:46.511952	active	group	approved	2025-07-10-081846.411923health-system-data.png	f
201f6de2-82e9-41ee-aeb9-ce8b8b7dc94a	socio-demographic-data	Socio-demographic data	This group contains **geospatial and statistical data** that describe the **human settlements and population distribution** in **Ifanadiana district**.  \r\nThe datasets originate from **national censuses**, **detailed field-based censuses**, and **OpenStreetMap mapping efforts**, providing a **multi-scale view** of demographic characteristics across **villages and fokontany**.	2025-07-10 08:20:20.245659	active	group	approved	2025-07-10-082020.184903socio-demo-data.png	f
c98ef028-561d-4234-bc3c-18ec39aff682	environment-data	Environmental data 	This category encompasses a **rich and diverse set of environmental data** covering the **Ifanadiana district**, integrating information on:\r\n- **Land cover**\r\n- **Elevation**\r\n- **Vegetation indices**\r\n- **Moisture indices**\r\n- **Air quality**\r\n\r\nThese data primarily come from satellite sources (**Sentinel-2**, **MODIS**, **SRTM**) and are essential for **environmental monitoring**, **ecosystem analysis**, and **territorial planning**.	2025-07-10 08:22:56.443514	active	group	approved	2025-07-10-082256.429134environmental-data.png	f
a2248456-a6a7-4c09-97ca-0e52b52ea2f8	pivot-science	Pivot - Science Department	**Pivot Science** is a department of **Pivot**, a non-governmental organization that combines accessible and comprehensive **health care services** with rigorous **scientific research** to support the existing public health system in **rural Madagascar**.  \r\nFor more information, see [Pivot's website](https://www.pivotworks.org).	2025-05-21 08:02:21.840101	active	organization	approved	2025-07-10-082502.690840pivotlogo01.png	t
\.


--
-- Data for Name: group_extra; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.group_extra (id, group_id, key, value, state) FROM stdin;
\.


--
-- Data for Name: group_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.group_extra_revision (id, group_id, key, value, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: group_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.group_revision (id, name, title, description, created, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, type, approval_status, image_url, is_organization) FROM stdin;
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.member (id, group_id, table_id, state, table_name, capacity) FROM stdin;
577ff1d0-f299-482c-b77e-99bf74a55b04	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	0477425b-7190-4199-b54d-2f31d6d4cb5b	active	user	admin
04e688f9-52fb-40c5-b664-f9b4ae0f8050	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	7cf5167a-80e8-466b-9072-9b03de2b5e99	deleted	package	organization
135e4f3e-f965-4346-bce0-343aacdb94fe	23e28c95-8953-493c-a0e3-fb460c516687	7cf5167a-80e8-466b-9072-9b03de2b5e99	deleted	package	public
6315ea6b-97ba-4c48-96f0-b2c00d3e67d8	23e28c95-8953-493c-a0e3-fb460c516687	39a3c0ef-a7c3-4205-9ab0-88c6f74ad830	deleted	package	public
98f69987-b6fd-443c-a3b2-6388629016eb	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	39a3c0ef-a7c3-4205-9ab0-88c6f74ad830	deleted	package	organization
607fbcab-0c87-43bc-b805-cc8c1b8ab22d	23e28c95-8953-493c-a0e3-fb460c516687	0477425b-7190-4199-b54d-2f31d6d4cb5b	deleted	user	admin
d2b60078-56cf-4f61-b083-b6bcfa461951	2a5f2193-234f-46f2-8220-6cdad1ed045b	0477425b-7190-4199-b54d-2f31d6d4cb5b	active	user	admin
7fa28609-7131-4e0c-ad96-8a61a03dcdf2	91ec9df9-73d4-41eb-a76f-fda6e4418371	0477425b-7190-4199-b54d-2f31d6d4cb5b	active	user	admin
b00072f6-9198-4d80-8711-45948f9f675c	7734d401-8ed2-462c-afde-8dfdc2b90796	0477425b-7190-4199-b54d-2f31d6d4cb5b	active	user	admin
fb7db265-0c11-4200-bee9-83c7f72701c2	201f6de2-82e9-41ee-aeb9-ce8b8b7dc94a	0477425b-7190-4199-b54d-2f31d6d4cb5b	active	user	admin
8b8bd2ba-36c4-41ac-8c06-67f26cfe521b	c98ef028-561d-4234-bc3c-18ec39aff682	0477425b-7190-4199-b54d-2f31d6d4cb5b	active	user	admin
235dea0b-225d-4a09-bc1b-367502a80934	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	b6a9d6c5-64d6-49e0-abfa-7743564a9a66	active	package	organization
2447d945-c1a8-45b2-9e66-795691ab6d61	2a5f2193-234f-46f2-8220-6cdad1ed045b	b6a9d6c5-64d6-49e0-abfa-7743564a9a66	active	package	public
fcd855be-4523-4915-9e2e-6441c63c1c37	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	9b952e3b-de36-42a0-a0b1-2b5f3bff1415	active	package	organization
39345d93-7c2a-42c0-b583-3923ca3e9870	2a5f2193-234f-46f2-8220-6cdad1ed045b	9b952e3b-de36-42a0-a0b1-2b5f3bff1415	active	package	public
beb84c32-55cd-4636-b2a9-c1872612894e	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	f2089312-30ad-4041-a338-ece3113e6908	active	package	organization
1ad7c13d-1cb5-4931-9f01-4f03f80bfb7a	2a5f2193-234f-46f2-8220-6cdad1ed045b	f2089312-30ad-4041-a338-ece3113e6908	active	package	public
badbe624-f267-4ef1-be59-662bf29e72b2	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	bbf1a158-2ed4-40a6-854a-6eec7627a364	active	package	organization
d4b0decc-5b87-41eb-ba83-b27358c1c47a	2a5f2193-234f-46f2-8220-6cdad1ed045b	bbf1a158-2ed4-40a6-854a-6eec7627a364	active	package	public
150d7bcb-05ef-4c5f-aeb3-3486c98ffa0f	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	1cc1035e-97bf-40b8-b164-86c5c2a461d6	active	package	organization
225a33c7-39cd-43db-b4b5-6bdff764b662	2a5f2193-234f-46f2-8220-6cdad1ed045b	1cc1035e-97bf-40b8-b164-86c5c2a461d6	active	package	public
6adee967-7ef5-448e-8d28-5ae79c6d9add	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	6eba7d5c-6bbf-42bc-be75-0b0112afd4d8	active	package	organization
cce35ea6-c7f4-4a4e-8823-9bd1eea7f11f	2a5f2193-234f-46f2-8220-6cdad1ed045b	6eba7d5c-6bbf-42bc-be75-0b0112afd4d8	active	package	public
617e8e67-5973-40f8-8c98-f7f0b54699b5	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	835e19fb-dcb7-48f7-b634-8f1795f46bc4	active	package	organization
ec380ada-c4ab-4163-9361-4f321b338b31	91ec9df9-73d4-41eb-a76f-fda6e4418371	835e19fb-dcb7-48f7-b634-8f1795f46bc4	active	package	public
da9446fc-3c50-4286-b271-3384bee10898	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	a81fe6ef-4519-4697-b5ab-67341b6d67b4	active	package	organization
b15c02ec-3919-4067-bf8d-e0177c6602d5	91ec9df9-73d4-41eb-a76f-fda6e4418371	a81fe6ef-4519-4697-b5ab-67341b6d67b4	active	package	public
9d706f57-ae2b-4141-9b94-5a47a33462f5	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	9714e542-9a34-4f2c-a7d4-2d9b062d1b90	active	package	organization
dea1d548-f01d-417b-833c-abc2196b40f8	91ec9df9-73d4-41eb-a76f-fda6e4418371	9714e542-9a34-4f2c-a7d4-2d9b062d1b90	active	package	public
607dd309-f8e2-439d-bdfe-87e873e3f2e5	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	ae93a02c-f722-4af9-b16a-0f63841b8b06	active	package	organization
7c66903f-3e0b-414e-89f7-15e940817a89	91ec9df9-73d4-41eb-a76f-fda6e4418371	ae93a02c-f722-4af9-b16a-0f63841b8b06	active	package	public
73fb56bc-5a5f-48a8-b0e0-58e17d294592	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	de231e52-b888-4552-8688-68dc0eecd48c	active	package	organization
16129c12-5588-487a-aa42-a5698c1bec93	7734d401-8ed2-462c-afde-8dfdc2b90796	de231e52-b888-4552-8688-68dc0eecd48c	active	package	public
16ab81ce-465b-4c94-85ef-d42350019aa3	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	9b57f710-78d4-47d7-8629-35346c1e5ee3	active	package	organization
ed0ed1ae-16c4-4edf-8d1b-3ea7b0102369	7734d401-8ed2-462c-afde-8dfdc2b90796	9b57f710-78d4-47d7-8629-35346c1e5ee3	active	package	public
77088236-74cc-4a30-88b7-823de6003c81	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	2f9f7af8-2a32-4f78-80a7-0883532c1340	active	package	organization
1fea480c-0369-466a-9edb-ad5f0441b603	c98ef028-561d-4234-bc3c-18ec39aff682	2f9f7af8-2a32-4f78-80a7-0883532c1340	active	package	public
2f4b978a-bac4-43b2-9171-d347cce9fb0a	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	5780b1c9-d5dc-4773-96db-9dff544f8cc2	active	package	organization
3f1c825d-da18-4f21-ba44-f662f201706c	c98ef028-561d-4234-bc3c-18ec39aff682	5780b1c9-d5dc-4773-96db-9dff544f8cc2	active	package	public
a76cf12d-4840-4647-b338-ba6a90c24a2f	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	21ec7fdc-131a-4a3d-96ac-59530857a08d	active	package	organization
9da77ae1-355e-46ce-90e4-13a2d32513a6	c98ef028-561d-4234-bc3c-18ec39aff682	21ec7fdc-131a-4a3d-96ac-59530857a08d	active	package	public
2210f79e-8c4b-4936-9be3-59e57424602d	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	754acaf5-cb06-4b80-8c10-0224add58cc8	active	package	organization
1ee6a050-00fd-4156-a04e-0cdc43aeae57	c98ef028-561d-4234-bc3c-18ec39aff682	754acaf5-cb06-4b80-8c10-0224add58cc8	active	package	public
62a756c4-3f32-42e7-a34f-705f29889ab6	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	30677483-6527-4c20-a7b5-5682643ed35c	active	package	organization
31b13600-9931-428c-8136-3135e9c9f780	c98ef028-561d-4234-bc3c-18ec39aff682	30677483-6527-4c20-a7b5-5682643ed35c	active	package	public
d393ba90-dd2a-4d82-9694-c99c63dd3fbe	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	dd628090-9e2b-48c9-894c-19a8d4512639	active	package	organization
169de2a6-df56-4fae-abc1-b868dfea991d	c98ef028-561d-4234-bc3c-18ec39aff682	dd628090-9e2b-48c9-894c-19a8d4512639	active	package	public
3332e437-b410-4f1f-932e-5e9d1bb1c696	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	49b5b713-0773-4d7c-b03c-ef5ded601661	active	package	organization
205a3b1d-dd66-4128-8a16-6e33090df63c	c98ef028-561d-4234-bc3c-18ec39aff682	49b5b713-0773-4d7c-b03c-ef5ded601661	active	package	public
1b38a3ab-a237-4e9c-b014-6fe25e2522e9	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	b7865633-8ff9-4523-9848-15b91aa64dd6	active	package	organization
4f13a003-bed9-403b-b778-64f85b5e7091	c98ef028-561d-4234-bc3c-18ec39aff682	b7865633-8ff9-4523-9848-15b91aa64dd6	active	package	public
8bd0d971-add6-4478-abe7-bc6eec2fcdb8	c98ef028-561d-4234-bc3c-18ec39aff682	c8577170-42b1-417f-ac25-85550abad242	active	package	public
bd088443-8b4a-4f9d-8548-448fe5e9d098	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	3a60beaa-f53d-4928-b1e9-5c3359a8b647	active	package	organization
a37f6341-1241-40e5-a3e0-8575d8bfac28	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	571138dc-e441-4ab6-b5c0-c73cbdd6baa9	active	package	organization
e29bb3e7-231b-42d3-9668-789d429313a4	c98ef028-561d-4234-bc3c-18ec39aff682	571138dc-e441-4ab6-b5c0-c73cbdd6baa9	active	package	public
3d36d4d9-78b0-4b0d-8c01-a336d09d9b01	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	c8577170-42b1-417f-ac25-85550abad242	active	package	organization
bfd997f8-4fd4-4586-bfcd-1108d4680093	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	2e8e66da-47d9-421f-b4fd-b8474a55a0b6	active	package	organization
3e4f2636-afa0-42c4-a54f-1355651f8a69	201f6de2-82e9-41ee-aeb9-ce8b8b7dc94a	2e8e66da-47d9-421f-b4fd-b8474a55a0b6	active	package	public
60dbb223-da86-4394-99c0-2a6869a3058d	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	08f20c0b-4627-4ec4-9d0c-39802aa21443	active	package	organization
35464e26-3afb-4a35-b57a-5b94272bbf43	2a5f2193-234f-46f2-8220-6cdad1ed045b	08f20c0b-4627-4ec4-9d0c-39802aa21443	active	package	public
5c27632a-6edf-49e0-a49e-203a0683b152	201f6de2-82e9-41ee-aeb9-ce8b8b7dc94a	3a60beaa-f53d-4928-b1e9-5c3359a8b647	active	package	public
cc0e2f47-a3f0-4f54-a93b-7c2642d7cfa8	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	1f91eac6-9746-4af1-bee0-84c9288b3661	active	package	organization
04d4ac78-2010-49d3-be1e-f48bb2320e9f	201f6de2-82e9-41ee-aeb9-ce8b8b7dc94a	1f91eac6-9746-4af1-bee0-84c9288b3661	active	package	public
9e15212f-c130-4213-9aaf-147afec93a8a	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	f90ce444-bfce-4f95-b445-d967b3eeeff6	active	package	organization
fe8383a1-65fe-4f53-a61e-a85d37d21e7f	201f6de2-82e9-41ee-aeb9-ce8b8b7dc94a	f90ce444-bfce-4f95-b445-d967b3eeeff6	active	package	public
f304a291-27e0-4d7c-96ed-81275c904b46	2a5f2193-234f-46f2-8220-6cdad1ed045b	caa0894d-2dfd-4921-9ccf-e4a8b86d1ef5	active	user	member
6d067e8c-c21a-4b06-b95e-5f60a6c0244f	91ec9df9-73d4-41eb-a76f-fda6e4418371	caa0894d-2dfd-4921-9ccf-e4a8b86d1ef5	active	user	admin
a972684d-6476-4c8b-b4d4-0a34af6fa6e2	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	caa0894d-2dfd-4921-9ccf-e4a8b86d1ef5	active	user	member
\.


--
-- Data for Name: member_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.member_revision (id, table_id, group_id, state, revision_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current, table_name, capacity) FROM stdin;
\.


--
-- Data for Name: package; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package (id, name, title, version, url, notes, author, author_email, maintainer, maintainer_email, state, license_id, type, owner_org, private, metadata_modified, creator_user_id, metadata_created, plugin_data) FROM stdin;
7cf5167a-80e8-466b-9072-9b03de2b5e99	ifd_evi_sentinle2	ifd_evi_sentinle2			evi public					deleted		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	f	2025-05-21 18:19:26.003108	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 18:19:10.042867	\N
39a3c0ef-a7c3-4205-9ab0-88c6f74ad830	ifd_evi_sentinnel2_village	ifd_evi_sentinnel2_village			evi8sentinel2 description data					deleted		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-05-21 08:11:25.036922	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-05-21 08:09:44.491543	\N
a81fe6ef-4519-4697-b5ab-67341b6d67b4	ifanadiana-ocha-commune	Ifanadiana OCHA Commune		United Nations Organization for the Coordination of Humanitarian Affairs (OCHA)	The Ifd_admin_Old_GADM_level_4_(Old_Commune) and Ifd_admin_New_GADM_level_4_(New_Commune) data represent the administrative divisions of the Ifanadiana district in two periods:  \r\n- Ifd_admin_Old_GADM_level_4_(Old_Commune) reflects the old communal division in force until 2019  \r\n- Ifd_admin_New_GADM_level_4_(New_Commune) represents the new territorial organization established in 2019/2020, which includes fifteen communes following the creation of AMBIABE and AMPASINAMBO. This data should be used 2019-onwards.  \r\nThese static data enable us to track the evolution of the district's administrative division.\r\n\r\n**Columns :**   \r\n- `fid` : numeric id of commune or fokontany  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun` : commune name before 2019 	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:54:38.126783	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:51:04.144866	\N
b6a9d6c5-64d6-49e0-abfa-7743564a9a66	ifanadiana-bioclim	Ifanadiana Bioclim		WorldClim	Bioclim V2.1 data for the period 1970-2000 are a set of 19 bioclimatic variables derived from monthly temperature and precipitation values. These original data, at a spatial resolution of around 1 km², are static, representing climatological averages over a defined reference period (1970-2000). These variables have been aggregated at fokontany and commune level, taking the spatial average within the polygons of each administrative zone.\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of Commune / fokontany  \r\n- `new_commune` : commune name after 2019  \r\n- `old_commune` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `bio_1` : Annual Mean Temperature (°C)  \r\n- `bio_2` : Mean Diurnal Range (°C) (Annual mean of (Tmax - Tmin))  \r\n- `bio_3` : Isothermality (%) ((BIO2/BIO7) × 100)  \r\n- `bio_4` : Temperature Seasonality ((Temperature standard deviation) × 100))  \r\n- `bio_5` : Max Temperature of Warmest Month (°C)  \r\n- `bio_6` : Min Temperature of Coldest Month (°C)  \r\n- `bio_7` : Temperature Annual Range (°C)(BIO5 - BIO6)  \r\n- `bio_8` : Mean Temperature of Wettest Quarter (°C)  \r\n- `bio_9` : Mean Temperature of Driest Quarter (°C)  \r\n- `bio_10` : Mean Temperature of Warmest Quarter (°C)  \r\n- `bio_11` : Mean Temperature of Coldest Quarter (Mean temperature of coldest consecutive three months)  \r\n- `bio_12` : Annual Precipitation (mm)  \r\n- `bio_13` : Precipitation of Wettest Month (mm)  \r\n- `bio_14` : Precipitation of Driest Month (mm)  \r\n- `bio_15` : Precipitation Seasonality ((Precipitation standard deviation / Precipitation mean) × 100)  \r\n- `bio_16` : Precipitation of Wettest Quarter (mm)  \r\n- `bio_17` : Precipitation of Driest Quarter (mm)  \r\n- `bio_18` : Precipitation of Warmest Quarter (mm)  \r\n- `bio_19` : Precipitation of Coldest Quarter (mm) 	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:16:00.327883	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-10 11:45:57.892427	\N
f2089312-30ad-4041-a338-ece3113e6908	ifanadiana-era5-evapotranspiration	Ifanadiana ERA5 Evapotranspiration		The data come from the ECMWF/ERA5_LAND/MONTHLY_AGGR collection on Google Earth Engine (GEE). The band used, `potential_evaporation_sum`, gives the monthly sum of potential evapotranspiration.	Potential evapotranspiration represents the maximum quantity of water that could evaporate from the soil and be transpired by vegetation under ideal conditions, without limitation of available water. Data are available from 2000 to 2023, with an initial spatial resolution of 11,132 meters. These data have been aggregated by Commune and Fokontany to calculate monthly totals, expressed in meters.\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of commune or fokontany  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `mean_pev` : spatial average of total monthly potential evapotranspiration (m)  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:26:18.342934	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:25:27.193745	\N
9714e542-9a34-4f2c-a7d4-2d9b062d1b90	ifanadiana-ocha-fokontany	Ifanadiana OCHA Fokontany		United Nations Organization for the Coordination of Humanitarian Affairs (OCHA)	Ifd_admin_GADM_level_5_(Fokontany) data describe the Fokontany, Madagascar's smallest administrative unit. Following the 2019/2020 territorial redrawing, these data include two attributes: `old_commune` for the commune membership through 2018 and `new_commune` for 2019-onward. A unique identifier `comm_fkt` has been created by combining the name of the new commune and that of the fokontany, separated by an underscore. This static data makes it possible to trace changes in the administrative affiliation of Fokontany.\r\n\r\n**Columns :**   \r\n- `fid` : numeric id of commune or fokontany  \r\n- `new_commune` : commune name to be used from Jan 2019 onwards  \r\n- `old_commune` : commune name to be used thru 2018  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 14:00:11.785912	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:57:21.547077	\N
9b952e3b-de36-42a0-a0b1-2b5f3bff1415	ifanadiana-era5-temperature	Ifanadiana ERA5 Temperature		The data come from the ECMWF/ERA5_LAND/MONTHLY_AGGR collection on Google Earth Engine (GEE). The band used, `temperature_2m`, is the average monthly temperature at 2 meters above ground level, in Kelvin.	Air temperature measured at 2 meters above ground, available from 2000 to 2023, with an initial spatial resolution of 11,132 meters.. These data have been aggregated by Commune and Fokontany to calculate monthly averages, expressed in Kelvin.\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of commune or fokontany  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `mean_temp` : average monthly temperature (Celsius)  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:22:20.217001	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:21:26.683623	\N
bbf1a158-2ed4-40a6-854a-6eec7627a364	ifanadiana-era5-relative-humidity	Ifanadiana ERA5 Relative Humidity		The data needed to calculate relative humidity comes from the following Google Earth Engine (GEE) collections: `ECMWF/ERA5_LAND/MONTHLY_AGGR`, and the bands used are `dewpoint_temperature_2m` and `temperature_2m`.	Relative humidity represents the ratio between the quantity of water vapor present in the air and the maximum quantity the air can contain at a given temperature. Data are available from 2000 to 2023, with an initial spatial resolution of 11,132 meters. They are derived from the dew point temperature and the air temperature at 2 meters, according to the formula :\r\n\r\n> Relative Humidity = 100 * (exp((17.625 * TD) / (243.04 + TD)) / exp((17.625 * T) / (243.04 + T)))  \r\n> where TD is the dew point temperature and T is the air temperature.\r\n\r\nThese data have been aggregated by Commune and Fokontany to calculate monthly averages, expressed as a percentage (%), where 100% indicates complete saturation of the air with water vapor.\r\n\r\n**DOI :**  \r\n[https://doi.org/10.1175/1520-0450(1996)035<0601:IMFAOS>2.0.CO;2](https://doi.org/10.1175/1520-0450(1996)035<0601:IMFAOS>2.0.CO;2)\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of commune or fokontany  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  \r\n- `new_commune` : commune name after 2019  \r\n- `old_commune` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `mean` : average monthly relative humidity (%)  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:31:02.659436	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:30:05.364581	\N
1cc1035e-97bf-40b8-b164-86c5c2a461d6	ifanadiana-era5-precipitation	Ifanadiana ERA5 Precipitation		Precipitation data come from the fifth generation ECMWF atmospheric reanalysis (ERA5) collection of aggregated monthly images (ECMWF/ERA5_LAND/MONTHLY_AGGR) available on Google Earth Engine (GEE). The band used, “total_precipitation_sum”, provides the total sum of precipitation for each month, expressed in meters.	Precipitation at fokontany or commune level corresponds to all the water falling to the ground in the form of rain, snow, hail or any other form of atmospheric precipitation. These data, expressed in meters, exclude fog and dew. They cover the period from 2000 to 2023, with a spatial resolution of 11,132 meters and a monthly temporal resolution.\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of commune or fokontany  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `sum_ppt_month` : total monthly precipitation in mm  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:34:49.692392	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:33:58.973313	\N
835e19fb-dcb7-48f7-b634-8f1795f46bc4	ifanadiana-ocha-district	Ifanadiana OCHA District		United Nations Organization for the Coordination of Humanitarian Affairs (OCHA)	Ifd_admin_GADM_level_3_district data is static data that provides the complete administrative boundary of the Ifanadiana district.\r\n\r\n**Columns :**   \r\n- `fid` : district identifier  \r\n- `LIB_PROV` : province name  \r\n- `LIB_REG` : region name  \r\n- `LIB_DIST` : district name  	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:48:23.987669	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:46:31.285659	\N
ae93a02c-f722-4af9-b16a-0f63841b8b06	ifanadiana-standardized-name-of-level-5-fokontany	Ifanadiana standardized name of level 5 (Fokontany)		Pivot - Science Department	A list of standardized fokontany names, uniquely identified through the `comm_fkt` variable.  \r\n\r\n**Columns :**  \r\n- `fokontany` : fokontany name  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature 	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 14:06:28.827257	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 14:05:48.520102	\N
6eba7d5c-6bbf-42bc-be75-0b0112afd4d8	ifanadiana-worldclim	Ifanadiana Worldclim		WorldClim	WorldClim version 2.1 data, aggregated by Fokontany and Commune, provides global monthly average climate data for minimum, mean and maximum temperature, as well as precipitation. These data are static, representing climatological averages calculated over the reference period 1970-2000, and are available at an original spatial resolution of 1 km². They have been aggregated to the administrative unit via a spatial mean.\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of Commune or Fokontany  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `new_commune` : commune name after 2019  \r\n- `old_commun` : commune name before 2019  \r\n- `tmin_01` : minimum temperature in january (°C)  \r\n- `tmin_02` : minimum temperature in february (°C)  \r\n- `tmin_03` : minimum temperature in march (°C)  \r\n- `tmin_04` : minimum temperature in april (°C)  \r\n- `tmin_05` : minimum temperature in may (°C)  \r\n- `tmin_06` : minimum temperature in june (°C)  \r\n- `tmin_07` : minimum temperature in july (°C)  \r\n- `tmin_08` : minimum temperature in august (°C)  \r\n- `tmin_09` : minimum temperature in september (°C)  \r\n- `tmin_10` : minimum temperature in october (°C)  \r\n- `tmin_11` : minimum temperature in november (°C)  \r\n- `tmin_12` : minimum temperature in december (°C)  \r\n- `tmax_01` : maximum temperature in january (°C)  \r\n- `tmax_02` : maximum temperature in february (°C)  \r\n- `tmax_03` : maximum temperature in march (°C)  \r\n- `tmax_04` : maximum temperature in april (°C)  \r\n- `tmax_05` : maximum temperature in may (°C)  \r\n- `tmax_06` : maximum temperature in june (°C)  \r\n- `tmax_07` : maximum temperature in july (°C)  \r\n- `tmax_08` : maximum temperature in august (°C)  \r\n- `tmax_09` : maximum temperature in september (°C)  \r\n- `tmax_10` : maximum temperature in october (°C)  \r\n- `tmax_11` : maximum temperature in november (°C)  \r\n- `tmax_12` : maximum temperature in december (°C)  \r\n- `tavg_01` : average temperature in january (°C)  \r\n- `tavg_02` : average temperature in february (°C)  \r\n- `tavg_03` : average temperature in march (°C)  \r\n- `tavg_04` : average temperature in april (°C)  \r\n- `tavg_05` : average temperature in may (°C)  \r\n- `tavg_06` : average temperature in june (°C)  \r\n- `tavg_07` : average temperature in july (°C)  \r\n- `tavg_08` : average temperature in august (°C)  \r\n- `tavg_09` : average temperature in september (°C)  \r\n- `tavg_10` : average temperature in october (°C)  \r\n- `tavg_11` : average temperature in november (°C)  \r\n- `tavg_12` : average temperature in december (°C)  \r\n- `prec_01` : total rainfall in january (mm)  \r\n- `prec_02` : total rainfall in february (mm)  \r\n- `prec_03` : total rainfall in march (mm)  \r\n- `prec_04` : total rainfall in april (mm)  \r\n- `prec_05` : total rainfall in may (mm)  \r\n- `prec_06` : total rainfall in june (mm)  \r\n- `prec_07` : total rainfall in july (mm)  \r\n- `prec_08` : total rainfall in august (mm)  \r\n- `prec_09` : total rainfall in september (mm)  \r\n- `prec_10` : total rainfall in october (mm)  \r\n- `prec_11` : total rainfall in november (mm)  \r\n- `prec_12` : total rainfall in december (mm)  \r\n- `srad_01` : Mean daily solar radiation in january (kJ/m²/day)  \r\n- `srad_02` : Mean daily solar radiation in february (kJ/m²/day)  \r\n- `srad_03` : Mean daily solar radiation in march (kJ/m²/day)  \r\n- `srad_04` : Mean daily solar radiation in april (kJ/m²/day)  \r\n- `srad_05` : Mean daily solar radiation in may (kJ/m²/day)  \r\n- `srad_06` : Mean daily solar radiation in june (kJ/m²/day)  \r\n- `srad_07` : Mean daily solar radiation in july (kJ/m²/day)  \r\n- `srad_08` : Mean daily solar radiation in august (kJ/m²/day)  \r\n- `srad_09` : Mean daily solar radiation in september (kJ/m²/day)  \r\n- `srad_10` : Mean daily solar radiation in october (kJ/m²/day)  \r\n- `srad_11` : Mean daily solar radiation in november (kJ/m²/day)  \r\n- `srad_12` : Mean daily solar radiation in december (kJ/m²/day)  \r\n- `wind_01` : Mean wind speed in january (m/s)  \r\n- `wind_02` : Mean wind speed in february (m/s)  \r\n- `wind_03` : Mean wind speed in march (m/s)  \r\n- `wind_04` : Mean wind speed in april (m/s)  \r\n- `wind_05` : Mean wind speed in may (m/s)  \r\n- `wind_06` : Mean wind speed in june (m/s)  \r\n- `wind_07` : Mean wind speed in july (m/s)  \r\n- `wind_08` : Mean wind speed in august (m/s)  \r\n- `wind_09` : Mean wind speed in september (m/s)  \r\n- `wind_10` : Mean wind speed in october (m/s)  \r\n- `wind_11` : Mean wind speed in november (m/s)  \r\n- `wind_12` : Mean wind speed in december (m/s)  \r\n- `vapr_01` : Mean water vapor pressure in january (kPa)  \r\n- `vapr_02` : Mean water vapor pressure in february (kPa)  \r\n- `vapr_03` : Mean water vapor pressure in march (kPa)  \r\n- `vapr_04` : Mean water vapor pressure in april (kPa)  \r\n- `vapr_05` : Mean water vapor pressure in may (kPa)  \r\n- `vapr_06` : Mean water vapor pressure in june (kPa)  \r\n- `vapr_07` : Mean water vapor pressure in july (kPa)  \r\n- `vapr_08` : Mean water vapor pressure in august (kPa)  \r\n- `vapr_09` : Mean water vapor pressure in september (kPa)  \r\n- `vapr_10` : Mean water vapor pressure in october (kPa)  \r\n- `vapr_11` : Mean water vapor pressure in november (kPa)  \r\n- `vapr_12` : Mean water vapor pressure in december (kPa)  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 13:39:03.633634	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 13:38:18.808558	\N
de231e52-b888-4552-8688-68dc0eecd48c	ifanadiana-minsap-csb	Ifanadiana MINSAP CSB		Pivot - Science Department	This dataset provides a complete georeferenced inventory of the 21 Basic Health Centers (Centres de Santé de Base or CSB) located in Ifanadiana district, Vatovavy region, Madagascar. Of note, CSB Ampasinambo was established in November 2016 and CSB Ambiabe was established in April 2018, representing the newest facilities in the district.\r\n\r\n**Columns :**  \r\n- `Name` : Official name of the health center, typically based on the locality where it is located  \r\n- `fid` : Unique identifier for each CSB  \r\n- `name` : name of the CSB  \r\n- `type` : classification of the health center, likely according to Madagascar's Ministry of Health standards (for example, CSB level I or level II, based on services offered and facility size).  \r\n- `lat` : latitude (WGS84)  \r\n- `lon` : longitude (WGS84)  \r\n- `creation date` : 	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 14:44:42.146931	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 14:17:37.289317	\N
5780b1c9-d5dc-4773-96db-9dff544f8cc2	ifanadiana-srtm-elevation	Ifanadiana SRTM Elevation		USGS EROS	Elevation data are from the Shuttle Radar Topography Mission (SRTM), collected in 2000 (version 4.1). Units are in meters and the spatial reference system used is EPSG: 4326. This raster file represents elevation data for Ifanadiana district, with a resolution of 1 arc-second (approx. 30 meters).\r\n\r\n### Reference\r\n\r\nJarvis A., H.I. Reuter, A. Nelson, E. Guevara, 2008, Hole-filled seamless SRTM data V4, International Centre for Tropical Agriculture (CIAT), disponible sur http://srtm.csi.cgiar.org.\r\n	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:07:56.488147	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:07:23.764329	\N
9b57f710-78d4-47d7-8629-35346c1e5ee3	ifanadiana-community-site-location	Ifanadiana Community Site Location		Pivot - Science Department	Ifd_Community_Site_locations data provide the geographical locations of community sites in the Ifanadiana district, Madagascar.\r\n\r\n**Columns :**  \r\n- `name` : community site name  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun`: commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `lat` : latitude (WGS84)  \r\n- `lon` : longitude (WGS84)  	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 14:50:10.911311	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 14:47:56.773229	\N
49b5b713-0773-4d7c-b03c-ef5ded601661	ifanadiana-sentinel2-ndwi-gao	Ifanadiana Sentinel2 NDWI-GAO		Copernicus  data	This dataset contains Normalized Difference Moisture Index (NDMI) values, also known as Normalized Difference Water Index (NDWI-GAO), extracted from Sentinel-2 images for areas surrounding four main villages per fokontany.NDWI-GAO values were extracted within a 1 km buffer around each village, and a weighted average of the values was calculated based on the number of buildings per village.  \r\n\r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `vill_ndwigao` : ndwi_gao values calculated from Sentinel-2 images  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month \r\n	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:31:40.790077	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:31:06.545833	\N
2f9f7af8-2a32-4f78-80a7-0883532c1340	ifanadiana-sentinel2-land-cover	Ifanadiana Sentinel2 Land Cover		Pivot - Science Department	Ifd_Land_Cover is a Raster land cover classification data generated from Sentinel-2 satellite images and OpenStreetMap data collected in 2018. The raster has a spatial resolution of 10 meters and uses the EPSG:4326 - WGS84 spatial reference system. It is masked to only cover Ifanadiana district, and does not cover areas outside the boundary.\r\n\r\n**Columns :**  \r\n- `Id`: Unique identifier for each land use class  \r\n- `Name`: Designation of the land use class (1 = dense forest; 2 = surface water; 3 = savannah; 4 = human settlements; 5 = rice fields)  \r\n- `Area` Area covered by each class (in hectares)  	Felana Ihantamalala	fihantamalala@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-17 06:50:24.721832	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 14:58:31.366448	\N
21ec7fdc-131a-4a3d-96ac-59530857a08d	ifanadiana-modis-evi	Ifanadiana MODIS EVI		Data from the Google Earth Engine (GEE) platform using the collection: ee.collection(“MODIS_061_MOD13Q1”)	This dataset contains Enhanced Vegetation Index (EVI) values from MODIS images, extracted directly at fokontany level. Data are available from 2000 to the present day, with an original spatial resolution of 250m and a temporal resolution of 16 days, updated at a frequency of 16 days. The processed data represents a monthly mean aggregated to the level of the fokontany using the spatial mean.\r\n\r\n**Columns :**   \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature    \r\n- `vill_evi_modis` : evi values calculated from Modis images    \r\n- `date` : month in format YYYY-MM-DD  \r\n	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-17 06:47:19.647235	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:12:06.095427	\N
754acaf5-cb06-4b80-8c10-0224add58cc8	ifanadiana-sentinel2-evi	Ifanadiana Sentinel2 EVI		Copernicus  data	**Description :**  \r\nThis dataset contains Enhanced Vegetation Index (EVI) values from Sentinel-2 images. The EVI is calculated following Sen2Chain. Data has been available from October 2015, with an original spatial resolution of 10m and a temporal resolution of 6 days, updated every 6 days. The values are extracted from a 1-km buffer around the 4 major villages in each fokontany, then a weighted average is calculated based on the number of buildings per village to give a fokontany-level value.  \r\n\r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `vill_evi_sen2` : evi values calculated from Sentinel-2 images  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-17 06:49:05.749642	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:17:08.366559	\N
dd628090-9e2b-48c9-894c-19a8d4512639	ifanadiana-sentinel2-ndvi	Ifanadiana  Sentinel2 NDVI		Copernicus  data	This dataset contains Normalized Difference Vegetation Index (NDVI) values extracted from Sentinel-2 imagery for areas around four major villages per fokontany. NDVI values were extracted within a 1 km buffer around each village, and an average weighted by the number of buildings per village was calculated for each measuring point.  \r\n\r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `vill_ndvi` : ndvii values calculated from Sentinel-2 images  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month 	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:27:03.556327	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:26:30.414687	\N
571138dc-e441-4ab6-b5c0-c73cbdd6baa9	ifanadiana-topographic-wetness-index-twi	Ifanadiana Topographic Wetness Index (TWI)			The Topographic Wetness Index (TWI) estimates the tendency of water to pool based on a  pixel’s slope and location within a hydrological catchment. These values were estimated for the four major villages and aggregated to the fokontany level.  \r\n\r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `mean_twi` : Average TWI value in a 1km buffer surrounding the four major villages in a fokontany. Calculated using a building-weighted mean.  	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 16:28:38.533052	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:40:07.462042	\N
b7865633-8ff9-4523-9848-15b91aa64dd6	ifanadiana-sentinel2-mndwi	Ifanadiana Sentinel2 MNDWI		Copernicus  data	MNDWI (McFeeter’s Normalized Difference Water Index) data calculated from Sentinel-2 images. Values are extracted within a 1-km radius of 4 main villages per fokontany. A weighted average is then calculated based on the number of buildings per village.  \r\n\r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `vill_mndwi` : mndwi values calculated from Sentinel-2 images  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  \r\n					active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:35:35.616896	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:35:08.445029	\N
2e8e66da-47d9-421f-b4fd-b8474a55a0b6	ifanadiana-all-settlements	Ifanadiana All Settlements		Pivot - Science Department	Ifd_all_settlements.csv is a comprehensive inventory of all hamlets identified on OpenStreetMap in 2018 in the Ifanadiana district. This file potentially includes non-permanent settlements, including those with a single building. Hamlet centroids are georeferenced in latitude/longitude (WGS84).\r\n\r\n**Columns :**  \r\n- `fid` : numeric id of village  \r\n- `village` : village name. Only present for those with a known village name.  \r\n- `lon` : longitude of centroid (WGS84)  \r\n- `lat` : latitude of centroid (WGS84)  \r\n- `nbrBati` : number of buildings  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature \r\n	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:50:07.728206	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:49:39.347616	\N
c8577170-42b1-417f-ac25-85550abad242	ifanadiana-modis-aerosol-optical-depth-aod	Ifanadiana MODIS Aerosol Optical Depth (AOD)		Données venant de la plateforme Google Earth Engine (GEE) à partir de la collection : ee.ImageCollection("MODIS/061/MCD19A2_GRANULES") 	Aerosol Optical Depth (AOD) data are from the MODIS (Terra and Aqua) MCD19A2 V6.1 daily product. This is an Aerosol Optical Depth (AOD) product based on the Multi-angle Implementation of Atmospheric Correction (MAIAC). These data are available at a resolution of 1 km and are produced daily. They are extracted and aggregated at commune and fokontany level by taking the spatial and monthly mean. \r\n \r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `new_commun` : commune name after 2019  \r\n- `old_commun` : commune name before 2019  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:46:14.941024	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:45:20.367487	\N
08f20c0b-4627-4ec4-9d0c-39802aa21443	ifanadiana-era5-subsurface-runoff	Ifanadiana ERA5 Subsurface runoff		The data come from the ECMWF/ERA5_LAND/MONTHLY_AGGR collection on Google Earth Engine (GEE), with the sub_surface_runoff_sum band measuring total subsurface runoff.	Subsurface runoff represents the flow of water moving laterally through the surface layers of the soil. Data are available monthly from 2000 to 2023, with a spatial resolution of 11,132 meters. These data have been aggregated by Fokontany and by Communes to quantify the volume of water expressed in height-equivalents (meters), as if water were uniformly distributed over the administrative surface. \r\n\r\n**Columns :**  \r\n- `fid` : numeric id of commune or fokontany  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  \r\n- `new_commune` : commune name after 2019  \r\n- `old_commune` : commune name before 2019  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `mean_subrunoff` : average of subsurface runoff  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-17 06:45:14.740003	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 16:33:13.454133	\N
30677483-6527-4c20-a7b5-5682643ed35c	ifanadiana-modis-ndvi	Ifanadiana MODIS NDVI		Google Earth Engine (GEE), collection MODIS/061/MOD13Q1 	These datasets contain Normalized Vegetation Index (NDVI) values from MODIS images aggregated at commune / Fokontany level to analyze vegetation cover. Data are available from 2000 to the present day, with a spatial resolution of 250m and a temporal resolution of 16 days, updated at a frequency of 16 days.  \r\n\r\n**Columns :**  \r\n- `comm_fkt` : name of fokontany using standardized ‘new_commune’_’fokontany’ nomenclature  \r\n- `modis_ndvi` : ndvi values calculated from modis images  \r\n- `date` : date in format: YYYY-MM, corresponding to year and month  	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 16:22:48.220509	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:20:56.87306	\N
3a60beaa-f53d-4928-b1e9-5c3359a8b647	ifanadiana-majo-villages-level-3-district	Ifanadiana Major Villages level 3 district		Pivot - Science Department	fd_major_villages is a location of the four largest villages in each Fokontany, according to their building density in OpenStreetMap. Some Fokontany may have fewer than four villages, depending on the distribution of buildings. These data enable us to identify the major population centers within each administrative unit. Coordinates are expressed in WGS84.  \r\nIfd_major_villages is a dataset identifying the location of up to four sentinel villages in each Fokontany, determined by the number of buildings and field-based knowledge of community locations. Some Fokontany may have fewer than four villages if there were fewer than four population centers in the Fokontany. This dataset is intended to highlight the main population centers within each administrative unit. Coordinates are expressed in WGS84.\r\n\r\n**Columns :**  \r\n- `gid` : numeric id of village  \r\n- `village` : village name. Only present for those with a known village name.  \r\n- `lon` : longitude of centroid (WGS84)  \r\n- `lat` : latitude of centroid (WGS84)  \r\n- `nbrBati` : number of buildings  \r\n- `comm_fkt` : name of fokontany using standardized ‘new commune’_’fokontany’ nomenclature  	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-16 15:53:31.381513	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-16 15:52:46.965637	\N
f90ce444-bfce-4f95-b445-d967b3eeeff6	ifanadiana-pivot-census-level5-fokontany	Ifanadiana PIVOT Census level5 Fokontany		Pivot’s Monitoring and Evaluation Team	Population by age class and gender for the 80 fokontany within Pivot’s initial catchment. This is derived from a census conducted in October 2021.\r\n\r\n**Columns :**  \r\n- `comm_fkt` : standardized commune and fokontany nomenclature  \r\n- `households` : number of households in the fokontany  \r\n- `children_u5` : number of children under 5 years old  \r\n- `children_5-15` : number of children between 5-15 years old  \r\n- `men_over15` : number of men older than 15 years of age  \r\n- `women_15-45` : number of women greater than 15 and up to 45 years old  \r\n- `women_over45` : women older than 45 years old  \r\n- `total_pop` : total population (all ages) \r\n	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-17 06:40:59.304612	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 06:40:21.573272	\N
1f91eac6-9746-4af1-bee0-84c9288b3661	ifanadiana-instat-population	Ifanadiana INSTAT Population		Institut National de la Statistique (INSTAT)	The population of each fokontany of Ifanadiana, based on the national censuses (“RGP”) conducted by INSTAT in 1993 and 2018.\r\n\r\n**Columns :**  \r\n- `comm_fkt` : standardized commune and fokontany nomenclature  \r\n- `pop_1993` : Total population in 1993  \r\n- `pop_2018` : Total population in 2018 \r\n	Michelle Evans 	mevans@pivotworks.org	RANDRIANJATOVO Tokiniaina 	twoockyis@gmail.com	active		dataset	a2248456-a6a7-4c09-97ca-0e52b52ea2f8	t	2025-07-17 06:42:18.342061	0477425b-7190-4199-b54d-2f31d6d4cb5b	2025-07-17 06:36:22.077807	\N
\.


--
-- Data for Name: package_extra; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_extra (id, key, value, state, package_id) FROM stdin;
04ed62dc-6a48-4e77-b5bf-065c17f9e825	Processing steps	Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary.	active	b6a9d6c5-64d6-49e0-abfa-7743564a9a66
917951aa-96c4-4f32-812a-ab4e758f2d92	Data link :	[https://www.worldclim.org/data/worldclim21.html#google_vignette](https://www.worldclim.org/data/worldclim21.html#google_vignette)	active	b6a9d6c5-64d6-49e0-abfa-7743564a9a66
4c0ce8ec-5de0-465a-abad-0e92b8ce16cc	Processing steps	temperature conversion in degrees Celsius / Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary.	active	9b952e3b-de36-42a0-a0b1-2b5f3bff1415
0889b6a6-a1ce-4d65-98a3-1ffb3c767821	Data link :	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR#bands	active	9b952e3b-de36-42a0-a0b1-2b5f3bff1415
89a10ced-dce5-4dd7-a273-2705c030b5e3	Processing steps	data aggregation using the spatial average of the polygon in each administrative zone	active	f2089312-30ad-4041-a338-ece3113e6908
8bf52b79-864a-49d3-833f-297422baaea2	Data link :	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR#bands	active	f2089312-30ad-4041-a338-ece3113e6908
47cc7ffe-f02f-4c30-b39c-e79834907fd1	Processing steps	data aggregation using the spatial average of the polygon in each administrative zone  	active	bbf1a158-2ed4-40a6-854a-6eec7627a364
b05bc51b-74a3-4429-af93-7ee09d43af88	Data link :	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR#bands	active	bbf1a158-2ed4-40a6-854a-6eec7627a364
c88cab70-6bd3-47e3-858d-f8aa617d3a7c	Processing steps	Conversion of data from meters to mm and data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary.	active	1cc1035e-97bf-40b8-b164-86c5c2a461d6
30a1eea6-797f-4b56-b7ae-d0656c60f199	Data link :	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY_AGGR	active	1cc1035e-97bf-40b8-b164-86c5c2a461d6
57c4d936-de0c-45fd-ae3d-85f5298d06f5	Processing steps	Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary. 	active	6eba7d5c-6bbf-42bc-be75-0b0112afd4d8
d8ce4b5e-9d06-4495-b58e-c893301b7020	Data link :	https://www.worldclim.org/data/worldclim21.html#google_vignette	active	6eba7d5c-6bbf-42bc-be75-0b0112afd4d8
cc6fdb45-56d5-4bb3-a187-d9c95efe54ea	Data link :	https://data.humdata.org/dataset/cod-ab-mdg	active	835e19fb-dcb7-48f7-b634-8f1795f46bc4
c16bab89-3057-4fd1-ac47-7c26c80e10b1	Data link 	https://data.humdata.org/dataset/cod-ab-mdg	active	a81fe6ef-4519-4697-b5ab-67341b6d67b4
008eceb0-1613-493b-a976-59fb538a6da9	Data link 	https://data.humdata.org/dataset/cod-ab-mdg	active	9714e542-9a34-4f2c-a7d4-2d9b062d1b90
8d40bf8e-a8d1-4058-a1d0-a8ccd1266060	Processing steps	The names of fokontany were manually cleaned and edited based on discussion with local experts to arrive at a standardized dataset of names.	active	ae93a02c-f722-4af9-b16a-0f63841b8b06
a0182b0c-f577-421e-918c-6f717dfbdbe0	Processing steps	The data were downloaded, re-projected and cropped to include the Ifanadiana district study area with surrounding buffer zones to enable hydrological analyses.	active	5780b1c9-d5dc-4773-96db-9dff544f8cc2
70e71482-8624-4468-8a84-74e4efde9c38	Data link 	https://developers.google.com/earth-engine/datasets/catalog/MODIS_061_MOD13Q1	active	21ec7fdc-131a-4a3d-96ac-59530857a08d
32661b15-cc77-4cf0-adff-8d571415384a	Processing steps	Data aggregation by fokontany/commune using spatial average (weighted mean). The average value was calculated using Google Earth Engine's reducer function, which computes a weighted mean based on the proportion of each pixel area that falls within the polygon boundary.	active	21ec7fdc-131a-4a3d-96ac-59530857a08d
101f2372-f980-4c3f-8ea1-fb41be687f92	Data link 	https://gitlab.com/pivot-sci-apps/smaller-backend/-/blob/main/data/model-variables/vill_evi.csv?ref_type=heads  	active	754acaf5-cb06-4b80-8c10-0224add58cc8
8f491061-4a76-4967-aa7e-bfc60f5a3fcf	Processing steps	Processing and treatment of images using Sen2Chain : Download L1C (top of atmosphere) products from available suppliers / Processing of L1C to L2A (bottom of atmosphere) products / Calculation of cloud masks and radiometric indices;   Extraction of values from a 1 km buffer around villages, followed by weighted-mean  based on the number of buildings per village to calculate a fokontany-level value. All spatial processing was doing using the Sen2Chain algorithm. https://espace-dev.frama.io/sen2chain/   6-day values are aggregated into a monthly mean by smoothing the full time series of data using a cubic spline to estimate weekly values which were then averaged to a monthly mean following Evans et al. 2025 (doi: 10.1186/s12936-025-05266-0)  	active	754acaf5-cb06-4b80-8c10-0224add58cc8
6f25abbc-579b-493c-9364-01bfb79fe772	Data link 	https://developers.google.com/earth-engine/datasets/catalog/MODIS_061_MOD13Q1	active	30677483-6527-4c20-a7b5-5682643ed35c
6484bbaa-47ea-4739-bb6d-984f972245c9	Processing steps	data aggregation using the spatial average 	active	30677483-6527-4c20-a7b5-5682643ed35c
4854b891-011a-42cd-9cf6-b7572f5e9f73	Data link 	https://gitlab.com/pivot-sci-apps/smaller-backend/-/blob/main/data/model-variables/vill_ndvi.csv?ref_type=heads 	active	dd628090-9e2b-48c9-894c-19a8d4512639
745c27fd-31a4-4a0f-bfa0-01c3c9bea838	Processing steps	Processing and treatment of images using Sen2Chain : Download L1C (top of atmosphere) products from available suppliers / Processing of L1C to L2A (bottom of atmosphere) products / Calculation of cloud masks and radiometric indices;   Calculation of NDVI using the following equation: (B08 - B4) / (B08 + B4)   Extraction of NDVI values from Sentinel-2 imagery.   Definition of a 1 km buffer around each major village.   Calculation of a weighted average of NDVI values based on the number of buildings per village. https://espace-dev.frama.io/sen2chain/  	active	dd628090-9e2b-48c9-894c-19a8d4512639
45399ccb-17ab-4b68-9e38-c417830213ca	Data link 	https://gitlab.com/pivot-sci-apps/smaller-backend/-/blob/main/data/model-variables/vill_ndwigao.csv?ref_type=heads 	active	49b5b713-0773-4d7c-b03c-ef5ded601661
876aa07a-e2f9-4a32-baa4-09cbd86bcad0	Processing steps	Processing and treatment of images using Sen2Chain : Download L1C (top of atmosphere) products from available suppliers / Processing of L1C to L2A (bottom of atmosphere) products / Calculation of cloud masks and radiometric indices;   Calculation of NDWI-GAO using the following equation: (B08 - B11) / (B08 + B11)   Extraction of NDWI-GAO values from Sentinel-2 imagery.   Definition of a 1 km buffer around each major village.   Calculation of a weighted average of NDWI-GAO values based on the number of buildings per village.  	active	49b5b713-0773-4d7c-b03c-ef5ded601661
db0b6ef5-8ce0-4bd0-ac1a-417ff125057e	Data link 	https://gitlab.com/pivot-sci-apps/smaller-backend/-/blob/main/data/model-variables/vill_mndwi.csv?ref_type=heads 	active	b7865633-8ff9-4523-9848-15b91aa64dd6
82cd61f5-97d4-4738-9644-8485747c8ba5	Processing steps	Calculation of MNDWI using the following equation: (B03 - B08) / (B03 + B08)   Extraction of MNDWI values in a 1 km buffer zone around selected villages   Calculation of weighted average based on number of buildings per village 	active	b7865633-8ff9-4523-9848-15b91aa64dd6
40b5350a-ec94-4f8d-9746-cdc3bd999564	Processing steps	Village locations and number of buildings were extracted from OpenStreetMap data updated in 2018.   The largest villages were selected on the basis of the number of buildings and habitat area, according to Mauricianot's analysis.	active	3a60beaa-f53d-4928-b1e9-5c3359a8b647
726362fa-a561-4f14-ad7e-e212ad28d099	Data link 	Created as part of Evans et al. 2025 (doi: 10.1186/s12936-025-05266-0). Can be accessed via the associated figshare repository. 	active	571138dc-e441-4ab6-b5c0-c73cbdd6baa9
beda86a8-f7f2-4abd-8fc9-65685c9c6ccb	Processing steps	The TWI is calculated based on the SRTM Digital Elevation model using the GRASS GIS function ‘topidx. It estimates TWI as ln(a/tan(β)), where a is the surface catchment area of that pixel and β is the local surface topographic slope. These values were then extracted using a spatial mean (weighted by included pixel area)  around two zones of interest: within a 1-km radius of major villages and in rice paddy areas. These values were aggregated to the level of the fokontany via a building-weighted mean  	active	571138dc-e441-4ab6-b5c0-c73cbdd6baa9
0450aa26-bd92-4fd5-9735-42a062070f10	Data link 	https://developers.google.com/earth-engine/datasets/catalog/MODIS_061_MCD19A2_GRANULES  	active	c8577170-42b1-417f-ac25-85550abad242
0b6d68f8-004a-4323-83c5-adca7124813c	Processing steps	data aggregation using the spatial average of the polygon in each 	active	c8577170-42b1-417f-ac25-85550abad242
860de3ce-9667-471f-881e-0b93c621b2ce	Processing steps	Village locations and number of buildings were extracted from OpenStreetMap data, which was updated in 2018 following a systematic mapping exercise of all buildings, residential areas, footpaths and rice fields in the district.	active	2e8e66da-47d9-421f-b4fd-b8474a55a0b6
68d98be7-0310-4260-a776-9043680e8476	Data link 	https://developers.google.com/earth-engine/datasets/catalog/ECMWF_ERA5_LAND_MONTHLY	active	08f20c0b-4627-4ec4-9d0c-39802aa21443
68be5355-b9c3-4f3a-95dd-db9dff7b221a	Processing steps	data aggregation using the spatial average of the polygon in each administrative zone	active	08f20c0b-4627-4ec4-9d0c-39802aa21443
dc82d43c-0a27-4fe9-b1d8-3ae4b5b8b8a0	Processing steps	Population (all ages) by fokontany in 1993 and 2018 extrapolated from the 2015 data provided via Pivot assuming a 2.8% growth rate, following INSTAT standards. This **should** correspond to the 1993 and 2018 census values and be used as a starting point for other calculations.	active	1f91eac6-9746-4af1-bee0-84c9288b3661
9834b9a2-f118-47e5-8156-27bdc04c9a4a	Processing steps	No data processing steps were taken. The original data does contain more disaggregation by age and gender and can be obtained by contacting Pivot’s Monitoring and Evaluation Team via the dataset author and/or maintainer email provided.	active	f90ce444-bfce-4f95-b445-d967b3eeeff6
3facccbb-ae59-4af3-bba4-7ae9aa3e1069	Usage guide	Note that for some fokontany, these values are *very* different from the INSTAT values. Comparisons with the size of residential areas and the number of buildings derived from OpenStreetMap found that these values corresponded better with the external dataset than those derived from the INSTAT national census. For this reason, we believe this local dataset to be more accurate and often use it in the place of INSTAT census data for the 80 fokontany for which it is available. When extrapolating to other years	active	f90ce444-bfce-4f95-b445-d967b3eeeff6
1d7171b7-aaee-4cf5-ba8e-3889f4ab51b9	Usage guide	Note that INSTAT assumes a 2.8% growth rate but our calculations find the growth rate between the 1993 and 2018 census to be 2.0%. When extrapolating to other years, you can either use the official 2.8% annual growth rate from INSTAT or the 2.0% growth rate based on the difference between the 1993-2018 census. If calculating by age class, we assume 18% of the population is under 5 and 27% is between 5-14 years old. Note that an external census conducted by Pivot in some communes of the district (see dataset “Pivot Census Data”) has found very different population values and this data should be used as a denominator in calculations with extreme caution.	active	1f91eac6-9746-4af1-bee0-84c9288b3661
\.


--
-- Data for Name: package_extra_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_extra_revision (id, key, value, revision_id, state, package_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: package_member; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_member (package_id, user_id, capacity, modified) FROM stdin;
\.


--
-- Data for Name: package_relationship; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_relationship (id, subject_package_id, object_package_id, type, comment, state) FROM stdin;
\.


--
-- Data for Name: package_relationship_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_relationship_revision (id, subject_package_id, object_package_id, type, comment, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: package_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_revision (id, name, title, version, url, notes, author, author_email, maintainer, maintainer_email, revision_id, state, continuity_id, license_id, expired_id, revision_timestamp, expired_timestamp, current, type, owner_org, private, metadata_modified, creator_user_id, metadata_created) FROM stdin;
\.


--
-- Data for Name: package_tag; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_tag (id, state, package_id, tag_id) FROM stdin;
\.


--
-- Data for Name: package_tag_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.package_tag_revision (id, revision_id, state, package_id, tag_id, continuity_id, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.resource (id, url, format, description, "position", hash, state, extras, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, created, url_type, package_id, metadata_modified) FROM stdin;
c04796a4-791c-45df-9c55-f4af04ebb13a	vill_evi.csv	CSV	evi description data	0		active	{"datastore_active": false}	vill_evi.csv	\N	text/csv	\N	1213590	2025-05-21 08:11:20.639285	\N	\N	2025-05-21 08:11:20.722155	upload	39a3c0ef-a7c3-4205-9ab0-88c6f74ad830	2025-05-21 08:11:25.044114
e9c9171d-b2b0-4d17-9f95-3007c7ff049b	vill_evi.csv	CSV		0		active	{"datastore_active": false}	vill_evi.csv	\N	text/csv	\N	1213590	2025-05-21 18:19:25.012063	\N	\N	2025-05-21 18:19:25.084884	upload	7cf5167a-80e8-466b-9072-9b03de2b5e99	2025-05-21 18:19:26.012831
1dfc7925-e822-4ed6-8bed-7916513328ab	ifd_worldclim_level_4_commune.csv	CSV		0		active	{"datastore_active": true}	ifd_worldclim_level_4_commune.csv	\N	text/csv	\N	22643	2025-07-16 13:38:41.637097	\N	\N	2025-07-16 13:38:41.681118	upload	6eba7d5c-6bbf-42bc-be75-0b0112afd4d8	2025-07-16 13:38:41.672673
ce22d8fe-e684-4b4c-96af-d839d73ecaea	ifd_bioclim_level_5_fokontany.csv	CSV		1		active	{"datastore_active": true}	ifd_bioclim_level_5_fokontany.csv	\N	text/csv	\N	74444	2025-07-16 13:15:32.222159	\N	\N	2025-07-16 13:15:32.388088	upload	b6a9d6c5-64d6-49e0-abfa-7743564a9a66	2025-07-16 13:15:32.343778
2706882a-b637-4170-997d-cd8e95a5543b	ifd_bioclim_level_4_commune.csv	CSV		0		active	{"datastore_active": true}	ifd_bioclim_level_4_commune.csv	\N	text/csv	\N	5467	2025-07-16 13:14:00.818667	\N	\N	2025-07-10 11:47:04.605282	upload	b6a9d6c5-64d6-49e0-abfa-7743564a9a66	2025-07-16 13:16:00.349033
d3cf4757-9609-48d7-aa06-9cb783730364	ifd_era5_temperature_level_4_commune.csv	CSV		0		active	{"datastore_active": true}	ifd_era5_temperature_level_4_commune.csv	\N	text/csv	\N	242849	2025-07-16 13:21:55.440131	\N	\N	2025-07-16 13:21:55.507843	upload	9b952e3b-de36-42a0-a0b1-2b5f3bff1415	2025-07-16 13:21:55.499072
73e1ef15-868c-48bf-b511-fbc2a2922fc8	ifd_era5_temperature_level_5_fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era5_temperature_level_5_fokontany.csv	\N	text/csv	\N	4763969	2025-07-16 13:22:19.150131	\N	\N	2025-07-16 13:22:19.202095	upload	9b952e3b-de36-42a0-a0b1-2b5f3bff1415	2025-07-16 13:22:20.234496
51299dd4-ce62-4ac3-b090-ee4e4b5d2b2d	ifd_era5_evapotranspiration_level_4_commune.csv	CSV		0		active	{"datastore_active": true}	ifd_era5_evapotranspiration_level_4_commune.csv	\N	text/csv	\N	250883	2025-07-16 13:25:49.787718	\N	\N	2025-07-16 13:25:49.842025	upload	f2089312-30ad-4041-a338-ece3113e6908	2025-07-16 13:25:49.829022
df4e10bb-1b3f-461b-a1f2-c902efbce76a	ifd_era5_evapotranspiration_level_5_fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era5_evapotranspiration_level_5_fokontany.csv	\N	text/csv	\N	4678815	2025-07-16 13:26:17.322654	\N	\N	2025-07-16 13:26:17.382676	upload	f2089312-30ad-4041-a338-ece3113e6908	2025-07-16 13:26:18.417652
eeb335fd-2b14-453e-ad1f-9b710aab6c38	ifd_era5_relative_humidity_level_4_commune.csv	CSV		0		active	{"datastore_active": true}	ifd_era5_relative_humidity_level_4_commune.csv	\N	text/csv	\N	239193	2025-07-16 13:30:31.578478	\N	\N	2025-07-16 13:30:31.676867	upload	bbf1a158-2ed4-40a6-854a-6eec7627a364	2025-07-16 13:30:31.665019
445c199c-b9ce-4309-a1c6-126af238cec1	ifd_era5_relative_humidity_level_5_fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era5_relative_humidity_level_5_fokontany.csv	\N	text/csv	\N	3233240	2025-07-16 13:31:01.369102	\N	\N	2025-07-16 13:31:01.401489	upload	bbf1a158-2ed4-40a6-854a-6eec7627a364	2025-07-16 13:31:02.692893
e125a58b-eb5a-4f74-a9ca-b5464e25b2e8	ifd_era5_precipitation_level_4_commune.csv	CSV		0		active	{"datastore_active": true}	ifd_era5_precipitation_level_4_commune.csv	\N	text/csv	\N	241540	2025-07-16 13:34:23.107775	\N	\N	2025-07-16 13:34:23.159062	upload	1cc1035e-97bf-40b8-b164-86c5c2a461d6	2025-07-16 13:34:23.149776
ed457e27-6cbf-42d6-a0e3-93455849903b	ifd_era5_precipitation_level_5_fokontany.csv	CSV		1		active	{"datastore_active": false}	ifd_era5_precipitation_level_5_fokontany.csv	\N	text/csv	\N	4747983	2025-07-16 13:34:48.180497	\N	\N	2025-07-16 13:34:48.207177	upload	1cc1035e-97bf-40b8-b164-86c5c2a461d6	2025-07-16 13:34:49.705145
f1183c23-811d-4ebd-94a5-987e75349105	ifd_admin_new_gadm_level_4_new_commune.geojson	GeoJSON		0		active	{"datastore_active": false}	ifd_admin_new_gadm_level_4_new_commune.geojson	\N	\N	\N	328886	2025-07-16 13:51:40.594666	\N	\N	2025-07-16 13:51:40.63381	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:52:03.308057
4c94580e-c2c5-413b-8199-9c96db81efab	ifd_worldclim_level_5_fokontany.csv	CSV		1		active	{"datastore_active": true}	ifd_worldclim_level_5_fokontany.csv	\N	text/csv	\N	289424	2025-07-16 13:39:02.47975	\N	\N	2025-07-16 13:39:02.560681	upload	6eba7d5c-6bbf-42bc-be75-0b0112afd4d8	2025-07-16 13:39:03.656198
648885c2-b2a5-4450-a1bc-68a19f0a5f43	ifd_admin_gadm_level_3_district.geojson	GeoJSON		0		active	{"datastore_active": false}	ifd_admin_gadm_level_3_district.geojson	\N	\N	\N	140730	2025-07-16 13:47:06.325692	\N	\N	2025-07-16 13:47:06.365467	upload	835e19fb-dcb7-48f7-b634-8f1795f46bc4	2025-07-16 13:47:36.424964
0b8640d0-e6a1-4f21-aa24-cd201947c9ef	ifd_admin_gadm_level_3_district.gpkg	gpkg		1		active	{"datastore_active": false}	ifd_admin_gadm_level_3_district.gpkg	\N	\N	\N	155648	2025-07-16 13:47:36.389255	\N	\N	2025-07-16 13:47:36.429513	upload	835e19fb-dcb7-48f7-b634-8f1795f46bc4	2025-07-16 13:48:00.745039
7ca75ff7-bcf5-4f40-828a-ed9b8bad8c89	ifd_admin_gadm_level_3_district.kml	KML		2		active	{"datastore_active": false}	ifd_admin_gadm_level_3_district.kml	\N	\N	\N	110097	2025-07-16 13:48:00.706413	\N	\N	2025-07-16 13:48:00.758081	upload	835e19fb-dcb7-48f7-b634-8f1795f46bc4	2025-07-16 13:48:23.183595
6cea2afb-d74b-444e-9b53-5662b86272ec	ifd_admin_gadm_level_3_district.zip	SHP		3		active	{"datastore_active": false}	ifd_admin_gadm_level_3_district.zip	\N	application/zip	\N	40627	2025-07-16 13:48:23.144913	\N	\N	2025-07-16 13:48:23.189179	upload	835e19fb-dcb7-48f7-b634-8f1795f46bc4	2025-07-16 13:48:23.99571
aa5bfbad-b319-4fa4-a579-d8908d99d3d1	ifd_admin_new_gadm_level_4_new_commune.gpkg	gpkg		1		active	{"datastore_active": false}	ifd_admin_new_gadm_level_4_new_commune.gpkg	\N	\N	\N	241664	2025-07-16 13:52:03.276052	\N	\N	2025-07-16 13:52:03.31502	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:52:26.668953
fc094f57-7586-4021-88dd-f7f493318760	ifd_admin_new_gadm_level_4_new_commune.kml	KML		2		active	{"datastore_active": false}	ifd_admin_new_gadm_level_4_new_commune.kml	\N	\N	\N	261318	2025-07-16 13:52:26.631074	\N	\N	2025-07-16 13:52:26.67899	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:52:58.309915
1c618ed0-f618-41b6-82e0-8f90707ceb08	ifd_admin_new_gadm_level_4_new_commune.zip	ZIP		3		active	{"datastore_active": false}	ifd_admin_new_gadm_level_4_new_commune.zip	\N	application/zip	\N	87908	2025-07-16 13:52:58.271166	\N	\N	2025-07-16 13:52:58.32577	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:53:23.942764
39c5482d-7c1f-4e10-8130-cd5a9bc94031	ifd_admin_old_gadm_level_4_old_commune.geojson	GeoJSON		4		active	{"datastore_active": false}	ifd_admin_old_gadm_level_4_old_commune.geojson	\N	\N	\N	335803	2025-07-16 13:53:23.875904	\N	\N	2025-07-16 13:53:23.957245	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:53:45.155425
a804b1a8-f428-4484-904a-0c8e6810c12a	ifd_admin_old_gadm_level_4_old_commune.gpkg	gpkg		5		active	{"datastore_active": false}	ifd_admin_old_gadm_level_4_old_commune.gpkg	\N	\N	\N	241664	2025-07-16 13:53:45.113681	\N	\N	2025-07-16 13:53:45.161171	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:54:10.047152
5a34ef2e-a7a3-4d36-8120-32bfa330f02b	ifd_admin_old_gadm_level_4_old_commune.kml	KML		6		active	{"datastore_active": false}	ifd_admin_old_gadm_level_4_old_commune.kml	\N	\N	\N	265846	2025-07-16 13:54:09.997979	\N	\N	2025-07-16 13:54:10.06059	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:54:37.337537
43a7f1a4-6184-423a-aa03-5eac880b719e	ifd_admin_old_gadm_level_4_old_commune.zip	ZIP		7		active	{"datastore_active": false}	ifd_admin_old_gadm_level_4_old_commune.zip	\N	application/zip	\N	86368	2025-07-16 13:54:37.280187	\N	\N	2025-07-16 13:54:37.34503	upload	a81fe6ef-4519-4697-b5ab-67341b6d67b4	2025-07-16 13:54:38.148833
880b4215-89f7-4681-ac61-e9bc7ff7d4b8	ifd_admin_gadm_level_5_fokontany.zip	ZIP		0		active	{"datastore_active": false}	ifd_admin_gadm_level_5_fokontany.zip	\N	application/zip	\N	111417	2025-07-16 13:58:32.003683	\N	\N	2025-07-16 13:58:32.065965	upload	9714e542-9a34-4f2c-a7d4-2d9b062d1b90	2025-07-16 13:59:15.937123
70a2d7b9-12f2-4712-8209-00dc67883736	ifd_admin_gadm_level_5_fokontany.kml	KML		1		active	{"datastore_active": false}	ifd_admin_gadm_level_5_fokontany.kml	\N	\N	\N	435554	2025-07-16 13:59:15.923978	\N	\N	2025-07-16 13:59:15.950681	upload	9714e542-9a34-4f2c-a7d4-2d9b062d1b90	2025-07-16 13:59:40.654648
855fcf35-db3b-4304-8d4a-294086b6505e	ifd_admin_gadm_level_5_fokontany.gpkg	gpkg		2		active	{"datastore_active": false}	ifd_admin_gadm_level_5_fokontany.gpkg	\N	\N	\N	323584	2025-07-16 13:59:40.632388	\N	\N	2025-07-16 13:59:40.658757	upload	9714e542-9a34-4f2c-a7d4-2d9b062d1b90	2025-07-16 14:00:10.700605
cbb0809f-f045-42da-9c0e-a6c15f0acf25	ifd_admin_gadm_level_5_fokontany.geojson	GeoJSON		3		active	{"datastore_active": false}	ifd_admin_gadm_level_5_fokontany.geojson	\N	\N	\N	452445	2025-07-16 14:00:10.607672	\N	\N	2025-07-16 14:00:10.713225	upload	9714e542-9a34-4f2c-a7d4-2d9b062d1b90	2025-07-16 14:00:11.797536
1eb71bd9-efa5-4900-97da-e3aeeafc22f1	ifd_community_site_locations_level_3_district.gpkg	gpkg		2		active	{"datastore_active": false}	ifd_community_site_locations_level_3_district.gpkg	\N	\N	\N	151552	2025-07-16 14:49:17.131103	\N	\N	2025-07-16 14:49:17.33631	upload	9b57f710-78d4-47d7-8629-35346c1e5ee3	2025-07-16 14:50:10.955024
e7af45d2-83d1-4fa9-bbf0-b0d479d83057	ifd_standardized_name_level_5_fokontany.csv	CSV		0		active	{"datastore_active": true}	Ifd_standardized_name_level_5_fokontany.csv	\N	text/csv	\N	12496	2025-07-16 14:06:27.488513	\N	\N	2025-07-16 14:06:27.513604	upload	ae93a02c-f722-4af9-b16a-0f63841b8b06	2025-07-16 14:06:28.873373
81ac6fe8-7025-4116-aa41-c076c5fbcfcc	ifd_minsap_csb_district_level_3_district.zip	ZIP		0		active	{"datastore_active": false}	ifd_minsap_csb_district_level_3_district.zip	\N	application/zip	\N	3425	2025-07-16 14:43:18.335189	\N	\N	2025-07-16 14:43:18.514203	upload	de231e52-b888-4552-8688-68dc0eecd48c	2025-07-16 14:43:47.456288
c955582d-816a-4824-aeeb-0ebd72eeed48	ifd_minsap_csb_district_level_3_district.kml	KML		1		active	{"datastore_active": false}	ifd_minsap_csb_district_level_3_district.kml	\N	\N	\N	9766	2025-07-16 14:43:47.34968	\N	\N	2025-07-16 14:43:47.471684	upload	de231e52-b888-4552-8688-68dc0eecd48c	2025-07-16 14:44:14.018589
6a9ff9b0-0a3a-4218-af8c-a33a98d229ce	ifd_minsap_csb_district_level_3_district.gpkg	gpkg		2		active	{"datastore_active": false}	ifd_minsap_csb_district_level_3_district.gpkg	\N	\N	\N	110592	2025-07-16 14:44:13.937116	\N	\N	2025-07-16 14:44:14.037985	upload	de231e52-b888-4552-8688-68dc0eecd48c	2025-07-16 14:44:40.916361
2ec758c3-0dd9-45e4-9cf6-464800419cd6	ifd_minsap_csb_district_level_3_district.geojson	GeoJSON		3		active	{"datastore_active": false}	ifd_minsap_csb_district_level_3_district.geojson	\N	\N	\N	5082	2025-07-16 14:44:40.8423	\N	\N	2025-07-16 14:44:40.921687	upload	de231e52-b888-4552-8688-68dc0eecd48c	2025-07-16 14:44:42.156917
91968753-c8e3-4627-816c-f7492fb789be	ifd_community_site_locations_level_3_district.zip	ZIP		0		active	{"datastore_active": false}	ifd_community_site_locations_level_3_district.zip	\N	application/zip	\N	13618	2025-07-16 14:48:31.728192	\N	\N	2025-07-16 14:48:31.767938	upload	9b57f710-78d4-47d7-8629-35346c1e5ee3	2025-07-16 14:48:54.9172
1ce56288-4d4b-4c3a-84dc-fcab75995528	ifd_community_site_locations_level_3_district.geojson	GeoJSON		1		active	{"datastore_active": false}	ifd_community_site_locations_level_3_district.geojson	\N	\N	\N	59169	2025-07-16 14:48:54.899186	\N	\N	2025-07-16 14:48:54.922636	upload	9b57f710-78d4-47d7-8629-35346c1e5ee3	2025-07-16 14:49:17.313606
e483394b-0bd2-4fba-b6a1-218fca3d41b0	ifd_elevation_level_3_district.tif	TIFF		0		active	{"datastore_active": false}	Ifd_elevation_level_3_district.tif	\N	image/tiff	\N	16902041	2025-07-16 15:07:55.668487	\N	\N	2025-07-16 15:07:55.690852	upload	5780b1c9-d5dc-4773-96db-9dff544f8cc2	2025-07-16 15:07:56.508755
8915609f-36fb-4c7e-b558-b15e56444647	ifd_community_site_locations_level_3_district.kml	KML		3		active	{"datastore_active": false}	ifd_community_site_locations_level_3_district.kml	\N	\N	\N	113466	2025-07-16 14:49:45.204952	\N	\N	2025-07-16 14:49:45.267249	upload	9b57f710-78d4-47d7-8629-35346c1e5ee3	2025-07-16 14:49:46.205577
3fb73684-5001-41d8-bef5-f12f643e5768	ifd_s2_land_cover_level_3_district.geojson	GeoJSON		0		active	{"datastore_active": false}	Ifd_s2_land_cover_level_3_district.geojson	\N	\N	\N	57981206	2025-07-16 14:59:28.607951	\N	\N	2025-07-16 14:59:28.651206	upload	2f9f7af8-2a32-4f78-80a7-0883532c1340	2025-07-16 15:00:06.868286
9c731522-2c67-4da8-a44b-58b2804fc39b	ifd_s2_land_cover_level_3_district.gpkg	gpkg		1		active	{"datastore_active": false}	Ifd_s2_land_cover_level_3_district.gpkg	\N	\N	\N	28086272	2025-07-16 15:00:06.827855	\N	\N	2025-07-16 15:00:06.875852	upload	2f9f7af8-2a32-4f78-80a7-0883532c1340	2025-07-16 15:00:55.656484
9022e85e-cecd-44b9-bc05-449ff74da23a	ifd_s2_land_cover_level_3_district.kml	KML		2		active	{"datastore_active": false}	Ifd_s2_land_cover_level_3_district.kml	\N	\N	\N	45839572	2025-07-16 15:00:55.606421	\N	\N	2025-07-16 15:00:55.668935	upload	2f9f7af8-2a32-4f78-80a7-0883532c1340	2025-07-16 15:02:06.577148
ba135cef-9361-4c1d-8b85-d1888993bb54	ifd_s2_land_cover_level_3_district.tif	TIFF		3		active	{"datastore_active": false}	Ifd_s2_land_cover_level_3_district.tif	\N	image/tiff	\N	78866744	2025-07-16 15:02:06.546149	\N	\N	2025-07-16 15:02:06.582092	upload	2f9f7af8-2a32-4f78-80a7-0883532c1340	2025-07-16 15:02:43.957612
51204e73-b8fe-4a5b-8b46-65ed59743c52	ifd_s2_land_cover_level_3_district.zip	ZIP		4		active	{"datastore_active": false}	Ifd_s2_land_cover_level_3_district.zip	\N	application/zip	\N	19948551	2025-07-16 15:02:43.93027	\N	\N	2025-07-16 15:02:43.961675	upload	2f9f7af8-2a32-4f78-80a7-0883532c1340	2025-07-16 15:02:44.877458
93cda875-8743-4548-b50e-3d77203fbfe1	ifd_modis_evi_level_5_fokontany.csv	CSV		0		active	{"datastore_active": false}	ifd_modis_evi_level_5_fokontany.csv	\N	text/csv	\N	9374286	2025-07-16 15:12:43.11738	\N	\N	2025-07-16 15:12:43.162368	upload	21ec7fdc-131a-4a3d-96ac-59530857a08d	2025-07-16 15:12:44.662479
3f2033fd-32c7-474a-8cf1-c768ac4558db	ifd_sentinel2_evi_village.csv	CSV		0		active	{"datastore_active": false}	Ifd_sentinel2_evi_village.csv	\N	text/csv	\N	1313138	2025-07-16 15:17:52.969686	\N	\N	2025-07-16 15:17:53.001097	upload	754acaf5-cb06-4b80-8c10-0224add58cc8	2025-07-16 15:17:54.529497
94615c8b-5ad1-4d5f-9c25-15334e9c871c	ifd_modis_ndvi_level_5_fokontany.csv	CSV		0		active	{"datastore_active": false}	ifd_modis_ndvi_level_5_fokontany.csv	\N	text/csv	\N	9359786	2025-07-16 15:21:51.952459	\N	\N	2025-07-16 15:21:52.006315	upload	30677483-6527-4c20-a7b5-5682643ed35c	2025-07-16 15:21:52.982438
e8d197cc-5eaa-41e1-947b-f1eed19a00ac	ifd_sentinel2_ndvi_village.csv	CSV		0		active	{"datastore_active": false}	Ifd_sentinel2_ndvi_village.csv	\N	text/csv	\N	1313255	2025-07-16 15:27:01.963345	\N	\N	2025-07-16 15:27:02.012394	upload	dd628090-9e2b-48c9-894c-19a8d4512639	2025-07-16 15:27:03.60203
8cdd88b9-8af1-494a-a3dc-cdd17dd13b6c	ifd_-sentinel2_ndwigao_village.csv	CSV		0		active	{"datastore_active": false}	Ifd_ sentinel2_ndwigao_village.csv	\N	text/csv	\N	1316584	2025-07-16 15:31:39.707009	\N	\N	2025-07-16 15:31:39.788146	upload	49b5b713-0773-4d7c-b03c-ef5ded601661	2025-07-16 15:31:40.844595
85a7b5d4-0d6d-4a78-b773-c3cb82fceea8	ifd_sentinel2_mndwi_village.csv	CSV		0		active	{"datastore_active": false}	Ifd_sentinel2_mndwi_village.csv	\N	text/csv	\N	1336121	2025-07-16 15:35:33.916664	\N	\N	2025-07-16 15:35:34.100186	upload	b7865633-8ff9-4523-9848-15b91aa64dd6	2025-07-16 15:35:35.660304
fbb85f83-36da-4193-a47e-af1f55e3e15e	ifd_sentinel2_mndwi_village.csv	CSV		0		deleted	{"datastore_active": false}	Ifd_sentinel2_mndwi_village.csv	\N	text/csv	\N	1336121	2025-07-16 15:41:59.652423	\N	\N	2025-07-16 15:41:59.764889	upload	571138dc-e441-4ab6-b5c0-c73cbdd6baa9	2025-07-16 15:42:01.32815
1e3015b0-0998-4b51-996f-ac5844e5d16a	ifd_modis_aod_level_5_fokontany.csv	CSV		0		active	{"datastore_active": false}	Ifd_modis_aod_level_5_fokontany.csv	\N	text/csv	\N	4175806	2025-07-16 15:45:47.709026	\N	\N	2025-07-16 15:45:47.792291	upload	c8577170-42b1-417f-ac25-85550abad242	2025-07-16 15:46:13.489258
96e6e967-92cc-43cf-b444-74f81658fce7	ifd_modis_aod_level_4_commune.csv	CSV		1		active	{"datastore_active": true}	Ifd_modis_aod_level_4_commune.csv	\N	text/csv	\N	188835	2025-07-16 15:46:13.446446	\N	\N	2025-07-16 15:46:13.514042	upload	c8577170-42b1-417f-ac25-85550abad242	2025-07-16 15:46:14.953941
e04c2079-ac42-4ae2-a4bd-bba1c37178c8	ifd_all_settlements_level_3_district.csv	CSV		0		active	{"datastore_active": false}	Ifd_all_settlements_level_3_district.csv	\N	text/csv	\N	3383441	2025-07-16 15:50:06.625677	\N	\N	2025-07-16 15:50:06.662383	upload	2e8e66da-47d9-421f-b4fd-b8474a55a0b6	2025-07-16 15:50:07.784151
6873d696-868d-42f5-9716-d8916da3c03b	ifd_major_villages_level_3_district.csv	CSV		0		active	{"datastore_active": true}	Ifd_major_villages_level_3_district.csv	\N	text/csv	\N	65303	2025-07-16 15:53:11.101097	\N	\N	2025-07-16 15:53:11.172484	upload	3a60beaa-f53d-4928-b1e9-5c3359a8b647	2025-07-16 15:53:12.401138
0133dd77-82ea-48be-a09e-98510c014b9d	ifd_modis_ndvi_level_4_commune.csv	CSV		1		active	{"datastore_active": true}	ifd_modis_ndvi_level_4_commune.csv	\N	text/csv	\N	483938	2025-07-16 16:22:48.177916	\N	\N	2025-07-16 16:22:48.364458	upload	30677483-6527-4c20-a7b5-5682643ed35c	2025-07-16 16:22:48.310259
8b7d4aae-1984-438e-add1-6d720baef6ca	ifd_modis_evi_level_4_commune.csv	CSV		1		active	{"datastore_active": true}	ifd_modis_evi_level_4_commune.csv	\N	text/csv	\N	485124	2025-07-16 16:25:09.408705	\N	\N	2025-07-16 16:25:09.447683	upload	21ec7fdc-131a-4a3d-96ac-59530857a08d	2025-07-16 16:25:09.439009
8b74e247-442d-4017-91db-d5f06edf3ab9	ifd_twi_level_5_fokontany.csv	CSV		0		active	{"datastore_active": true}	Ifd_twi_level_5_fokontany.csv	\N	text/csv	\N	9364	2025-07-16 16:28:22.502775	\N	\N	2025-07-16 16:28:22.572326	upload	571138dc-e441-4ab6-b5c0-c73cbdd6baa9	2025-07-16 16:28:22.564552
0716086a-f11f-4e7b-9d14-516752a65952	ifd_era_subsurface_runoff_level_5_fokontany.csv	CSV		0		active	{"datastore_active": false}	ifd_era_subsurface_runoff_level_5_fokontany.csv	\N	text/csv	\N	4866619	2025-07-16 16:35:07.425255	\N	\N	2025-07-16 16:35:07.48042	upload	08f20c0b-4627-4ec4-9d0c-39802aa21443	2025-07-16 16:35:31.428562
3b1bdf83-0fa8-4c3f-a751-3f02883ddb78	ifd_era_subsurface_runoff_level_4_commune.csv	CSV		1		active	{"datastore_active": true}	ifd_era_subsurface_runoff_level_4_commune.csv	\N	text/csv	\N	250715	2025-07-16 16:35:31.384747	\N	\N	2025-07-16 16:35:31.441642	upload	08f20c0b-4627-4ec4-9d0c-39802aa21443	2025-07-16 16:35:32.702779
d759919c-069d-4abc-9fa3-6b4995285860	ifd_instat_population_level_5_fokontany.csv	CSV		0		active	{"datastore_active": true}	Ifd_instat_population_level_5_fokontany.csv	\N	text/csv	\N	6569	2025-07-17 06:37:00.109812	\N	\N	2025-07-17 06:37:00.344482	upload	1f91eac6-9746-4af1-bee0-84c9288b3661	2025-07-17 06:37:02.865589
5cff35af-def9-4e9c-bd1a-17d9a9eb224a	ifd_pivot_census_level_5_fokontany.csv	CSV		0		active	{"datastore_active": true}	Ifd_pivot_census_level_5_fokontany.csv	\N	text/csv	\N	4344	2025-07-17 06:40:58.053168	\N	\N	2025-07-17 06:40:58.106169	upload	f90ce444-bfce-4f95-b445-d967b3eeeff6	2025-07-17 06:40:59.350448
\.


--
-- Data for Name: resource_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.resource_revision (id, url, format, description, "position", revision_id, hash, state, continuity_id, extras, expired_id, revision_timestamp, expired_timestamp, current, name, resource_type, mimetype, mimetype_inner, size, last_modified, cache_url, cache_last_updated, webstore_url, webstore_last_updated, created, url_type, package_id) FROM stdin;
\.


--
-- Data for Name: resource_view; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.resource_view (id, resource_id, title, description, view_type, "order", config) FROM stdin;
36fd1c74-6e0e-4967-be98-068da7ca862d	2706882a-b637-4170-997d-cd8e95a5543b	Image		image_view	0	\N
d2d75688-955b-4e8a-8250-0ef528c35bbf	2706882a-b637-4170-997d-cd8e95a5543b	Table		datatables_view	1	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
0b0622a7-5fd0-4969-aca4-64c61258558c	ce22d8fe-e684-4b4c-96af-d839d73ecaea	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
010b5e9a-be16-4611-a7f8-218933b652bc	d3cf4757-9609-48d7-aa06-9cb783730364	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
66f403f0-2518-4871-91cd-3d8146afd5d4	51299dd4-ce62-4ac3-b090-ee4e4b5d2b2d	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
d2b2b6bf-3120-4f4b-bd5e-c13c273ba94c	eeb335fd-2b14-453e-ad1f-9b710aab6c38	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
bd7dc7b7-78ac-4aba-a93e-ea1822eca7d5	e125a58b-eb5a-4f74-a9ca-b5464e25b2e8	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
c174e882-6b6a-440b-9513-1c97b8aebaf0	1dfc7925-e822-4ed6-8bed-7916513328ab	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
e86d4c4d-72cf-47b4-b275-cf20630869c2	4c94580e-c2c5-413b-8199-9c96db81efab	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
afce3a20-fac5-47fc-affe-ef189d28e4da	e7af45d2-83d1-4fa9-bbf0-b0d479d83057	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
04b71c31-aa6c-4cc5-b1f4-0bce29594fdd	96e6e967-92cc-43cf-b444-74f81658fce7	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
3b742a7d-cf45-499d-9230-0ad4bcdf645a	6873d696-868d-42f5-9716-d8916da3c03b	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
96512a29-b024-4072-aefb-5bdda44208b0	0133dd77-82ea-48be-a09e-98510c014b9d	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
2b2f361f-7b2a-43a8-9693-9c89978f901a	8b7d4aae-1984-438e-add1-6d720baef6ca	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
53505f95-44b2-4fff-b7ed-887509dcf7ba	8b74e247-442d-4017-91db-d5f06edf3ab9	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
7297fbd2-a36d-4bc0-9d2a-c1c037ee8ec4	3b1bdf83-0fa8-4c3f-a751-3f02883ddb78	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
29fac7af-736f-4776-aadc-8bbc60107952	d759919c-069d-4abc-9fa3-6b4995285860	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
b5183f70-019f-4819-a511-ddaf79160fb1	5cff35af-def9-4e9c-bd1a-17d9a9eb224a	Table		datatables_view	0	{"date_format": "llll", "ellipsis_length": 100, "filterable": true, "responsive": false}
\.


--
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.revision (id, "timestamp", author, message, state, approved_timestamp) FROM stdin;
\.


--
-- Data for Name: system_info; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.system_info (id, key, value, state) FROM stdin;
1	ckan.site_about		active
2	ckan.site_custom_css		active
3	ckan.site_description		active
5	ckan.site_logo	/base/images/ckan-logo.png	active
6	ckan.site_title	CKAN	active
7	ckan.theme	css/main	active
4	ckan.site_intro_text	Welcome to the **AFRICAM Geospatial Data Hub**, a repository for data related to the AFRICAM project in Madagascar [https://www.preacts.org/africam](https://www.preacts.org/africam).  \r\nThis data hub contains geospatial and tabular data collected by the AFRICAM research teams. It includes **climate and environmental, socio-demographic, and health system data**.\r\n\r\nA **free user account** is required to access the data platform. You can create a new account by clicking on the **‘Register’** button above.  \r\nFor any questions, please contact the data administrator: **RANDRIANJATOVO Tokiniaina** (twoockyis@gmail.com).	active
8	ckan.config_update	1752135988.4244006	active
\.


--
-- Data for Name: system_info_revision; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.system_info_revision (id, key, value, revision_id, continuity_id, state, expired_id, revision_timestamp, expired_timestamp, current) FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.tag (id, name, vocabulary_id) FROM stdin;
\.


--
-- Data for Name: task_status; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.task_status (id, entity_id, entity_type, task_type, key, value, state, error, last_updated) FROM stdin;
c90c475a-4f45-4d26-885c-196963a03342	94615c8b-5ad1-4d5f-9c25-15334e9c871c	resource	datapusher	datapusher	{"job_id": "d782c0a7-2970-4dfb-9742-5e06eb8cddd9", "job_key": "3e2afa8b-e038-4d00-af86-578804f627ed"}	error	{}	2025-07-16 15:21:53.527325
0fcc54a0-8d67-4517-9640-1876443b3580	c04796a4-791c-45df-9c55-f4af04ebb13a	resource	datapusher	datapusher	{"job_id": "fa6910e3-3915-416f-91d3-aba61f132976", "job_key": "4c64e5fc-e2d3-45d3-87e0-7f6eb470d8cb"}	error	{}	2025-05-21 08:11:25.972479
8651f4c9-dfce-4b87-bad9-c0699a5329c0	ed457e27-6cbf-42d6-a0e3-93455849903b	resource	datapusher	datapusher	{"job_id": "a72ffabd-5bb5-4c47-8ea0-f130bf886d37", "job_key": "86a6708b-08e4-48fb-a3e6-8371f191b5dc"}	error	{}	2025-07-16 13:34:49.983076
0f133796-e684-492f-a7f1-55d48ad0b616	e9c9171d-b2b0-4d17-9f95-3007c7ff049b	resource	datapusher	datapusher	{"job_id": "78ee90f1-4543-40a3-b8a3-3bc327c019f2", "job_key": "19f16d0e-3732-4e68-88b8-f4e0fc9ca21b"}	error	{}	2025-05-21 18:19:26.378959
c81061ad-1f83-4378-bf65-8666f8d0f288	2706882a-b637-4170-997d-cd8e95a5543b	resource	datapusher	datapusher	{"job_id": "7f347207-697d-4e05-a47b-d1907dee141f", "job_key": "6b6ba4c4-884b-4029-be77-4d1ed1b7e478"}	complete	{}	2025-07-16 13:14:04.787037
d95ddf9f-0e50-41e2-87de-e6a8b9ddc3ef	ce22d8fe-e684-4b4c-96af-d839d73ecaea	resource	datapusher	datapusher	{"job_id": "36e07e42-1521-46b3-8b65-cd552c158865", "job_key": "580d56f2-8ffa-48a3-bb9e-43367f338759"}	complete	{}	2025-07-16 13:15:35.909789
c44b768f-bd63-4129-b95e-f49f1d8d31c7	1dfc7925-e822-4ed6-8bed-7916513328ab	resource	datapusher	datapusher	{"job_id": "ff1c996e-4798-4a2d-9582-f969dcb806b5", "job_key": "baa45533-f83b-4797-a4a7-0663fdaf385f"}	complete	{}	2025-07-16 13:38:45.038472
e9ed1aa9-766b-4912-a08e-853a86387312	d3cf4757-9609-48d7-aa06-9cb783730364	resource	datapusher	datapusher	{"job_id": "6b5f1908-24cc-4554-bc91-7ee3c16a1768", "job_key": "512680ef-8b2e-4504-96f6-36d968c70e0c"}	complete	{}	2025-07-16 13:22:09.446971
a15472dd-b6d9-433e-b3a4-85bd40c49492	73e1ef15-868c-48bf-b511-fbc2a2922fc8	resource	datapusher	datapusher	{"job_id": "33d7a0c5-ac84-406b-809f-b9d27a64a37b", "job_key": "9007245a-db25-45d8-bc25-7f766be2afe4"}	error	{}	2025-07-16 13:22:20.549941
b1936a5c-b7ad-4243-b7df-f3da94f1f00c	fbb85f83-36da-4193-a47e-af1f55e3e15e	resource	datapusher	datapusher	{"job_id": "c3e80e89-eeb6-4648-bc7f-87c74d786922", "job_key": "8b2d7bbb-abd0-47dd-b16a-9a0b10094e82"}	error	{}	2025-07-16 15:42:01.710686
849bf671-69c5-417f-aa82-673b88934903	51299dd4-ce62-4ac3-b090-ee4e4b5d2b2d	resource	datapusher	datapusher	{"job_id": "a2402984-88c1-4bef-9477-4885b9def62f", "job_key": "8c2bc54e-3dcb-43c7-b419-e1466fc75c2c"}	complete	{}	2025-07-16 13:26:01.49079
ca35b2ff-9d0d-41df-9f0d-0e178bc91df2	4c94580e-c2c5-413b-8199-9c96db81efab	resource	datapusher	datapusher	{"job_id": "7f00f446-e140-48f3-b140-c3c794402444", "job_key": "733fe38e-af1e-4504-a060-2b715e093c9e"}	complete	{}	2025-07-16 13:39:06.995918
c21d608a-06f8-4012-9eb9-e877433a7831	df4e10bb-1b3f-461b-a1f2-c902efbce76a	resource	datapusher	datapusher	{"job_id": "d5852df3-7cd3-4f7b-9c8a-e3fd9861650f", "job_key": "70cda642-fdec-4d32-934a-b8b9c79b564e"}	error	{}	2025-07-16 13:26:18.986989
1d8a7d0c-ecfb-476a-a2dc-37aafebed7f5	eeb335fd-2b14-453e-ad1f-9b710aab6c38	resource	datapusher	datapusher	{"job_id": "b651f97c-9149-4265-8acc-8a16072c3fda", "job_key": "3be2733c-6bfd-4e08-a8d2-ce6251272516"}	complete	{}	2025-07-16 13:30:46.079807
b292140f-077e-47c3-a052-f455319d3f30	e8d197cc-5eaa-41e1-947b-f1eed19a00ac	resource	datapusher	datapusher	{"job_id": "4c36c6ee-9709-49a5-beb5-e6a8e61d0214", "job_key": "b00a2607-df1e-48b0-b6ae-cafb2b2de560"}	error	{}	2025-07-16 15:27:03.895003
d05e4206-c1b7-4b84-a24e-b2a4e6f975cc	445c199c-b9ce-4309-a1c6-126af238cec1	resource	datapusher	datapusher	{"job_id": "70bce26d-008f-4c7a-be2a-4a6f8f422cc0", "job_key": "6a75cf34-b587-47da-9de0-8b759f145322"}	error	{}	2025-07-16 13:31:03.24674
a95057d8-ed37-4b19-a147-c34bf7a4fdfd	e7af45d2-83d1-4fa9-bbf0-b0d479d83057	resource	datapusher	datapusher	{"job_id": "553b0dbb-1a42-46f2-96e1-e3aafe14cd59", "job_key": "24b52aea-2455-4ae1-95b3-467b61a80fae"}	complete	{}	2025-07-16 14:06:31.719831
71a56426-3ab7-4dfb-ab9b-d2d00a096438	e125a58b-eb5a-4f74-a9ca-b5464e25b2e8	resource	datapusher	datapusher	{"job_id": "05ed6b77-9450-48d6-a71d-5b74849cace0", "job_key": "faf57c00-7c41-4bef-9297-d3c0bb8797da"}	complete	{}	2025-07-16 13:34:36.139954
2485f1f1-2575-4cb0-b0e2-49c2ceced215	93cda875-8743-4548-b50e-3d77203fbfe1	resource	datapusher	datapusher	{"job_id": "b38ea5d7-4a6f-4a2e-af97-2357b1640643", "job_key": "ff91f20b-bfaf-4392-b639-0a3c1ee08cc5"}	error	{}	2025-07-16 15:12:45.073971
d91ac0a4-2922-4123-bca6-6d5199e5f6c1	3f2033fd-32c7-474a-8cf1-c768ac4558db	resource	datapusher	datapusher	{"job_id": "65d2bbc2-5a44-4d2f-abf5-b68f80bdd28f", "job_key": "f075dbb1-535a-4ab9-8eef-c14f44551187"}	error	{}	2025-07-16 15:17:55.084305
b68e2a05-76b4-485c-9b70-5b099c45ea4b	8cdd88b9-8af1-494a-a3dc-cdd17dd13b6c	resource	datapusher	datapusher	{"job_id": "bc364e8e-713e-4212-80ec-ddf086da1898", "job_key": "e8abc5e6-9d20-4e41-87cf-402dc1f75213"}	error	{}	2025-07-16 15:31:41.181482
d42f629f-d67c-490d-9f75-f5a4f332c60c	1e3015b0-0998-4b51-996f-ac5844e5d16a	resource	datapusher	datapusher	{"job_id": "1a2a3722-1c74-404c-b041-edfe044e1a27", "job_key": "ef855245-20be-44cb-9a62-5b03526041f3"}	error	{}	2025-07-16 15:45:49.886999
d02853d1-a05a-48f0-8b15-6c0f8e41785f	85a7b5d4-0d6d-4a78-b773-c3cb82fceea8	resource	datapusher	datapusher	{"job_id": "7f01b5ad-a5a9-414e-a266-9ea0c2e946bb", "job_key": "7b0dd0ed-9b04-4372-9c08-f3d4fffce94d"}	error	{}	2025-07-16 15:35:36.036153
cb8be7c8-7389-41d9-80c0-fdc167117087	e04c2079-ac42-4ae2-a4bd-bba1c37178c8	resource	datapusher	datapusher	{"job_id": "70719754-bfd0-4f7d-8d9a-dc28f66fb1b2", "job_key": "0d7f70b2-ae29-4c94-a443-18bf740da37b"}	error	{}	2025-07-16 15:50:08.299854
e1e6eb82-bf15-494f-ad39-0005cb63e2c1	96e6e967-92cc-43cf-b444-74f81658fce7	resource	datapusher	datapusher	{"job_id": "7de072c5-60e0-4456-9f53-4e596de542c4", "job_key": "7f159ecb-425e-4ef4-95b3-b8c9df1df0e2"}	complete	{}	2025-07-16 15:46:25.658747
29bc60a8-af57-49ae-a5a9-eb6ae6fae93f	0133dd77-82ea-48be-a09e-98510c014b9d	resource	datapusher	datapusher	{"job_id": "d0e14bf6-7b97-4c4f-9cc6-648bf0b773bb", "job_key": "34c03f66-feda-469d-b338-b2c0f3270277"}	complete	{}	2025-07-16 16:23:10.461347
9a100f13-9454-4c43-9fd8-c95454a1926e	6873d696-868d-42f5-9716-d8916da3c03b	resource	datapusher	datapusher	{"job_id": "0a1c708b-bfea-4c55-b464-c6465074f135", "job_key": "a43670dd-ca76-415d-9a26-4e3b28e3e058"}	complete	{}	2025-07-16 15:53:16.161696
8ec75091-bba5-417c-a3f7-f638ccf731eb	8b7d4aae-1984-438e-add1-6d720baef6ca	resource	datapusher	datapusher	{"job_id": "0f745c4c-2750-4df4-abcf-1c92d96ee123", "job_key": "24afd909-23d5-4730-ab32-ea901083d37c"}	complete	{}	2025-07-16 16:25:24.97735
dcd765ce-d6c6-4716-ad0d-6a287a961e1e	8b74e247-442d-4017-91db-d5f06edf3ab9	resource	datapusher	datapusher	{"job_id": "930c38ce-cad8-4e9b-8d7e-ee55359111d4", "job_key": "cac1906e-c9a6-4f26-8988-6794120c1717"}	complete	{}	2025-07-16 16:28:26.577894
27dd2338-6af3-4e94-8363-b29b8aab378f	0716086a-f11f-4e7b-9d14-516752a65952	resource	datapusher	datapusher	{"job_id": "af7cbbe2-526d-4885-95e9-eb9d5b2f7d66", "job_key": "d8674aa8-6565-437d-a778-9a48df108e54"}	error	{}	2025-07-16 16:35:09.252229
b64c2569-50e0-4737-a0dc-f5fd3a7e9532	3b1bdf83-0fa8-4c3f-a751-3f02883ddb78	resource	datapusher	datapusher	{"job_id": "dcb70241-11d2-466c-9359-5aa1eb30da03", "job_key": "a9b9f4eb-d0ce-461e-9e63-e4757a840d30"}	complete	{}	2025-07-16 16:35:41.760055
dc3f7fec-9163-4bfa-bdfc-5d44bed52cb2	d759919c-069d-4abc-9fa3-6b4995285860	resource	datapusher	datapusher	{"job_id": "ba188d9e-fe24-4878-93a3-5c6bca6cc604", "job_key": "9b3cf5fe-d9d7-4281-84ec-b8e61e971c0d"}	complete	{}	2025-07-17 06:37:06.015837
a7bac7ae-6501-44f9-8edb-a441a10bf48d	5cff35af-def9-4e9c-bd1a-17d9a9eb224a	resource	datapusher	datapusher	{"job_id": "909df655-d4ac-4240-b2ac-26070010876b", "job_key": "adb67eba-2a59-4d7d-ab34-6f45fde30341"}	complete	{}	2025-07-17 06:41:01.355847
\.


--
-- Data for Name: term_translation; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.term_translation (term, term_translation, lang_code) FROM stdin;
\.


--
-- Data for Name: tracking_raw; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.tracking_raw (user_key, url, tracking_type, access_timestamp) FROM stdin;
\.


--
-- Data for Name: tracking_summary; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.tracking_summary (url, package_id, tracking_type, count, running_total, recent_views, tracking_date) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public."user" (id, name, apikey, created, about, password, fullname, email, reset_key, sysadmin, activity_streams_email_notifications, state, plugin_extras, image_url, last_active) FROM stdin;
491f4d92-ecf1-49c5-861b-125af8651fce	default	035cfab0-84ad-4737-a9de-2f6a6e4d979a	2025-05-08 13:35:24.364673	\N	$pbkdf2-sha512$25000$ipESopSSshYCQAjhnBMihA$81wrJz1EgKh3hFqrGipT/DSAiKVJvdDCsfOJqFKC1KdxxWeS1vCag6Fa6Uam/SRb9V12lhCcuK8QVxd6GhFVhg	\N	\N	\N	t	f	active	\N	\N	\N
7da14275-8ca1-42ad-8362-37ee54c25653	toky	\N	2025-07-17 10:40:39.119182	\N	$pbkdf2-sha512$25000$z/n/f6/1vhdiTImxVgrhXA$Xp6PDA4sHYNr0YhzNadFGRT5kvK2fUJJR1Z34IIpT51cmDTw8uN3MuvixwcUnWI8mli4fiPJj54QQz5YQ4Na1A	Tokiniaina Mahefanirina	toky.fianarana@gmail.com	\N	f	f	active	\N		2025-07-17 11:17:20.135611
caa0894d-2dfd-4921-9ccf-e4a8b86d1ef5	twoockyis	\N	2025-07-17 07:52:54.681433	\N	$pbkdf2-sha512$25000$PyfE2DsnJMTYe6.1tvbeGw$oa.G7FR8FePIz69lFKzBMtMROjNNW1XZkZ/U06S3QjGqFgbN2atgnp9oFtsid7e5PPGAnXVUIVRVve/6giRvgg	RANDRIANJATOVO Tokiniaina	r.tokiniaina.fianarana@gmail.com	\N	f	f	active	\N	2025-07-17-075216.037316pivotlogo01.png	2025-07-18 06:41:22.555037
88577cae-15ec-48b2-9f57-889b0d1a5c8d	josuee	\N	2025-07-18 06:45:12.16079	\N	$pbkdf2-sha512$25000$u3eOsXauNabUWovxHoNw7g$KO9SnpNxDLNHco9pUCUv/RN9yjPdViiCHwDbUwssb0Dts45ygY0AoY48pXfoxEm/ZBfkVLIX.Pp.449qnafZYg	Josuee RAZAFIMAHEFA	josueetahina@gmail.com	\N	f	f	active	\N		2025-07-18 06:45:12.312585
afaa4e59-3fd7-4c43-b40c-59accbb8799e	twoockyis_admin	\N	2025-07-17 09:08:20.956979	\N	$pbkdf2-sha512$25000$Y6wVwnhvjXGOMWZsrVWK8Q$f/afrvrAz/4v67jY2xt0hRzKldF7Nsuiu.S75F1.AG3MTvkRk/MhgLzQmwpaXNB1NL/9YcxkKPM0CQ17NMXMHQ	RANDRIANJATOVO Tokiniaina	twoockyis@gmail.com	\N	t	f	active	\N		2025-07-18 11:01:12.415741
0477425b-7190-4199-b54d-2f31d6d4cb5b	ckan_admin	\N	2025-05-08 13:35:30.296013	\N	$pbkdf2-sha512$25000$3lvLGYNQ6n3vnbP2PqcUog$sQbdSR4TvVNyg.PsD6V8z5ZtRhcBCdl/fF2qBDmz323jxKpKWrQ5JcJLgRoyPn38rPU2yUwYD3wZ.SCNmUKiFA	\N	your_email@example.com	\N	t	f	active	\N	\N	2025-08-18 11:40:31.590846
\.


--
-- Data for Name: user_following_dataset; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.user_following_dataset (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: user_following_group; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.user_following_group (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: user_following_user; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.user_following_user (follower_id, object_id, datetime) FROM stdin;
\.


--
-- Data for Name: vocabulary; Type: TABLE DATA; Schema: public; Owner: ckandbuser
--

COPY public.vocabulary (id, name) FROM stdin;
\.


--
-- Name: system_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ckandbuser
--

SELECT pg_catalog.setval('public.system_info_id_seq', 8, true);


--
-- Name: activity_detail activity_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.activity_detail
    ADD CONSTRAINT activity_detail_pkey PRIMARY KEY (id);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: api_token api_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.api_token
    ADD CONSTRAINT api_token_pkey PRIMARY KEY (id);


--
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (user_id);


--
-- Name: group_extra group_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra
    ADD CONSTRAINT group_extra_pkey PRIMARY KEY (id);


--
-- Name: group_extra_revision group_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra_revision
    ADD CONSTRAINT group_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: group group_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_name_key UNIQUE (name);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: group_revision group_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_revision
    ADD CONSTRAINT group_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);


--
-- Name: member_revision member_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member_revision
    ADD CONSTRAINT member_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_extra package_extra_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra
    ADD CONSTRAINT package_extra_pkey PRIMARY KEY (id);


--
-- Name: package_extra_revision package_extra_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra_revision
    ADD CONSTRAINT package_extra_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_member package_member_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_member
    ADD CONSTRAINT package_member_pkey PRIMARY KEY (package_id, user_id);


--
-- Name: package package_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_name_key UNIQUE (name);


--
-- Name: package package_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package
    ADD CONSTRAINT package_pkey PRIMARY KEY (id);


--
-- Name: package_relationship package_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship
    ADD CONSTRAINT package_relationship_pkey PRIMARY KEY (id);


--
-- Name: package_relationship_revision package_relationship_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_revision package_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_revision
    ADD CONSTRAINT package_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: package_tag package_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag
    ADD CONSTRAINT package_tag_pkey PRIMARY KEY (id);


--
-- Name: package_tag_revision package_tag_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag_revision
    ADD CONSTRAINT package_tag_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (id);


--
-- Name: resource_revision resource_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_revision
    ADD CONSTRAINT resource_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: resource_view resource_view_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_view
    ADD CONSTRAINT resource_view_pkey PRIMARY KEY (id);


--
-- Name: revision revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (id);


--
-- Name: system_info system_info_key_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info
    ADD CONSTRAINT system_info_key_key UNIQUE (key);


--
-- Name: system_info system_info_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info
    ADD CONSTRAINT system_info_pkey PRIMARY KEY (id);


--
-- Name: system_info_revision system_info_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info_revision
    ADD CONSTRAINT system_info_revision_pkey PRIMARY KEY (id, revision_id);


--
-- Name: tag tag_name_vocabulary_id_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_name_vocabulary_id_key UNIQUE (name, vocabulary_id);


--
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: task_status task_status_entity_id_task_type_key_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.task_status
    ADD CONSTRAINT task_status_entity_id_task_type_key_key UNIQUE (entity_id, task_type, key);


--
-- Name: task_status task_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.task_status
    ADD CONSTRAINT task_status_pkey PRIMARY KEY (id);


--
-- Name: user_following_dataset user_following_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_dataset
    ADD CONSTRAINT user_following_dataset_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_following_group user_following_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_group
    ADD CONSTRAINT user_following_group_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user_following_user user_following_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_user
    ADD CONSTRAINT user_following_user_pkey PRIMARY KEY (follower_id, object_id);


--
-- Name: user user_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_name_key UNIQUE (name);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: vocabulary vocabulary_name_key; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.vocabulary
    ADD CONSTRAINT vocabulary_name_key UNIQUE (name);


--
-- Name: vocabulary vocabulary_pkey; Type: CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.vocabulary
    ADD CONSTRAINT vocabulary_pkey PRIMARY KEY (id);


--
-- Name: idx_activity_detail_activity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_activity_detail_activity_id ON public.activity_detail USING btree (activity_id);


--
-- Name: idx_activity_object_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_activity_object_id ON public.activity USING btree (object_id, "timestamp");


--
-- Name: idx_activity_user_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_activity_user_id ON public.activity USING btree (user_id, "timestamp");


--
-- Name: idx_extra_grp_id_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_extra_grp_id_pkg_id ON public.member USING btree (group_id, table_id);


--
-- Name: idx_extra_id_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_extra_id_pkg_id ON public.package_extra USING btree (id, package_id);


--
-- Name: idx_extra_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_extra_pkg_id ON public.package_extra USING btree (package_id);


--
-- Name: idx_group_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_current ON public.group_revision USING btree (current);


--
-- Name: idx_group_extra_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_current ON public.group_extra_revision USING btree (current);


--
-- Name: idx_group_extra_group_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_group_id ON public.group_extra USING btree (group_id);


--
-- Name: idx_group_extra_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_period ON public.group_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_group_extra_period_group; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_extra_period_group ON public.group_extra_revision USING btree (revision_timestamp, expired_timestamp, group_id);


--
-- Name: idx_group_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_id ON public."group" USING btree (id);


--
-- Name: idx_group_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_name ON public."group" USING btree (name);


--
-- Name: idx_group_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_period ON public.group_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_group_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_group_pkg_id ON public.member USING btree (table_id);


--
-- Name: idx_member_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_member_continuity_id ON public.member_revision USING btree (continuity_id);


--
-- Name: idx_only_one_active_email; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE UNIQUE INDEX idx_only_one_active_email ON public."user" USING btree (email, state) WHERE (state = 'active'::text);


--
-- Name: idx_package_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_continuity_id ON public.package_revision USING btree (continuity_id);


--
-- Name: idx_package_creator_user_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_creator_user_id ON public.package USING btree (creator_user_id);


--
-- Name: idx_package_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_current ON public.package_revision USING btree (current);


--
-- Name: idx_package_extra_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_continuity_id ON public.package_extra_revision USING btree (continuity_id);


--
-- Name: idx_package_extra_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_current ON public.package_extra_revision USING btree (current);


--
-- Name: idx_package_extra_package_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_package_id ON public.package_extra_revision USING btree (package_id, current);


--
-- Name: idx_package_extra_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_period ON public.package_extra_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_extra_period_package; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_period_package ON public.package_extra_revision USING btree (revision_timestamp, expired_timestamp, package_id);


--
-- Name: idx_package_extra_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_extra_rev_id ON public.package_extra_revision USING btree (revision_id);


--
-- Name: idx_package_group_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_group_current ON public.member_revision USING btree (current);


--
-- Name: idx_package_group_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_group_id ON public.member USING btree (id);


--
-- Name: idx_package_group_period_package_group; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_group_period_package_group ON public.member_revision USING btree (revision_timestamp, expired_timestamp, table_id, group_id);


--
-- Name: idx_package_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_period ON public.package_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_package_relationship_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_relationship_current ON public.package_relationship_revision USING btree (current);


--
-- Name: idx_package_resource_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_id ON public.resource USING btree (id);


--
-- Name: idx_package_resource_package_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_package_id ON public.resource USING btree (package_id);


--
-- Name: idx_package_resource_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_rev_id ON public.resource_revision USING btree (revision_id);


--
-- Name: idx_package_resource_url; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_resource_url ON public.resource USING btree (url);


--
-- Name: idx_package_tag_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_continuity_id ON public.package_tag_revision USING btree (continuity_id);


--
-- Name: idx_package_tag_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_current ON public.package_tag_revision USING btree (current);


--
-- Name: idx_package_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_id ON public.package_tag USING btree (id);


--
-- Name: idx_package_tag_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_pkg_id ON public.package_tag USING btree (package_id);


--
-- Name: idx_package_tag_pkg_id_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_pkg_id_tag_id ON public.package_tag USING btree (tag_id, package_id);


--
-- Name: idx_package_tag_revision_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_id ON public.package_tag_revision USING btree (id);


--
-- Name: idx_package_tag_revision_pkg_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_pkg_id ON public.package_tag_revision USING btree (package_id);


--
-- Name: idx_package_tag_revision_pkg_id_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_pkg_id_tag_id ON public.package_tag_revision USING btree (tag_id, package_id);


--
-- Name: idx_package_tag_revision_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_rev_id ON public.package_tag_revision USING btree (revision_id);


--
-- Name: idx_package_tag_revision_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_package_tag_revision_tag_id ON public.package_tag_revision USING btree (tag_id);


--
-- Name: idx_period_package_relationship; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_period_package_relationship ON public.package_relationship_revision USING btree (revision_timestamp, expired_timestamp, object_package_id, subject_package_id);


--
-- Name: idx_period_package_tag; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_period_package_tag ON public.package_tag_revision USING btree (revision_timestamp, expired_timestamp, package_id, tag_id);


--
-- Name: idx_pkg_lname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_lname ON public.package USING btree (lower((name)::text));


--
-- Name: idx_pkg_revision_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_revision_id ON public.package_revision USING btree (id);


--
-- Name: idx_pkg_revision_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_revision_name ON public.package_revision USING btree (name);


--
-- Name: idx_pkg_revision_rev_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_revision_rev_id ON public.package_revision USING btree (revision_id);


--
-- Name: idx_pkg_sid; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_sid ON public.package USING btree (id, state);


--
-- Name: idx_pkg_slname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_slname ON public.package USING btree (lower((name)::text), state);


--
-- Name: idx_pkg_sname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_sname ON public.package USING btree (name, state);


--
-- Name: idx_pkg_stitle; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_stitle ON public.package USING btree (title, state);


--
-- Name: idx_pkg_suname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_suname ON public.package USING btree (upper((name)::text), state);


--
-- Name: idx_pkg_uname; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_pkg_uname ON public.package USING btree (upper((name)::text));


--
-- Name: idx_resource_continuity_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_resource_continuity_id ON public.resource_revision USING btree (continuity_id);


--
-- Name: idx_resource_current; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_resource_current ON public.resource_revision USING btree (current);


--
-- Name: idx_resource_period; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_resource_period ON public.resource_revision USING btree (revision_timestamp, expired_timestamp, id);


--
-- Name: idx_rev_state; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_rev_state ON public.revision USING btree (state);


--
-- Name: idx_revision_author; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_revision_author ON public.revision USING btree (author);


--
-- Name: idx_tag_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_tag_id ON public.tag USING btree (id);


--
-- Name: idx_tag_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_tag_name ON public.tag USING btree (name);


--
-- Name: idx_user_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_user_id ON public."user" USING btree (id);


--
-- Name: idx_user_name; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_user_name ON public."user" USING btree (name);


--
-- Name: idx_user_name_index; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_user_name_index ON public."user" USING btree ((
CASE
    WHEN ((fullname IS NULL) OR (fullname = ''::text)) THEN name
    ELSE fullname
END));


--
-- Name: idx_view_resource_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX idx_view_resource_id ON public.resource_view USING btree (resource_id);


--
-- Name: term_lang; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX term_lang ON public.term_translation USING btree (term, lang_code);


--
-- Name: tracking_raw_access_timestamp; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_raw_access_timestamp ON public.tracking_raw USING btree (access_timestamp);


--
-- Name: tracking_raw_url; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_raw_url ON public.tracking_raw USING btree (url);


--
-- Name: tracking_raw_user_key; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_raw_user_key ON public.tracking_raw USING btree (user_key);


--
-- Name: tracking_summary_date; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_summary_date ON public.tracking_summary USING btree (tracking_date);


--
-- Name: tracking_summary_package_id; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_summary_package_id ON public.tracking_summary USING btree (package_id);


--
-- Name: tracking_summary_url; Type: INDEX; Schema: public; Owner: ckandbuser
--

CREATE INDEX tracking_summary_url ON public.tracking_summary USING btree (url);


--
-- Name: activity_detail activity_detail_activity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.activity_detail
    ADD CONSTRAINT activity_detail_activity_id_fkey FOREIGN KEY (activity_id) REFERENCES public.activity(id);


--
-- Name: api_token api_token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.api_token
    ADD CONSTRAINT api_token_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: dashboard dashboard_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_extra group_extra_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra
    ADD CONSTRAINT group_extra_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: group_extra_revision group_extra_revision_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra_revision
    ADD CONSTRAINT group_extra_revision_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: group_extra_revision group_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_extra_revision
    ADD CONSTRAINT group_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: group_revision group_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.group_revision
    ADD CONSTRAINT group_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: member member_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_group_id_fkey FOREIGN KEY (group_id) REFERENCES public."group"(id);


--
-- Name: member_revision member_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.member_revision
    ADD CONSTRAINT member_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_extra package_extra_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra
    ADD CONSTRAINT package_extra_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: package_extra_revision package_extra_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_extra_revision
    ADD CONSTRAINT package_extra_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_member package_member_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_member
    ADD CONSTRAINT package_member_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: package_member package_member_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_member
    ADD CONSTRAINT package_member_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: package_relationship package_relationship_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship
    ADD CONSTRAINT package_relationship_object_package_id_fkey FOREIGN KEY (object_package_id) REFERENCES public.package(id);


--
-- Name: package_relationship_revision package_relationship_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES public.package_relationship(id);


--
-- Name: package_relationship_revision package_relationship_revision_object_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_object_package_id_fkey FOREIGN KEY (object_package_id) REFERENCES public.package(id);


--
-- Name: package_relationship_revision package_relationship_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_relationship_revision package_relationship_revision_subject_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship_revision
    ADD CONSTRAINT package_relationship_revision_subject_package_id_fkey FOREIGN KEY (subject_package_id) REFERENCES public.package(id);


--
-- Name: package_relationship package_relationship_subject_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_relationship
    ADD CONSTRAINT package_relationship_subject_package_id_fkey FOREIGN KEY (subject_package_id) REFERENCES public.package(id);


--
-- Name: package_revision package_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_revision
    ADD CONSTRAINT package_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_tag package_tag_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag
    ADD CONSTRAINT package_tag_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: package_tag_revision package_tag_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag_revision
    ADD CONSTRAINT package_tag_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: package_tag_revision package_tag_revision_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag_revision
    ADD CONSTRAINT package_tag_revision_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: package_tag package_tag_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.package_tag
    ADD CONSTRAINT package_tag_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tag(id);


--
-- Name: resource resource_package_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_package_id_fkey FOREIGN KEY (package_id) REFERENCES public.package(id);


--
-- Name: resource_revision resource_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_revision
    ADD CONSTRAINT resource_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: resource_view resource_view_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.resource_view
    ADD CONSTRAINT resource_view_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: system_info_revision system_info_revision_continuity_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info_revision
    ADD CONSTRAINT system_info_revision_continuity_id_fkey FOREIGN KEY (continuity_id) REFERENCES public.system_info(id);


--
-- Name: system_info_revision system_info_revision_revision_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.system_info_revision
    ADD CONSTRAINT system_info_revision_revision_id_fkey FOREIGN KEY (revision_id) REFERENCES public.revision(id);


--
-- Name: tag tag_vocabulary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_vocabulary_id_fkey FOREIGN KEY (vocabulary_id) REFERENCES public.vocabulary(id);


--
-- Name: user_following_dataset user_following_dataset_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_dataset
    ADD CONSTRAINT user_following_dataset_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_dataset user_following_dataset_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_dataset
    ADD CONSTRAINT user_following_dataset_object_id_fkey FOREIGN KEY (object_id) REFERENCES public.package(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_group user_following_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_group
    ADD CONSTRAINT user_following_group_group_id_fkey FOREIGN KEY (object_id) REFERENCES public."group"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_group user_following_group_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_group
    ADD CONSTRAINT user_following_group_user_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_user user_following_user_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_user
    ADD CONSTRAINT user_following_user_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_following_user user_following_user_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ckandbuser
--

ALTER TABLE ONLY public.user_following_user
    ADD CONSTRAINT user_following_user_object_id_fkey FOREIGN KEY (object_id) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

