/* can't run these concurrently. Do each query as a separate transaction as some occupy a lot of memory */
DROP TABLE IF EXISTS viridarii.state_veg_maps_2021 CASCADE
;

CREATE TABLE viridarii.state_veg_maps_2021 (LIKE
tests.hunterupper_svm_v1_0_pct_e_4894 INCLUDING ALL)
;

ALTER TABLE viridarii.state_veg_maps_2021
DROP COLUMN shape_length,
DROP COLUMN shape_area
;

INSERT INTO viridarii.state_veg_maps_2021 (
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  geom)
SELECT
  'centtable_svm_v1p0_pct_e_4778' AS mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  geom
FROM tests.centtable_svm_v1p0_pct_e_4778_sbdvd
;
-- INSERT 0 2248705 Query returned successfully in 2 min 55 secs.

INSERT INTO viridarii.state_veg_maps_2021 (
mapsource,
pctid,
pctname,
vegetationclass,
vegetationformation,
geom)
SELECT
'sydneymetroarea_v3_1_2016_e_4489',
pctid,
pctname,
stateclass,
stateform,
geom
FROM tests.sydneymetroarea_v3_1_2016_e_4489_sbdvd
;
-- INSERT 0 194030 Query returned successfully in 18 secs 928 msec.

INSERT INTO viridarii.state_veg_maps_2021 AS x (
mapsource,
pctid,
pctname,
vegetationclass,
vegetationformation,
geom)
SELECT
'western_svm_v1_0_pct_e_4492',
pctid,
pctname,
vegetationclass,
vegetationformation,
geom AS geom
FROM tests.western_svm_v1_0_pct_e_4492_sbdvd
;
-- -- INSERT 0 7586816 Query returned successfully in 5 min 54 secs.

INSERT INTO viridarii.state_veg_maps_2021 (
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  geom)
SELECT
  'brg_namoi_svm_v1p3_pct_e_4467' AS mapsource,
  pctid,
  pctname,
  class,
  formation,
  geom
FROM tests.brg_namoi_svm_v1p3_pct_e_4467_sbdvd
;
-- INSERT 0 1892264 Query returned successfully in 1 min 20 secs.

/*** End of blind inserts ***/

CREATE INDEX state_veg_maps_2021_gidx
ON viridarii.state_veg_maps_2021
USING GIST(geom)
;
-- CREATE INDEX Query returned successfully in 2 min 24 secs.

/***   ***/

DROP TABLE IF EXISTS tests.state_veg_maps_2021_temp_mask CASCADE
;

CREATE TABLE tests.state_veg_maps_2021_temp_mask AS
SELECT
a.id,
ST_Multi(ST_CollectionExtract(ST_Union(ST_Intersection(a.geom, b.geom)),3))::geometry(MultiPolygon, 7855) AS geom
FROM tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd AS a
JOIN viridarii.state_veg_maps_2021 AS b
ON ST_Intersects(a.geom, b.geom)
GROUP BY a.id
;
-- SELECT 179036 Query returned successfully in 17 min 32 secs.

CREATE INDEX state_veg_maps_2021_temp_mask_gidx
ON tests.state_veg_maps_2021_temp_mask
USING GIST(geom)
;
-- CREATE INDEX Query returned successfully in 1 secs 721 msec.

CREATE INDEX state_veg_maps_2021_temp_mask_idx
ON tests.state_veg_maps_2021_temp_mask(id)
;
-- CREATE INDEX Query returned successfully in 252 msec.

INSERT INTO viridarii.state_veg_maps_2021 (
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  geom)
WITH clippers AS (
  SELECT v.id,
  ST_Union(v.geom) AS geom
  FROM tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd AS c
  JOIN tests.state_veg_maps_2021_temp_mask AS v
  ON ST_Intersects(c.geom, v.geom)
  GROUP BY v.id
)
SELECT 'centwestlach_svm_v1p4_pct_e_4468' AS mapsource,
  c.pctid,
  c.pctname,
  c.class,
  c.formation,
  ST_CollectionExtract(ST_Multi(ST_Difference(c.geom, vu.geom)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd AS c
JOIN clippers AS vu
USING (id)
UNION ALL
SELECT 'centwestlach_svm_v1p4_pct_e_4468' AS mapsource,
  c.pctid,
  c.pctname,
  c.class,
  c.formation,
  c.geom
FROM tests.centwestlach_svm_v1p4_pct_e_4468_sbdvd AS c
LEFT JOIN clippers AS vu
ON vu.id = c.id
WHERE vu.id IS NULL
;
-- INSERT 0 1298198 Query returned successfully in 50 min 12 secs.

/***   ***/

DROP TABLE IF EXISTS tests.state_veg_maps_2021_temp_mask CASCADE
;

CREATE TABLE tests.state_veg_maps_2021_temp_mask AS
SELECT
a.id,
ST_Multi(ST_CollectionExtract(ST_Union(ST_Intersection(a.geom, b.geom)),3))::geometry(MultiPolygon, 7855) AS geom
FROM tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd AS a
JOIN viridarii.state_veg_maps_2021 AS b
ON ST_Intersects(a.geom, b.geom)
GROUP BY a.id
;
-- SELECT 35153 Query returned successfully in 15 min 7 secs.

CREATE INDEX state_veg_maps_2021_temp_mask_gidx
ON tests.state_veg_maps_2021_temp_mask
USING GIST(geom)
;
-- CREATE INDEX Query returned successfully in 1 secs 721 msec.

CREATE INDEX state_veg_maps_2021_temp_mask_idx
ON tests.state_veg_maps_2021_temp_mask(id)
;
-- CREATE INDEX Query returned successfully in 252 msec.

INSERT INTO viridarii.state_veg_maps_2021 (
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  geom)
WITH clippers AS (
  SELECT v.id,
  ST_Union(v.geom) AS geom
  FROM tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd AS c
  JOIN tests.state_veg_maps_2021_temp_mask AS v
  ON ST_Intersects(c.geom, v.geom)
  GROUP BY v.id
)
SELECT 'hunterupper_svm_v1_0_pct_e_4894' AS mapsource,
  c.pctid,
  c.pctname,
  c.vegetationclass,
  c.vegetationformation,
  ST_CollectionExtract(ST_Multi(ST_Difference(c.geom, vu.geom)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd AS c
JOIN clippers AS vu
USING (id)
UNION ALL
SELECT 'hunterupper_svm_v1_0_pct_e_4894' AS mapsource,
  c.pctid,
  c.pctname,
  c.vegetationclass,
  c.vegetationformation,
  c.geom
FROM tests.hunterupper_svm_v1_0_pct_e_4894_sbdvd AS c
LEFT JOIN clippers AS vu
ON vu.id = c.id
WHERE vu.id IS NULL
;
-- INSERT 0 516202 Query returned successfully in 26 min 20 secs.

/***   ***/

DROP TABLE IF EXISTS tests.state_veg_maps_2021_temp_mask CASCADE
;

CREATE TABLE tests.state_veg_maps_2021_temp_mask AS
SELECT
a.id,
ST_Multi(ST_CollectionExtract(ST_Union(ST_Intersection(a.geom, b.geom)),3))::geometry(MultiPolygon, 7855) AS geom
FROM tests.riverina_v1p2_quickview_sbdvd AS a
JOIN viridarii.state_veg_maps_2021 AS b
ON ST_Intersects(a.geom, b.geom)
GROUP BY a.id
;
-- SELECT 23141 Query returned successfully in 50 secs 823 msec.

CREATE INDEX state_veg_maps_2021_temp_mask_gidx
ON tests.state_veg_maps_2021_temp_mask
USING GIST(geom)
;
-- CREATE INDEX Query returned successfully in 1 secs 721 msec.

CREATE INDEX state_veg_maps_2021_temp_mask_idx
ON tests.state_veg_maps_2021_temp_mask(id)
;
-- CREATE INDEX Query returned successfully in 252 msec.

INSERT INTO viridarii.state_veg_maps_2021 (
  mapsource,
  pctid,
  pctname,
  vegetationclass,
  vegetationformation,
  geom)
WITH clippers AS (
  SELECT v.id,
  ST_Union(v.geom) AS geom
  FROM tests.riverina_v1p2_quickview_sbdvd AS c
  JOIN tests.state_veg_maps_2021_temp_mask AS v
  ON ST_Intersects(c.geom, v.geom)
  GROUP BY v.id
)
SELECT 'riverina_v1p2_quickview' AS mapsource,
  c.pctid,
  c.pctname,
  c.vegetationclass,
  c.vegetationformation,
  ST_CollectionExtract(ST_Multi(ST_Difference(c.geom, vu.geom)),3)::geometry(MultiPolygon, 7855) AS geom
FROM tests.riverina_v1p2_quickview_sbdvd AS c
JOIN clippers AS vu
USING (id)
UNION ALL
SELECT 'riverina_v1p2_quickview' AS mapsource,
  c.pctid,
  c.pctname,
  c.vegetationclass,
  c.vegetationformation,
  c.geom
FROM tests.riverina_v1p2_quickview_sbdvd AS c
LEFT JOIN clippers AS vu
ON vu.id = c.id
WHERE vu.id IS NULL
;
-- INSERT 0 2272688 Query returned successfully in 11 min 45 secs.

DELETE
FROM viridarii.state_veg_maps_2021
WHERE ST_Area(geom) < 1
OR geom IS NULL
;
-- DELETE 228609 Query returned successfully in 2 min 25 sec.

UPDATE viridarii.state_veg_maps_2021
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom)
;
-- UPDATE 0 Query returned successfully in 9 min 16 secs.

VACUUM ANALYZE viridarii.state_veg_maps_2021
;
-- VACUUM Query returned successfully in 26 secs 404 msec.

CLUSTER viridarii.state_veg_maps_2021
USING state_veg_maps_2021_gidx
;
-- CLUSTER Query returned successfully in 24 min 22 secs.

DO
  $do$
  BEGIN
  EXECUTE format($$COMMENT ON TABLE viridarii.state_veg_maps_2021 IS 'Table created date: %s'$$, LOCALTIMESTAMP);
  END
  $do$
  ;

/***   ***/
