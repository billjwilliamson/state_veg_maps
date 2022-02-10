/* copy qa test to local file */
/* In PGAdmin, open a PSQL Tool and run this from the prompt */

\COPY ( SELECT mapsource, ROUND(SUM(ST_Area(geom)/10000)::NUMERIC,0) AS sum_area_ha FROM viridarii.state_veg_maps_2021 GROUP BY mapsource ORDER BY mapsource ) TO '/home/billw/Downloads/state_veg_maps_2021_qa_area_by_mapsource.csv' DELIMITER ',' CSV HEADER ;
-- COPY 7


\COPY ( SELECT vegetationformation, ROUND(SUM(ST_Area(geom)/10000)::NUMERIC,0) AS sum_area_ha FROM viridarii.state_veg_maps_2021 GROUP BY vegetationformation ORDER BY vegetationformation ) TO '/home/billw/Downloads/state_veg_maps_2021_qa_area_by_formation.csv' DELIMITER ',' CSV HEADER ;
-- COPY 38
