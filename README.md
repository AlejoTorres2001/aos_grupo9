# AOS-Grupo9-Gestion-de-Trabajos

## Descripción

Este trabajo consiste en la creación de un subsistema para gestionar la planificación del día a día de los trabajos del taller, consistiendo en una colección de trabajos de mantenimiento que se realizarán sobre determinados vehículos y los estados de dichos trabajos.

## Esquemas
Los esquemas creados para la API han sido lo siguientes:

- Trabajo: representación del recurso trabajo, identifica el ingreso de un vehículo a taller, estado y descripción del proceso general.   Sus campos son los siguientes: idTrabajo*, descripcionTrabajo*, fechaIngresoTrabajo, fechaInicioTrabajo*, fechaFinalizaciónTrabajo,   estadoTrabajo*, categoriaTrabajo*, cotizacionTrabajo*, clienteIdTrabajo*, mecanicoIdTrabajo, vehiculoVINTrabajo*, complejidadTrabajo*,    links.
- IdTrabajo: identificador único del trabajo en el sistema de persistencia.
Estados_Trabajo: indica en que estado se encuentra un trabajo. Este estado puede ser: “Creado”, “Planificado”, “Iniciado” o “Terminado”.
- Categorias_Trabajo: indica en que tipo de categoría se encuentra un trabajo. Estas categorías pueden ser: “Reparacion”, “Recambio”,     “Estetica”.
- ClienteId: identicador único del cliente dentro del sistema.
- MecanicoId: identificador de un mecánico dentro del sistema.
- VehiculoVIN: identificador de un vehículo dentro del sistema.
- Complejidad_Trabajo: indica la complejidad que tiene un trabajo. La complejidad se puede categorizar como: “Baja”, “Media”,“Alta”.
- HTTP_Problem: detalles de los problemas HTTP APIs.
- Link: consiste en un enlace de relación.
## Servicios

El archivo docker-compose es un fichero YAML de configuración de Docker Compose que define tres servicios: backend, frontend y proxy.

El servicio "backend" utiliza la imagen de Docker "stoplight/prism:4" para ejecutar una instancia de Prism. Prism es un servidor que permite validar y mockear una API RESTful de OpenAPI. El comando "mock" se utiliza para iniciar un servidor de respuestas exponiendo el puerto 4010.

El servicio "frontend" utiliza la imagen de Docker "swaggerapi/swagger-ui:latest" para iniciar un servidor Swagger UI. Swagger UI es una herramienta de visualización de API que permite explorar y probar una API RESTful utilizando una interfaz web. El puerto 8000 se expone para que la interfaz de usuario de Swagger sea accesible desde el host de Docker.

El servicio "proxy" utiliza la imagen de Docker "caddy:latest" para ejecutar un servidor proxy HTTP. El servidor proxy se utiliza para redirigir las solicitudes de API del servidor Swagger UI al servidor mock de la API. El archivo "Caddyfile" se utiliza para configurar la redirección exponiendo el puerto 80.


## Integrantes

    Alejo Torres Teruel
    Antonio Jiménez Herrero
    Carlota López García
    Iván Molina Abellán

## Comandos Docker

### Levantar el contenedor
```bash
docker-compose up -d
```
### Validar la especificación OpenAPI
```bash
docker run --rm -v "$(pwd)/openapi/openapi.yaml:/app/openapi.yaml" redocly/cli lint /app/openapi.yaml
```

### Pasar la especificacion a MultiFile
```bash

docker run -it --rm -v "$(pwd)/openapi:/app" redocly/cli split /app/openapi.yaml --outDir /app/multiFile

```
