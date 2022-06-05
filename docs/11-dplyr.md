# dplyr: gramática para manipulación de datos

## Trabajo previo

### Lecturas
Wickham, H., & Grolemund, G. (2017). *R for Data Science: Import, Tidy, Transform, Visualize, and Model Data*. O’Reilly Media. https://r4ds.had.co.nz/

## Resumen
En este capítulo se estudia el paquete `dplyr` de Tidyverse.

## Características generales
El paquete [dplyr](https://dplyr.tidyverse.org/) de [Tidyverse](https://www.tidyverse.org/) es descrito como una *"gramática para la manipulación de datos, la cual proporciona un conjunto consistente de verbos que ayuda a solucionar los retos de manipulación de datos más comunes"*. Los principales "verbos" (i.e. funciones) de esta gramática son:

* [select()](https://dplyr.tidyverse.org/reference/select.html): selecciona columnas con base en sus nombres.

* [filter()](https://dplyr.tidyverse.org/reference/filter.html): selecciona filas con base en sus valores.

* [arrange()](https://dplyr.tidyverse.org/reference/arrange.html): cambia el orden de las filas.

* [mutate()](https://dplyr.tidyverse.org/reference/mutate.html): crea nuevas columnas, las cuales se expresan como funciones de columnas existentes.

* [summarise()](https://dplyr.tidyverse.org/reference/summarise.html): agrupa y resume valores.

Todas estas operaciones pueden combinarse con la función [group_by()](https://dplyr.tidyverse.org/reference/group_by.html), la cual ejecuta cualquiera de las operaciones anteriores "en grupo". Además, dplyr proporciona [funciones adicionales](https://dplyr.tidyverse.org/reference/index.html) para tareas más específicas.

Todas las funciones de dplyr trabajan de manera similar:

1. El primer argumento es un data frame. Puede omitirse si la función recibe el data frame a través del operador *pipe*.
2. Los argumentos siguientes describen que hacer con el data frame, utilizando los nombres de las columnas (sin comillas).  
3. El resultado es un nuevo data frame.

Las funciones de dplyr pueden encadenarse a través del operador [*pipe* (%>%)](https://magrittr.tidyverse.org/reference/pipe.html) (tubo), para formar *pipelines* (tuberías).

## Instalación y carga
El paquete `dplyr` pueden instalarse junto con todos los demás paquete de Tidyverse o de manera individual:


```r
# Instalación conjunta de Tidyverse
install.packages("tidyverse")

# Instalación individual
install.packages("dplyr")
```

Una vez instalado,  `dplyr` puede cargarse con la función `library()`:


```r
# Carga conjunta de Tidyverse
library(tidyverse)

# Carga individual
library(dplyr)
```

## Conjuntos de datos de ejemplo

Para los ejemplos de este capítulo, se utiliza el paquete de datos [palmerpenguins](https://allisonhorst.github.io/palmerpenguins/).


```r
# Carga del paquete de datos palmerpenguins
library(palmerpenguins)
```

Estructura del conjunto de datos `penguins`:


```r
# Carga del paquete de datos palmerpenguins
glimpse(penguins)
#> Rows: 344
#> Columns: 8
#> $ species           <fct> Adelie, Adelie, Adelie, Adelie, …
#> $ island            <fct> Torgersen, Torgersen, Torgersen,…
#> $ bill_length_mm    <dbl> 39.1, 39.5, 40.3, NA, 36.7, 39.3…
#> $ bill_depth_mm     <dbl> 18.7, 17.4, 18.0, NA, 19.3, 20.6…
#> $ flipper_length_mm <int> 181, 186, 195, NA, 193, 190, 181…
#> $ body_mass_g       <int> 3750, 3800, 3250, NA, 3450, 3650…
#> $ sex               <fct> male, female, female, NA, female…
#> $ year              <int> 2007, 2007, 2007, 2007, 2007, 20…
```

Vista del conjunto de datos `penguins`:


```r
# Vista del paquete de datos palmerpenguins
View(penguins)
```

## Funciones

### select()
La función `select()` selecciona (y opcionalmente renombra) columnas de un data frame con base en sus nombres.


```r
# Selección de las columnas de especie, longitud del pico y sexo
penguins %>%
  select(species, bill_length_mm, sex)
#> # A tibble: 344 × 3
#>    species bill_length_mm sex   
#>    <fct>            <dbl> <fct> 
#>  1 Adelie            39.1 male  
#>  2 Adelie            39.5 female
#>  3 Adelie            40.3 female
#>  4 Adelie            NA   <NA>  
#>  5 Adelie            36.7 female
#>  6 Adelie            39.3 male  
#>  7 Adelie            38.9 female
#>  8 Adelie            39.2 male  
#>  9 Adelie            34.1 <NA>  
#> 10 Adelie            42   <NA>  
#> # … with 334 more rows
```

Cambio de nombres de columnas:


```r
# Selección y cambio de nombre de las columnas de especie, longitud del pico y sexo
penguins %>%
  select(especie = species,
         longitud_pico_mm = bill_length_mm,
         sexo = sex)
#> # A tibble: 344 × 3
#>    especie longitud_pico_mm sexo  
#>    <fct>              <dbl> <fct> 
#>  1 Adelie              39.1 male  
#>  2 Adelie              39.5 female
#>  3 Adelie              40.3 female
#>  4 Adelie              NA   <NA>  
#>  5 Adelie              36.7 female
#>  6 Adelie              39.3 male  
#>  7 Adelie              38.9 female
#>  8 Adelie              39.2 male  
#>  9 Adelie              34.1 <NA>  
#> 10 Adelie              42   <NA>  
#> # … with 334 more rows
```

El operador `:` permite seleccionar un rango de columnas continuas:


```r
# Selección de las columnas en el rango de species a flipper_length_mm
penguins %>%
  select(species:flipper_length_mm)
#> # A tibble: 344 × 5
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Torgersen           39.1          18.7
#>  2 Adelie  Torgersen           39.5          17.4
#>  3 Adelie  Torgersen           40.3          18  
#>  4 Adelie  Torgersen           NA            NA  
#>  5 Adelie  Torgersen           36.7          19.3
#>  6 Adelie  Torgersen           39.3          20.6
#>  7 Adelie  Torgersen           38.9          17.8
#>  8 Adelie  Torgersen           39.2          19.6
#>  9 Adelie  Torgersen           34.1          18.1
#> 10 Adelie  Torgersen           42            20.2
#> # … with 334 more rows, and 1 more variable:
#> #   flipper_length_mm <int>
```

Selección de todas las columnas que cumplen una condición:


```r
# Selección de las columnas numéricas
penguins %>%
  select(where(is.numeric))
#> # A tibble: 344 × 5
#>    bill_length_mm bill_depth_mm flipper_length_… body_mass_g
#>             <dbl>         <dbl>            <int>       <int>
#>  1           39.1          18.7              181        3750
#>  2           39.5          17.4              186        3800
#>  3           40.3          18                195        3250
#>  4           NA            NA                 NA          NA
#>  5           36.7          19.3              193        3450
#>  6           39.3          20.6              190        3650
#>  7           38.9          17.8              181        3625
#>  8           39.2          19.6              195        4675
#>  9           34.1          18.1              193        3475
#> 10           42            20.2              190        4250
#> # … with 334 more rows, and 1 more variable: year <int>
```


### filter()
La función `filter()` retorna un subconjunto de un data frame con todas las filas que satisfacen una condición (i.e. expresión lógica).

Ejemplos de uso de expresiones y operadores lógicos:


```r
# Filas de la especie 'Adelie' con longitud del pico mayor o igual a 45 mm
penguins %>%
  filter(species == 'Adelie' & bill_length_mm >= 45)
#> # A tibble: 3 × 8
#>   species island    bill_length_mm bill_depth_mm
#>   <fct>   <fct>              <dbl>         <dbl>
#> 1 Adelie  Torgersen           46            21.5
#> 2 Adelie  Torgersen           45.8          18.9
#> 3 Adelie  Biscoe              45.6          20.3
#> # … with 4 more variables: flipper_length_mm <int>,
#> #   body_mass_g <int>, sex <fct>, year <int>
```


```r
# Filas de las especie 'Adelie' o 'Gentoo'
penguins %>%
  filter(species == 'Adelie' | species == 'Gentoo')
#> # A tibble: 276 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Torgersen           39.1          18.7
#>  2 Adelie  Torgersen           39.5          17.4
#>  3 Adelie  Torgersen           40.3          18  
#>  4 Adelie  Torgersen           NA            NA  
#>  5 Adelie  Torgersen           36.7          19.3
#>  6 Adelie  Torgersen           39.3          20.6
#>  7 Adelie  Torgersen           38.9          17.8
#>  8 Adelie  Torgersen           39.2          19.6
#>  9 Adelie  Torgersen           34.1          18.1
#> 10 Adelie  Torgersen           42            20.2
#> # … with 266 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```


```r
# Filas de especies diferentes a 'Chinstrap'
penguins %>%
  filter(!(species == 'Chinstrap'))
#> # A tibble: 276 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Torgersen           39.1          18.7
#>  2 Adelie  Torgersen           39.5          17.4
#>  3 Adelie  Torgersen           40.3          18  
#>  4 Adelie  Torgersen           NA            NA  
#>  5 Adelie  Torgersen           36.7          19.3
#>  6 Adelie  Torgersen           39.3          20.6
#>  7 Adelie  Torgersen           38.9          17.8
#>  8 Adelie  Torgersen           39.2          19.6
#>  9 Adelie  Torgersen           34.1          18.1
#> 10 Adelie  Torgersen           42            20.2
#> # … with 266 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```


```r
# Filas con longitud del pico mayor o igual al promedio
penguins %>%
  filter(bill_length_mm >= mean(bill_length_mm, na.rm = TRUE))
#> # A tibble: 175 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Torgersen           46            21.5
#>  2 Adelie  Dream               44.1          19.7
#>  3 Adelie  Torgersen           45.8          18.9
#>  4 Adelie  Biscoe              45.6          20.3
#>  5 Adelie  Torgersen           44.1          18  
#>  6 Gentoo  Biscoe              46.1          13.2
#>  7 Gentoo  Biscoe              50            16.3
#>  8 Gentoo  Biscoe              48.7          14.1
#>  9 Gentoo  Biscoe              50            15.2
#> 10 Gentoo  Biscoe              47.6          14.5
#> # … with 165 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```


```r
# Filas con longitud del pico mayor o igual al promedio
#   El argumento lógico na.rm de mean() indica si los valores NA ("not available") 
#   deben ser removidos antes del cálculo
penguins %>%
  filter(bill_length_mm >= mean(bill_length_mm, na.rm = TRUE))
#> # A tibble: 175 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Torgersen           46            21.5
#>  2 Adelie  Dream               44.1          19.7
#>  3 Adelie  Torgersen           45.8          18.9
#>  4 Adelie  Biscoe              45.6          20.3
#>  5 Adelie  Torgersen           44.1          18  
#>  6 Gentoo  Biscoe              46.1          13.2
#>  7 Gentoo  Biscoe              50            16.3
#>  8 Gentoo  Biscoe              48.7          14.1
#>  9 Gentoo  Biscoe              50            15.2
#> 10 Gentoo  Biscoe              47.6          14.5
#> # … with 165 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```

Condiciones relacionadas con valores NA:


```r
# Filas con valor NA en la columna sex
penguins %>%
  select(species, island, sex) %>%
  filter(is.na(sex))
#> # A tibble: 11 × 3
#>    species island    sex  
#>    <fct>   <fct>     <fct>
#>  1 Adelie  Torgersen <NA> 
#>  2 Adelie  Torgersen <NA> 
#>  3 Adelie  Torgersen <NA> 
#>  4 Adelie  Torgersen <NA> 
#>  5 Adelie  Torgersen <NA> 
#>  6 Adelie  Dream     <NA> 
#>  7 Gentoo  Biscoe    <NA> 
#>  8 Gentoo  Biscoe    <NA> 
#>  9 Gentoo  Biscoe    <NA> 
#> 10 Gentoo  Biscoe    <NA> 
#> 11 Gentoo  Biscoe    <NA>
```

La función `drop_na()` remueve las filas con valores `NA` en una o varias columnas.


```r
# Filas con valor diferente a NA en la columna sex
penguins %>%
  select(species,
         bill_length_mm,
         bill_depth_mm,
         flipper_length_mm,
         body_mass_g,
         sex) %>%
  drop_na(sex)
#> # A tibble: 333 × 6
#>    species bill_length_mm bill_depth_mm flipper_length_mm
#>    <fct>            <dbl>         <dbl>             <int>
#>  1 Adelie            39.1          18.7               181
#>  2 Adelie            39.5          17.4               186
#>  3 Adelie            40.3          18                 195
#>  4 Adelie            36.7          19.3               193
#>  5 Adelie            39.3          20.6               190
#>  6 Adelie            38.9          17.8               181
#>  7 Adelie            39.2          19.6               195
#>  8 Adelie            41.1          17.6               182
#>  9 Adelie            38.6          21.2               191
#> 10 Adelie            34.6          21.1               198
#> # … with 323 more rows, and 2 more variables:
#> #   body_mass_g <int>, sex <fct>
```


```r
# Filas con valor diferente a NA en cualquier columna
penguins %>%
  select(species,
         bill_length_mm,
         bill_depth_mm,
         flipper_length_mm,
         body_mass_g,
         sex) %>%
  drop_na()
#> # A tibble: 333 × 6
#>    species bill_length_mm bill_depth_mm flipper_length_mm
#>    <fct>            <dbl>         <dbl>             <int>
#>  1 Adelie            39.1          18.7               181
#>  2 Adelie            39.5          17.4               186
#>  3 Adelie            40.3          18                 195
#>  4 Adelie            36.7          19.3               193
#>  5 Adelie            39.3          20.6               190
#>  6 Adelie            38.9          17.8               181
#>  7 Adelie            39.2          19.6               195
#>  8 Adelie            41.1          17.6               182
#>  9 Adelie            38.6          21.2               191
#> 10 Adelie            34.6          21.1               198
#> # … with 323 more rows, and 2 more variables:
#> #   body_mass_g <int>, sex <fct>
```

### arrange()
La función `arrange()` cambia el orden de las filas de un data frame de acuerdo con los valores de las columnas seleccionadas.


```r
# Ordenamiento ascendente por las columnas 'bill_lenght_mm' y 'bill_depth_mm'
penguins %>%
  arrange(bill_length_mm, bill_depth_mm)
#> # A tibble: 344 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Dream               32.1          15.5
#>  2 Adelie  Dream               33.1          16.1
#>  3 Adelie  Torgersen           33.5          19  
#>  4 Adelie  Dream               34            17.1
#>  5 Adelie  Torgersen           34.1          18.1
#>  6 Adelie  Torgersen           34.4          18.4
#>  7 Adelie  Biscoe              34.5          18.1
#>  8 Adelie  Torgersen           34.6          17.2
#>  9 Adelie  Torgersen           34.6          21.1
#> 10 Adelie  Biscoe              35            17.9
#> # … with 334 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```

Por defecto, las columnas se ordenan de manera acendente. Si se desea un orden descendente, puede utilizarse la función `desc()`.


```r
# Ordenamiento descendente por las columnas 'bill_lenght_mm' y 'bill_depth_mm'
penguins %>%
  arrange(desc(bill_length_mm), desc(bill_depth_mm))
#> # A tibble: 344 × 8
#>    species   island bill_length_mm bill_depth_mm
#>    <fct>     <fct>           <dbl>         <dbl>
#>  1 Gentoo    Biscoe           59.6          17  
#>  2 Chinstrap Dream            58            17.8
#>  3 Gentoo    Biscoe           55.9          17  
#>  4 Chinstrap Dream            55.8          19.8
#>  5 Gentoo    Biscoe           55.1          16  
#>  6 Gentoo    Biscoe           54.3          15.7
#>  7 Chinstrap Dream            54.2          20.8
#>  8 Chinstrap Dream            53.5          19.9
#>  9 Gentoo    Biscoe           53.4          15.8
#> 10 Chinstrap Dream            52.8          20  
#> # … with 334 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```

Nótese que los valores `NA` se ubican al final de cualquier ordenamiento.

La función `across()` aplica una función en múltiples columnas.


```r
# Ordenamiento ascendente por las columnas que empiezan con 'bill'
penguins %>%
  arrange(across(starts_with('bill')))
#> # A tibble: 344 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Dream               32.1          15.5
#>  2 Adelie  Dream               33.1          16.1
#>  3 Adelie  Torgersen           33.5          19  
#>  4 Adelie  Dream               34            17.1
#>  5 Adelie  Torgersen           34.1          18.1
#>  6 Adelie  Torgersen           34.4          18.4
#>  7 Adelie  Biscoe              34.5          18.1
#>  8 Adelie  Torgersen           34.6          17.2
#>  9 Adelie  Torgersen           34.6          21.1
#> 10 Adelie  Biscoe              35            17.9
#> # … with 334 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```


```r
# Ordenamiento ascendente por las columnas que contienen la hilera 'lenght'
penguins %>%
  arrange(across(contains('length')))
#> # A tibble: 344 × 8
#>    species island    bill_length_mm bill_depth_mm
#>    <fct>   <fct>              <dbl>         <dbl>
#>  1 Adelie  Dream               32.1          15.5
#>  2 Adelie  Dream               33.1          16.1
#>  3 Adelie  Torgersen           33.5          19  
#>  4 Adelie  Dream               34            17.1
#>  5 Adelie  Torgersen           34.1          18.1
#>  6 Adelie  Torgersen           34.4          18.4
#>  7 Adelie  Biscoe              34.5          18.1
#>  8 Adelie  Torgersen           34.6          17.2
#>  9 Adelie  Torgersen           34.6          21.1
#> 10 Adelie  Biscoe              35            17.9
#> # … with 334 more rows, and 4 more variables:
#> #   flipper_length_mm <int>, body_mass_g <int>, sex <fct>,
#> #   year <int>
```

### mutate()
La función `mutate()` crea o modifica columnas en un data frame.


```r
# Creación de la columna 'body_mass_kg' con el valor de 'body_mass_g' expresado en kg
penguins %>%
  select(species, body_mass_g) %>%
  mutate(body_mass_kg = body_mass_g/1000)
#> # A tibble: 344 × 3
#>    species body_mass_g body_mass_kg
#>    <fct>         <int>        <dbl>
#>  1 Adelie         3750         3.75
#>  2 Adelie         3800         3.8 
#>  3 Adelie         3250         3.25
#>  4 Adelie           NA        NA   
#>  5 Adelie         3450         3.45
#>  6 Adelie         3650         3.65
#>  7 Adelie         3625         3.62
#>  8 Adelie         4675         4.68
#>  9 Adelie         3475         3.48
#> 10 Adelie         4250         4.25
#> # … with 334 more rows
```


```r
# Creación de la columnas 'body_mass_g_mean' (promedio de masa) 
# y 'body_mass_g_normalized' (proporción con respecto al promedio)
penguins %>%
  select(species, body_mass_g) %>%
  mutate(body_mass_g_mean = mean(body_mass_g, na.rm = TRUE)) %>%
  mutate(body_mass_g_normalized = body_mass_g / body_mass_g_mean)
#> # A tibble: 344 × 4
#>    species body_mass_g body_mass_g_mean body_mass_g_normali…
#>    <fct>         <int>            <dbl>                <dbl>
#>  1 Adelie         3750            4202.                0.892
#>  2 Adelie         3800            4202.                0.904
#>  3 Adelie         3250            4202.                0.773
#>  4 Adelie           NA            4202.               NA    
#>  5 Adelie         3450            4202.                0.821
#>  6 Adelie         3650            4202.                0.869
#>  7 Adelie         3625            4202.                0.863
#>  8 Adelie         4675            4202.                1.11 
#>  9 Adelie         3475            4202.                0.827
#> 10 Adelie         4250            4202.                1.01 
#> # … with 334 more rows
```

La función `group_by()` agrupa una o más columnas.


```r
# Creación de la columnas 'body_mass_g_mean_species' (promedio de masa de la especie) 
# y 'body_mass_g_species_normalized' (proporción con respecto al promedio de masa de la especie)
penguins %>%
  select(species, body_mass_g) %>%
  group_by(species) %>%
  mutate(body_mass_g_mean_species = mean(body_mass_g, na.rm = TRUE)) %>%
  mutate(body_mass_g_species_normalized = body_mass_g / body_mass_g_mean_species)
#> # A tibble: 344 × 4
#> # Groups:   species [3]
#>    species body_mass_g body_mass_g_mean_… body_mass_g_speci…
#>    <fct>         <int>              <dbl>              <dbl>
#>  1 Adelie         3750              3701.              1.01 
#>  2 Adelie         3800              3701.              1.03 
#>  3 Adelie         3250              3701.              0.878
#>  4 Adelie           NA              3701.             NA    
#>  5 Adelie         3450              3701.              0.932
#>  6 Adelie         3650              3701.              0.986
#>  7 Adelie         3625              3701.              0.980
#>  8 Adelie         4675              3701.              1.26 
#>  9 Adelie         3475              3701.              0.939
#> 10 Adelie         4250              3701.              1.15 
#> # … with 334 more rows
```

### summarise()
La función `summarise()` crea un nuevo data frame con una (o más filas), correspondientes a combinaciones de las columnas usadas en una agrupación. Esta función frecuentemente se usa en combinación con `group_by()`. Si no hay agrupación, se retorna una sola fila que sumariza todas las observaciones de la entrada.

Sumarización sin agrupamiento:


```r
# Creación de un data frame con las columnas sumarizadas 'body_mass_g_mean' (promedio de masa) 
# y 'n' (cantidad de individuos)
penguins %>%
  summarise(body_mass_g_mean = mean(body_mass_g, na.rm = TRUE),
            n = n())
#> # A tibble: 1 × 2
#>   body_mass_g_mean     n
#>              <dbl> <int>
#> 1            4202.   344
```

La función `n()` cuenta la cantidad de filas en un grupo.

Sumarización con agrupamiento:


```r
# Creación de un data frame con las columnas sumarizadas de mínimo, máximo y promedio de masa,
# y cantidad de individuos para cada especie
penguins %>%
  group_by(species) %>%
  summarise(
    body_mass_g_min = min(body_mass_g, na.rm = TRUE),
    body_mass_g_max = max(body_mass_g, na.rm = TRUE),
    body_mass_g_mean = mean(body_mass_g, na.rm = TRUE),
    n = n()
  )
#> # A tibble: 3 × 5
#>   species   body_mass_g_min body_mass_g_max body_mass_g_mean
#>   <fct>               <int>           <int>            <dbl>
#> 1 Adelie               2850            4775            3701.
#> 2 Chinstrap            2700            4800            3733.
#> 3 Gentoo               3950            6300            5076.
#> # … with 1 more variable: n <int>
```

### Otras

#### count()
Una forma alternativa (a `summarise()`) de realizar un conteo es con la función `count()`:


```r
# Creación de un data frame con el conteo de individuos por especie
penguins %>%
  count(species)
#> # A tibble: 3 × 2
#>   species       n
#>   <fct>     <int>
#> 1 Adelie      152
#> 2 Chinstrap    68
#> 3 Gentoo      124
```

## Ejercicios
1. En el data frame `penguins`, cree:
    - Una columna llamada "body_mass_g_mean_species_sex" con el promedio de masa para la especie y el sexo a los que pertenece cada individuo.
    - Una columna llamada "body_mass_g_species_sex_normalized" con la proporción de la masa de cada individuo con respecto al promedio de masa para la especie y el sexo a los que pertenece.
    
2. Agrupe el data frame `penguins` por especie y sexo y obtenga el promedio de masa y la cantidad de individuos para cada grupo.

## Recursos de interés
Canelón, S. (2020). *An Antarctic Tour of the Tidyverse*. https://spcanelon.github.io/tour-of-the-tidyverse/

R- Ladies Global. (2020). *R-Ladies Chicago (English)—An Antarctic Tour of the Tidyverse—Silvia Canelón*. https://www.youtube.com/watch?v=m_ZoMmAIx-o

RStudio. (2017). *Data transformation with dplyr::Cheat Sheet*. https://github.com/rstudio/cheatsheets/blob/45c1e642468695830fd8b724587ccfe8901e2185/data-transformation.pdf

Wickham, H., & Grolemund, G. (s. f.). *R para Ciencia de Datos*. Recuperado 14 de mayo de 2022, de https://es.r4ds.hadley.nz/
