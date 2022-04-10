# Reproducibilidad

## Resumen
Un análisis realizado por un investigador se considera reproducible si el código fuente y los datos que utilizó para obtener los resultados están disponibles y son suficientes para que otro investigador, trabajando de manera independiente, pueda llegar al mismo resultado. El concepto de reproducibilidad es cada vez más importante debido al aumento exponencial de datos y al empleo de la programación de computadoras por parte de especialistas de diversas disciplinas.

## El concepto de reproducibilidad
En general, la [reproducibilidad](https://es.wikipedia.org/wiki/Reproducibilidad_y_repetibilidad) es la capacidad de un ensayo o experimento de ser reproducido por otros. Más formalmente, en investigación cuantitativa, un análisis se considera reproducible si *"el código fuente y los datos utilizados por un investigador para llegar a un resultado están disponibles y son suficientes para que otro investigador, trabajando de manera independiente, pueda llegar al mismo resultado"* [@gandrud_reproducible_2020]. 

La reproducibilidad, junto con la [falsabilidad](https://es.wikipedia.org/wiki/Falsabilidad), es uno de los pilares del [método científico](https://es.wikipedia.org/wiki/M%C3%A9todo_cient%C3%ADfico). Sin embargo, en años recientes, se ha generado una creciente preocupación debido a que muchos estudios científicos publicados fallan las pruebas de reproducibilidad (véase, por ejemplo, [*The Excel Depression*, de Paul Krugman](https://www.nytimes.com/2013/04/19/opinion/krugman-the-excel-depression.html)), dando lugar a una [crisis de reproducibilidad o replicabilidad](https://es.wikipedia.org/wiki/Crisis_de_replicaci%C3%B3n) en varias ciencias.

El concepto de reproducibilidad es cada vez más importante debido, entre otras razones, al aumento exponencial de datos disponibles y a la aplicación de la programación de computadoras, para procesar estos datos, por parte de especialistas de muchas disciplinas.

## Reproducibilidad en ciencia de datos geoespaciales
Alex Singleton y otros autores [@singleton_establishing_2016] han identificado los siguientes retos para la reproducibilidad en ciencia de datos geoespaciales:

1. Los datos deben ser de dominio público y estar disponibles para los investigadores.
2. El software utilizado debe ser de código abierto (*open source*) y estar disponible para ser revisado.
3. Siempre que sea posible, los [flujos de trabajo](https://es.wikipedia.org/wiki/Flujo_de_trabajo) deben ser públicos y con enlaces a los datos, software y métodos de análisis, junto con la documentación necesaria.
4. El proceso de [revisión por pares (*peer review process*)](https://es.wikipedia.org/wiki/Revisi%C3%B3n_por_pares) y la publicación académica deben requerir la presentación de un modelo de flujo de trabajo e idealmente la disponibilidad de los materiales necesarios para la replicación.
5. En los casos en los que la reproducibilidad total no sea posible (ej. datos sensibles), los investigadores deben esforzarse por incluir todos los aspectos que puedan de un marco de trabajo abierto.

En general, el estándar mínimo de reproducibilidad requiere que los datos y el código fuente estén disponibles para otros investigadores [@peng_reproducible_2011]. Sin embargo, dependiendo de las circunstancias y recursos disponibles, existe todo un espectro de posibilidades, que se ilustra en la figura \@ref(fig:espectro-reproducibilidad).

<div class="figure">
<img src="img/espectro-reproducibilidad.png" alt="Espectro de reproducibilidad. Imagen de [Anita Graser](https://www.youtube.com/watch?v=ZjXb53pOor0), basada en [(Peng, 2001)](https://doi.org/10.1126/science.1213847)." width="690" />
<p class="caption">(\#fig:espectro-reproducibilidad)Espectro de reproducibilidad. Imagen de [Anita Graser](https://www.youtube.com/watch?v=ZjXb53pOor0), basada en [(Peng, 2001)](https://doi.org/10.1126/science.1213847).</p>
</div>

## Herramientas para facilitar la reproducibilidad
La documentación es vital durante todo el ciclo de vida de una investigación reproducible. Se recomienda utilizar mecanismos estandarizados y abiertos como el [lenguaje de marcado de hipertexto (HTML, en inglés, *HyperText Markup Language*)](https://es.wikipedia.org/wiki/HTML) o [Markdown](https://en.wikipedia.org/wiki/Markdown), con los cuales pueden crearse documentos mediante editores de texto simples (i.e. no se requiere de software propietario), y exportables a varios formatos (ej. [LaTeX](https://es.wikipedia.org/wiki/LaTeX), [PDF](https://es.wikipedia.org/wiki/PDF)).

Para dar mantenimiento, tanto al código fuente como a la documentación, es necesario un sistema de [control de versiones](https://es.wikipedia.org/wiki/Control_de_versiones) como [Git](https://es.wikipedia.org/wiki/Git), el cual permite llevar el registro de los cambios en archivos y también facilita el trabajo colaborativo al reunir las modificaciones hechas por varias personas. Git es usado en varias plataformas que comparten código fuente (ej. [GitHub](https://github.com/), [GitLab](https://about.gitlab.com/)) y que ofrecen servicios relacionados, como hospedaje de sitios web.

## Recursos de interés
Bartomeus Lab. (2016). *A reproducible workflow*. https://www.youtube.com/watch?v=s3JldKoA0zw

FOSS4G. (2021). *FOSS4G2021—Open source for open spatial data science—Anita Graser*. https://www.youtube.com/watch?v=ZjXb53pOor0

Krugman, P. (2013). Opinion | The Excel Depression. *The New York Times*. https://www.nytimes.com/2013/04/19/opinion/krugman-the-excel-depression.html

Peng, R. D. (2011). Reproducible Research in Computational Science. *Science, 334*(6060), 1226-1227. https://doi.org/10.1126/science.1213847

Singleton, A. D., Spielman, S., & Brunsdon, C. (2016). Establishing a framework for Open Geographic Information science. *International Journal of Geographical Information Science, 30*(8), 1507-1521. https://doi.org/10.1080/13658816.2015.1137579
