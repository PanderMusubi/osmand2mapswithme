if [ $# -ne 2 ]; then
	echo 'ERROR: osmand2mapswithme favourites.gpx My\ Places.kml'
	exit 1
fi
gpsbabel -i gpx -f $1 -o kml -F tmp.kml
datetime=`date +%Y-%m-%dT%H:%M:%SZ`
cat header > "$2"
tail -n +40 tmp.kml | \
sed -e 's/    <Folder>//' | \
sed -e 's/    <\/Folder>//' | \
sed -e 's/#waypoint/#placemark-red/g' | \
sed -e 's/<\/name>$/<\/name>\n        <TimeStamp><when>'$datetime'<\/when><\/TimeStamp>/g' | \
sed -e 's/<\/Point>$/<\/Point>\n        <ExtendedData xmlns:mwm="http:\/\/mapswith.me">\n          <mwm:scale>18<\/mwm:scale>\n        <\/ExtendedData>/g' >> "$2"
#rm -f tmp.kml
