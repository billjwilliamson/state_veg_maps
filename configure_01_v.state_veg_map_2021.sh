#!/bin/bash

# This file load script is based on configuration from a QGIS session, therefore can either use the commands via a bash session in ogr2ogr to load the files to the server or repeat in QGIS.


# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…

# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/vegetationwesternsvtmv104492/Vegetation_Western_SVTM_v1_0_4492/data/quickview.gdb" WesternSVM_v1_0_PCT_E_4492 -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.western_svm_v1_0_pct_e_4492 -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -nlt PROMOTE_TO_MULTI
# GDAL command output:
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP.
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 5555.48 seconds (1 hour 32 minutes 35 seconds)
# Results:
# {}
# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished
#
#
# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…
# Input parameters:
#
# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/vegetationsydmetroareav314489/data/GDB/data.gdb" SydneyMetroArea_v3_1_2016_E_4489 -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.sydneymetroarea_v3_1_2016_e_4489 -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -nlt PROMOTE_TO_MULTI
# GDAL command output:
#
#
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP, or only make it analyze counter-clock wise parts by setting METHOD=ONLY_CCW if you can assume that the outline of holes is counter-clock wise defined
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 339.75 seconds (5 minutes 40 seconds)
# Results:
# {}

# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished
#
# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…
#
# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/vegetationhunteruppersvtm4894/hunterupper_svtm_4894/data/quickview.gdb" HunterUpperSVM_v1_0_PCT_E_4894 -overwrite -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.hunterupper_svm_v1_0_pct_e_4894 -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -skipfailures -nlt PROMOTE_TO_MULTI
# GDAL command output:
#
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP, or only make it analyze counter-clock wise parts by setting METHOD=ONLY_CCW if you can assume that the outline of holes is counter-clock wise defined
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 23235.67 seconds (6 hours 27 minutes 16 seconds)
# Results:
# {}
#
# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished



# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…
#
# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/vegetationcentraltablelandssvtm4778/Vegetation_CentralTablelands_SVTM_4778/Vegetation_CentralTablelands_SVTM_4778/data/VegMap.gdb" CentTableSVM_v1p0_PCT_E_4778 -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.centtable_svm_v1p0_pct_e_4778 -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -nlt PROMOTE_TO_MULTI
# GDAL command output:
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP, or only make it analyze counter-clock wise parts by setting METHOD=ONLY_CCW if you can assume that the outline of holes is counter-clock wise defined
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 3946.88 seconds (1 hour 5 minutes 47 seconds)
# Results:
# {}
#
# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished



# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…
#
# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/Vegetation_BorderRiversGwydirNamoi_4467/data/GDB/QuickViewMap.gdb" BRG_NamoiSVM_v1p3_PCT_E_4467 -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.brg_namoi_svm_v1p3_pct_e_4467 -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -nlt PROMOTE_TO_MULTI
# GDAL command output:
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP, or only make it analyze counter-clock wise parts by setting METHOD=ONLY_CCW if you can assume that the outline of holes is counter-clock wise defined
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 1528.52 seconds (25 minutes 29 seconds)
# Results:
# {}
#
# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished
#
#
# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…
#
# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/vegetationsvtmriverinav1.2quickviews4469/SVTM_Riverina_v1p2.gdb" Riverina_v1p2_Quickview -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.riverina_v1p2_quickview -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -nlt PROMOTE_TO_MULTI
# GDAL command output:
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP, or only make it analyze counter-clock wise parts by setting METHOD=ONLY_CCW if you can assume that the outline of holes is counter-clock wise defined
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 6175.94 seconds (1 hour 42 minutes 56 seconds)
# Results:
# {}
#
# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished
#
#
# QGIS version: 3.20.1-Odense
# QGIS code revision: 2755615b9f
# Qt version: 5.15.2
# Python version: 3.9.5
# GDAL version: 3.2.2
# GEOS version: 3.9.0-CAPI-1.16.2
# PROJ version: Rel. 7.2.1, January 1st, 2021
# PDAL version: 2.2.0 (git-version: Release)
# Processing algorithm…
# Algorithm 'Export to PostgreSQL (available connections)' starting…
#
# GDAL command:
ogr2ogr -progress --config PG_USE_COPY YES -f PostgreSQL "PG:dbname='terroir' host=host_ip_here port=5432 user='username_here' password='password_here' active_schema=tests" -lco DIM=2 "path_here/NSW Govt/VegMaps/vegetationcentwestlachlansvm4468/Vegetation_CentWestLachlanSVM_4468/data/VegData.gdb" CentWestLachSVM_v1p4_PCT_E_4468 -nlt MULTIPOLYGON -lco GEOMETRY_NAME=geom -lco FID=id -nln tests.centwestlach_svm_v1p4_pct_e_4468 -s_srs EPSG:4283 -t_srs EPSG:7855 -a_srs EPSG:7855 -nlt PROMOTE_TO_MULTI
# GDAL command output:
#
# Warning 1: organizePolygons() received a polygon with more than 100 parts. The processing may be really slow. You can skip the processing by setting METHOD=SKIP, or only make it analyze counter-clock wise parts by setting METHOD=ONLY_CCW if you can assume that the outline of holes is counter-clock wise defined
# 0...10...20...30...40...50...60...70...80...90...100 - done.
# Process completed successfully
# Execution completed in 2080.83 seconds (34 minutes 41 seconds)
# Results:
# {}
#
# Loading resulting layers
# Algorithm 'Export to PostgreSQL (available connections)' finished
