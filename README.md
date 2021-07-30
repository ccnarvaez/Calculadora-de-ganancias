# Calculadora de ganancias

Invertir es una actividad que supone cierto riesgo, y para hacerla en forma efectiva es necesario hacer un proceso de investigación que permita conocer y desarrollar cierto grado de familiarización con los mercados que estamos tratando.

Un fondo de inversión reúne dinero de inversionistas que delegan la administración de su dinero a un profesional, quien toma decisiones diarias sobre la compra de valores que produzcan rendimientos que busquen obtener los objetivos del fondo, sin embargo, no es sencillo delegar nuestro dinero en manos de desconocidos.

Por tal motivo, surge la necesidad de desarrollar una herramienta que permita estudiar el comportamiento de los fondos de inversión en un rango de tiempo, a fin de evaluar el comportamiento del mercado y definir la mejor estrategia de inversión.

# Fondos de inversión

Para el desarrollo de este programa fueron consumidos los datos de la API de fintual (https://fintualist.com/chile/noticias/el-api-de-fintual/), y se consideran tres fondos de inversión:

* Risky Morris
* Moderate Pitt
* Conservative Clooney

# ¿Cómo funciona?
El programa simula un proceso de inversión en la que, se evaluará el crecimiento (o pérdidas) en términos monetarios de una inversión como si hubiese sido realizada en alguna fecha del pasado.

Se desarrolló un programa de consola, el cuál solicitará los siguientes datos para su funcionamiento:

* Fecha de inversión: Se debe indicar una fecha (algún día del pasado) a partir del cual se desee evaluar el comportamiento del fondo de inversión. La fecha debe ingresarse en formato DD/MM/AAAA.

* Total del dinero a invertir: Aquí se debe declarar la cantidad de dinero sobre la que se desea simular la inversión. La cantidad debe declararse en pesos chilenos.

* Porcentajes en cada fondo: Se debe indicar que porcentaje del dinero total desea invertirse en cada uno de los fondos. Esta cantidad debe ser escrita en porcentaje Ej. 20 (no olvides que la suma de porcentajes de los tres fondos debe ser igual al 100%)

# Respuesta
Una vez ingresados los datos solicitados, el programa emitirá una respuesta:

* Crecimiento de la inversión: factor que relaciona el crecimiento del valor de la acción desde el día evaluado hasta la fecha.

* Dinero total por fondo: Muestra la cantidad de dinero que dispone luego de la inversión.




