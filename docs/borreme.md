---
title: "Bórreme"
author: "Manuel Vargas"
date: "2022-06-09"
output: 
  html_document:
    code_folding: hide
    theme: readable
    toc: true
    toc_depth: 5
    toc_float:
      collapsed: false
      smooth_scroll: false
---



# Bórreme

## Preparativos


```r
library(readxl)
library(dplyr)
library(DT)
library(ggplot2)
library(plotly)
```


```r
estadisticas_policiales <-
  read_excel("datos/oij/estadisticas-policiales/estadisticaspoliciales2021.xls")
```

## Tabla


```r
estadisticas_policiales %>%
  select(Delito, Fecha, Victima, Edad, Genero, Provincia, Canton) %>%
  datatable(
    options = list(
      pageLength = 5,
      language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json') # traducción al español
    ),
    colnames = c(
      "Delito",
      "Fecha",
      "Víctima",
      "Edad",
      "Género",
      "Provincia",
      "Cantón"
    )
  )
```

```{=html}
<div id="htmlwidget-d5b56ac6c318e14177b6" style="width:100%;height:auto;" class="datatables html-widget"></div>
```

## Gráfico por tipo de delito


```r
grafico_delitos_x_delito <-
  estadisticas_policiales %>%
  count(Delito) %>%
  ggplot(aes(x = reorder(Delito, n), y = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal()

grafico_delitos_x_delito %>%
  ggplotly() %>% 
  config(locale = 'es') # traducción de etiquetas al español
```

```{=html}
<div id="htmlwidget-f544826a977022d3992b" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-f544826a977022d3992b">{"x":{"data":[{"orientation":"h","width":[0.9,0.9,0.9,0.9,0.9,0.9],"base":[0,0,0,0,0,0],"x":[9897,537,12162,9812,3099,2842],"y":[5,1,6,4,3,2],"text":["reorder(Delito, n): ASALTO<br />n:  9897","reorder(Delito, n): HOMICIDIO<br />n:   537","reorder(Delito, n): HURTO<br />n: 12162","reorder(Delito, n): ROBO<br />n:  9812","reorder(Delito, n): ROBO DE VEHICULO<br />n:  3099","reorder(Delito, n): TACHA DE VEHICULO<br />n:  2842"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(89,89,89,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.2283105022831,"r":7.30593607305936,"b":40.1826484018265,"l":124.931506849315},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-608.1,12770.1],"tickmode":"array","ticktext":["0","2500","5000","7500","10000","12500"],"tickvals":[0,2500,5000,7500,10000,12500],"categoryorder":"array","categoryarray":["0","2500","5000","7500","10000","12500"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"n","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.4,6.6],"tickmode":"array","ticktext":["HOMICIDIO","TACHA DE VEHICULO","ROBO DE VEHICULO","ROBO","ASALTO","HURTO"],"tickvals":[1,2,3,4,5,6],"categoryorder":"array","categoryarray":["HOMICIDIO","TACHA DE VEHICULO","ROBO DE VEHICULO","ROBO","ASALTO","HURTO"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"reorder(Delito, n)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"locale":"es"},"source":"A","attrs":{"8c25604a8215":{"x":{},"y":{},"type":"bar"}},"cur_data":"8c25604a8215","visdat":{"8c25604a8215":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```

## Gráfico por cabeceras de provincia


```r
grafico_delitos_x_cabecera <-
  estadisticas_policiales %>%
  filter(Canton == "SAN JOSE" | Canton == "ALAJUELA" | Canton == "CARTAGO" | Canton == "HEREDIA") %>%
  count(Canton) %>%
  ggplot(aes(x = reorder(Canton, n), y = n)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal()

grafico_delitos_x_cabecera %>%
  ggplotly() %>% 
  config(locale = 'es') # traducción de etiquetas al español
```

```{=html}
<div id="htmlwidget-ca280c85e35e68956c3e" style="width:672px;height:480px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-ca280c85e35e68956c3e">{"x":{"data":[{"orientation":"h","width":[0.9,0.9,0.9,0.9],"base":[0,0,0,0],"x":[2107,1064,1351,6419],"y":[3,1,2,4],"text":["reorder(Canton, n): ALAJUELA<br />n: 2107","reorder(Canton, n): CARTAGO<br />n: 1064","reorder(Canton, n): HEREDIA<br />n: 1351","reorder(Canton, n): SAN JOSE<br />n: 6419"],"type":"bar","textposition":"none","marker":{"autocolorscale":false,"color":"rgba(89,89,89,1)","line":{"width":1.88976377952756,"color":"transparent"}},"showlegend":false,"xaxis":"x","yaxis":"y","hoverinfo":"text","frame":null}],"layout":{"margin":{"t":26.2283105022831,"r":7.30593607305936,"b":40.1826484018265,"l":72.3287671232877},"font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187},"xaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[-320.95,6739.95],"tickmode":"array","ticktext":["0","2000","4000","6000"],"tickvals":[0,2000,4000,6000],"categoryorder":"array","categoryarray":["0","2000","4000","6000"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"y","title":{"text":"n","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"yaxis":{"domain":[0,1],"automargin":true,"type":"linear","autorange":false,"range":[0.4,4.6],"tickmode":"array","ticktext":["CARTAGO","HEREDIA","ALAJUELA","SAN JOSE"],"tickvals":[1,2,3,4],"categoryorder":"array","categoryarray":["CARTAGO","HEREDIA","ALAJUELA","SAN JOSE"],"nticks":null,"ticks":"","tickcolor":null,"ticklen":3.65296803652968,"tickwidth":0,"showticklabels":true,"tickfont":{"color":"rgba(77,77,77,1)","family":"","size":11.689497716895},"tickangle":-0,"showline":false,"linecolor":null,"linewidth":0,"showgrid":true,"gridcolor":"rgba(235,235,235,1)","gridwidth":0.66417600664176,"zeroline":false,"anchor":"x","title":{"text":"reorder(Canton, n)","font":{"color":"rgba(0,0,0,1)","family":"","size":14.6118721461187}},"hoverformat":".2f"},"shapes":[{"type":"rect","fillcolor":null,"line":{"color":null,"width":0,"linetype":[]},"yref":"paper","xref":"paper","x0":0,"x1":1,"y0":0,"y1":1}],"showlegend":false,"legend":{"bgcolor":null,"bordercolor":null,"borderwidth":0,"font":{"color":"rgba(0,0,0,1)","family":"","size":11.689497716895}},"hovermode":"closest","barmode":"relative"},"config":{"doubleClick":"reset","modeBarButtonsToAdd":["hoverclosest","hovercompare"],"showSendToCloud":false,"locale":"es"},"source":"A","attrs":{"8c25691937c5":{"x":{},"y":{},"type":"bar"}},"cur_data":"8c25691937c5","visdat":{"8c25691937c5":["function (y) ","x"]},"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot","plotly_sunburstclick"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script>
```