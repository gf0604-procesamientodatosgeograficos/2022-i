# R Markdown

## Trabajo previo

### Lecturas
Xie, Y., Allaire, J. J., & Grolemund, G. (2018). *R Markdown: The definitive guide*. CRC Press. https://bookdown.org/yihui/rmarkdown/

Xie, Y., Dervieux, C., & Riederer, E. (2020). *R Markdown Cookbook*. CRC Press. https://bookdown.org/yihui/rmarkdown-cookbook/

## Resumen

## Características generales
[R Markdown](https://rmarkdown.rstudio.com/) es un formato que permite insertar código R, y sus salidas, en documentos escritos en Markdown. Fue introducido por Yihui Xie en 2012, junto con el paquete [knitr](https://yihui.org/knitr/), cuyo propósito es facilitar la investigación reproducible en R a través de la [programación literaria (*literate programming*)](https://es.wikipedia.org/wiki/Programaci%C3%B3n_literaria), un paradigma de programación propuesto por Donald Knuth en 1984. 

Los programas "literarios" (o "letrados") están escritos como una exposición lógica en un lenguaje humano similar a la explicación de las fórmulas y ecuaciones empleadas para representar y resolver un problema en un texto de física o de matemáticas. En estos programas, se describe el análisis del problema, su solución y su implementación, intercalando código fuente entre los párrafos (y otros contenidos como imágenes, tablas, gráficos estadísticos y mapas), de forma similar a como en los textos de matemáticas se intercalan las fórmulas y las ecuaciones. La programación literaria puede mejorar enormemente un programa, ya que permite documentar ampliamente en qué consiste el problema a resolver, cómo se resuelve, cómo y por qué se adoptó cierto diseño, cómo se optimizó y cómo se implementó en un lenguaje de programación.

R Markdown se apoya en knitr y en [Pandoc](http://pandoc.org/), una herramienta para convertir documentos de un formato a otro. knitr ejecuta el código R incrustado en Markdown y convierte los documentos en R Markdown a Markdown. Por su parte, Pandoc exporta los documentos Markdown al formato de salida deseado (ej. HTML, PDF, Microsoft Word, Microsoft PowerPoint). Este proceso se ilustra en la figura \@ref(fig:r-markdown-knitr-pandoc).

<div class="figure">
<img src="img/r-markdown-knitr-pandoc.png" alt="Conversión de un documento R Markdown (.RMD) a su formato de salida. Imagen de [Xie et al.](https://bookdown.org/yihui/rmarkdown-cookbook/rmarkdown-process.html#rmarkdown-process)." width="777" />
<p class="caption">(\#fig:r-markdown-knitr-pandoc)Conversión de un documento R Markdown (.RMD) a su formato de salida. Imagen de [Xie et al.](https://bookdown.org/yihui/rmarkdown-cookbook/rmarkdown-process.html#rmarkdown-process).</p>
</div>

## Anatomía de un documento R Markdown
Un documento R Markdown tiene tres tipos de contenido:

- Metadatos en YAML
- Narrativa en Markdown
- Fragmentos de código en R

### Metadatos en YAML
Todo documento R Markdown inicia con un encabezado en la sintaxis [YAML (YAML Ain't Markup Language)](https://es.wikipedia.org/wiki/YAML), el cual contiene metadatos del documento como el título, el autor, la fecha de creación, el formato de salida y la estructura de la tabla de contenidos, entre muchos otros. Los elementos de metadatos que pueden especificarse pueden variar de acuerdo al formato de salida.

Un encabezado YAML comienza y termina con tres guiones (`---`) y contiene un conjunto de campos y valores de la forma:

```
---
campo01: valor01
campo02: valor02
campo0n: valor0n
---
```

Por ejemplo, un encabezado YAML típico puede ser el siguiente:

```
---
title: Mi primer documento R Markdown
author: Manuel Vargas
output: html_document
---
```

Los campos del encabezado pueden anidarse con sangrías de dos espacios como, por ejemplo:

```
---
output:
  html_document:
    toc: true
    toc_float: true
---
```

Las [viñetas del paquete ymlthis](https://cran.r-project.org/web/packages/ymlthis/vignettes/yaml-fieldguide.html) presentan una lista de los campos YAML disponibles para el encabezado de un documento R Markdown.

### Narrativa en Markdown

### Fragmentos de código en R

## Recursos de interés
Alzahawi, S. (s. f.). *Reproducible Reports with R Markdown*. Recuperado 21 de marzo de 2022, de https://rmarkdown-shilaan.netlify.app/

Bartomeus Lab. (2016). *A reproducible workflow*. https://www.youtube.com/watch?v=s3JldKoA0zw

*Basic YAML*. (s. f.). Recuperado 6 de mayo de 2022, de https://cran.r-project.org/web/packages/ymlthis/vignettes/yaml-fieldguide.html

Higgins, M. (s. f.). *Reproducible Templates for Analysis and Dissemination*. Coursera. Recuperado 11 de abril de 2022, de https://www.coursera.org/learn/reproducible-templates-analysis

RStudio. (s. f.). rmarkdown::CHEAT SHEET. Recuperado 6 de mayo de 2022, de https://raw.githubusercontent.com/rstudio/cheatsheets/main/rmarkdown.pdf

*Quarto*. (s. f.). Recuperado 6 de mayo de 2022, de https://quarto.org/
