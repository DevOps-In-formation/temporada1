# DevOps In-Formation T1 Ep.2

## Desplazamientos

En DevOps existe el concepto de desplazamiento, el cual implica el desplazar la responsabilidad hacia un lado u otro.

Desplazar la responsabilidad a la izquierda refiere a: realizar las tareas en etapas tempranas del ciclo, mientras que desplazar a la derecha refiere a las estapas finales.

Algunos ejemplos del desplazamiento a la izquierda (Shift Left) son:

- Pruebas unitarias
- Pruebas de integracion
- Uso de contenedores
- Escaneos de seguridad
- Integracion/Despliegue Continuos (CI/CD)

Mientras que los ejemplos del desplazamiento a la derecha (Shift Right) son:

- Pruebas A/B
- Liberaciones Canario
- Despliegue Azul-Verde (Blue-Green)
- Interruptores (Banderas) de funciones

## Gestión de la configuración - Evolución

### Aprovisionamiento de Servidores (Físicos)

```mermaid
block
columns 3
  block:blk1:1
  columns 2
    lbl01(["Gestión"]):2
    space:2
    chg["Perfíl Config"]
    space:4
    ftp["Servidor (tFTP)"]
    space:2
    pxe["Servidor (PXE)"]
  end
  space
  block:blk2:1
  columns 2
    lbl02(["SRV n"]):2
    space:2
    os["Sistema Op"]
    bs["Perfíl Config"]
    space:2
    ins["Instalador"]:2
    space:2
    btp["Bootp"]:2
  end

  chg -- "( 1 )" --> pxe
  btp -- "( 2 )" --> pxe
  btp -- "( 3 )" --> ins
  ins -- "( 4 )" --> ftp
  ins -- "( 5 )" --> os
  ins -- "( 6 )" --> bs
```

### Gestión de configuración de servicios

```mermaid
block
columns 3
  block:blk1:1
  columns 1
    lbl01(["Gestión"])
    space
    chg01["Cambio Config"]
    space
    cms01["Servidor (Puppet)"]
  end
  space
  block:blk2:1
  columns 4
    space:1
    lbl02(["SRV n"]):2
    space:5
    app01["Apache"]
    app02["MySQL"]
    app03["PHP"]
    app04["App n"]
    space:5
    cma01["Agente"]:2
  end

  chg01 -- "(1)" --> cms01
  cma01 -- "(2)" --> cms01
  cma01 -- "(3)" --> app01
  cma01 -- "(3)" --> app02
  cma01 -- "(3)" --> app03
  cma01 -- "(3)" --> app04
```

### Aprovisionamiento de Máquinas Virtuales

```mermaid
block
columns 3
  block:blk1:1
  columns 1
    lbl01(["Interfaz"])
    space
    stp03["Crear Instancia"]
    space:3
    stp02["Definir userdata"]
    space:3
    stp01["Imagen SO y Tamaño"]
  end
  space
  block:blk2:1
  columns 3
    space
    lbl02(["Hypervisor"])
    space:5
    stp04["Aprovisiona recursos"]
    space:5
    stp05[\"Primera ejecución?"/]
    space:4
    stp06a["Ejecuta userdata"]
    space
    stp06b["Continua"]
    space:4
    stp07["Finaliza el arranque"]
    space:5
    stp08["Máquina Virtual Lista"]
    space
  end

  stp01 -- "(1)" --> stp02
  stp02 -- "(2)" --> stp03
  stp03 -- "(3)" --> stp04
  stp04 -- "(4)" --> stp05
  stp05 -- "Sí (5)" --> stp06a
  stp05 -- "No (5)" --> stp06b
  stp06a -- "(6)" --> stp07
  stp06b -- "(6)" --> stp07
  stp07 -- "(7)" --> stp08
```

### Construcción de Imagenes de Contenedores

```mermaid
block
columns 3
  block:blk1:1
  columns 1
    lbl01(["Desarrollador"])
    space
    stp03["Crear y Guardar Imagen"]
    space:3
    stp02["Definir Metadatos"]
    space:3
    stp01["Crear Dockerfile"]
  end
  space
  block:blk2:1
  columns 1
    lbl02(["Orquestador"])
    space
    stp04["Crea contenedor"]
    space
    stp05["Lee Metadatos"]
    space
    stp06["Ejecuta contenedor"]
    space
    stp07["Finaliza el arranque"]
    space
    stp08["Contenedor Listo"]
  end

  stp01 -- "(1)" --> stp02
  stp02 -- "(2)" --> stp03
  stp03 -- "(3)" --> stp04
  stp04 -- "(4)" --> stp05
  stp05 -- "(5)" --> stp06
  stp06 -- "(6)" --> stp07
  stp07 -- "(7)" --> stp08
```

### Interruptores de funciones

```mermaid
block
columns 3
  block:blk1:1
  columns 1
    lbl01(["Desarrollador"])
    space
    stp03["Aplica los cambios"]
    space:2
    stp02["Codifica comportamiento"]
    space:2
    stp01["Crea interruptor"]
  end
  space
  block:blk2:1
  columns 3
    space
    lbl02(["Applicación"])
    space:5
    stp04["Monitorea interruptor"]
    space:5
    stp05[\"Cambio en el valor?"/]
    space:4
    stp06a["Cambia comportamiento"]
    space
    stp06b["Continua ejecutando"]
    space:4
    stp07["Reinicia monitoreo"]
  end

  stp01 -- "(1)" --> stp02
  stp02 -- "(2)" --> stp03
  stp03 -- "(3)" --> stp04
  stp04 -- "(4)" --> stp05
  stp05 -- "Sí (5)" --> stp06a
  stp05 -- "No (5)" --> stp06b
  stp06a -- "(6)" --> stp07
  stp06b -- "(6)" --> stp07
```
