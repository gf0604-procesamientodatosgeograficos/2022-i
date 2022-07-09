# (PART) V. Visualización avanzada {-}

# Desarrollo de tableros de control

## Resumen
Los tableros de control son interfaces gráficas que presentan conjuntos de visualizaciones como tablas, gráficos y mapas. El paquete `flexdashboard` de R está orientado a la creación de tableros interactivos mediante R Markdown.

## Trabajo previo

### Lecturas
Moraga, P. (2019). *Geospatial Health Data: Modeling and Visualization with R-INLA and Shiny* (capítulo 12). Chapman & Hall/CRC. https://www.paulamoraga.com/book-geospatial/

## Preparativos

### Instalación y carga de paquetes


```r
# Instalación de flexdashboard
install.packages("flexdashboard")
```


```r
# Carga de flexdashboard
library(flexdashboard)
```

## Tableros de control
Los tableros de control, también llamados tableros de mando, cuadros de mando o, en inglés, *dashboards*, son interfaces gráficas que presentan visualizaciones de datos junto con herramientas para controlarlas (ej. acercamientos, alejamientos, búsquedas, ordenamientos, filtros). Estas visualizaciones pueden incluir tablas, gráficos y mapas, entre otras (ej. [COVID-19 Map - Johns Hopkins Coronavirus Resource Center](https://coronavirus.jhu.edu/map.html)).

## El paquete flexdashboard
[flexdashboard](https://pkgs.rstudio.com/flexdashboard/) es un paquete de R orientado a la creación de tableros interactivos mediante R Markdown. Algunas de sus principales características son:

- Soporta una gran cantidad de componentes tales como tablas, gráficos, mapas, anotaciones de texto, cajas de valores (*value boxes*) e indicadores (*gauges*), entre otros. Algunos de estos componentes están disponibles como [htmlwidgets](https://www.htmlwidgets.org/) (herramientas de JavaScript disponibles en R).
- Permite configuraciones ([*layouts*](https://pkgs.rstudio.com/flexdashboard/articles/layouts.html)) orientados a filas o a columnas. Los componentes que se colocan en estas configuraciones se adaptan a diferentes tamaños de pantalla (ej. dispositivos móviles).
- Soporta el desarrollo de [storyboards](https://pkgs.rstudio.com/flexdashboard/articles/using.html#storyboards), para presentar secuencias de visualizaciones acompañadas de textos explicativos.
- Opcionalmente, puede utilizarse en combinación con [Shiny](https://shiny.rstudio.com/) para añadir interactividad a las visualizaciones.
- Opcionalmente, puede emplear [bslib](https://rstudio.github.io/bslib/) para personalizar colores, tipos de letra y otros aspectos visuales de los tableros.

### Estructura de un documento flexdashboard
Como otros documentos R Markdown, la estructura de un tablero de control flexdashboard se basa en los encabezados Markdown, de la siguente manera: 

- Encabezados de nivel 1: páginas del tablero.
- Encabezados de nivel 2: filas o columnas.
- Encabezados de nivel 3: secciones de una fila o columna en las que se ubican los diferentes componentes (tablas, gráficos, mapas, *value boxes*, anotaciones, etc.) en secciones de código (*chunks*) de R.

### Creación de un documento flexdashboard en RStudio
Puede crearse con la opción de menú: `File - New File - R Markdown - From Template - Flex Dashboard`. El tablero de control resultante está basado en una plantilla y puede modificarse.

## Documentación
Se recomienda leer:

- [Dashboard basics](https://pkgs.rstudio.com/flexdashboard/articles/flexdashboard.html)
- [Using flexdashboard](https://pkgs.rstudio.com/flexdashboard/articles/using.html)
- [Sample layouts](https://pkgs.rstudio.com/flexdashboard/articles/layouts.html)
- [Theming flexdashboard](https://pkgs.rstudio.com/flexdashboard/articles/theme.html)

También es recomendable consultar la [guía de referencia de flexdashboard](https://pkgs.rstudio.com/flexdashboard/reference/).

## Ejemplos
El sitio web de `flexdashboard` contiene enlaces a varios [ejemplos de tableros de control](https://pkgs.rstudio.com/flexdashboard/articles/examples.html).

También puede consultar los siguientes ejemplos desarrollados con algunos de los conjuntos de datos utilizados en clase y su código fuente:

- [Datos de mamíferos de Costa Rica (flexdashboard)](https://gf0604-procesamientodatosgeograficos.github.io/2022-i-mamiferos-flexdashboard/) ([código fuente](https://github.com/gf0604-procesamientodatosgeograficos/2022-i-mamiferos-flexdashboard))
- [Datos de cantones de Costa Rica (flexdashboard)](https://gf0604-procesamientodatosgeograficos.github.io/2022-i-cantones-flexdashboard/) ([código fuente](https://github.com/gf0604-procesamientodatosgeograficos/2022-i-cantones-flexdashboard))

## Ejercicios
1. Desarrolle un tablero de control con datos de cantones de Costa Rica.
    - Cree un repositorio en su cuenta en GitHub, con el nombre `tablero-cantones` y clónelo a su computadora con RStudio.
    - En el directorio del proyecto que acaba de crear, copie el [archivo GeoJSON con los polígonos de los cantones de Costa Rica](datos/ign/delimitacion-territorial-administrativa/cantones.geojson) o su [versión con geometrías simplificadas](datos/ign/delimitacion-territorial-administrativa/cantones_simplificados.geojson).
    - Cree un documento R Markdown correspondiente a un tablero de control y nómbrelo `index.Rmd`.
    - En las secciones del tablero coloque:
        - Una tabla creada con el paquete `DT` que muestre, al menos, las columnas `provincia`, `canton` y `area`.
        - Un mapa creado con el paquete `leaflet` que despliegue una capa base y los polígonos de los cantones.
        - Un gráfico de barras creado con los paquetes `ggplot2` y `plotly` que muestre el área de cada cantón (o de un subconjunto de cantones que quepa en la pantalla).
    - Debe crear las secciones de código necesarias para cargar los paquetes, leer los datos y realizar cualquier transformación requerida.
    - Publique el proyecto como un sitio en GitHub Pages.
    - Ensaye diferentes configuraciones del tablero de control (si es conveniente, agregue más tablas, gráficos y mapas de ejemplo):
        - Cambie la configuración de columnas a filas o viceversa.
        - Use varias páginas para distribuir los componentes.
        - Coloque varios componentes en la misma fila o columna.
        - Utilice [*tabsets*](https://pkgs.rstudio.com/flexdashboard/articles/layouts.html#tabset-column) en filas y columnas.
        - Pruebe otras opciones usadas en los [ejemplos](https://pkgs.rstudio.com/flexdashboard/articles/examples.html) o explicadas en las páginas de documentación mencionadas arriba.
        
2. Desarrolle un tablero de control con datos de distritos de Costa Rica ([geometrías de distritos simplificadas](datos/ign/delimitacion-territorial-administrativa/distritos_simplificados.geojson)), siguiendo los pasos del ejercicio con datos de cantones.
