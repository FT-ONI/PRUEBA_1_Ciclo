Pipeline CI/CD para TechMarket - Plantillas Reutilizables
Acá les comparto cómo armamos la estandarización de los pipelines CI/CD usando GitHub Actions para los proyectos de TechMarket.

Por qué estandarizar los pipelines
Tener nuestras plantillas YAML separadas por tareas (Test, Build y Deploy) nos trae ventajas súper claras para el día a día:

Menos errores: Al tener la lógica centralizada, evitamos que cada equipo configure los despliegues a su manera y rompa algo por accidente o deje huecos de seguridad.

Entregas más rápidas: Los desarrolladores no pierden tiempo "inventando la rueda" cada vez que arman un flujo nuevo.

Consistencia: Nos aseguramos de que todo el código que se sube pase exactamente por los mismos filtros de calidad (como npm audit y npm test).

Ahorro de tiempo
La idea principal de esto es hacerle la vida más fácil al equipo. Si TechMarket crea un nuevo microservicio, el desarrollador solo tiene que armar un archivo main_pipeline.yml súper corto (unas 30 líneas). Desde ahí se llaman a estas plantillas usando el comando uses:, y listo. Nos ahorramos escribir cientos de líneas de código repetitivo.

Plantillas flexibles (Parámetros)
Hicimos que las plantillas se adapten a distintos escenarios usando inputs, outputs y variables de entorno (env):

Inputs: Nos permiten cambiar cosas específicas (como la versión de Node, la región de AWS o en qué namespace queremos desplegar). Gracias a esto, usamos la misma plantilla exacta para mandar cosas a un entorno de pruebas (staging) o al entorno de producción en EKS.

Outputs: El link (URI) de la imagen de Docker que se crea en el Build pasa de forma automática y segura a la plantilla de Deploy, así no le perdemos el rastro.
Básicamente, si alguien necesita cambiar una configuración, lo hace en su propio archivo principal sin miedo a romper el código de las plantillas base.

Uso de Actions externas
Para no hacer trabajo de más, nos apoyamos en algunas herramientas oficiales del Marketplace de GitHub:

actions/checkout@v4 y actions/setup-node@v4: Las usamos para descargar el código y preparar el entorno de Node de forma rápida y estandarizada.

aws-actions/configure-aws-credentials@v5.1.0: En lugar de armar scripts propios para loguearnos en AWS (que siempre terminan fallando), usamos esta action oficial que es mucho más segura y robusta.

En resumen
Separar el código de las aplicaciones de la configuración de despliegue es un gran paso para TechMarket. El equipo gana muchísima agilidad, reducimos las caídas del sistema por malas configuraciones y hacemos que trabajar con DevOps sea mucho más amigable para todos.

Nota sobre el uso de IA: Para armar la base de estos archivos YAML y revisar que la sintaxis estuviera correcta, me apoyé en Gemini de Google como asistente, aunque todo el código y el flujo fue revisado, ajustado y probado manualmente paso a paso.
