Get-Process

Get-Process | Where-Object { $_.CPU -gt 80 }

$date = Get-Date -Format "yyyyMMdd_HHmmss"
$logFileName = "HighCPUProcesses_$date.txt"

Get-Process | Where-Object { $_.CPU -gt 80 } | Out-File -FilePath "C:\path\to\$logFileName"