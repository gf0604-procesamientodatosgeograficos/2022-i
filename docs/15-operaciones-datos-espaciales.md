# Operaciones con datos espaciales

## Resumen
Las operaciones con atributos en datos vectoriales incluyen creación de subconjuntos espaciales, agregación espacial, cruce de datos espaciales y relaciones de distancia, entre otras. Estas operaciones pueden ejecutarse con funciones del paquete base de R o con las de paquetes de Tidyverse. Por su parte, las operaciones con atributos en datos raster incluyen creación de subconjuntos espaciales y álgebra de mapas, entre otras.

## Trabajo previo

### Lecturas
Lovelace, R., Nowosad, J., & Münchow, J. (2019). *Geocomputation with R* (capítulo 4). CRC Press. https://geocompr.robinlovelace.net/

## Preparativos

### Carga de paquetes


```r
# Carga de paquetes

library(dplyr) # transformación de datos
library(sf) # manejo de datos vectoriales
library(terra) # manejo de datos raster
```

Datos de ejemplo de Lovelace et al.:


```r
# Instalación de paquete de datos de ejemplo de Lovelace et al.

install.packages("spData")
```


```r
# Carga de paquete de datos de ejemplo de Lovelace et al.

library(spData)
```

### Conjuntos de datos para ejemplos

#### Provincias de Costa Rica
Es un [archivo GeoJSON con los polígonos de las provincias de Costa Rica](datos/ign/delimitacion-territorial-administrativa/provincias.geojson). Este archivo proviene de un [geoservicio de tipo Web Feature Service (WFS)](http://geos.snitcr.go.cr/be/IGN_5/wfs) publicado por el Instituto Geográfico Nacional (IGN). Se transforma a WGS84 para combinarlo más fácilmente con otros conjuntos de datos.


```r
# Lectura y visualización de datos geoespaciales de provincias

# Lectura
provincias <-
  st_read(
    dsn = "datos/ign/delimitacion-territorial-administrativa/provincias.geojson",
    quiet = TRUE
  ) %>%
  st_transform(4326) # transformación a WGS84

# Visualización en un mapa
plot(
  provincias$geometry,
  extent = st_bbox(c(xmin = -86.0, xmax = -82.3, ymin = 8.0, ymax = 11.3)),
  main = "Provincias de Costa Rica",
  axes = TRUE,
  graticule = TRUE
)
```

<img src="15-operaciones-datos-espaciales_files/figure-html/carga-datos-provincias-1.png" width="672" />


## Introducción
Esta lección brinda una visión general de las operaciones espaciales en datos vectoriales implementadas en el paquete `sf` y en datos raster implementadas en el paquete `terra`.

## Datos vectoriales
Las operaciones espaciales en datos vectoriales incluyen:

- Creación de subconjuntos espaciales (*spatial subsetting*).  
- Cruce de datos espaciales (*spatial joining*).
- Agregación espacial (*spatial aggregation*).
- Relaciones de distancia. 

Seguidamente, se explicará como maneja estas operaciones el paquete `sf`.

## Manejo de datos espaciales con el paquete sf

## Datos raster
Las operaciones espaciales en datos raster incluyen:

- .  
- .  

Seguidamente, se explicará como maneja estas operaciones el paquete `terra`.

## Manejo de datos espaciales con el paquete terra