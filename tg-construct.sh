case $1 in
	1) geo='--min-lon=151.3 --max-lon=152.2 --min-lat=6.8 --max-lat=7.7';; #Chuuk
	
	2) geo='--min-lon=137.5 --max-lon=163.3 --min-lat=1.0 --max-lat=10.2';; #whole Micronesia
	
	3) geo='--min-lon=163.3 --max-lon=172.5 --min-lat=4.5 --max-lat=15.0';; #whole Marshall Islands
	
	4) geo='--min-lon=166.8 --max-lon=167.0 --min-lat=-0.6 --max-lat=-0.4';; #Nauru
	
	5) geo='--min-lon=166.8 --max-lon=180.0 --min-lat=-9.6 --max-lat=3.5';; #Nauru, Kiribati (western part) and Tuvalu
	
	6) geo='--min-lon=-180 --max-lon=-154.5 --min-lat=-15.0 --max-lat=6.5';; #Kiribati (eastern part)
	
	7) geo='--min-lon=-165 --max-lon=-127 --min-lat=-28.0 --max-lat=-13.7';; #Tahiti, French Polynesia
	
	8) geo='--min-lon=-159.9 --max-lon=-159.6 --min-lat=-21.3 --max-lat=-21.1';; #only Rarotonga
	
	9) geo='--min-lon=-149.7 --max-lon=-149.5 --min-lat=-17.8 --max-lat=-17.5';; #only Papeete, Tahiti
	#9) geo='--min-lon=-149.7 --max-lon=-149.0 --min-lat=-18.0 --max-lat=-17.5';; #only Papeete, Tahiti
	
esac
echo $1
echo $geo
if [ ! -z "$2" ]  && [ $2 = "light" ]
then
	echo "Light built: Not building Asphalt, Railroad, Strem";
	arg="";
else
	arg="Asphalt Railroad Stream";
fi
tg-construct --work-dir=./work --output-dir=./output/Terrain `echo $geo` --threads=3 --priorities=priorities.txt AirportArea SRTM-1 AirportObj Default Ocean Hole Freeway Road Road-Motorway Road-Trunk Road-Residential Road-Primary Road-Secondary Road-Tertiary Road-Service Road-Pedestrian Road-Steps Road-Unclassified Airport Pond Lake DryLake Reservoir IntermittentLake IntermittentStream Watercourse Canal Cliffs Glacier PackIce PolarIce Ocean Estuary Urban SubUrban Town Fishing Construction Industrial Port Dump FloodLand Lagoon Bog Marsh SaltMarsh Sand Saline Littoral Dirt Rock Lava OpenMining BuiltUpCover Transport Cemetery DryCrop IrrCrop Rice MixedCrop Vineyard Bamboo Mangrove ComplexCrop NaturalCrop CropGrass CropWood AgroForest Olives GolfCourse Greenspace GrassCover Grassland ScrubCover Scrub ShrubGrassCover SavannaCover Orchard DeciduousForest DeciduousBroadCover EvergreenForest EvergreenBroadCover MixedForest RainForest BarrenCover HerbTundra Sclerophyllous Heath Burnt SnowCover Island Default Void Null Unknown River $arg
