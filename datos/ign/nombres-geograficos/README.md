Comandos de GDAL/OGR para la descarga de datos:
```shell
# Poblados
ogr2ogr \
  -makevalid \
  poblados.geojson \
  WFS:"https://geos.snitcr.go.cr/be/IGN_NG/wfs?" "IGN_NG:poblados_cr_5k"
```
