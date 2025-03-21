PGDMP     (    0                |            neondb    15.10    15.4 %    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    16386    neondb    DATABASE     n   CREATE DATABASE neondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C.UTF-8';
    DROP DATABASE neondb;
                neondb_owner    false            %           0    0    DATABASE neondb    ACL     0   GRANT ALL ON DATABASE neondb TO neon_superuser;
                   neondb_owner    false    3364            �            1259    49153    movie    TABLE     �   CREATE TABLE public.movie (
    id integer NOT NULL,
    tmdb_id integer NOT NULL,
    title character varying(255),
    overview text,
    poster_path character varying(999),
    release_year integer,
    rating double precision
);
    DROP TABLE public.movie;
       public         heap    neondb_owner    false            �            1259    49152    movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.movie_id_seq;
       public          neondb_owner    false    221            &           0    0    movie_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;
          public          neondb_owner    false    220            �            1259    24634    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(255),
    password character varying(255),
    user_type character varying(50) DEFAULT 'user'::character varying
);
    DROP TABLE public.users;
       public         heap    neondb_owner    false            �            1259    24633    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          neondb_owner    false    219            '           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          neondb_owner    false    218            �            1259    24598    watchedlist    TABLE     !  CREATE TABLE public.watchedlist (
    id integer NOT NULL,
    tmdb_id integer NOT NULL,
    rating double precision,
    user_id integer NOT NULL,
    title text,
    CONSTRAINT watchedlist_rating_check CHECK (((rating >= (1)::double precision) AND (rating <= (5)::double precision)))
);
    DROP TABLE public.watchedlist;
       public         heap    neondb_owner    false            �            1259    24602    watchedlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.watchedlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.watchedlist_id_seq;
       public          neondb_owner    false    214            (           0    0    watchedlist_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.watchedlist_id_seq OWNED BY public.watchedlist.id;
          public          neondb_owner    false    215            �            1259    24603    wishlist    TABLE     �   CREATE TABLE public.wishlist (
    id integer NOT NULL,
    tmdb_id integer NOT NULL,
    user_id integer NOT NULL,
    title text
);
    DROP TABLE public.wishlist;
       public         heap    neondb_owner    false            �            1259    24606    wishlist_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.wishlist_id_seq;
       public          neondb_owner    false    216            )           0    0    wishlist_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.wishlist_id_seq OWNED BY public.wishlist.id;
          public          neondb_owner    false    217            {           2604    49156    movie id    DEFAULT     d   ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);
 7   ALTER TABLE public.movie ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    220    221    221            y           2604    24637    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    218    219    219            w           2604    24609    watchedlist id    DEFAULT     p   ALTER TABLE ONLY public.watchedlist ALTER COLUMN id SET DEFAULT nextval('public.watchedlist_id_seq'::regclass);
 =   ALTER TABLE public.watchedlist ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    215    214            x           2604    24610    wishlist id    DEFAULT     j   ALTER TABLE ONLY public.wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlist_id_seq'::regclass);
 :   ALTER TABLE public.wishlist ALTER COLUMN id DROP DEFAULT;
       public          neondb_owner    false    217    216                      0    49153    movie 
   TABLE DATA           `   COPY public.movie (id, tmdb_id, title, overview, poster_path, release_year, rating) FROM stdin;
    public          neondb_owner    false    221   �'                 0    24634    users 
   TABLE DATA           V   COPY public.users (id, first_name, last_name, email, password, user_type) FROM stdin;
    public          neondb_owner    false    219   �'                 0    24598    watchedlist 
   TABLE DATA           J   COPY public.watchedlist (id, tmdb_id, rating, user_id, title) FROM stdin;
    public          neondb_owner    false    214   ^)                 0    24603    wishlist 
   TABLE DATA           ?   COPY public.wishlist (id, tmdb_id, user_id, title) FROM stdin;
    public          neondb_owner    false    216   +       *           0    0    movie_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.movie_id_seq', 1, false);
          public          neondb_owner    false    220            +           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 22, true);
          public          neondb_owner    false    218            ,           0    0    watchedlist_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.watchedlist_id_seq', 68, true);
          public          neondb_owner    false    215            -           0    0    wishlist_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.wishlist_id_seq', 5, true);
          public          neondb_owner    false    217            �           2606    49160    movie movie_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_pkey;
       public            neondb_owner    false    221            �           2606    49162    movie movie_tmdb_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_tmdb_id_key UNIQUE (tmdb_id);
 A   ALTER TABLE ONLY public.movie DROP CONSTRAINT movie_tmdb_id_key;
       public            neondb_owner    false    221            �           2606    24643    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            neondb_owner    false    219            �           2606    24641    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            neondb_owner    false    219            ~           2606    24620    watchedlist watchedlist_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.watchedlist
    ADD CONSTRAINT watchedlist_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.watchedlist DROP CONSTRAINT watchedlist_pkey;
       public            neondb_owner    false    214            �           2606    24622    wishlist wishlist_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public            neondb_owner    false    216                       826    16388     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     |   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO neon_superuser WITH GRANT OPTION;
          public          cloud_admin    false                       826    16387    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     y   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES  TO neon_superuser WITH GRANT OPTION;
          public          cloud_admin    false                  x������ � �         ~  x�e�ˎ�0�y�,�f�s!솆Ds����n�6�;O�T�J�fwt��Ͽ$焂N<� @˚���ɽT3��^��j��ڑ����k��]�v��Ԓ�
�Ѹ-�Q�]��	Aװ��f�F"({.�%�n�kA_����T�f�1��~�z��3u�������B����o��v-l���G�`!�0�H��7��&��c�f�.laHk�tp��tZ�~�kW�L�8�2>$�C�������@���u����{<z�����_z����?&��9	��Xw��42M5N)yk�������H��c�w�l�'AQ�Ws�*�;g�ƿ�G��'���B�{	k]�54�E/�Z�X��.�q�����埪�(�{T�e         �  x�uR�n�@<s�bo=0�Kr�M�h��p�K.g�%CV�~~)ɉu�I��p�
��%	0���f�("��� '����=cV��mB<d��Z ��%9�@L��2��x���O��}(�}��^��pao�Ƕ�j}�^k|��L��}���������0{}#-{;�C���ڼTۿ؛����A�n׷�a�H���n��i�m[�D(8�p߇�P�j8}������_q�I8swo�{�m�wז6�
7�n�C�����l���P� p&Yz���O'�п5ݫ�\Nc�
Lq���:�+��0^� :r�N�>��F9��ן]�;��E�'/q�d�Hp DB+��z�����Y�yL�����:�<�US����p���)�\��e7Ƙ73�k         �   x�]���  ����}A���[�d��.��"4���W���1��JY���X5t%=�:L�%��Y���&�Eo�d?Y����E���C��h�3j���z]I��ܨ�E���
�� ���ufs1�pA�?
�2�     