# Analizador Lógico de Tráfico (ALOT)

ALOT es una solución innovadora para el diagnóstico de redes y ciberseguridad que fusiona la captura empírica de datos con el poder de la programación lógica. 

El proyecto extrae el tráfico capturado mediante herramientas como Wireshark y transforma esos paquetes crudos en una base de conocimientos estructurada a través de hechos lógicos. De este modo, un simple registro plano se convierte en un ecosistema de datos dinámico, interrogado por un motor de inferencia en Prolog para realizar análisis semánticos automatizados.

## Características Principales

* **Traducción Automatizada:** Conversión de capturas masivas (CSV) a bases de hechos lógicos (`.pl`).
* **Análisis Semántico (En desarrollo):** Deducción de eventos de alto nivel a partir de paquetes individuales.
* **Detección de Anomalías (En desarrollo):** Identificación de tráfico vulnerable en texto plano y escaneo de puertos.
* **Diagnóstico Inteligente:** Demostración de la utilidad práctica de la lógica de predicados aplicada a la ciberseguridad.

## Estructura del Proyecto

```text
Proyecto_ALOT/
│
├── capturas/            # Archivos CSV exportados desde Wireshark (Ignorados en Git).
├── scripts/             
│   └── csv_a_prolog.py  # Script de Python que traduce CSV a hechos lógicos.
├── src/                 
│   ├── base_hechos.pl   # Base de conocimiento autogenerada por el script.
│   └── prueba.pl        # Pruebas de conectividad del motor Prolog.
├── .gitignore           # Exclusión de archivos pesados y temporales.
└── README.md            # Documentación del proyecto.
