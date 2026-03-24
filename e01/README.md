# DevOps In-Formation T1 Ep.1

## Contenedores en la "NUBE" - Diagrama simplificado

```mermaid
block
columns 1
  block:orq1:1
  columns 3
    space
    lblorq1(["Orquestador"])
    space
    block:pod1
    columns 2
      or1cn1["Contenedor 1a"]:1
      or1cnn["Contenedor 2a"]:1
    end
    block:pod2
    columns 2
      pod2cn1["Contenedor 1b"]:1
      pod2cnn["Contenedor 2b"]:1
    end
    block:podn
    columns 2
      or2cn1["Contenedor 1c"]:1
      or2cnn["Contenedor … n"]:1
    end
    space:3
    nod1["Nodo   1"]
    nod2["Nodo   2"]
    nodn["Nodo … n"]
    space:4
    orqcon["Plano de Control"]
    space:5
    orqui["Interfaz"]
  end
  block:hyp1:1
  columns 3
    space
    lblhyp1(["Nube"])
    space
    block:hv1
    columns 2
      hv1vm1["Máquina Virtual 1"]:1
      hv1vmn["Máquina Virtual 2"]:1
    end
    block:hv2
    columns 2
      hv2vm1["Máquina Virtual 3"]:1
      hv2vmn["Máquina Virtual 4"]:1
    end
    block:hvn
    columns 2
      hvnvm1["Máquina Virtual 5"]:1
      hvnvmn["Máquina Virtual … n"]:1
    end
    space:3
    srv1["Servidor 1"]
    srv2["Servidor 2"]
    srvn["Servidor … n"]
    space:4
    con["Plano de Control"]
    space:5
    ui["Interfaz"]
  end

  nod1 --- pod1
  nod2 --- pod2
  nodn --- podn
  orqcon --> nod1
  orqcon --> nod2
  orqcon --> nodn
  orqui --> orqcon
  hv1vm1 --- nod1
  hvnvmn --- nodn
  hv1 --- srv1
  hv2 --- srv2
  hvn --- srvn
  con --> srv1
  con --> srv2
  con --> srvn
  ui --> con
```

## Areas que conforman DevOPS

```mermaid
---
title: Etapas tradicionales - Dessarrollo, Liberación y Operaciones
---
flowchart LR
  subgraph dev["Desarrollo"]
    direction TB
    dev_start([Inicio])
    dev_stop([Fin])
    plan[Planeación<br/>y diseño]
    code[Codificación]
    repo[Almacena en<br/>repositorio]
    utest[Pruebas Unitarias]
    build[Compilacion]
    store[Almacena binario]
    notify_rel[Notifica a<br/>liberación]
  end
  subgraph rel[Liberación]
    direction TB
    rel_start([Inicio])
    rel_stop([Fin])
    build_rel[Construye paquete]
    document_rel[Documenta acciones<br/>requeridas]
    raise_ticket[Levanta requerimiento<br/>a operaciones]
    wait[\Espera a que<br/>operaciones finalize/]
    report_dev[Reporta a desarrollo<br/>resultado del proceso]
  end
  subgraph ops["Operaciones"]
    direction TB
    ops_start([Inicio])
    ops_stop([Fin])
    get[Descarga paquete<br/>e instrucciones]
    install[Instala en servidores]
    itest[Prueba de integración]
    fail{¿Falló?}
    rollback[Revierte los<br/>cambios]
    reject[Rechaza la versión<br/>- Documenta errores]
    accept[Acepta la versión]
    report_rel[Reposta a liberación]
  end

  dev r1@-..- rel r2@-..- ops
  r1@{ animate: true }
  r2@{ animate: true }
  dev_start --> plan --> code --> repo --> utest --> build --> store --> notify_rel --> dev_stop
  rel_start --> build_rel --> document_rel --> raise_ticket --> wait --> report_dev --> rel_stop
  ops_start --> get --> install --> itest --> fail
  fail --> |Si|rollback --> reject --> report_rel
  fail --> |No|accept --> report_rel
  report_rel --> ops_stop
```

```mermaid
---
title: DevOps - Etapas
---
flowchart LR
  subgraph app["Applicación"]
    direction TB
    app_repo[Cambios en<br/>repositorio git]
    u_test[Pruebas<br/>unitarias]
    build[Compilación]
    buildx[Construye imagen<br/>de contenedor]
    registry[Almacena imagen<br/>de contenedor]
  end
  subgraph deploy["Liberación"]
    direction TB
    deploy_testing[Libera en pruebas]
    i_test[Pruebas de integración]
    deploy_staging[Libera en pre-producción]
    a_test[\Pruebas de acceptación/]
    deploy_prod[Libera en produccion]
    v_test[Pruebas de validación]
  end
  subgraph iac["Infrastructura como Código"]
    direction TB
    iac_repo[Cambios en<br/>repositorio iac]
    validate_iac[Validación de IaC]
    plan_iac[\Examina plan de IaC/]
    deploy_iac_testing[Libera IaC en<br/>pruebas]
    deploy_iac_staging[Libera IaC en<br/>pre-producción]
    deploy_iac_prod[Libera IaC en<br/>producción]
  end

  app --> deploy r1@--- iac 
  r1@{ animate: true }
  app_repo --> u_test --> build --> buildx --> registry
  deploy_testing --> i_test --> deploy_staging --> a_test --> deploy_prod --> v_test
  iac_repo --> validate_iac --> plan_iac --> deploy_iac_testing --> deploy_iac_staging --> deploy_iac_prod
```

