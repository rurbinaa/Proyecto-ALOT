import csv
import os
import glob # Librería para buscar múltiples archivos

def limpiar_texto(texto):
    """Limpia caracteres que podrían romper la sintaxis de Prolog."""
    return texto.replace("'", "").replace("\\", "/")

def procesar_todos_los_csv():
    # Configuramos las rutas
    ruta_actual = os.path.dirname(os.path.abspath(__file__))
    carpeta_capturas = os.path.join(ruta_actual, '..', 'capturas')
    ruta_prolog = os.path.join(ruta_actual, '..', 'src', 'base_hechos.pl')

    # Buscamos todos los archivos que terminen en .csv dentro de la carpeta
    patron_busqueda = os.path.join(carpeta_capturas, '*.csv')
    archivos_csv = glob.glob(patron_busqueda)

    if not archivos_csv:
        print(f"No se encontraron archivos CSV en la carpeta: {carpeta_capturas}")
        return

    print(f"Se encontraron {len(archivos_csv)} capturas CSV. Iniciando traducción...\n")

    # Abrimos el archivo de Prolog para escribir todo consolidado
    total_hechos = 0
    with open(ruta_prolog, mode='w', encoding='utf-8') as f_pl:
        f_pl.write("% ==========================================\n")
        f_pl.write("% Base de Conocimiento de Tráfico (ALOT)\n")
        f_pl.write("% Autogenerada desde múltiples capturas\n")
        f_pl.write("% ==========================================\n")

        # Iteramos sobre cada archivo CSV que encontró
        for archivo in archivos_csv:
            nombre_archivo = os.path.basename(archivo)
            print(f" -> Procesando: {nombre_archivo}")
            
            # Ponemos un comentario en Prolog para saber de qué captura viene
            f_pl.write(f"\n% --- Origen: {nombre_archivo} ---\n")
            
            with open(archivo, mode='r', encoding='utf-8') as f_csv:
                lector = csv.DictReader(f_csv)
                
                for fila in lector:
                    id_paquete = fila.get('No.', '0')
                    tiempo = fila.get('Time', '0.0')
                    ip_src = fila.get('Source', 'unknown')
                    ip_dst = fila.get('Destination', 'unknown')
                    protocolo = fila.get('Protocol', 'unknown').lower()
                    info = limpiar_texto(fila.get('Info', ''))
                    
                    # Para evitar IDs repetidos entre diferentes archivos, 
                    # le pegamos el nombre del archivo al ID del paquete como texto.
                    id_unico = f"'{nombre_archivo}_pkt{id_paquete}'"
                    
                    hecho = f"paquete({id_unico}, {tiempo}, '{protocolo}', '{ip_src}', '{ip_dst}', '{info}').\n"
                    f_pl.write(hecho)
                    total_hechos = total_hechos + 1
                    
    print(f"\nTraducción masiva completada con éxito!")
    print(f"Se generaron {total_hechos} hechos lógicos en total.")
    print(f"Tu motor puede leerlos en: {ruta_prolog}")

# Ejecutar el script
if __name__ == '__main__':
    procesar_todos_los_csv()