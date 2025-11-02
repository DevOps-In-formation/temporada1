# DevOps In-Formation T1 Ep.1

## Contenedores en la "NUBE" - Diagrama simplificado

```mermaid
block
  columns 6
  block:nsp1:3
    columns 3
    or1cn1["Contenedor 1"]
    or1cne["Contenedor …"]
    or1cnn["Contenedorn n"]
  end
  block:nsp2:3
    columns 3
    or2cn1["Contenedor 1"]
    or2cne["Contenedor …"]
    or2cnn["Contenedorn n"]
  end
  space:6
  or1["Orquestador 1"]:3
  or2["Orquestador 2"]:3
  space:6
  block:env1:6
    columns 3
    hv1vm1["VM 1"]
    hv1vme["VM …"]
    hv1vmn["VM n"]
  end
  con1["UI para Clientes"]:6
  vrt1["Plataforma de Virtualizacion"]:6
  block:dc1:6
    columns 3
    dc1srv1["Server 1"]
    dc2srve["Server …"]
    dc1srvn["Server n"]
  end
  env1 --- or1
  env1 --- or2
  or1 --- nsp1
  or2 --- nsp2
```

## Areas que conforman DevOPS

```mermaid
---
title: Areas tradicionales - Dessarrollo y Operaciones
---
flowchart LR
  subgraph dev["Desarrollo"]
    dev_start([Start])
    dev_stop([Stop])
    direction TB
    code[Codigo fuente]
    repo[Repositorio]
    utest[Pruebas Unitarias]
    build[Compilacion]
    store[Almacena binario<br/>o paquete]
  end
  subgraph release["Liberación"]
    raise_ticket["Requerimiento"]
    
  end
  subgraph ops["Operaciones"]
    ops_start([Start])
    ops_stop([Stop])
    get[Obtiene binario<br/>o paquete]
    install[Instala en servidores]
    itest[Prueba de integracion]
    fail{¿Falló?}
    rollback[Retorna a la<br/>version anterior]
    reject[Rechaza el binario<br/>o paquete]
    accept[Acepta la version]
  end
  dev_start-->code-->repo-->utest-->build-->store-->dev_stop
  dev -->|"Requerimiento<br/>Libera nueva version"| ops
  ops_start--->get-->install-->itest-->fail
  fail-->|Si|rollback-->reject-->ops_stop
  fail-->|No|accept-->ops_stop
```

```mermaid
---
title: DevOps - Areas
---
flowchart
  subgraph devops[DevOps]
    subgraph "Desarrollo"
      repo[repositorio git]
    end
    subgraph who["¿Quien está a cargo aquí?"]
      registry[Registro de imagenes<br/>de contenedor]
      subgraph ci[CI/CD]
        direction TB
        test[Pruebas<br/>unitarias]
        build[Compilacion]
      end
      state[Almacenamiento de<br/>archivos de estado]
    end
    subgraph "Operaciones"
      infra[Infrastructura]
    end
  end


  registry --- infra
  repo --- ci
  test --- build
  ci --- registry
  ci --- infra
  ci ~~~ state
  state --- infra
```

