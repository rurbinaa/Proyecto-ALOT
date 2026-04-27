# Sistema de Recomendaciones Agropecuarias

Este es un **Sistema Experto modular** desarrollado en **Prolog** utilizando la interfaz gráfica **XPCE**. El programa actúa como un consultor inteligente para agricultores y ganaderos, permitiendo tomar decisiones basadas en variables biológicas, climáticas y técnicas para maximizar la productividad y evitar pérdidas económicas.

## Características Principales

### Módulo Agrícola (Recomendador de Cultivos)
* **Base de Datos Extendida:** Más de 50 cultivos comunes con sus requerimientos específicos.
* **Entrada Inteligente:** Conversor automático de temperatura (Celsius/Fahrenheit).
* **Filtros de Viabilidad:** Evaluación lógica de pH (Ácido, Neutro, Alcalino), Humedad y Temporada de siembra.
* **Tips Contextuales:** Guía integrada sobre métodos de medición manual (Prueba del puño, vinagre/bicarbonato, etc.).

### Módulo Zootécnico (Gestión de Lotes Bovinos)
* **Análisis Genético:** Evaluación de 11 razas principales (Brahman, Holstein, Gyr, Senepol, entre otras) según el propósito (Carne, Leche, Doble Propósito).
* **Estrés Calórico:** Sistema de alertas según la tolerancia térmica de la raza (Bos Taurus vs Bos Indicus).
* **Protección UV:** Lógica avanzada que detecta razas sensibles a la radiación solar para prevenir enfermedades como el cáncer de ojo o quemaduras.
* **Optimización de Recursos:** Recomendaciones sobre fotoperiodo (horas de luz) para aumentar la producción láctea.

## Arquitectura del Proyecto

El sistema está diseñado bajo un modelo modular para facilitar su mantenimiento y escalabilidad:

1. **`base_conocimiento.pl`**: Contiene los hechos puros (cultivos, razas, diccionarios de ayuda) + tablas de tolerancias.
2. **`motor_logico.pl`**: Motor de inferencia con jerarquía numérica para tolerancias, reglas matemáticas, conversiones y manejo de excepciones.
3. **`agronomo.pl`**: Interfaz gráfica de usuario (GUI) desarrollada en XPCE, listeners de eventos y formularios dinámicos.
4. **`test_alot.pl`**: Tests unitarios usando plunit (27 tests).

## Requisitos

* [SWI-Prolog](https://www.swi-prolog.org/) (Versión 8.0 o superior).
* Librería XPCE (incluida por defecto en SWI-Prolog).

## Instalación y Uso

1. Descarga todos los archivos `.pl` en una misma carpeta.
2. Abre la terminal de SWI-Prolog en esa ruta.
3. Carga el archivo principal:
   ```prolog
   ?- [agronomo].
   ```
4. Inicia el programa:
   ```prolog
   ?- iniciar_recomendador.
   ```

## Ejecutar Tests

```prolog
?- [test_alot].
?- run_tests.
```

## Conceptos de Programación

El proyecto utiliza conceptos avanzados de programación lógica:
* **Unificación y Backtracking:** Para el filtrado de cultivos compatibles.
* **Reglas Parametrizadas:** Tablas de tolerancias (`tolerancia_climatica/3`, `tolerancia_uv/2`) con jerarquía numérica.
* **Manejo de Errores:** Implementación de `catch/3` para validar entradas numéricas.
* **UI Reactiva:** Uso de mensajes `send` en XPCE para actualizar etiquetas de botones en tiempo real.
* **Tests Unitarios:** 27 tests con plunit cubriendo pH, humedad, búsqueda de razas, nutrición e integración.

---
Desarrollado como proyecto de Programación Lógica.