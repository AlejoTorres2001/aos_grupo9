# AOS-Grupo3-Gestion-de-Trabajos

## Descripción

## Esquemas

## Servicios

## Integrantes

## Comandos Docker

### Levantar el contenedor
```bash
docker-compose up -d
```
### Validar la especificación OpenAPI
```bash
docker run --rm -v $(pwd)/openapi/openapi.yaml:/app/openapi.yaml redocly/cli lint /app/openapi.yaml
```

### Pasar la especificacion a MultiFile
```bash

docker run -it --rm -v $(pwd)/openapi:/app redocly/cli split /app/openapi.yaml --outDir /app/multiFile

```