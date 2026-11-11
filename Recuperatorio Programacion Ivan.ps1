# ====================================================================
# TRABAJO PRÁCTICO - GRUPO 2: AUTOMATIZACIÓN DE CONECTIVIDAD DE RED
# ====================================================================
Clear-Host

Write-Host "Iniciando prueba de conectividad hacia los DNS de Google (8.8.8.8)..." -ForegroundColor Cyan
Write-Host ""

# 1. Ciclo repetitivo que se repite 3 veces para simular intentos de conexión
for ($i = 1; $i -le 3; $i++) {
    
    # 3. Mostrar la fecha y hora exacta de cada verificación
    $fechaHora = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "--- Intento número: $i --- [Hora: $fechaHora]" -ForegroundColor Yellow

    # 2. Ejecutar Test-Connection para comprobar respuesta del servidor (8.8.8.8)
    try {
        Test-Connection -ComputerName "8.8.8.8" -Count 1 -ErrorAction Stop | Out-Null
        Write-Host "Estado de la red: Conexión exitosa con el servidor 8.8.8.8" -ForegroundColor Green
    } catch {
        Write-Host "Estado de la red: No se pudo alcanzar el servidor" -ForegroundColor Red
    }

    # 4. Estructura condicional dentro del ciclo para evaluar si la iteración es par o impar
    if ($i % 2 -eq 0) {
        Write-Host "Evaluación de iteración: El número $i es PAR." -ForegroundColor Magenta
    } else {
        Write-Host "Evaluación de iteración: El número $i es IMPAR." -ForegroundColor Blue
    }
    
    Write-Host "------------------------------------------------------------"
    Start-Sleep -Seconds 1
}

# 5. Mensaje final indicando que el monitoreo ha concluido con éxito
Write-Host "¡El monitoreo de red ha concluido con éxito!" -ForegroundColor Green

