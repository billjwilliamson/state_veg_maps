
UPDATE tests.centtable_svm_v1p0_pct_e_4778
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
/* MULTIPLE NOTICES FOLLOW
NOTICE:  Ring Self-intersection at or near point 795040.0083557812 6326587.8774691727
NOTICE:  Ring Self-intersection at or near point 817358.45526373468 6295326.8909339495
NOTICE:  Ring Self-intersection at or near point 815321.5999932983 6322157.0786628891
NOTICE:  Ring Self-intersection at or near point 814116.01149212976 6310473.8367807996
NOTICE:  Ring Self-intersection at or near point 817112.06107553153 6309248.9897430204
NOTICE:  Ring Self-intersection at or near point 652014.95689928858 6360808.6691495925
NOTICE:  Ring Self-intersection at or near point 640817.92829756974 6387990.1227185428
NOTICE:  Ring Self-intersection at or near point 640303.31231396657 6357072.2107807007
NOTICE:  Ring Self-intersection at or near point 641394.09300974873 6356061.7489371505
NOTICE:  Ring Self-intersection at or near point 646612.67431599158 6369418.0775754377
*/
-- UPDATE 293 Query returned successfully in 19 min 21 secs.


CREATE TABLE tests.centtable_svm_v1p0_pct_e_4778_sbdvd (
  id	SERIAL PRIMARY KEY,
  mapsource	TEXT,
  pctidmod1	INTEGER,
  pctidmod2	INTEGER,
  pctidmod3	INTEGER,
  pctid	INTEGER,
  mapname	TEXT,
  pctname	TEXT,
  vegetationformation	TEXT,
  vegetationclass	TEXT,
  shape_leng	NUMERIC,
  shape_length	NUMERIC,
  shape_area	NUMERIC,
  geom	geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.centtable_svm_v1p0_pct_e_4778_sbdvd (
mapsource,
pctidmod1,
pctidmod2,
pctidmod3,
pctid,
mapname,
pctname,
vegetationformation,
vegetationclass,
shape_leng,
shape_length,
shape_area,
geom)
SELECT
mapsource,
pctidmod1,
pctidmod2,
pctidmod3,
pctid,
mapname,
pctname,
vegetationformation,
vegetationclass,
shape_leng,
shape_length,
shape_area,
ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.centtable_svm_v1p0_pct_e_4778
;
-- INSERT 0 2248705 Query returned successfully in 17 min 21 secs.

CREATE INDEX centtable_svm_v1p0_pct_e_4778_sbdvd_gidx
ON tests.centtable_svm_v1p0_pct_e_4778_sbdvd USING GIST(geom)
;

CREATE INDEX centtable_svm_v1p0_pct_e_4778_sbdvd_idx
ON tests.centtable_svm_v1p0_pct_e_4778_sbdvd (id)
;
-- CREATE INDEX Query returned successfully in 18 secs 915 msec.

DELETE
FROM tests.centtable_svm_v1p0_pct_e_4778_sbdvd
WHERE geom IS NULL
;
-- DELETE 0 Query returned successfully in 128 msec.

UPDATE tests.centtable_svm_v1p0_pct_e_4778_sbdvd
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
-- UPDATE 0 Query returned successfully in 1 min 6 secs.

/***   ***/

UPDATE tests.centwestlach_svm_v1p4_pct_e_4468
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;

/* multiple notices
NOTICE:  Ring Self-intersection at or near point 723434.15395899257 6457767.0228128247
NOTICE:  Ring Self-intersection at or near point 722899.16632352653 6537436.9174007494
NOTICE:  Ring Self-intersection at or near point 563364.39030651969 6623179.3270498477
NOTICE:  Ring Self-intersection at or near point 568404.38221599977 6614491.8377644969
NOTICE:  Ring Self-intersection at or near point 635004.29273945559 6605664.3398313839
NOTICE:  Ring Self-intersection at or near point 646594.27893263777 6616034.3243978173
NOTICE:  Ring Self-intersection at or near point 592049.35633063479 6652469.2841229821
*/
-- UPDATE 418 Query returned successfully in 6 min 5 secs.

CREATE TABLE tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd (
id	SERIAL PRIMARY KEY,
mapsource	INTEGER,
pctid	INTEGER,
pctname	TEXT,
class	TEXT,
formation	TEXT,
pctidmod1	INTEGER,
pctidmod2	INTEGER,
pctidmod3	INTEGER,
shape_length	NUMERIC,
shape_area	NUMERIC,
geom	geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd (
mapsource,
pctid,
pctname,
class,
formation,
pctidmod1,
pctidmod2,
pctidmod3,
shape_length,
shape_area,
geom)
SELECT
mapsource,
pctid,
pctname,
class,
formation,
pctidmod1,
pctidmod2,
pctidmod3,
shape_length,
shape_area,
ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.centwestlach_svm_v1p4_pct_e_4468
;
-- INSERT 0 1789638 Query returned successfully in 10 min 58 secs.

CREATE INDEX centwestlach_svm_v1p4_pct_e_4468_sbdvd_gidx
ON tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd USING GIST(geom)
;

CREATE INDEX centwestlach_svm_v1p4_pct_e_4468_sbdvd_idx
ON tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd (id)
;
-- CREATE INDEX Query returned successfully in 15 secs 968 msec.

DELETE
FROM tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd
WHERE geom IS NULL
;
-- DELETE 0 Query returned successfully in 141 msec.

UPDATE tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
-- UPDATE 0 Query returned successfully in 2 min 6 secs.

/***  ***/

UPDATE tests.sydneymetroarea_v3_1_2016_e_4489
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
-- multiple notices follow
/*
NOTICE:  Ring Self-intersection at or near point 883797.60916547198 6259197.4324628189
NOTICE:  Ring Self-intersection at or near point 882094.52907759673 6262220.4770619273
NOTICE:  Ring Self-intersection at or near point 897489.10782284336 6271511.480362149
NOTICE:  Ring Self-intersection at or near point 892319.22115294717 6265047.3538771439
NOTICE:  Ring Self-intersection at or near point 897019.93897586421 6263658.2495992696
NOTICE:  Ring Self-intersection at or near point 897712.28265319904 6249229.3412337126
*/
-- UPDATE 10049 Query returned successfully in 52 secs 696 msec.


CREATE TABLE tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd (
id SERIAL PRIMARY KEY,
area_ha NUMERIC,
mapunitcod TEXT,
mapunitnam TEXT,
vegcode TEXT,
tec_nsw TEXT,
tec_epbc TEXT,
commcode TEXT,
confname TEXT,
ustorname TEXT,
distname TEXT,
disevname TEXT,
disindname TEXT,
stateclass TEXT,
stateform TEXT,
pct_code TEXT,
biometricc TEXT,
domspp TEXT,
substrate TEXT,
niche TEXT,
vegstruct TEXT,
shape_leng NUMERIC,
pctid INTEGER,
pctname TEXT,
shape_length NUMERIC,
shape_area NUMERIC,
geom geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd (
area_ha,
mapunitcod,
mapunitnam,
vegcode,
tec_nsw,
tec_epbc,
commcode,
confname,
ustorname,
distname,
disevname,
disindname,
stateclass,
stateform,
pct_code,
biometricc,
domspp,
substrate,
niche,
vegstruct,
shape_leng,
pctid,
pctname,
shape_length,
shape_area,
geom
)
SELECT
area_ha,
mapunitcod,
mapunitnam,
vegcode,
tec_nsw,
tec_epbc,
commcode,
confname,
ustorname,
distname,
disevname,
disindname,
stateclass,
stateform,
pct_code,
biometricc,
domspp,
substrate,
niche,
vegstruct,
shape_leng,
pctid,
pctname,
shape_length,
shape_area,
ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.sydneymetroarea_v3_1_2016_e_4489
;
-- INSERT 0 194030 Query returned successfully in 1 min 37 secs.

CREATE INDEX sydneymetroarea_v3_1_2016_e_4489_sbdvd_gidx ON
tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd USING GIST(geom)
;
-- CREATE INDEX Query returned successfully in 1 secs 394 msec.

CREATE INDEX sydneymetroarea_v3_1_2016_e_4489_sbdvd_idx ON
tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd (id)
;

DELETE
FROM tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd
WHERE geom IS NULL
;

UPDATE tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
-- UPDATE 0 Query returned successfully in 7 secs 149 msec.

/***    ***/

UPDATE tests.western_svm_v1_0_pct_e_4492
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
/* Multiple notices follow
NOTICE:  Ring Self-intersection at or near point -16634.619011421571 6484386.8155084886
NOTICE:  Ring Self-intersection at or near point 554565.10677645914 6708370.7583272271
NOTICE:  Nested shells at or near point 621217.50476656691 6736670.8200404737
NOTICE:  Hole lies outside shell at or near point 577440.3737907497 6754567.9237336833
NOTICE:  Ring Self-intersection at or near point 647262.15171828237 6744982.9545192011
NOTICE:  Ring Self-intersection at or near point 272078.6136588871 6703453.4874317627
NOTICE:  Ring Self-intersection at or near point 252997.5169717212 6720242.6716458034
NOTICE:  Ring Self-intersection at or near point 423491.97864718724 6729739.6096859369
NOTICE:  Ring Self-intersection at or near point 8576.0739116531331 6397694.6884104982
NOTICE:  Hole lies outside shell at or near point 130834.11041467555 6243820.6669724267
NOTICE:  Ring Self-intersection at or near point 146964.0284504852 6363202.62990472
NOTICE:  Ring Self-intersection at or near point 166371.19470769604 6420813.2818665616
*/
--

CREATE TABLE tests.western_svm_v1_0_pct_e_4492_sbdvd (
  id	SERIAL PRIMARY KEY,
  pctid	INTEGER,
  pctname	TEXT,
  mapname	TEXT,
  vegetationclass	TEXT,
  vegetationformation	TEXT,
  shape_length	NUMERIC,
  shape_area	NUMERIC,
  geom	geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.western_svm_v1_0_pct_e_4492_sbdvd (
pctid,
pctname,
mapname,
vegetationclass,
vegetationformation,
shape_length,
shape_area,
geom
)
SELECT
pctid,
pctname,
mapname,
vegetationclass,
vegetationformation,
shape_length,
shape_area,
ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.western_svm_v1_0_pct_e_4492
;

-- INSERT 0 7586816 Query returned successfully in 39 min 41 secs.

CREATE INDEX western_svm_v1_0_pct_e_4492_sbdvd_gidx
ON tests.western_svm_v1_0_pct_e_4492_sbdvd USING GIST(geom)
;
-- CREATE INDEX Query returned successfully in 2 min 24 secs.

CREATE INDEX western_svm_v1_0_pct_e_4492_sbdvd_idx
ON tests.western_svm_v1_0_pct_e_4492_sbdvd (id)
;
-- CREATE INDEX Query returned successfully in 6 secs 11 msec.

DELETE
FROM tests.western_svm_v1_0_pct_e_4492_sbdvd
WHERE geom IS NULL
;
--

UPDATE tests.western_svm_v1_0_pct_e_4492_sbdvd
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
-- UPDATE 0 Query returned successfully in 4 min 9 secs.

/***   ***/

UPDATE tests.brg_namoi_svm_v1p3_pct_e_4467
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
/* MULTIPLE NOTICES FOLLOW
NOTICE:  Ring Self-intersection at or near point 926095.79108924675 6655783.7074484015
NOTICE:  Ring Self-intersection at or near point 935079.75656546862 6637949.8191704806
NOTICE:  Ring Self-intersection at or near point 760567.18485599651 6738989.9397950415
NOTICE:  Ring Self-intersection at or near point 771947.8153268022 6736313.2844383959
NOTICE:  Ring Self-intersection at or near point 915674.59704537992 6768599.9380685762
NOTICE:  Ring Self-intersection at or near point 923860.29506520694 6688895.0606818879
NOTICE:  Ring Self-intersection at or near point 847826.07115534716 6752902.680836251
NOTICE:  Ring Self-intersection at or near point 865169.99336976092 6785658.9697039444
NOTICE:  Ring Self-intersection at or near point 944582.13285512268 6736289.3393882737
NOTICE:  Ring Self-intersection at or near point 890624.84913852485 6766254.8975195047
NOTICE:  Ring Self-intersection at or near point 892335.23574542149 6797189.7575203218
*/
-- UPDATE 429 Query returned successfully in 1 min 52 secs.

CREATE TABLE tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd (
  id	SERIAL PRIMARY KEY,
  pctname	TEXT,
  pctid	INTEGER,
  class	TEXT,
  formation	TEXT,
  pctidmod1	INTEGER,
  pctidmod2	INTEGER,
  pctidmod3	INTEGER,
  mapsource	TEXT,
  shape_length	NUMERIC,
  shape_area	NUMERIC,
  geom	geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd (
  pctname,
  pctid,
  class,
  formation,
  pctidmod1,
  pctidmod2,
  pctidmod3,
  mapsource,
  shape_length,
  shape_area,
  geom
)
SELECT
pctname,
pctid,
class,
formation,
pctidmod1,
pctidmod2,
pctidmod3,
mapsource,
shape_length,
shape_area,
ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.brg_namoi_svm_v1p3_pct_e_4467
;
-- INSERT 0 1892264 Query returned successfully in 5 min 42 secs.

CREATE INDEX brg_namoi_svm_v1p3_pct_e_4467_sbdvd_gidx
ON tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd USING GIST(geom)
;
--

CREATE INDEX brg_namoi_svm_v1p3_pct_e_4467_sbdvd_idx
ON tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd (id)
;
--

DELETE
FROM tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd
WHERE geom IS NULL
;
-- DELETE 0 Query returned successfully in 114 msec.

UPDATE tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
-- UPDATE 0 Query returned successfully in 1 min 20 secs.

/***   ***/

UPDATE tests.riverina_v1p2_quickview
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
/* MULTIPLE NOTICES FOLLOW
NOTICE:  Ring Self-intersection at or near point 420251.17838045536 6165564.1981623266
NOTICE:  Ring Self-intersection at or near point 436353.65533712477 6142521.7238141634
NOTICE:  Ring Self-intersection at or near point 448503.64320360147 6159424.2014033915
NOTICE:  Ring Self-intersection at or near point 423428.67334638798 6157649.2074123807
NOTICE:  Ring Self-intersection at or near point 414168.68645908963 6169919.1938085714
NOTICE:  Ring Self-intersection at or near point 430753.66746168054 6177589.182027827
NOTICE:  Ring Self-intersection at or near point 601675.94374708098 6071034.2853432316
NOTICE:  Ring Self-intersection at or near point 592445.94862490846 6029899.3367256317
NOTICE:  Ring Self-intersection at or near point 603093.43892566231 6050911.8096092567
NOTICE:  Ring Self-intersection at or near point 628335.90495298849 6028784.3324521733
NOTICE:  Ring Self-intersection at or near point 615568.41843727883 6015879.3501967099
NOTICE:  Ring Self-intersection at or near point 607763.43635827128 6070951.7845210731
NOTICE:  Ring Self-intersection at or near point 643600.90491141984 6149661.6835957915
NOTICE:  Ring Self-intersection at or near point 625845.77445515431 6197276.1235555103
*/
-- UPDATE 965 Query returned successfully in 16 min 24 secs.

CREATE TABLE tests.riverina_v1p2_quickview_sbdvd (
  id	SERIAL PRIMARY KEY,
  pctid	INTEGER,
  mapsource	TEXT,
  pctidmod1	TEXT,
  pctidmod2	TEXT,
  pctidmod3	TEXT,
  pctname	TEXT,
  vegetationclass	TEXT,
  vegetationformation	TEXT,
  mapname	TEXT,
  shape_length	NUMERIC,
  shape_area	NUMERIC,
  geom	geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.riverina_v1p2_quickview_sbdvd
(
pctid,
mapsource,
pctidmod1,
pctidmod2,
pctidmod3,
pctname,
vegetationclass,
vegetationformation,
mapname,
shape_length,
shape_area,
geom
)
SELECT
pctid,
mapsource,
pctidmod1,
pctidmod2,
pctidmod3,
pctname,
vegetationclass,
vegetationformation,
mapname,
shape_length,
shape_area,
ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.riverina_v1p2_quickview
;
-- INSERT 0 3477987 Query returned successfully in 23 min 4 secs.

CREATE INDEX riverina_v1p2_quickview_sbdvd_gidx
ON tests.riverina_v1p2_quickview_sbdvd USING GIST(geom)
;

CREATE INDEX riverina_v1p2_quickview_sbdvd_idx
ON tests.riverina_v1p2_quickview_sbdvd (id)
;
-- CREATE INDEX Query returned successfully in 1 min 7 secs.

DELETE
FROM tests.riverina_v1p2_quickview_sbdvd
WHERE geom IS NULL
;
-- DELETE 0 Query returned successfully in 152 msec.

UPDATE tests.riverina_v1p2_quickview_sbdvd
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
--UPDATE 0 Query returned successfully in 1 min 36 secs.

/***   ***/

UPDATE tests.hunterupper_svm_v1_0_pct_e_4894
SET geom=ST_MAKEVALID(geom)
WHERE NOT ST_ISVALID(geom)
;
/* MULTIPLE NOTICES
NOTICE:  Ring Self-intersection at or near point 987971.74865706521 6480593.1729906555
NOTICE:  Ring Self-intersection at or near point 951437.77644829953 6505933.575384384
NOTICE:  Ring Self-intersection at or near point 928139.71647212002 6518349.9570106622
NOTICE:  Ring Self-intersection at or near point 941560.84466161323 6512166.1570896329
NOTICE:  Ring Self-intersection at or near point 929829.5814868731 6518789.4523349209
NOTICE:  Ring Self-intersection at or near point 939012.88445985923 6518796.8459312757
NOTICE:  Ring Self-intersection at or near point 950614.33039599028 6524185.6456794832
NOTICE:  Ring Self-intersection at or near point 947571.61052707722 6522140.8905280819
NOTICE:  Ring Self-intersection at or near point 962947.33088257629 6522990.4095715769
NOTICE:  Ring Self-intersection at or near point 954450.14643719001 6518462.5024653096
NOTICE:  Ring Self-intersection at or near point 953483.60004199133 6510567.2055051262
NOTICE:  Ring Self-intersection at or near point 951291.65159280971 6522617.839258831
*/
-- UPDATE 469 Query returned successfully in 4 min 52 secs.

CREATE TABLE tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd (
  id	SERIAL PRIMARY KEY,
  mapname	TEXT,
  mapsource	TEXT,
  pctid	INTEGER,
  pctname	TEXT,
  vegetationclass	TEXT,
  vegetationformation	TEXT,
  shape_length	NUMERIC,
  shape_area	NUMERIC,
  geom	geometry(MultiPolygon,7855)
)
;

INSERT INTO tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd (
  mapname,
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  shape_length,
  shape_area,
  geom
)
SELECT
  mapname,
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  shape_length,
  shape_area,
  ST_CollectionExtract(ST_Multi(ST_Subdivide(geom,2048)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.hunterupper_svm_v1_0_pct_e_4894
;
-- INSERT 0 1473436 Query returned successfully in 17 min 27 secs.

CREATE INDEX hunterupper_svm_v1_0_pct_e_4894_sbdvd_gidx
ON tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd USING GIST(geom)
;

CREATE INDEX hunterupper_svm_v1_0_pct_e_4894_sbdvd_idx
ON tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd (id)
;
-- CREATE INDEX Query returned successfully in 53 secs 849 msec.

DELETE
FROM tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd
WHERE geom IS NULL
;

UPDATE tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
-- UPDATE 0 Query returned successfully in 44 secs 674 msec.

/***   ***/
