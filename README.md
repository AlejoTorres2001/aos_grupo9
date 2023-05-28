# PRÁCTICA 2 AOS 2023. GRUPO 9 TRABAJOS

# INTRODUCCIÓN

Este trabajo contiene la implementacion de los diferentes microservicios desarrollados durante la práctica 1 sobre los diferentes trabajos que realiza en un taller mecánico. Para ello se han usado diferentes tecnologías como:

- Swagger, para la interfaz gráfica de estos microservicios y hacer peticiones a la API y al mock, este servicio está implementado en el archivo docker-compose.yaml
- Caddy, como servidor proxy, implementado en un Caddyfile que redirecciona a los diferentes puertos donde se alojaría cada micro tanto en el backend como frontend
- Docker, permite la ejecución de la aplicación en contenedores y creación de imágenes, en el repositorio se incluye un Dockerfile para la creación de la imagen de la aplicación.
- Kubernetes o K8, es la plataforma de orquestación de los contenedores, para la creación de un clúster en local se ha usado Minikube.
- Prism, se utiliza para generar mocks que serán utilizados para poder desplegar los otros servicios en el docker-compose.yaml y en los kubernetes.


# DESPLIEGUE EN DOCKER COMPOSE

Para el despliegue de la aplicación en Docker  es necesario ejecutar el siguiente comando, para el docker-compose.yaml se utiliza la imagen subida a Dockerhub para trabajos, para el resto de servicios se usa la especificación realizadas por los otros grupos de openapi tanto en frontend como en backend:

	docker-compose up -d

# DESPLIEGUE CON KUBERNETES

Para la orquestación de los contendores se ha usado el servicios de Kubernetes junto Minikube y Docker, la decisión de usar Minikube es debido para poder ejecutar el clúster de kubernetes en local. Para poder integrar en los kubernetes el servicio de “Trabajos” se ha usado nuevamente la imagen que se encuentra alojada en Dockerhub.
Para iniciar minikube es necesario ejecutar el siguiente comando en la carpeta de la práctica:

	minikube start

Una vez creada la máquina virtual utilizamos el siguiente comando para montarla:

	minikube mount $(pwd):/aos

Para finalizar el despliegue con kubernetes se ejecutan los siguientes comandos:

	kubectl apply -f k8.yaml

La comprobación de volumenes se realiza con el siguiente comando:

	kubectl get pvc 

La comprobación de servicios se realiza con el siguiente comando:

	kubectl get svc 

Y finalmente la comprobación de PODs se realiza con el siguiente comando:

	kubectl get pod 

Para permitir el accesos a los kubernetes desde nuestro navegador debido a que los puertos son del tipo NodePort se ejecuta el siguiente comando:

	minikube service --all



