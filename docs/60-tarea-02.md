# Tarea 2 {-}

## Fecha y hora límite de entrega {-}
- Grupo 001: Lunes 20 de junio de 2022. 07:59 a.m.
- Grupo 002: Martes 21 de mayo de 2022. 10:59 a.m.

## Entregables {-}
1. Dirección de un repositorio en GitHub con el código fuente en R Markdown que produzca el contenido especificado en la sección Desarrollo. Este repositorio también debe contener el archivo de datos.
2. Dirección de un sitio web publicado en GitHub Pages generado a partir del repositorio especificado en el punto anterior. 

La entrega debe realizarse a través de la plataforma Mediación Virtual.

## Objetivos {-}
Cada estudiante debe mostrar que es capaz de:

1. Desarrollar tablas interactivas con el paquete `DT` de R.
2. Desarrollar gráficos estadísticos interactivos con los paquetes `ggplot2` y `plotly` de R.
3. Desarrollar documentos en R Markdown que desplieguen tablas y gráficos en páginas web.

## Consideraciones adicionales {-}
- Esta tarea es **estrictamente individual**.
- La entrega en Mediación Virtual finaliza a la hora especificada para cada grupo.

## Desarrollo {-}
Cada estudiante debe desarrollar un documento R Markdown, publicado como un sitio web en GitHub Pages, que muestre tablas y gráficos para el conjunto de datos [estadisticaspoliciales2021.xls](datos/oij/estadisticas-policiales/estadisticaspoliciales2021.xls), procedente de la [página web de datos abiertos del Organismo de Investigación Juficial (OIJ)](https://sitiooij.poder-judicial.go.cr/index.php/ayuda/servicios-policiales/servicios-a-organizaciones/indice-de-transparencia-del-sector-publico-costarricense/datos-abiertos). Sugerencia: lea el archivo XLS con la función `readxl::read_excel()`.

Las tablas y gráficos que debe desarrollar son:

1. Una tabla `DT` que con las columnas `Delito`, `Fecha`, `Víctima`, `Edad`, `Género`, `Provincia` y `Cantón`.
    - Las columnas deben, si es necesario, convertirse al tipo de datos adecuado (ej. `Date`).
    - Los encabezados de las columnas en la tabla deben estar correctamente escritos (ej. con tildes), pero no deben alterarse los nombres de las columnas del conjunto de datos. Sugerencia: utilice el argumento `colnames` de la función `DT::datatable()`.
    - Los controles de la tabla deben estar en español.
    
2. Un gráfico de barras simples (sin apilar ni agrupar), generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre la cantidad de delitos por tipo de delito (una barra por tipo de delito: Asalto, homicidio, hurto, etc).
    - Las barras del gráfico deben estar ordenadas por longitud, de la más larga a la más corta (ya sea de izquierda a derecha o de arriba a abajo).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    
3. Un gráfico de barras simples (sin apilar ni agrupar), generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre la cantidad de delitos por mes del año (una barra por cada uno de los meses del año).
    - Las barras del gráfico deben estar ordenadas por número de mes (1, 2, ...) o nombre de mes (Enero, Febrero, ...).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    - Sugerencia: para obtener el mes del año, considere la función `lubridate::month()`.
    
4. Un gráfico de barras apiladas, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre una barra por cada tipo de delito (Asalto, homicidio, hurto, etc). Cada barra debe mostrar la proporción (no la cantidad) de delitos por género (mujer, hombre, desconocido).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.

5. Un gráfico de barras simples (sin apilar ni agrupar), generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre la cantidad de delitos para los cantones de San José, Alajuela, Cartago y Heredia (una barra por cantón).
    - Las barras del gráfico deben estar ordenadas por longitud, de la más larga a la más corta (ya sea de izquierda a derecha o de arriba a abajo).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.    

## Calificación {-}
Entre paréntesis, se muestra el porcentaje correspondiente a cada aspecto que se calificará:

Revisión de las direcciones entregadas en Mediación Virtual:  
- Dirección del repositorio en GitHub que contiene el código fuente y el archivo de datos: 5%.  
- Dirección del sitio web publicado en GitHub Pages: 5%.  

Revisión de las tablas y gráficos:  
- Tabla: 10%.  
- Cada uno de los cuatro gráficos: 20%.
