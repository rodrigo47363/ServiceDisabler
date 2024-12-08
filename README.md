# ServiceDisabler - Desactivador de Servicios de Windows

**ServiceDisabler** es un **script de PowerShell** diseñado para **mejorar el rendimiento** y **seguridad en sistemas Windows**. Este script desactiva una lista de servicios innecesarios que pueden estar ejecutándose en segundo plano, optimizando el sistema y ayudando a liberar recursos.

## Palabras clave (SEO)
- Desactivar servicios en Windows
- Optimizar Windows
- Mejorar rendimiento Windows
- PowerShell para administración de servicios
- Seguridad en sistemas Windows
- Desactivador de servicios innecesarios
- Optimización de sistema operativo
- PowerShell administrador

## Requisitos

- **Windows 7** o superior.
- **PowerShell** ejecutado con privilegios de **administrador**.

## Funcionalidades

1. **Verificación de privilegios de administrador**: El script comprueba si se ejecuta con privilegios de administrador. Si no es así, la ejecución se interrumpe para evitar errores.
2. **Registro detallado**: Se genera un archivo de log en `C:\DesactivacionServicios_yyyy-MM-dd_HH-mm-ss.log`, con el proceso completo y detallado de cada acción realizada.
3. **Desactivación de servicios innecesarios**: Desactiva los siguientes servicios de Windows para mejorar el rendimiento y la seguridad:

    - `diagnosticshub.standardcollector.service` (Microsoft Diagnostics Hub Standard Collector Service)
    - `DiagTrack` (Diagnostics Tracking Service)
    - `dmwappushservice` (WAP Push Message Routing Service)
    - `lfsvc` (Geolocation Service)
    - `MapsBroker` (Downloaded Maps Manager)
    - `NetTcpPortSharing` (Net.Tcp Port Sharing Service)
    - `RemoteAccess` (Routing and Remote Access)
    - `RemoteRegistry` (Remote Registry)
    - `SharedAccess` (Internet Connection Sharing)
    - `TrkWks` (Distributed Link Tracking Client)
    - `WbioSrvc` (Windows Biometric Service)
    - `WMPNetworkSvc` (Windows Media Player Network Sharing Service)
    - `XblAuthManager` (Xbox Live Auth Manager)
    - `XblGameSave` (Xbox Live Game Save Service)
    - `XboxNetApiSvc` (Xbox Live Networking Service)

4. **Confirmación antes de proceder**: El script solicita confirmación del usuario antes de proceder con la desactivación de los servicios, asegurando que la acción no sea accidental.

## Instrucciones de uso

1. **Descarga** o clona el repositorio en tu máquina.
2. **Abre PowerShell** como administrador.
3. Navega hasta el directorio donde se encuentra el script.
4. Ejecuta el script con el siguiente comando:

    ```powershell
    .\ServiceDisabler.ps1
    ```

5. El script solicitará confirmación para proceder con la desactivación de los servicios.
6. Un archivo de log será generado en `C:\DesactivacionServicios_yyyy-MM-dd_HH-mm-ss.log`, con detalles de la ejecución.

## Log

El archivo de log contiene un registro detallado de cada servicio que se desactiva, incluyendo:

- Nombre del servicio.
- Estado de detención del servicio.
- Cualquier error ocurrido durante el proceso.

Este archivo te permitirá verificar todas las acciones realizadas y detectar posibles problemas.

## Contribuciones

Si deseas contribuir a este proyecto, por favor realiza un **fork** del repositorio y envía un **pull request** con tus modificaciones o mejoras.

## Licencia

Este proyecto está bajo la **Licencia MIT**. Consulta el archivo [LICENSE](LICENSE) para más detalles.
