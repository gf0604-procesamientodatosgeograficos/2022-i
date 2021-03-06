# Desarrollo de aplicaciones web interactivas

## Resumen
En una aplicación web interactiva, el usuario puede modificar el comportamiento de la aplicación, usualmente mediante una interfaz que le permite realizar operaciones como filtros, búsquedas y ordenamientos, entre otros. `Shiny` es un paquete de R que facilita el desarrollo de este tipo de aplicaciones. Un tablero de control desarrollado en `flexdashboard` puede ser adaptado para que funcione como una aplicación `Shiny`.

## Trabajo previo

### Lecturas
Moraga, P. (2019). *Geospatial Health Data: Modeling and Visualization with R-INLA and Shiny* (capítulos 13 y 14). Chapman & Hall/CRC. https://www.paulamoraga.com/book-geospatial/

Berishvili, N. (2020). Create an Interactive Dashboard with Shiny, Flexdashboard, and Plotly. *Medium*. https://towardsdatascience.com/create-an-interactive-dashboard-with-shiny-flexdashboard-and-plotly-b1f025aebc9c

1littlecoder. (2020). How to Deploy R Shiny App for Free on Shinyapps.io. https://www.youtube.com/watch?v=2QstfyGX4ZU

## Preparativos

### Instalación y carga de paquetes


```r
# Instalación de Shiny
install.packages("shiny")
```


```r
# Carga de Shiny
library(shiny)
```

## Desarrollo de aplicaciones web interactivas mediante Shiny
En una aplicación web interactiva, el usuario puede modificar el comportamiento de la aplicación, usualmente mediante una interfaz que le permite realizar operaciones como filtros, búsquedas y ordenamientos, entre otros, para el caso de una aplicación orientada a la visualización de datos. [Shiny](https://shiny.rstudio.com/) es un paquete de R que facilita el desarrollo de este tipo de aplicaciones.

Las aplicaciones Shiny deben ejecutarse en un [servidor](https://www.rstudio.com/products/shiny/shiny-server/), el cual puede estar ubicado en cualquier computador habilitado para ejecutar código en R como, por ejemplo, la estación de trabajo del programador (esta opción se usa principalmente para efectos de desarrollo y pruebas), un servidor ubicado en la red de una organización o un servidor en la nube (ej. [shinyapps.io](https://www.shinyapps.io/), [RStudio Connect](https://www.rstudio.com/products/connect/)).

Hay varias formas de desarrollar aplicaciones con `Shiny`. En este capítulo se estudiará como hacerlo en un tablero de control desarrollado con `flexdashboard`.

## Shiny y flexdashboard
La adición de componentes de `Shiny` a un tablero de control desarrollado con `flexdashboard`, permite convertir un tablero de control "estático" en un [documento interactivo](https://rmarkdown.rstudio.com/authoring_shiny.html). Para esto, deben ejecutarse los siguientes pasos en el documento R Markdown con el tablero `flexdashboard`:

1. Añadir `runtime: shiny` a la sección de *front matter* del documento (la que está al inicio, con sintaxis YAML).
2. Agregar el atributo `{.sidebar}` a la primera columna del tablero, para que funcione como un contenedor de los controles de entrada.
3. Agregar [controles de entrada (*widgets*)](https://shiny.rstudio.com/gallery/widget-gallery.html) de `Shiny`.
4. Colocar las salidas en funciones tipo `render` (ej. `renderDT()`, `renderPlotly()`, `renderLeaflet()`), para que así respondan dinámicamente a los cambios en las entradas del usuario y que se redimensionen cuando cambia el tamaño de su contenedor.
5. Definir [expresiones reactivas](https://shiny.rstudio.com/tutorial/written-tutorial/lesson6/) para detectar las acciones del usuario final y reflejarlas en las salidas del tablero.

## Documentación
Se recomienda leer:

- [Shiny - Tutorial](https://shiny.rstudio.com/tutorial/)
- [Using shiny with flexdashboard](https://rstudio.github.io/flexdashboard/articles/shiny.html)

También es recomendable consultar la [guía de referencia de Shiny](https://shiny.rstudio.com/reference/shiny/).

## Ejemplos
El sitio web de `Shiny` contiene enlaces a varios [ejemplos de aplicaciones interactivas](https://shiny.rstudio.com/gallery/).

También puede consultar los siguientes ejemplos desarrollados con algunos de los conjuntos de datos utilizados en clase y su código fuente:

- [Datos de cantones de Costa Rica (flexdashboard + Shiny)](https://mfvargas.shinyapps.io/2022-i-cantones-flexdashboard-shiny/) ([código fuente](https://github.com/gf0604-procesamientodatosgeograficos/2022-i-cantones-flexdashboard-shiny))

## Ejercicios
1. En el tablero de datos de distritos que desarrolló en el capítulo anterior:
    - Agregue los siguientes *widgets* de `Shiny`:
        - Una lista de selección de provincia.
        - Una lista de selección de cantón.
    - Publíquelo en [shinyapps.io](https://www.shinyapps.io/). Puede consultar el video [How to Deploy R Shiny App for Free on Shinyapps.io](https://www.youtube.com/watch?v=2QstfyGX4ZU).
