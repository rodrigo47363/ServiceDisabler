# Comprobar si el script se está ejecutando como administrador
if (-not [System.Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544') {
    Write-Error "Este script debe ejecutarse con privilegios de administrador. Por favor, ejecuta PowerShell como administrador."
    exit
}

# Log de salida para registrar el proceso
$logFile = "C:\DesactivacionServicios_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"
$timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
Write-Output "$timestamp - Inicio del proceso de desactivación de servicios" | Out-File -Append $logFile

# Lista de servicios a desactivar (sin el servicio 'ndu')
$services = @(
    "diagnosticshub.standardcollector.service",  # Microsoft Diagnostics Hub Standard Collector Service
    "DiagTrack",                                  # Diagnostics Tracking Service
    "dmwappushservice",                           # WAP Push Message Routing Service
    "lfsvc",                                      # Geolocation Service
    "MapsBroker",                                 # Downloaded Maps Manager
    "NetTcpPortSharing",                          # Net.Tcp Port Sharing Service
    "RemoteAccess",                               # Routing and Remote Access
    "RemoteRegistry",                             # Remote Registry
    "SharedAccess",                               # Internet Connection Sharing (ICS)
    "TrkWks",                                     # Distributed Link Tracking Client
    "WbioSrvc",                                   # Windows Biometric Service
    "WMPNetworkSvc",                              # Windows Media Player Network Sharing Service
    "XblAuthManager",                             # Xbox Live Auth Manager
    "XblGameSave",                                # Xbox Live Game Save Service
    "XboxNetApiSvc"                               # Xbox Live Networking Service
)

# Confirmación del usuario para proceder
$confirmation = Read-Host "¿Deseas continuar con la desactivación de estos servicios? (S/N)"
if ($confirmation -ne 'S') {
    Write-Output "$timestamp - Proceso cancelado por el usuario." | Out-File -Append $logFile
    exit
}

# Bucle para desactivar cada servicio
foreach ($service in $services) {
    try {
        Write-Output "$timestamp - Iniciando el proceso para desactivar el servicio: $service" | Out-File -Append $logFile
        
        # Verificar si el servicio existe antes de intentar desactivarlo
        $serviceStatus = Get-Service -Name $service -ErrorAction SilentlyContinue
        if ($null -ne $serviceStatus) {
            # Cambiar el tipo de inicio del servicio a "Deshabilitado"
            Set-Service -Name $service -StartupType Disabled

            # Intentar detener el servicio si es posible
            try {
                Stop-Service -Name $service -Force -ErrorAction Stop
                Write-Output "$timestamp - El servicio '$service' ha sido detenido y desactivado exitosamente." | Out-File -Append $logFile
            } catch {
                Write-Warning "$timestamp - No se pudo detener el servicio '$service'. Solo se desactivará." | Out-File -Append $logFile
            }
        } else {
            Write-Warning "$timestamp - El servicio '$service' no se encontró en el sistema." | Out-File -Append $logFile
        }
    } catch {
        # Capturar errores y registrar la excepción en el log
        Write-Error "$timestamp - Error al intentar desactivar el servicio '$service': $_" | Out-File -Append $logFile
    }
}

# Mensaje final de proceso completado
Write-Output "$timestamp - Proceso de desactivación de servicios completado." | Out-File -Append $logFile
