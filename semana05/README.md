# Semana 05: Bash Scripting - Fundamentos
#
# Descripción
# sysinfo.sh genera un reporte del estado del sistema.
# Muestra información de CPU, RAM, disco y procesos activos.
#
# Uso
# ```bash
# ./sysinfo.sh            # Reporte completo
# ./sysinfo.sh --cpu      # Solo CPU
# ./sysinfo.sh --mem      # Solo memoria
# ./sysinfo.sh --disk     # Solo disco
# ./sysinfo.sh --proc     # Solo procesos
# ./sysinfo.sh --version  # Versión del script
# ./sysinfo.sh --help     # Ayuda
# ```
#
# Estructura
# ```
# semana05/
# ├── README.md
# ├── sysinfo.sh
# └── commands-used.md
# ```
#
# Conceptos aprendidos
# - Variables en Bash (declaración, expansión, valores por defecto)
# - Parámetros posicionales ($1, $@, $#)
# - Variables especiales ($?, $$, $USER)
# - Aritmética con $(( ))
# - Sustitución de comandos con $()
# - echo y printf para formato de salida
# - read para entrada del usuario
# - Comandos de sistema: uname, hostname, uptime, date, nproc, free, df, ps
# - Validación de argumentos y exit con códigos
#
# Ejecución
# ```bash
# cd ~/linux-lab/semana05
# chmod +x sysinfo.sh
# ./sysinfo.sh
# ```
