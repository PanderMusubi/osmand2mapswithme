# osmand2mapswithme

Convert favourites.gpx from OsmAnd to My Places.kml for MapsWithMe


## Get favourites.gpx

Syncthing can be used to retrieve `favourites.gpx` from your mobile device at `/storage/emulated/0/Android/data/net.osmand.plus/files` by using a `.stignore` file with the content

    !/favourites.gpx
    *


## Convert

Run `./osmand2mapswithme favourites.gpx My\ Places.kml`


## Push My Places.kml

Syncthing can be used to upload `My Places.kml` to your mobile device at `/storage/emulated/0/MapsWithMe` by using a `.stignore` file with the content

    !/My Places.kml
    *

