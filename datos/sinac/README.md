Comandos de GDAL/OGR para la descarga de datos:
```shell
# Áreas silvestres protegidas
ogr2ogr \
  -makevalid \
  areas-silvestres-protegidas.geojson \
  WFS:"http://geos1pne.sirefor.go.cr/wfs" "PNE:areas_silvestres_protegidas"
```
