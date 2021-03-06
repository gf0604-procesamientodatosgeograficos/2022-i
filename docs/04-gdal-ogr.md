# Ejemplo de interfaz de línea de comandos - GDAL/OGR: biblioteca para lectura y escritura de datos geoespaciales

## Resumen
Se introduce la biblioteca GDAL/OGR para lectura y escritura de datos geoespaciales y se muestran varios ejemplos de su uso a través de los programas para la línea de comandos del sistema operativo.

## Trabajo previo

### Lecturas
Pebesma, E., Wagner, W., Verbesselt, J., Goor, E., Briese, C., & Neteler, M. (2016). *OpenEO: a GDAL for Earth Observation Analytics*. https://r-spatial.org/2016/11/29/openeo.html

### Tutoriales
Gandhi, U. (2020). Mastering GDAL Tools. *Spatial Thoughts*. https://spatialthoughts.com/courses/mastering-gdal-tools/

## Descripción general
[Geospatial Data Abstraction Library (GDAL)](https://gdal.org/) es una biblioteca para leer y escribir datos geoespaciales en formatos [raster](https://gdal.org/drivers/raster/) y [vectoriales](https://gdal.org/drivers/vector/). GDAL se refiere a la funcionalidad para datos raster y OGR (sigla antes usada para *OpenGIS Simple Features Reference Implementation*) a la correspondiente a datos vectoriales. En ocasiones, se utiliza la sigla GDAL (sin OGR) para referirse a la funcionalidad para ambos modelos de datos. GDAL es distribuida por la [Open Source Geospatial Foundation (OSGeo)](https://www.osgeo.org/) con una [licencia X/MIT](https://gdal.org/license.html#license).

GDAL/OGR cuenta con un único [modelo abstracto de datos raster](https://gdal.org/user/raster_data_model.html) y un único [modelo abstracto de datos vectoriales](https://gdal.org/user/vector_data_model.html), lo que permite programar aplicaciones geoespaciales sin tener que ocuparse de las particularidades de cada formato que se utilice (GeoTIFF, NetCDF, ESRI Shapefile, GeoPackage, GeoJSON, etc.).

A pesar de que GDAL/OGR está programada en C/C++, cuenta con una interfaz de programación de aplicaciones (API, en inglés, *Application Programming Interface*) para varios lenguajes de programación, incluyendo [C](https://gdal.org/api/index.html#c-api), [C++](https://gdal.org/api/index.html#id3), [Python](https://gdal.org/python/index.html) y [Java](https://gdal.org/java/overview-summary.html). Además, ofrece un conjunto de [programas para la línea de comandos del sistema operativo](https://gdal.org/programs/) cuyas [distribuciones binarias](https://gdal.org/download.html#binaries) están disponibles para varios sistemas operativos, incluyendo Windows, macOS y Linux. Estas API y los programas también están incluídos en la plataforma de ciencia de datos [Anaconda](https://www.anaconda.com/), la cual puede instalarse en todos los sistemas operativos mencionados.

## Programas para la línea de comandos del sistema operativo
Los [programas de GDAL/OGR para la línea de comandos del sistema operativo](https://gdal.org/programs/) permiten ejecutar tareas de geoprocesamiento y de conversión entre formatos geoespaciales sin utilizar una interfaz gráfica o un lenguaje de programación.

### Instalación
En el sitio web de GDAL se describen varias opciones para su [descarga e instalación](https://gdal.org/download.html), incluyendo [archivos binarios ejecutables para varias plataformas](https://gdal.org/download.html#binaries).

En el caso del sistema operativo Windows, estos programas se incluyen en la aplicación [OSGeo4W](https://trac.osgeo.org/osgeo4w/), la cual puede instalarse junto con el sistema de información geográfica de escritorio [QGIS](https://qgis.org/). Se recomienda usar el [instalador de red OSGeo4W](https://download.osgeo.org/osgeo4w/v2/osgeo4w-setup.exe).

### Consideraciones generales
Los programas de GDAL comparten una serie de [opciones comunes para datos raster](https://gdal.org/programs/raster_common_options.html#raster-common-options) y de [opciones comunes para datos vectoriales](https://gdal.org/programs/vector_common_options.html) que pueden visualizarse con la opción `-- help-general`. Por ejemplo:

```shell
ogrinfo --help-general
```
```
Generic GDAL utility command options:
  --version: report version of GDAL in use.
  --license: report GDAL license info.
  --formats: report all configured format drivers.
  --format [format]: details of one format.
  --optfile filename: expand an option file into the argument list.
  --config key value: set system configuration option.
  --debug [on/off/value]: set debug level.
  --pause: wait for user input, time to attach debugger
  --locale [locale]: install locale for debugging (i.e. en_US.UTF-8)
  --help-general: report detailed help on general options.
```
  
Para obtener ayuda acerca de un comando particular, puede usarse la opción `-- help`. Por ejemplo:

```shell
ogrinfo --help
```
```
Usage: ogrinfo [--help-general] [-ro] [-q] [-where restricted_where|@filename]
               [-spat xmin ymin xmax ymax] [-geomfield field] [-fid fid]
               [-sql statement|@filename] [-dialect sql_dialect] [-al] [-rl] [-so] [-fields={YES/NO}]
               [-geom={YES/NO/SUMMARY}] [[-oo NAME=VALUE] ...]
               [-nomd] [-listmdd] [-mdd domain|`all`]*
               [-nocount] [-noextent] [-nogeomtype] [-wkt_format WKT1|WKT2|...]
               [-fielddomain name]
               datasource_name [layer [layer ...]]
```

### Ejemplos de uso
En esta sección, se presentan ejemplos de uso de los programas, tanto para datos vectoriales como para datos raster.

#### Programas para datos vectoriales

##### ogrinfo
El programa [ogrinfo](https://gdal.org/programs/ogrinfo.html) despliega información acerca de una fuente de datos vectoriales.

Los siguientes comandos despliegan información sobre la [capa de países](https://www.naturalearthdata.com/downloads/110m-cultural-vectors/110m-admin-0-countries/) de [Natural Earth](https://www.naturalearthdata.com/), tanto para el formato comprimido (ZIP) como para el formato shapefile (SHP). En el caso comprimido, note el uso de [/vsizip/](https://gdal.org/user/virtual_file_systems.html), para sistemas de archivos virtuales.

- Cree una nueva carpeta (ej. ejemplos-uso-gdal) para almacenar los archivos con los que trabajará.
- Descargue en la nueva carpeta la capa de paises desde la dirección [https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip](https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip).
- Descomprima el archivo ZIP (no lo borre).
- Con una herramienta de escritorio (ej. QGIS), visualice tanto el archivo ZIP como el SHP.
- Desde una interfaz de línea de comandos (ej. OSGeo4W Shell), ubíquese en la carpeta que creó y ejecute los siguientes comandos para obtener información sobre ambos archivos:

```shell
 # Información sobre la capa comprimida en formato ZIP
ogrinfo -al -so /vsizip/ne_110m_admin_0_countries.zip

# Información sobre la capa descomprimida en formato shapefile
ogrinfo -al -so ne_110m_admin_0_countries.shp
```

- ¿Qué información despliegan ambos comandos? ¿Qué efectos produce el uso de las opciones `-al` y `-so`? Revise la documentación sobre estas opciones y pruebe los comandos omitiendo cada una y ambas.
- Ejecute los siguientes comandos para filtrar registros de acuerdo con expresiones lógicas (*booleana*).

```shell
# Registros (países y otros territorios) del continente 'Oceania' (se omite el campo de la geometría)
ogrinfo -al -where "CONTINENT='Oceania'" -geom=NO ne_110m_admin_0_countries.shp

# Registros de Oceanía de tipo país ('Country')
ogrinfo -al -where "CONTINENT='Oceania' AND TYPE='Country'" -geom=NO ne_110m_admin_0_countries.shp
```

- Note el uso del operador `AND` (y), el cuál es un operador lógico, como también lo son el `OR` (o) y el `NOT` (no).

##### ogr2ogr
El programa [ogr2ogr](https://gdal.org/programs/ogr2ogr.html) realiza conversiones entre formatos de fuentes de datos vectoriales. A la vez, puede ejecutar otras operaciones como selección de atributos y geometrías, filtrado por criterios espaciales y no espaciales, reproyección y validación de geometrías, entre otras.

- Ejecute el siguiente comando para desplegar la lista de formatos (*drivers*) vectoriales soportados por OGR:
```shell
# Despliegue de la lista de formatos vectoriales soportados por GDAL/OGR
ogr2ogr --formats
```
```
Supported Formats:
  FITS -raster,vector- (rw+): Flexible Image Transport System
  PCIDSK -raster,vector- (rw+v): PCIDSK Database File
  netCDF -raster,multidimensional raster,vector- (rw+vs): Network Common Data Format
  PDS4 -raster,vector- (rw+vs): NASA Planetary Data System 4
  VICAR -raster,vector- (rw+v): MIPL VICAR file
  JP2OpenJPEG -raster,vector- (rwv): JPEG-2000 driver based on OpenJPEG library
  PDF -raster,vector- (rw+vs): Geospatial PDF
  MBTiles -raster,vector- (rw+v): MBTiles
  BAG -raster,multidimensional raster,vector- (rw+v): Bathymetry Attributed Grid
  EEDA -vector- (ro): Earth Engine Data API
  OGCAPI -raster,vector- (rov): OGCAPI
  ESRI Shapefile -vector- (rw+v): ESRI Shapefile
...
```

- Ejecute los siguientes comandos para convertir la capa de países (en SHP) a otros formatos y cambiar su nombre:
```shell
# Conversión de SHP a GeoJSON
ogr2ogr paises.geojson ne_110m_admin_0_countries.shp

# Conversión de SHP a GeoPackage
ogr2ogr paises.gpkg ne_110m_admin_0_countries.shp
```

- Ejecute el siguiente comando para desplegar la lista de capas en el WFS "IGN Cartografía 1:5mil" del Instituto Geográfico Nacional (IGN):
```shell
# Lista de capas en el WFS "IGN Cartografía 1:5mil"
ogrinfo WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs"
```
```
INFO: Open of `WFS:http://geos.snitcr.go.cr/be/IGN_5/wfs'
      using driver `WFS' successful.
Metadata:
  ABSTRACT=This is the reference implementation of WFS 1.0.0 and WFS 1.1.0, supports all WFS operations including Transaction.
  PROVIDER_NAME=The Ancient Geographers
  TITLE=SNIT Web Feature Service
1: IGN_5:forestal2017_5k (title: ARBOLES 2017 1:5MIL)
2: IGN_5:indice_5000 (title: Cobertura Ortofoto 1:5mil)
3: IGN_5:cultivos2017_5k (title: Cultivos 2017 1:5mil)
4: IGN_5:curvas_5000 (title: Curvas de Nivel 10m (5000))
5: IGN_5:delimitacion2017_5k (title: Delimitación territorial 2017 1:5mil)
6: IGN_5:edificaciones2017_5k (title: Edificaciones 2017 1:5mil)
7: IGN_5:hidrografia_5000 (title: Hidrografía 1:5mil)
8: IGN_5:limitecantonal_5k (title: Límite Cantonal 1:5mil)
9: IGN_5:limitedistrital_5k (title: Límite Distrital 1:5mil)
10: IGN_5:limiteprovincial_5k (title: Límite Provincial 1:5mil)
11: IGN_5:linea_costa_5000 (title: Línea de Costa 1:5mil)
12: IGN_5:pastos2017_5k (title: Pastos 2017 1:5mil)
13: IGN_5:urbano_5000 (title: Urbano 1:5mil)
14: IGN_5:vias_5000 (title: Vías 1:5mil)
```

- Ejecute el siguiente comando para descargar la capa de cantones del WFS "IGN Cartografía 1:5mil" del Instituto Geográfico Nacional (IGN) en formato GeoPackage:
```shell
# Descarga y validación de geometrías
ogr2ogr -makevalid cantones.gpkg WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"

# Descarga, validación de geometrías y reproyección a WGS84
ogr2ogr -t_srs EPSG:4326 -makevalid cantones-wgs84.gpkg WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
```

### Ejercicios
1. De la capa de países de Natural Earth, extraiga los registros con población estimada superior a mil millones. En la capa resultante, incluya solamente los campos de nombre del país en español y población estimada. ¿Cuál opción debe utilizar para especificar los campos que desea incluir en el archivo de salida?

```shell
# La opción -select especifica la lista de campos que se copian al archivo de salida
ogr2ogr -select "NAME_ES, POP_EST" -where "POP_EST >= 1000000000" paises-muy-poblados.gpkg ne_110m_admin_0_countries.shp
```

2. De la capa de cantones de Costa Rica, extraiga en un archivo GeoJSON los cantones de las provincia de Guanacaste, Puntarenas y Limón.

```shell
ogr2ogr -where "provincia = 'Guanacaste' OR provincia = 'Puntarenas' OR provincia = 'Limón'" cantones-guanacaste-puntarenas-limon.geojson WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
```

3. De la capa de cantones de Costa Rica, extraiga en un archivo GeoJSON los cantones con área mayor o igual a 2000 km2.

```shell
ogr2ogr -where "area >= 2000" cantones-grandes.geojson WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
```

4. De la capa de cantones de Costa Rica, extraiga en un archivo GeoJSON los cantones con área mayor o igual a 2000 km2 de la provincia de Limón.

```shell
# El operador lógico AND se utiliza para buscar los registros que cumplen dos condiciones simultáneamente
ogr2ogr -where "area >= 2000 AND provincia = 'Limón'" cantones-grandes-limon.geojson WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
```

5. De la capa de cantones de Costa Rica, extraiga en un archivo GeoJSON los cantones con área mayor o igual a 2000 km2 de las provincias de Guanacaste, Puntarenas y Limón.

```shell
# En este caso, deben utilizarse paréntesis para alterar el orden de precedencia de los operadores lógicos AND y OR
ogr2ogr -where "area >= 2000 AND (provincia = 'Guanacaste' OR provincia = 'Puntarenas' OR provincia = 'Limón')" cantones-grandes-guanacaste-puntarenas-limon.geojson WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
```

6. De la capa de cantones de Costa Rica, extraiga en un archivo GeoPackage, los cantones de Guanacaste, con la excepción de Liberia.

```shell
# El operador NOT se utiliza para excluir el cantón de Liberia.
ogr2ogr -where "provincia = 'Guanacaste' AND NOT(canton = 'Liberia')" cantones-guanacaste-excepto-liberia.gpkg WFS:"http://geos.snitcr.go.cr/be/IGN_5/wfs" "IGN_5:limitecantonal_5k"
```

<!-- #### Programas para datos raster -->

<!-- ##### gdalinfo -->
<!-- El programa [gdalinfo](https://gdal.org/programs/gdalinfo.html) despliega información acerca de una fuente de datos raster. -->

<!-- Los siguientes comandos trabajan con la capa global de altitud de la base de datos climática [WorldClim](https://www.worldclim.org/). -->

<!-- - Descargue en su carpeta de trabajo la capa de altitud desde la dirección [https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_30s_elev.zip](https://biogeo.ucdavis.edu/data/worldclim/v2.1/base/wc2.1_30s_elev.zip). -->
<!-- - Descomprima el archivo ZIP. -->
<!-- - Con una herramienta de escritorio (ej. QGIS), visualice la capa descomprimida. -->
<!-- - Desde una interfaz de línea de comandos (ej. OSGeo4W Shell), ubíquese en la carpeta que creó y ejecute los siguientes comandos para obtener información sobre la capa: -->

<!-- ```shell -->
<!-- # Información sobre la capa -->
<!-- gdalinfo -stats wc2.1_30s_elev.tif -->
<!-- ``` -->
<!-- ``` -->
<!-- Driver: GTiff/GeoTIFF -->
<!-- Files: wc2.1_30s_elev.tif -->
<!-- Size is 43200, 21600 -->
<!-- Coordinate System is: -->
<!-- GEOGCRS["WGS 84", -->
<!--     DATUM["World Geodetic System 1984", -->
<!--         ELLIPSOID["WGS 84",6378137,298.257223563, -->
<!--             LENGTHUNIT["metre",1]]], -->
<!--     PRIMEM["Greenwich",0, -->
<!--         ANGLEUNIT["degree",0.0174532925199433]], -->
<!--     CS[ellipsoidal,2], -->
<!--         AXIS["geodetic latitude (Lat)",north, -->
<!--             ORDER[1], -->
<!--             ANGLEUNIT["degree",0.0174532925199433]], -->
<!--         AXIS["geodetic longitude (Lon)",east, -->
<!--             ORDER[2], -->
<!--             ANGLEUNIT["degree",0.0174532925199433]], -->
<!--     ID["EPSG",4326]] -->
<!-- Data axis to CRS axis mapping: 2,1 -->
<!-- Origin = (-180.000000000000000,90.000000000000000) -->
<!-- Pixel Size = (0.008333333333333,-0.008333333333333) -->
<!-- Metadata: -->
<!--   AREA_OR_POINT=Area -->
<!-- Image Structure Metadata: -->
<!--   COMPRESSION=DEFLATE -->
<!--   INTERLEAVE=BAND -->
<!-- Corner Coordinates: -->
<!-- Upper Left  (-180.0000000,  90.0000000) (180d 0' 0.00"W, 90d 0' 0.00"N) -->
<!-- Lower Left  (-180.0000000, -90.0000000) (180d 0' 0.00"W, 90d 0' 0.00"S) -->
<!-- Upper Right ( 180.0000000,  90.0000000) (180d 0' 0.00"E, 90d 0' 0.00"N) -->
<!-- Lower Right ( 180.0000000, -90.0000000) (180d 0' 0.00"E, 90d 0' 0.00"S) -->
<!-- Center      (   0.0000000,   0.0000000) (  0d 0' 0.01"E,  0d 0' 0.01"N) -->
<!-- Band 1 Block=43200x1 Type=Int16, ColorInterp=Gray -->
<!--   Min=-415.000 Max=8424.000  -->
<!--   Minimum=-415.000, Maximum=8424.000, Mean=nan, StdDev=nan -->
<!--   NoData Value=-32768 -->
<!--   Metadata: -->
<!--     STATISTICS_MAXIMUM=8424 -->
<!--     STATISTICS_MEAN=1.#SNAN -->
<!--     STATISTICS_MINIMUM=-415 -->
<!--     STATISTICS_STDDEV=1.#SNAN -->
<!-- ``` -->

<!-- ##### gdalwarp -->
<!-- El programa [gdalwarp](https://gdal.org/programs/gdalwarp.html) se utiliza para reproyectar y transformar datos raster. -->

<!-- - Recorte la capa raster de altitud global con el contorno de la capa de cantones de Costa Rica: -->

<!-- ```shell -->
<!-- # Recorte de la capa raster de altitud global con el contorno de la capa de cantones de Costa Rica -->
<!-- gdalwarp \ -->
<!--   -dstnodata -9999 \ -->
<!--   -tr 0.00833333 0.00833333 -q \ -->
<!--   -cutline 'cantones-wgs84.gpkg' -crop_to_cutline wc2.1_30s_elev.tif altitud-cr.tif -->

<!-- # Información sobre la capa de altitud de Costa Rica -->
<!-- gdalinfo -stats altitud-cr.tif -->
<!-- ``` -->

## Recursos de interés
Codecademy. (s. f.). *Command Line Tutorial: Learn The Command Line*. Codecademy. Recuperado 19 de marzo de 2022, de https://www.codecademy.com/learn/learn-the-command-line

*SS64 Command line reference*. (s. f.). Recuperado 3 de abril de 2022, de https://ss64.com/
