# DevOps In-Formation T1 Ep.4

## Docker Compose

```shell
docker compose up -d
docker compose up -d <service>
docker compose down
docker compose down <service>
```

### Obtener detalles de instancia de un contenedor

```shell
docker inspect <container>
```

### Ejecutar un shell en una instancia de contenedor

```shell
docker exec -ti <container> /bin/sh
```

### Ejecutar un comando en una instancia de contenedor

```shell
docker exec -ti <container> <comando y argumentos>
```

## Git

### Ejemplos de uso basicos de git

```powershell
git pull
git checkout -b <nombre de rama>
git add <archivo a agregar>
git commit -m "<mensaje del commit>"
git push -u origin <nombre de rama>
```

### Cambiar de rama

```powershell
git checkout <nombre de rama>
```

### Saltar a la rama anterior

```powershell
git checkout -
```
