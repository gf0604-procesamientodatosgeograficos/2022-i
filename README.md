# GF0604 Procesamiento de datos geográficos 2021-I

## Apuntes técnicos

### Ambiente conda

Se creó un ambiente conda con los paquetes de R utilizados en el curso. 

```shell
conda update conda
conda create -n gf0604-2022-i
conda activate gf0604-2022-i
conda config --env --add channels conda-forge
conda config --env --set channel_priority strict
conda install r-base r-essentials r-downlit r-bookdown r-blogdown r-xaringan r-ggplot2 r-plotly r-dt r-sf r-terra r-leaflet r-leaflet.providers r-leaflet.extras r-leaflet.minicharts r-leafem r-flexdashboard r-shiny r-shinydashboard r-packrat r-rsconnect
```

Se prefirió instalar los paquetes desde la línea de comandos del sistema operativo, como parte del ambiente conda, en lugar de instalarlos desde R mediante `install.packages()`. Aparentemente, así se obtienen mejores resultados, particularmente con los paquetes geoespaciales.

### Archivo `_bookdown.yml`

```
book_filename: "2022-i"
new_session: true
before_chapter_script: _common.R
delete_merged_file: true
output_dir: "docs"
language:
  ui:
    chapter_name: "Chapter "
```
