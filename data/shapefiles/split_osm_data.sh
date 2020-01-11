mkdir osm_motorway osm_trunk osm_primary osm_secondary osm_tertiary osm_stream osm_river osm_railway osm_industrial osm_town osm_forest osm_golfcourse osm_commercial osm_sand osm_construction osm_lake osm_meadow osm_scrub osm_landmass osm_dump osm_grassland osm_lava osm_rock osm_airport osm_wetland osm_reef
split_osm() {
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'motorway' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_motorway/osm_motorway_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'trunk' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_trunk/osm_trunk_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'motorway_link' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_primary/osm_motorwaylink_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'trunk_link' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_primary/osm_trunklink_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'primary' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_primary/osm_primary_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'primarylink' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_secondary/osm_primary_link_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'secondary' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_secondary/osm_secondary_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'secondary_link' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_tertiary/osm_secondarylink_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "highway = 'tertiary' AND NOT other_tags LIKE '%bridge_=>_yes%' AND NOT other_tags LIKE '%tunnel_=>_yes%'" osm_tertiary/osm_tertiary_$1.shp "osm_"$1/$1"_lines.shp"


	ogr2ogr -f "ESRI Shapefile"  -where "waterway = 'stream'" osm_stream/osm_stream_$1.shp "osm_"$1/$1"_lines.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "waterway = 'river'" osm_river/osm_river_$1.shp "osm_"$1/$1"_lines.shp"

	ogr2ogr -f "ESRI Shapefile"  -where "other_tags LIKE '%railway%'" osm_railway/osm_railway_$1.shp "osm_"$1/$1"_lines.shp"

	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'industrial'" osm_industrial/osm_industrial_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'commercial'" osm_commercial/osm_commercial_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'residential'" osm_town/osm_town_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'forest'" osm_forest/osm_forest_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'wood'" osm_forest/osm_forest_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'wetland'" osm_wetland/osm_wetland_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "leisure = 'golf_course'" osm_golfcourse/osm_golfcourse_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'beach'" osm_sand/osm_beach_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'construction'" osm_construction/osm_costruction_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'water'" osm_lake/osm_lake_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'meadow'" osm_meadow/osm_meadow_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "landuse = 'landfill'" osm_dump/osm_landfill_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'scrub'" osm_scrub/osm_scrub_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'bare_rock'" osm_rock/osm_barerock_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'grassland'" osm_grassland/osm_grassland_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'lava'" osm_lava/osm_lava_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "aeroway = 'aerodrome'" osm_airport/osm_airport_$1.shp "osm_"$1/$1"_polygons.shp"
	ogr2ogr -f "ESRI Shapefile"  -where "natural = 'reef'" osm_reef/osm_reef_$1.shp "osm_"$1/$1"_polygons.shp"
}

if [ -z "$1" ]
then
	for i in 'micronesia' 'marshall' 'coll1' 'coll2'
	do
		split_osm $i;
	done
else
	split_osm $1;
fi

# OR ( boundary = 'administrative' AND admin_leve = '8' AND NOT (other_tags LIKE '%maritime_=>_yes%') )
