PGDMP  +    &    	    	        |            hotel_management    16.6    17.0 2    H           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            I           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            J           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            K           1262    16562    hotel_management    DATABASE     �   CREATE DATABASE hotel_management WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
     DROP DATABASE hotel_management;
                     postgres    false            L           0    0    DATABASE hotel_management    ACL     8   GRANT ALL ON DATABASE hotel_management TO laravel_user;
                        postgres    false    4939                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            M           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16833    accommodations    TABLE     �   CREATE TABLE public.accommodations (
    accommodation_id integer NOT NULL,
    room_type_id integer NOT NULL,
    name character varying(50) NOT NULL
);
 "   DROP TABLE public.accommodations;
       public         heap r       postgres    false    4            �            1259    16810 #   accommodations_accommodation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accommodations_accommodation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 :   DROP SEQUENCE public.accommodations_accommodation_id_seq;
       public               postgres    false    4            �            1259    16832 $   accommodations_accommodation_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.accommodations_accommodation_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.accommodations_accommodation_id_seq1;
       public               postgres    false    4    224            N           0    0 $   accommodations_accommodation_id_seq1    SEQUENCE OWNED BY     l   ALTER SEQUENCE public.accommodations_accommodation_id_seq1 OWNED BY public.accommodations.accommodation_id;
          public               postgres    false    223            �            1259    16812    hotels    TABLE     �  CREATE TABLE public.hotels (
    hotel_id integer NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    city character varying(100) NOT NULL,
    nit character varying(50) NOT NULL,
    phone_number character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    max_rooms integer NOT NULL,
    CONSTRAINT hotels_max_rooms_check CHECK ((max_rooms > 0))
);
    DROP TABLE public.hotels;
       public         heap r       postgres    false    4            �            1259    16807    hotels_hotel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotels_hotel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 *   DROP SEQUENCE public.hotels_hotel_id_seq;
       public               postgres    false    4            �            1259    16811    hotels_hotel_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.hotels_hotel_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.hotels_hotel_id_seq1;
       public               postgres    false    220    4            O           0    0    hotels_hotel_id_seq1    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.hotels_hotel_id_seq1 OWNED BY public.hotels.hotel_id;
          public               postgres    false    219            �            1259    16824 
   room_types    TABLE     o   CREATE TABLE public.room_types (
    room_type_id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.room_types;
       public         heap r       postgres    false    4            �            1259    16808    room_types_room_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.room_types_room_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 2   DROP SEQUENCE public.room_types_room_type_id_seq;
       public               postgres    false    4            �            1259    16823    room_types_room_type_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.room_types_room_type_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.room_types_room_type_id_seq1;
       public               postgres    false    222    4            P           0    0    room_types_room_type_id_seq1    SEQUENCE OWNED BY     \   ALTER SEQUENCE public.room_types_room_type_id_seq1 OWNED BY public.room_types.room_type_id;
          public               postgres    false    221            �            1259    16872    rooms    TABLE        CREATE TABLE public.rooms (
    room_id integer NOT NULL,
    hotel_id integer NOT NULL,
    room_type_id integer NOT NULL,
    accommodation_id integer NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT rooms_quantity_check CHECK ((quantity > 0))
);
    DROP TABLE public.rooms;
       public         heap r       postgres    false    4            �            1259    16809    rooms_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rooms_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;
 (   DROP SEQUENCE public.rooms_room_id_seq;
       public               postgres    false    4            �            1259    16871    rooms_room_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.rooms_room_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.rooms_room_id_seq1;
       public               postgres    false    226    4            Q           0    0    rooms_room_id_seq1    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.rooms_room_id_seq1 OWNED BY public.rooms.room_id;
          public               postgres    false    225            �           2604    16836    accommodations accommodation_id    DEFAULT     �   ALTER TABLE ONLY public.accommodations ALTER COLUMN accommodation_id SET DEFAULT nextval('public.accommodations_accommodation_id_seq1'::regclass);
 N   ALTER TABLE public.accommodations ALTER COLUMN accommodation_id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    16815    hotels hotel_id    DEFAULT     s   ALTER TABLE ONLY public.hotels ALTER COLUMN hotel_id SET DEFAULT nextval('public.hotels_hotel_id_seq1'::regclass);
 >   ALTER TABLE public.hotels ALTER COLUMN hotel_id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    16827    room_types room_type_id    DEFAULT     �   ALTER TABLE ONLY public.room_types ALTER COLUMN room_type_id SET DEFAULT nextval('public.room_types_room_type_id_seq1'::regclass);
 F   ALTER TABLE public.room_types ALTER COLUMN room_type_id DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    16875    rooms room_id    DEFAULT     o   ALTER TABLE ONLY public.rooms ALTER COLUMN room_id SET DEFAULT nextval('public.rooms_room_id_seq1'::regclass);
 <   ALTER TABLE public.rooms ALTER COLUMN room_id DROP DEFAULT;
       public               postgres    false    225    226    226            C          0    16833    accommodations 
   TABLE DATA           N   COPY public.accommodations (accommodation_id, room_type_id, name) FROM stdin;
    public               postgres    false    224   �;       ?          0    16812    hotels 
   TABLE DATA           i   COPY public.hotels (hotel_id, name, address, city, nit, phone_number, created_at, max_rooms) FROM stdin;
    public               postgres    false    220   	<       A          0    16824 
   room_types 
   TABLE DATA           8   COPY public.room_types (room_type_id, name) FROM stdin;
    public               postgres    false    222   �<       E          0    16872    rooms 
   TABLE DATA           \   COPY public.rooms (room_id, hotel_id, room_type_id, accommodation_id, quantity) FROM stdin;
    public               postgres    false    226   �<       R           0    0 #   accommodations_accommodation_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.accommodations_accommodation_id_seq', 1, false);
          public               postgres    false    218            S           0    0 $   accommodations_accommodation_id_seq1    SEQUENCE SET     R   SELECT pg_catalog.setval('public.accommodations_accommodation_id_seq1', 7, true);
          public               postgres    false    223            T           0    0    hotels_hotel_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotels_hotel_id_seq', 1, false);
          public               postgres    false    215            U           0    0    hotels_hotel_id_seq1    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hotels_hotel_id_seq1', 8, true);
          public               postgres    false    219            V           0    0    room_types_room_type_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.room_types_room_type_id_seq', 1, false);
          public               postgres    false    216            W           0    0    room_types_room_type_id_seq1    SEQUENCE SET     J   SELECT pg_catalog.setval('public.room_types_room_type_id_seq1', 3, true);
          public               postgres    false    221            X           0    0    rooms_room_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.rooms_room_id_seq', 1, false);
          public               postgres    false    217            Y           0    0    rooms_room_id_seq1    SEQUENCE SET     @   SELECT pg_catalog.setval('public.rooms_room_id_seq1', 4, true);
          public               postgres    false    225            �           2606    16838 "   accommodations accommodations_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_pkey PRIMARY KEY (accommodation_id);
 L   ALTER TABLE ONLY public.accommodations DROP CONSTRAINT accommodations_pkey;
       public                 postgres    false    224            �           2606    16822    hotels hotels_nit_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_nit_key UNIQUE (nit);
 ?   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_nit_key;
       public                 postgres    false    220            �           2606    16820    hotels hotels_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotel_id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public                 postgres    false    220            �           2606    16831    room_types room_types_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.room_types DROP CONSTRAINT room_types_name_key;
       public                 postgres    false    222            �           2606    16829    room_types room_types_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.room_types
    ADD CONSTRAINT room_types_pkey PRIMARY KEY (room_type_id);
 D   ALTER TABLE ONLY public.room_types DROP CONSTRAINT room_types_pkey;
       public                 postgres    false    222            �           2606    16880 6   rooms rooms_hotel_id_room_type_id_accommodation_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_hotel_id_room_type_id_accommodation_id_key UNIQUE (hotel_id, room_type_id, accommodation_id);
 `   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_hotel_id_room_type_id_accommodation_id_key;
       public                 postgres    false    226    226    226            �           2606    16878    rooms rooms_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);
 :   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_pkey;
       public                 postgres    false    226            �           2606    16839 /   accommodations accommodations_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.accommodations
    ADD CONSTRAINT accommodations_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES public.room_types(room_type_id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.accommodations DROP CONSTRAINT accommodations_room_type_id_fkey;
       public               postgres    false    222    224    4768            �           2606    16881 !   rooms rooms_accommodation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_accommodation_id_fkey FOREIGN KEY (accommodation_id) REFERENCES public.accommodations(accommodation_id);
 K   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_accommodation_id_fkey;
       public               postgres    false    4770    224    226            �           2606    16886    rooms rooms_hotel_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_hotel_id_fkey FOREIGN KEY (hotel_id) REFERENCES public.hotels(hotel_id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_hotel_id_fkey;
       public               postgres    false    226    220    4764            �           2606    16891    rooms rooms_room_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_type_id_fkey FOREIGN KEY (room_type_id) REFERENCES public.room_types(room_type_id);
 G   ALTER TABLE ONLY public.rooms DROP CONSTRAINT rooms_room_type_id_fkey;
       public               postgres    false    4768    226    222            C   F   x�3�4�N�K���I�2r\�rR��9�8C�2�L ӹ���Rה���ȁh0��b���� 7��      ?   �   x��̻�0 ��<�-��;K�蠡���RKV؆YX@�~�0.unx�}�<��-k}�y���JGc��3ސvmn�����kp�B�[�^S KVc�&����Q[NE�֩�ko��ȏ�!Q&�t������h���2�      A   *   x�3�t-.9�0/%��ˈӫ4/3��˘3�4�$�+F��� �
.      E      x�3�4�4�4�4�2��И+F��� (U     