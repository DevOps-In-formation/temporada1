# DevOps In-formation Temporada 1

Para trabajar con Git desde una terminal se requiere una llave SSH, esta se crea y se agrega la llave publica en tu usuario de GitHub en https://github.com/settings/keys

```powershell
ssh-keygen -t ed25519 -C <direccion de correo>
```

El comando anterior crea un par de archivos en la carpeta .ssh en el directorio del usuario, el archivo id_ed25519 es la llave privada, esta nunca debe ser compartida y el archivo id_ed25519.pud es la llave publica

Es probable que requieran configurar un agente ssh para el correcto funcionamiento, la documentacion de GitHub incluye ejemplos al respecto la encuentra aqui https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

Antes que nada configuren su usuario de Git

```powershell
git config --global user.email "<direccion de correo>"
git config --global user.name "<nombre y apellido>"
```

Este repositorio se inicio con los siguientes comandos

```powershell
git init
git branch -M main
git add README.md
git commit -m "Inicio"
git remote add origin git@github.com:DevOps-In-formation/temporada1.git
git push -u origin main
```
