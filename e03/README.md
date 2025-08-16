# DevOps In-Formation T1 Ep.3

## Docker

Lista contenedores ejecutando

`docker ps` 

Lista todos los contenedores, incluyendo los detenidos

`docker ps -a`

Lista las imagenes de contenedores

`docker image ls`

Borra las imagenes huerfanas

`docker image ls --prune`

Instanciar un contenedor, sin terminal

`docker run -d ...`

Instanciar un contenedor, con terminal

`docker run -ti ...`

Argumentos para instanciar contenedores

Publicar puerto: ` -p <publish:expose> `
Remover contenedor al detener: ` --rm `
Establecer nombre del contenedor: ` --name <nombre> `

Construir un contenedor

`docker build -t <image>[:<tag>] .`

Argumentos para construir contenedores

Deshabilitar cache: ` --no-cache `
Especificar Dockerfile: ` -f <Dockerfile> `
Argumento a la construccion: ` --build-arg argumento=valor `

## Referencias

https://hub.docker.com/_/nginx
https://docs.docker.com/build/building/variables/
https://docs.docker.com/reference/dockerfile/#arg
