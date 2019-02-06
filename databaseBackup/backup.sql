--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.04.1)

-- Started on 2019-02-06 17:40:40 EAT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 13041)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 16753)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    departmentid integer NOT NULL,
    departmentname character varying(20) NOT NULL,
    descriptionn text
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16751)
-- Name: department_departmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_departmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_departmentid_seq OWNER TO postgres;

--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 196
-- Name: department_departmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_departmentid_seq OWNED BY public.department.departmentid;


--
-- TOC entry 199 (class 1259 OID 16764)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employeeid integer NOT NULL,
    firstname character varying(20) NOT NULL,
    middlename character varying(20),
    lastname character varying(20) NOT NULL,
    address character varying(20),
    department integer,
    manager integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16762)
-- Name: employee_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employeeid_seq OWNER TO postgres;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 198
-- Name: employee_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employeeid_seq OWNED BY public.employee.employeeid;


--
-- TOC entry 200 (class 1259 OID 16780)
-- Name: employee_phonenumber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_phonenumber (
    employee integer NOT NULL,
    phonenumber character varying(17) NOT NULL
);


ALTER TABLE public.employee_phonenumber OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16839)
-- Name: expenditure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenditure (
    expenditureid integer NOT NULL,
    expenditurename character varying(20) NOT NULL,
    cost integer NOT NULL,
    date date DEFAULT CURRENT_DATE,
    department integer
);


ALTER TABLE public.expenditure OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16837)
-- Name: expenditure_expenditureid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenditure_expenditureid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.expenditure_expenditureid_seq OWNER TO postgres;

--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 205
-- Name: expenditure_expenditureid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenditure_expenditureid_seq OWNED BY public.expenditure.expenditureid;


--
-- TOC entry 202 (class 1259 OID 16805)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    productid integer NOT NULL,
    productname character varying(20) NOT NULL,
    department integer
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16816)
-- Name: product_price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_price (
    product integer NOT NULL,
    price integer NOT NULL,
    lastupdate date DEFAULT CURRENT_DATE
);


ALTER TABLE public.product_price OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16803)
-- Name: product_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_productid_seq OWNER TO postgres;

--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 201
-- Name: product_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_productid_seq OWNED BY public.product.productid;


--
-- TOC entry 212 (class 1259 OID 16911)
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    purchaseid integer NOT NULL,
    purchasedate date DEFAULT CURRENT_DATE,
    quantitypurchased integer NOT NULL,
    product integer,
    supplier character varying(20)
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16909)
-- Name: purchase_purchaseid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_purchaseid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purchase_purchaseid_seq OWNER TO postgres;

--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 211
-- Name: purchase_purchaseid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_purchaseid_seq OWNED BY public.purchase.purchaseid;


--
-- TOC entry 210 (class 1259 OID 16878)
-- Name: sale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale (
    saleid integer NOT NULL,
    saledate date DEFAULT CURRENT_DATE,
    quantitysold integer NOT NULL,
    product integer,
    employee integer
);


ALTER TABLE public.sale OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16876)
-- Name: sale_saleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_saleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_saleid_seq OWNER TO postgres;

--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 209
-- Name: sale_saleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_saleid_seq OWNED BY public.sale.saleid;


--
-- TOC entry 204 (class 1259 OID 16827)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    product integer NOT NULL,
    stockavailableforsale integer NOT NULL,
    deplicities integer NOT NULL
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16861)
-- Name: supplier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier (
    suppliername character varying(20) NOT NULL,
    address character varying(20)
);


ALTER TABLE public.supplier OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16866)
-- Name: supplier_phonenumber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supplier_phonenumber (
    supplier character varying(20) NOT NULL,
    phonenumber character varying(17) NOT NULL
);


ALTER TABLE public.supplier_phonenumber OWNER TO postgres;

--
-- TOC entry 2837 (class 2604 OID 16756)
-- Name: department departmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN departmentid SET DEFAULT nextval('public.department_departmentid_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 16767)
-- Name: employee employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_employeeid_seq'::regclass);


--
-- TOC entry 2841 (class 2604 OID 16842)
-- Name: expenditure expenditureid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditure ALTER COLUMN expenditureid SET DEFAULT nextval('public.expenditure_expenditureid_seq'::regclass);


--
-- TOC entry 2839 (class 2604 OID 16808)
-- Name: product productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN productid SET DEFAULT nextval('public.product_productid_seq'::regclass);


--
-- TOC entry 2845 (class 2604 OID 16914)
-- Name: purchase purchaseid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase ALTER COLUMN purchaseid SET DEFAULT nextval('public.purchase_purchaseid_seq'::regclass);


--
-- TOC entry 2843 (class 2604 OID 16881)
-- Name: sale saleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale ALTER COLUMN saleid SET DEFAULT nextval('public.sale_saleid_seq'::regclass);


--
-- TOC entry 3003 (class 0 OID 16753)
-- Dependencies: 197
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (departmentid, departmentname, descriptionn) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 16764)
-- Dependencies: 199
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employeeid, firstname, middlename, lastname, address, department, manager) FROM stdin;
\.


--
-- TOC entry 3006 (class 0 OID 16780)
-- Dependencies: 200
-- Data for Name: employee_phonenumber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_phonenumber (employee, phonenumber) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 16839)
-- Dependencies: 206
-- Data for Name: expenditure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.expenditure (expenditureid, expenditurename, cost, date, department) FROM stdin;
\.


--
-- TOC entry 3008 (class 0 OID 16805)
-- Dependencies: 202
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (productid, productname, department) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 16816)
-- Dependencies: 203
-- Data for Name: product_price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_price (product, price, lastupdate) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 16911)
-- Dependencies: 212
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase (purchaseid, purchasedate, quantitypurchased, product, supplier) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 16878)
-- Dependencies: 210
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sale (saleid, saledate, quantitysold, product, employee) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 16827)
-- Dependencies: 204
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock (product, stockavailableforsale, deplicities) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 16861)
-- Dependencies: 207
-- Data for Name: supplier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier (suppliername, address) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 16866)
-- Dependencies: 208
-- Data for Name: supplier_phonenumber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supplier_phonenumber (supplier, phonenumber) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 196
-- Name: department_departmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_departmentid_seq', 1, false);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 198
-- Name: employee_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employeeid_seq', 1, false);


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 205
-- Name: expenditure_expenditureid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expenditure_expenditureid_seq', 1, false);


--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 201
-- Name: product_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_productid_seq', 1, false);


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 211
-- Name: purchase_purchaseid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_purchaseid_seq', 1, false);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 209
-- Name: sale_saleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_saleid_seq', 1, false);


--
-- TOC entry 2848 (class 2606 OID 16761)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (departmentid);


--
-- TOC entry 2852 (class 2606 OID 16784)
-- Name: employee_phonenumber employee_phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_phonenumber
    ADD CONSTRAINT employee_phonenumber_pkey PRIMARY KEY (employee, phonenumber);


--
-- TOC entry 2850 (class 2606 OID 16769)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employeeid);


--
-- TOC entry 2860 (class 2606 OID 16845)
-- Name: expenditure expenditure_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditure
    ADD CONSTRAINT expenditure_pkey PRIMARY KEY (expenditureid);


--
-- TOC entry 2854 (class 2606 OID 16810)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);


--
-- TOC entry 2856 (class 2606 OID 16821)
-- Name: product_price product_price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_price_pkey PRIMARY KEY (product, price);


--
-- TOC entry 2868 (class 2606 OID 16917)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchaseid);


--
-- TOC entry 2866 (class 2606 OID 16884)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (saleid);


--
-- TOC entry 2858 (class 2606 OID 16831)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (product);


--
-- TOC entry 2864 (class 2606 OID 16870)
-- Name: supplier_phonenumber supplier_phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_phonenumber
    ADD CONSTRAINT supplier_phonenumber_pkey PRIMARY KEY (supplier, phonenumber);


--
-- TOC entry 2862 (class 2606 OID 16865)
-- Name: supplier supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (suppliername);


--
-- TOC entry 2869 (class 2606 OID 16770)
-- Name: employee employee_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_department_fkey FOREIGN KEY (department) REFERENCES public.department(departmentid);


--
-- TOC entry 2870 (class 2606 OID 16775)
-- Name: employee employee_manager_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_manager_fkey FOREIGN KEY (manager) REFERENCES public.employee(employeeid);


--
-- TOC entry 2871 (class 2606 OID 16785)
-- Name: employee_phonenumber employee_phonenumber_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_phonenumber
    ADD CONSTRAINT employee_phonenumber_employee_fkey FOREIGN KEY (employee) REFERENCES public.employee(employeeid);


--
-- TOC entry 2875 (class 2606 OID 16846)
-- Name: expenditure expenditure_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditure
    ADD CONSTRAINT expenditure_department_fkey FOREIGN KEY (department) REFERENCES public.department(departmentid);


--
-- TOC entry 2872 (class 2606 OID 16811)
-- Name: product product_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_department_fkey FOREIGN KEY (department) REFERENCES public.department(departmentid);


--
-- TOC entry 2873 (class 2606 OID 16822)
-- Name: product_price product_price_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_price
    ADD CONSTRAINT product_price_product_fkey FOREIGN KEY (product) REFERENCES public.product(productid);


--
-- TOC entry 2880 (class 2606 OID 16923)
-- Name: purchase purchase_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_product_fkey FOREIGN KEY (product) REFERENCES public.product(productid);


--
-- TOC entry 2879 (class 2606 OID 16918)
-- Name: purchase purchase_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_supplier_fkey FOREIGN KEY (supplier) REFERENCES public.supplier(suppliername);


--
-- TOC entry 2878 (class 2606 OID 16890)
-- Name: sale sale_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_employee_fkey FOREIGN KEY (employee) REFERENCES public.employee(employeeid);


--
-- TOC entry 2877 (class 2606 OID 16885)
-- Name: sale sale_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_product_fkey FOREIGN KEY (product) REFERENCES public.product(productid);


--
-- TOC entry 2874 (class 2606 OID 16832)
-- Name: stock stock_product_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_product_fkey FOREIGN KEY (product) REFERENCES public.product(productid);


--
-- TOC entry 2876 (class 2606 OID 16871)
-- Name: supplier_phonenumber supplier_phonenumber_supplier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supplier_phonenumber
    ADD CONSTRAINT supplier_phonenumber_supplier_fkey FOREIGN KEY (supplier) REFERENCES public.supplier(suppliername);


-- Completed on 2019-02-06 17:40:43 EAT

--
-- PostgreSQL database dump complete
--

