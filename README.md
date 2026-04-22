# Sistema de Recomendaciones Agropecuarias

Este es un **Sistema Experto modular** desarrollado en **Prolog** utilizando la interfaz gráfica **XPCE**. El programa actúa como un consultor inteligente para agricultores y ganaderos, permitiendo tomar decisiones basadas en variables biológicas, climáticas y técnicas para maximizar la productividad y evitar pérdidas económicas.

##  Características Principales

###  Módulo Agrícola (Recomendador de Cultivos)
* **Base de Datos Extendida:** Más de 50 cultivos comunes con sus requerimientos específicos.
* **Entrada Inteligente:** Conversor automático de temperatura (Celsius/Fahrenheit).
* **Filtros de Viabilidad:** Evaluación lógica de pH (Ácido, Neutro, Alcalino), Humedad y Temporada de siembra.
* **Tips Contextuales:** Guía integrada sobre métodos de medición manual (Prueba del puño, vinagre/bicarbonato, etc.).

###  Módulo Zootécnico (Gestión de Lotes Bovinos)
* **Análisis Genético:** Evaluación de 11 razas principales (Brahman, Holstein, Gyr, Senepol, entre otras) según el propósito (Carne, Leche, Doble Propósito).
* **Estrés Calórico:** Sistema de alertas según la tolerancia térmica de la raza (Bos Taurus vs Bos Indicus).
* **Protección UV:** Lógica avanzada que detecta razas sensibles a la radiación solar para prevenir enfermedades como el cáncer de ojo o quemaduras.
* **Optimización de Recursos:** Recomendaciones sobre fotoperiodo (horas de luz) para aumentar la producción láctea.

##  Arquitectura del Proyecto

El sistema está diseñado bajo un modelo modular para facilitar su mantenimiento y escalabilidad:

1.  **`base_conocimiento.pl`**: Contiene los hechos puros (Hechos de cultivos, razas y diccionarios de ayuda).
2.  **`motor_logico.pl`**: Contiene el motor de inferencia, las reglas matemáticas, conversiones y el manejo de excepciones (`catch/fail`).
3.  **`agronomo.pl`**: Interfaz gráfica de usuario (GUI) desarrollada en XPCE, listeners de eventos y formularios dinámicos.

##  Requisitos

* [SWI-Prolog](https://www.swi-prolog.org/) (Versión 8.0 o superior recomendada).
* Librería XPCE (incluida por defecto en la instalación estándar de SWI-Prolog).

##  Instalación y Uso

1.  Descarga los tres archivos (`.pl`) en una misma carpeta.
2.  Abre la terminal de SWI-Prolog en esa ruta.
3.  Carga el archivo principal:
    ```prolog
    ?- [agronomo].
    ```
4.  Inicia el programa:
    ```prolog
    ?- iniciar_recomendador.
    ```

##  Lógica de Programación

El proyecto utiliza conceptos avanzados de programación lógica:
* **Unificación y Backtracking:** Para el filtrado de cultivos compatibles.
* **Manejo de Errores:** Implementación de `catch/3` para validar entradas numéricas.
* **UI Reactiva:** Uso de mensajes `send` en XPCE para actualizar etiquetas de botones en tiempo real según la selección del usuario.

---
Desarrollado como proyecto de / Programación Lógica.