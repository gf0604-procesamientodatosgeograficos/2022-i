# Proyecto final {-}

## Fecha y hora límite de entrega {-}
- Grupo 001: Miércoles 27 de julio de 2022. 11:59 p.m.
- Grupo 002: Jueves 28 de julio de 2022. 11:59 p.m.

## Entregables {-}
1. Dirección de un repositorio en GitHub con el código fuente en R Markdown que genere el contenido especificado en la sección Desarrollo. Este repositorio también debe contener los archivos de datos.
2. Dirección de una aplicación web interactiva publicada en shinyapps.io generada a partir del código fuente contenido en el repositorio especificado en el punto anterior. 

La entrega debe realizarse a través de la plataforma Mediación Virtual.

## Objetivos {-}
Cada estudiante o pareja de estudiantes debe mostrar que es capaz de:

1. Desarrollar tablas interactivas con el paquete `DT` de R.
2. Desarrollar gráficos estadísticos interactivos con los paquetes `ggplot2` y `plotly` de R.
3. Desarrollar mapas interactivos con el paquete `leaflet` de R. 
4. Desarrollar tableros de control (*dashboards*), con el paquete `flexdashboard` de R, que contengan tablas, gráficos y mapas interactivos.
5. Desarrollar aplicaciones interactivas con el paquete `shiny` de R, basadas en los tableros de control desarrollados con `flexdashboard`, que contengan *widgets* (controles) para controlar el comportamiento de las tablas, gráficos y mapas.

## Consideraciones adicionales {-}
- Esta tarea puede realizarse **individualmente o en parejas**. En este último caso, solo uno de los estudiantes debe realizar la entrega en Mediación Virtual, especificando ahí el nombre del otro estudiante.
- La entrega en Mediación Virtual finaliza a la hora programada para cada grupo.

## Desarrollo {-}
Cada estudiante o pareja de estudiantes debe desarrollar un tablero de control interactivo con los paquetes `flexdashboard` y `shiny` de R que contenga *widgets*, tablas, gráficos y mapas para los siguientes conjuntos de datos:

- [estadisticaspoliciales2021.xls](datos/oij/estadisticas-policiales/estadisticaspoliciales2021.xls), procedente de la [página web de datos abiertos del Organismo de Investigación Juficial (OIJ)](https://sitiooij.poder-judicial.go.cr/index.php/ayuda/servicios-policiales/servicios-a-organizaciones/indice-de-transparencia-del-sector-publico-costarricense/datos-abiertos). 
- [distritos_simplificados.geojson](datos/ign/delimitacion-territorial-administrativa/distritos_simplificados.geojson), procedente de un [geoservicio](https://www.snitcr.go.cr/ico_servicios_ogc_info?k=bm9kbzo6MjY=&nombre=IGN%20Cartograf%C3%ADa%201:5mil) publicado por el Instituto Geográfico Nacional (IGN).

El tablero de control debe publicarse como una aplicación web interactiva en shinyapps.io. Puede elegir la configuración que considere más apropiada (orientado a filas o a columnas) y distribuir las tablas, gráficos y mapas como lo considere más apropiado también. Considere utilizar múltiples páginas y otros recursos que ofrece el paquete `flexdashboard` (ej. *tabsets*).

Las tablas, gráficos y mapas que debe desarrollar son:

1. Una tabla `DT` con las columnas `Delito`, `Fecha`, `Víctima`, `Edad`, `Género`, `Provincia`,  `Cantón` y `Distrito` (**note que hay algunas columnas nuevas con respecto a las tareas anteriores**).
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
    - Los controles del gráfico deben estar en español.
    
5. Un gráfico de barras apiladas, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre una barra por cada tipo de delito (asalto, homicidio, hurto, etc). Cada barra debe mostrar la proporción (no la cantidad) de delitos por género (mujer, hombre, desconocido).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    - Los controles del gráfico deben estar en español.
    
6. Un gráfico de barras apiladas, generado con `ggplot2` y traducido a `plotly` con `ggplotly()`, que muestre una barra por cada tipo de delito (asalto, homicidio, hurto, etc). Cada barra debe mostrar la proporción (no la cantidad) de delitos por edad (menor de edad, mayor de edad, adulto mayor, desconocido).
    - El gráfico debe tener título, etiqueta para el eje X y etiqueta para el eje Y.
    - Todo el contenido del gráfico debe ser legible.
    - Los controles del gráfico deben estar en español.    

7. Un mapa de coropletas desarrollado con `leaflet` que muestre la cantidad de delitos en los distritos de Costa Rica (vea el [ejemplo desarrollado en clase](https://gf0604-procesamientodatosgeograficos.github.io/2022-i/operaciones-con-datos-de-atributos.html#en-distritos)). El mapa debe tener:
    - Una capa base (ej. OpenStreetMap).
    - Una capa de polígonos de distritos cuyos colores reflejen la cantidad de delitos en cada distrito, de acuerdo con un esquema de colores adecuado.
    - Un control para activar y desactivar las capas.
    - Una leyenda que muestre los rangos de valores asociados a los colores.
    - Una ventana emergente (*popup*) que se active al hacer clic sobre el polígono y que muestre el nombre del distrito y la cantidad de delitos cometidos en este, junto con el cantón y la provincia a la que pertenece.

8. El siguiente conjunto de *widgets* de listas de selección (`selectInput()`) para filtrar las tablas, gráficos y mapas del tablero de control:
    - Tipo de delito (asalto, homicidio, hurto, etc.).
    - Víctima (edificación, persona, vivienda, etc.).
    - Género (mujer, hombre, desconocido).
    - Edad (menor de edad, mayor de edad, adulto mayor, desconocido).  
    
Todas las tablas, gráficos y mapas del tablero de control deben reflejar los filtros seleccionados por el usuario. Los valores de las listas deben estar ordenados alfabéticamente.

## Calificación {-}
Entre paréntesis, se muestra el porcentaje correspondiente a cada aspecto que se calificará:

Revisión de las direcciones entregadas en Mediación Virtual:  
- Dirección del repositorio en GitHub que contiene el código fuente y los archivos de datos: 5%.  
- Dirección de la aplicación web interactiva en shinyapps.io: 5%.  

Revisión de la mención de las fuentes de datos utilizadas:  
- Direcciones web de las fuentes de datos visibles en el tablero publicado: 5%

Revisión de las tablas, gráficos, mapas y *widgets*:  
- Tabla: 5%  
- Cada uno de los cinco gráficos: 5%  
- Mapa: 15%  
- Funcionamiento de los *widgets* de listas de selección: 40%
