# (PART) III. Graficación estadística en R {-}

# Paquetes de R para graficación estadística

## Resumen
R proporciona una gran cantidad de funciones para la elaboración de gráficos estadísticos. En este capítulo, se describen algunos de los paquetes que contienen estas funciones.

## Paquetes
Se presentan ejemplos de los paquetes `graphics`, `ggplot2` y `plotly`. 

- [graphics](http://search.r-project.org/R/library/graphics/html/graphics-package.html): forma parte de la instalación base de R. Es muy versátil y permite construir una gran cantidad de tipos de gráficos. Sin embargo, estos graficos son estáticos y no ofrecen posibilidades de interacción con el usuario.
- [ggplot2](https://ggplot2.tidyverse.org/): es un sistema para la creación declarativa de gráficos, basado en el libro [*The Grammar of Graphics*, de Wilkinson et al.](https://www.springer.com/gp/book/9780387245447). El programador proporciona los datos, indica cuales variables mapear a las propiedades visuales (estéticas o *aesthetics*) de las geometrías y `ggplot2` trata de encargarse del resto de los detalles.
- [plotly R](https://plotly.com/r/): es una biblioteca para gráficos interactivos que forma parte de la familia de [Plotly](https://plotly.com/), la cual incluye bibliotecas para otros lenguajes como JavaScript, Python, Julia, F# y MATLAB. Es adecuada, por ejemplo, cuando los gráficos van a utilizarse en la Web. Incluye una función llamada `ggplotly()` que permite convertir gráficos de `ggplot2` a `plotly`.

### Instalación y carga
Seguidamente, se muestran las instrucciones para instalar y cargar estos paquetes. El paquete `graphics` forma parte de la instalación base de R, por lo que no necesita ser instalado ni cargado explícitamente.


```r
# Instalación de paquetes de graficación
install.packages("ggplot2")
install.packages("plotly")
```


```r
# Carga de paquetes de graficación
library(ggplot2)
library(plotly)
```

Existen muchos otros paquetes de R para graficación, entre los que pueden mencionarse:

- [lattice](http://lattice.r-forge.r-project.org/): es especialmente utilizado para datos multivariados.
- [ggvis](https://ggvis.rstudio.com/): agrega interactividad a los gráficos de `ggplot2`.
- [rgl](https://github.com/dmurdoch/rgl): para gráficos en 3D.

## Conjuntos de datos para ejemplos
Para ejemplificar el uso de estos paquetes de graficación, se utilizarán varios conjuntos de datos. En esta sección, el contenido de estos conjuntos se muestra con el paquete [DT](https://rstudio.github.io/DT/), el cual despliega data frames como tablas en HTML con capacidades de filtrado, paginación, ordenamiento y otras.


```r
# Instalación del paquete DT
install.packages("DT")
```


```r
# Carga del paquete DT
library(DT)
```

### mtcars
[mtcars: *Motor Trend Car Road Tests*](https://rdrr.io/r/datasets/mtcars.html) contiene datos de aspectos de diseño y consumo de combustible para 32 modelos de automóviles.


```r
mtcars %>%
  datatable(options = list(
    pageLength = 5,
    language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json')
  ))
```

```{=html}
<div id="htmlwidget-2297222590667ddd3743" style="width:100%;height:auto;" class="datatables html-widget"></div>
<script type="application/json" data-for="htmlwidget-2297222590667ddd3743">{"x":{"filter":"none","vertical":false,"data":[["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>mpg<\/th>\n      <th>cyl<\/th>\n      <th>disp<\/th>\n      <th>hp<\/th>\n      <th>drat<\/th>\n      <th>wt<\/th>\n      <th>qsec<\/th>\n      <th>vs<\/th>\n      <th>am<\/th>\n      <th>gear<\/th>\n      <th>carb<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"pageLength":5,"language":{"url":"//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json"},"columnDefs":[{"className":"dt-right","targets":[1,2,3,4,5,6,7,8,9,10,11]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false,"lengthMenu":[5,10,25,50,100]}},"evals":[],"jsHooks":[]}</script>
```

## Ejemplos
### Gráficos de dispersión
Un [gráfico de dispersión o *scatterplot*](https://es.wikipedia.org/wiki/Diagrama_de_dispersi%C3%B3n) despliega los valores de dos variables numéricas de un conjunto de datos, como puntos en un sistema de coordenadas. El valor de una variable se despliega en el eje X y el de la otra variable en el eje Y. Variables adicionales pueden ser mostradas mediante atributos de los puntos, tales como tamaño, color y forma.

#### graphics


```r
plot(
  x = mtcars$wt,
  y = mtcars$mpg,
  main = "Peso vs. rendimiento de automóbiles",
  xlab = "Peso (miles de libras)",
  ylab = "Rendimiento (millas por galón)"
)
```

<img src="12-r-paquetes-graficacion-estadistica_files/figure-html/graphics-dispersion-1.png" width="672" />

#### ggplot2


```r
mtcars %>%
  ggplot(aes(x = wt, y = mpg)) +
  geom_point() +
  ggtitle("Peso vs. rendimiento de automóbiles") +
  xlab("Peso (miles de libras)") +
  ylab("Rendimiento (millas por galón)")
```

<img src="12-r-paquetes-graficacion-estadistica_files/figure-html/ggplot2-dispersion-1.png" width="672" />

#### plotly


```r
mtcars %>%
  plot_ly(x = ~ wt,
          y = ~ mpg) %>% layout(
            title = "Peso vs. rendimiento de automóbiles",
            xaxis = list(title = "Peso (miles de libras)"),
            yaxis = list(title = "Rendimiento (millas por galón)")
          ) %>% config(locale = 'es')
```

```{=html}
<div id="htmlwidget-0801124b492fae5eaeb9" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-0801124b492fae5eaeb9">{"x":{"visdat":{"199d2c6ad213a2":["function () ","plotlyVisDat"]},"cur_data":"199d2c6ad213a2","attrs":{"199d2c6ad213a2":{"x":{},"y":{},"alpha_stroke":1,"sizes":[10,100],"spans":[1,20]}},"layout":{"margin":{"b":40,"l":60,"t":25,"r":10},"title":"Peso vs. rendimiento de automóbiles","xaxis":{"domain":[0,1],"automargin":true,"title":"Peso (miles de libras)"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Rendimiento (millas por galón)"},"hovermode":"closest","showlegend":false},"source":"A","config":{"modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"locale":"es"},"data":[{"x":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"y":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"type":"scatter","mode":"markers","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```

## Recursos de interés
*DT: An R interface to the DataTables library*. (s. f.). Recuperado 21 de mayo de 2022, de https://rstudio.github.io/DT/

Healy, Y. H. and C. (s. f.). *From data to Viz | Find the graphic you need*. Recuperado 20 de marzo de 2022, de https://www.data-to-viz.com/
