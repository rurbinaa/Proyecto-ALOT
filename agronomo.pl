:- use_module(library(pce)).

% ==========================================
% 1. BASE DE CONOCIMIENTOS (4 Variables)
% Estructura: cultivo(Nombre, PH, Clima, Humedad, Temporada).
% ==========================================
cultivo('Tomate', neutro, calido, moderada, primavera).
cultivo('Zanahoria', acido, templado, moderada, otono).
cultivo('Cebolla', acido, templado, baja, invierno).
cultivo('Sandia', neutro, calido, alta, verano).
cultivo('Frijol', neutro, calido, moderada, primavera).
cultivo('Papa', acido, frio, moderada, invierno).
cultivo('Espinaca', neutro, frio, alta, otono).
cultivo('Aloe Vera (Sabila)', alcalino, calido, baja, verano).
cultivo('Lenteja', alcalino, templado, baja, primavera).
cultivo('Ajo', neutro, frio, baja, invierno).

% ==========================================
% 2. VENTANAS DE TIPS (Ayuda Contextual)
% ==========================================
tip_ph :-
    new(V, dialog('Tip: Nivel de pH')),
    send(V, append, new(_, label(l1, 'Prueba casera con tierra y agua:'))),
    send(V, append, new(_, label(l2, '- Echa Vinagre: Si burbujea, es ALCALINO.'))),
    send(V, append, new(_, label(l3, '- Echa Bicarbonato: Si burbujea, es ACIDO.'))),
    send(V, append, new(_, label(l4, '- Ninguno reacciona: Es NEUTRO.'))),
    send(V, open_centered).

tip_clima :-
    new(V, dialog('Tip: Clima Promedio')),
    send(V, append, new(_, label(l1, 'Temperatura de tu region:'))),
    send(V, append, new(_, label(l2, '- Frio: Menos de 15 C (Heladas frecuentes)'))),
    send(V, append, new(_, label(l3, '- Templado: Entre 15 C y 22 C'))),
    send(V, append, new(_, label(l4, '- Calido: Mas de 22 C (Mucho sol)'))),
    send(V, open_centered).

tip_humedad :-
    new(V, dialog('Tip: Humedad del Suelo')),
    send(V, append, new(_, label(l1, 'Toca la tierra con tus manos:'))),
    send(V, append, new(_, label(l2, '- Baja: Tierra seca, polvosa o arenosa.'))),
    send(V, append, new(_, label(l3, '- Moderada: Tierra fresca, no se desmorona facil.'))),
    send(V, append, new(_, label(l4, '- Alta: Tierra lodosa o que retiene mucha agua.'))),
    send(V, open_centered).

tip_temporada :-
    new(V, dialog('Tip: Temporada de Siembra')),
    send(V, append, new(_, label(l1, '¿En que estacion vas a plantar la semilla?'))),
    send(V, append, new(_, label(l2, 'Ten en cuenta que la planta crecera'))),
    send(V, append, new(_, label(l3, 'en los meses siguientes a tu eleccion.'))),
    send(V, open_centered).

% ==========================================
% 3. MOTOR DE INFERENCIA
% ==========================================
recomendar(PH, Clima, Humedad, Temporada) :-
    new(VRes, dialog('Resultado del Analisis')),
    send(VRes, append, new(Lista, list_browser)),
    send(Lista, size, size(60, 10)),
    
    (   cultivo(Nombre, PH, Clima, Humedad, Temporada),
        atomic_list_concat(['- Cultivo IDEAL: ', Nombre], Fila),
        send(Lista, append, Fila),
        fail
    ;   true 
    ),
    
    % Validar si encontró algo
    (   get(Lista?members, size, 0)
    ->  send(Lista, append, 'No hay cultivos exactos para este ecosistema.'),
        send(Lista, append, 'Intenta ajustar la humedad o temporada.')
    ;   true
    ),
    
    send(VRes, append, button('Cerrar', message(VRes, destroy))),
    send(VRes, open_centered).

% ==========================================
% 4. INTERFAZ PRINCIPAL CON AYUDA EN LÍNEA
% ==========================================
iniciar_agronomo :-
    new(Ventana, dialog('El Agronomo Virtual - Sistema Experto')),
    send(Ventana, append, new(_, label(titulo, 'Disena tu ecosistema de siembra:'))),
    send(Ventana, append, new(_, label(espacio, ' '))),
    
    % Variable 1: PH
    send(Ventana, append, new(MenuPH, menu('1. PH del Suelo', choice))),
    send_list(MenuPH, append, [acido, neutro, alcalino]),
    send(Ventana, append, button('? Como saber el pH', message(@prolog, tip_ph)), right),
    
    % Variable 2: Clima
    send(Ventana, append, new(MenuClima, menu('2. Clima Local  ', choice))),
    send_list(MenuClima, append, [frio, templado, calido]),
    send(Ventana, append, button('? Guia de Clima', message(@prolog, tip_clima)), right),
    
    % Variable 3: Humedad
    send(Ventana, append, new(MenuHum, menu('3. Nivel Humedad', choice))),
    send_list(MenuHum, append, [baja, moderada, alta]),
    send(Ventana, append, button('? Como medir', message(@prolog, tip_humedad)), right),
    
    % Variable 4: Temporada
    send(Ventana, append, new(MenuTemp, menu('4. Temporada    ', choice))),
    send_list(MenuTemp, append, [primavera, verano, otono, invierno]),
    send(Ventana, append, button('? Tip Temporada', message(@prolog, tip_temporada)), right),
    
    send(Ventana, append, new(_, label(espacio2, ' '))),
    
    % Botón final: Le pasamos las 4 variables seleccionadas a la regla "recomendar"
    send(Ventana, append, button('ANALIZAR Y OBTENER RECOMENDACION', 
         message(@prolog, recomendar, MenuPH?selection, MenuClima?selection, MenuHum?selection, MenuTemp?selection))),
    
    send(Ventana, open_centered).