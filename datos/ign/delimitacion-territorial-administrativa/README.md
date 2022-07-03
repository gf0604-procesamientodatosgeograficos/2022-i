# Delimitación territorial administrativa

## Geometrías sin simplificar

Comandos de GDAL/OGR:

```shell
# Provincias
ogr2ogr \
  -makevalid \
  provincias.geojson \
  WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limiteprovincial_5k"
    
# Cantones
ogr2ogr \
  -makevalid \
  cantones.geojson \
  WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
    
# Distritos
ogr2ogr \
  -makevalid \
  distritos.geojson \
  WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitedistrital_5k"
```

## Geometrías simplificadas

### Provincias

Código en R:

```r
# Paquetes
library(dplyr)
library(sf)
library(rmapshaper)
library(leaflet)

# Directorio de trabajo (debe usarse una ruta existente)
setwd("datos/ign/delimitacion-territorial-administrativa")
getwd()

# Se cargan primero las geometrías sin simplificar del IGN
provincias <-
  st_read(
    dsn = "provincias.geojson",
    quiet = TRUE
  )
  
# Simplificación con ms_simplify() con preservación de topología
provincias_simplificado <-
  provincias %>%
  ms_simplify(keep = 0.05, keep_shapes = TRUE)

# Visualización
leaflet() %>%
  addTiles(group = "OpenStreetMap") %>%
  addProviderTiles(provider = providers$Stamen.TonerLite, group = "Stamen") %>%
  addPolygons(
    data = st_transform(provincias, 4326),
    color = "red",
    weight = 2.0,
    group = "Provincias sin simplificar"
  ) %>%
  addPolygons(
    data = st_transform(provincias_simplificado, 4326),
    color = "black",
    weight = 2.0,
    group = "Provincias simplificadas"
  ) %>%
  addLayersControl(
    baseGroups = c("OpenStreetMap", "Stamen"),
    overlayGroups = c("Provincias sin simplificar", "Provincias simplificadas")
  ) %>%
  addScaleBar(position = "bottomright", options = scaleBarOptions(imperial = FALSE))
  
# Escritura en un archivo GeoJSON
st_write(
  provincias_simplificado, 
  "provincias_simplificadas.geojson"
)
```

### Cantones

Código en R:

```r
# Paquetes
library(dplyr)
library(sf)
library(rmapshaper)
library(leaflet)

# Directorio de trabajo (debe usarse una ruta existente)
setwd("datos/ign/delimitacion-territorial-administrativa")
getwd()

# Se cargan primero las geometrías sin simplificar del IGN
cantones <-
  st_read(
    dsn = "cantones.geojson",
    quiet = TRUE
  )
  
# Simplificación con ms_simplify() con preservación de topología
cantones_simplificado <-
  cantones %>%
  ms_simplify(keep = 0.05, keep_shapes = TRUE)

# Visualización
leaflet() %>%
  addTiles(group = "OpenStreetMap") %>%
  addProviderTiles(provider = providers$Stamen.TonerLite, group = "Stamen") %>%
  addPolygons(
    data = st_transform(cantones, 4326),
    color = "red",
    weight = 2.0,
    group = "Cantones sin simplificar"
  ) %>%
  addPolygons(
    data = st_transform(cantones_simplificado, 4326),
    color = "black",
    weight = 2.0,
    group = "Cantones simplificados"
  ) %>%
  addLayersControl(
    baseGroups = c("OpenStreetMap", "Stamen"),
    overlayGroups = c("Cantones sin simplificar", "Cantones simplificados")
  ) %>%
  addScaleBar(position = "bottomright", options = scaleBarOptions(imperial = FALSE))
  
# Escritura en un archivo GeoJSON
st_write(
  cantones_simplificado, 
  "cantones_simplificados.geojson"
)
```

### Distritos

Código en R:

```r
# Paquetes
library(dplyr)
library(sf)
library(rmapshaper)
library(leaflet)

# Directorio de trabajo (debe usarse una ruta existente)
setwd("datos/ign/delimitacion-territorial-administrativa")
getwd()

# Se cargan primero las geometrías sin simplificar del IGN
distritos <-
  st_read(
    dsn = "distritos.geojson",
    quiet = TRUE
  )
  
# Simplificación con ms_simplify() con preservación de topología
distritos_simplificado <-
  distritos %>%
  ms_simplify(keep = 0.05, keep_shapes = TRUE)

# Visualización
leaflet() %>%
  addTiles(group = "OpenStreetMap") %>%
  addProviderTiles(provider = providers$Stamen.TonerLite, group = "Stamen") %>%
  addPolygons(
    data = st_transform(distritos, 4326),
    color = "red",
    weight = 2.0,
    group = "Distritos sin simplificar"
  ) %>%
  addPolygons(
    data = st_transform(distritos_simplificado, 4326),
    color = "black",
    weight = 2.0,
    group = "Distritos simplificados"
  ) %>%
  addLayersControl(
    baseGroups = c("OpenStreetMap", "Stamen"),
    overlayGroups = c("Distritos sin simplificar", "Distritos simplificados")
  ) %>%
  addScaleBar(position = "bottomright", options = scaleBarOptions(imperial = FALSE))
  
# Escritura en un archivo GeoJSON
st_write(
  distritos_simplificado, 
  "distritos_simplificados.geojson"
)
```
