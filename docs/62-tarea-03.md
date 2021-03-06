# Tarea 3 {-}

## Fecha y hora límite de entrega {-}
- Grupo 001: Miércoles 13 de julio de 2022. 10:59 a.m.
- Grupo 002: Jueves 14 de julio de 2022. 04:59 a.m.

## Entregables {-}
1. Dirección de un repositorio en GitHub con el código fuente en R Markdown que genere el contenido especificado en la sección Desarrollo. Este repositorio también debe contener los archivos de datos.
2. Dirección de un sitio web publicado en GitHub Pages generado a partir del repositorio especificado en el punto anterior. 

La entrega debe realizarse a través de la plataforma Mediación Virtual.

## Objetivos {-}
Cada estudiante o pareja de estudiantes debe mostrar que es capaz de:

1. Desarrollar tablas interactivas con el paquete `DT` de R.
2. Desarrollar gráficos estadísticos interactivos con los paquetes `ggplot2` y `plotly` de R.
3. Desarrollar mapas interactivos con el paquete `leaflet` de R. 
4. Desarrollar tableros de control (*dashboards*), con el paquete `flexdashboard` de R, que contengan tablas, gráficos y mapas interactivos.

## Consideraciones adicionales {-}
- Esta tarea puede realizarse **individualmente o en parejas**. En este último caso, solo uno de los estudiantes debe realizar la entrega en Mediación Virtual y debe especificarse ahí el nombre del otro estudiante.
- La entrega en Mediación Virtual finaliza a la hora especificada para cada grupo.

## Desarrollo {-}
Cada estudiante o pareja de estudiantes debe desarrollar un tablero de control con el paquete `flexdashboard` de R que contenga tablas, gráficos y mapas para los siguientes conjuntos de datos:

- [estadisticaspoliciales2021.xls](datos/oij/estadisticas-policiales/estadisticaspoliciales2021.xls), procedente de la [página web de datos abiertos del Organismo de Investigación Juficial (OIJ)](https://sitiooij.poder-judicial.go.cr/index.php/ayuda/servicios-policiales/servicios-a-organizaciones/indice-de-transparencia-del-sector-publico-costarricense/datos-abiertos). 
- [cantones_simplificados.geojson](datos/ign/delimitacion-territorial-administrativa/cantones_simplificados.geojson), procedente de un [geoservicio de tipo Web Feature Service (WFS)](http://geos.snitcr.go.cr/be/IGN_5/wfs) publicado por el Instituto Geográfico Nacional (IGN).

El tablero de control debe publicarse como un sitio en GitHub Pages. Puede elegir la configuración que considere más apropiada (orientado a filas o a columnas) y distribuir las tablas, gráficos y mapas como lo considere más apropiado también. Considere utilizar múltiples páginas y otros recursos que ofrece el paquete `flexdashboard` (ej. *tabsets*).

Las tablas, gráficos y mapas que debe desarrollar son:

1. Una tabla `DT` con las columnas `Delito`, `Fecha`, `Víctima`, `Edad`, `Género`, `Provincia` y `Cantón`.
    - Los encabezados de las columnas en la tabla deben estar correctamente escritos (ej. con tildes), pero no deben alterarse los nombres de las columnas del conjunto de datos. Sugerencia: utilice el argumento `colnames` de la función `DT::datatable()`.
    - Los controles de la tabla deben estar en español.
    
2. Un gráfico de barras simples, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre la cantidad de delitos por tipo de delito (una barra por tipo de delito: asalto, homicidio, hurto, etc).
    - Las barras del gráfico deben estar ordenadas por longitud, de la más larga a la más corta (ya sea de izquierda a derecha o de arriba a abajo).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    - Los controles del gráfico deben estar en español.    
    
3. Un gráfico de barras simples, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre la cantidad de delitos por víctima (una barra por víctima: edificación, persona, vivienda, etc.).
    - Las barras del gráfico deben estar ordenadas por longitud, de la más larga a la más corta (ya sea de izquierda a derecha o de arriba a abajo).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    - Los controles del gráfico deben estar en español.    

4. Un gráfico de barras simples, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre la cantidad de delitos por mes del año (una barra por cada uno de los meses del año).
    - Las barras del gráfico deben estar ordenadas por número de mes (1, 2, ...) o nombre de mes (Enero, Febrero, ...), pero de acuerdo con el orden de los meses en el calendario.
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    - Los controles de la tabla deben estar en español.
    
5. Un gráfico de barras apiladas, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre una barra por cada tipo de delito (asalto, homicidio, hurto, etc). Cada barra debe mostrar la proporción (no la cantidad) de delitos por género (mujer, hombre, desconocido).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.

6. Un mapa de coropletas desarrollado con `leaflet` que muestre la cantidad de delitos en los cantones de Costa Rica (vea el [ejemplo desarrollado en clase](https://gf0604-procesamientodatosgeograficos.github.io/2022-i/operaciones-con-datos-de-atributos.html#en-cantones)). El mapa debe tener:
    - Una capa base (ej. OpenStreetMap).
    - Una capa de polígonos de cantones cuyos colores reflejen la cantidad de delitos en cada cantón, de acuerdo con un esquema de colores adecuado.
    - Un control para activar y desactivar las capas.
    - Una leyenda que muestre los rangos de valores asociados a los colores.

## Calificación {-}
Entre paréntesis, se muestra el porcentaje correspondiente a cada aspecto que se calificará:

Revisión de las direcciones entregadas en Mediación Virtual:  
- Dirección del repositorio en GitHub que contiene el código fuente y el archivo de datos: 5%.  
- Dirección del sitio web publicado en GitHub Pages: 5%.  

Revisión de la mención de las fuentes de datos utilizadas:  
- Direcciones web de las fuentes de datos visibles en el tablero publicado: 5%

Revisión de las tablas y gráficos:  
- Tabla: 5%  
- Mapa: 20%  
- Cada uno de los cuatro gráficos: 15%  
