:- use_module(library(pce)).
:- consult('motor_logico.pl').

% ==========================================
% 1. LISTENERS Y AYUDAS VISUALES
% ==========================================
actualizar_label_boton(NuevaSeleccion, BotonRef) :-
    NuevaSeleccion \== '',
    atomic_list_concat(['? ', NuevaSeleccion], NuevoTexto),
    send(BotonRef, label, NuevoTexto).

mostrar_tip_dinamico(OpcionElegida) :-
    info_ayuda(OpcionElegida, TextoAyuda),
    atomic_list_concat(['Informacion sobre: ', OpcionElegida], TituloVentana),
    new(V, dialog(TituloVentana)),
    send(V, append, new(_, label(l1, TextoAyuda))),
    send(V, open_centered).

tip_medir_ph :- new(V, dialog('Medicion')), send(V, append, new(_, label(l1, 'Vinagre hace espuma = Alcalino. Bicarbonato = Acido.'))), send(V, open_centered).
tip_medir_temp :- new(V, dialog('Medicion')), send(V, append, new(_, label(l1, 'Termometro a 1.5m del suelo, a la sombra.'))), send(V, open_centered).
tip_medir_hum :- new(V, dialog('Medicion')), send(V, append, new(_, label(l1, 'Si escurre agua al apretar la tierra = Alta.'))), send(V, open_centered).

% ==========================================
% 2. GENERADORES DE REPORTES GRAFICOS
% ==========================================
% NUEVO: Dibujador de Fichas Tecnicas Agricolas
mostrar_ficha_cultivo(NomCultivo) :-
    ficha_cultivo(NomCultivo, Siembra, Cosecha, Riego, Extra),
    atomic_list_concat(['Ficha Tecnica: ', NomCultivo], TituloVentana),
    new(V, dialog(TituloVentana)),
    send(V, size, size(400, 250)),
    
    send(V, append, new(_, label(t1, '=== CRONOGRAMA ==='))),
    atomic_list_concat(['Meses de Siembra: ', Siembra], TxtSiembra), send(V, append, new(_, label(l1, TxtSiembra))),
    atomic_list_concat(['Meses de Cosecha: ', Cosecha], TxtCosecha), send(V, append, new(_, label(l2, TxtCosecha))),
    
    send(V, append, new(_, label(e1, ' '))),
    send(V, append, new(_, label(t2, '=== MANEJO AGRONOMICO ==='))),
    atomic_list_concat(['Riego: ', Riego], TxtRiego), send(V, append, new(_, label(l3, TxtRiego))),
    atomic_list_concat(['Cuidados: ', Extra], TxtExtra), send(V, append, new(_, label(l4, TxtExtra))),
    
    send(V, append, new(_, label(e2, ' '))),
    send(V, append, button('Cerrar Ficha', message(V, destroy))),
    send(V, open_centered).

generar_recomendacion_zoo(Prop, Nut, Est, Luz) :-
    new(V, dialog('Dictamen Zootecnico de Compra')),
    send(V, append, new(L, list_browser)), send(L, size, size(90, 10)),
    
    send(L, append, '--- RAZAS IDEALES PARA COMPRAR ---'),
    (   buscar_raza_ideal(Prop, Est, Luz, RazaIdeal),
        atomic_list_concat(['> Puedes comprar: [', RazaIdeal, '] - Soporta tus condiciones.'], Fila), 
        send(L, append, Fila), fail
    ;   true ),
    ( get(L?members, size, 1) -> send(L, append, 'ALERTA: Ninguna raza bovina sobrevivira a estas condiciones extremas.') ; true ),
    
    send(L, append, ' '),
    send(L, append, '--- RENDIMIENTO ESPERADO ---'),
    eval_nut(Prop, Nut, M2), send(L, append, M2),
    eval_luz_prod(Prop, Luz, M4), send(L, append, M4),
    
    send(V, append, button('Cerrar Dictamen', message(V, destroy))), send(V, open_centered).

% REPORTE AGRICOLA REPARADO (Sin alargar la pantalla)
recomendar_agro(CatPH, TempStr, UnidadT, CatHum, Estacion) :-
    parse_num(TempStr, ResTemp),
    ( ResTemp = num(N_Temp) ->
        ( UnidadT == fahrenheit -> TempC is (N_Temp - 32) * 5 / 9 ; TempC = N_Temp ),
        
        % 1. Recolectamos a todos los ganadores en una sola lista invisible primero
        findall(Nom, 
            (cultivo(Nom, MinPH, MaxPH, MinT, MaxT, MinH, MaxH, Estacion),
             eval_ph(CatPH, MinPH, MaxPH), TempC >= MinT, TempC =< MaxT, eval_hum(CatHum, MinH, MaxH)), 
            CultivosGanadores),
            
        new(V, dialog('Dictamen Agricola')),
        send(V, append, new(L, list_browser)), send(L, size, size(80, 8)),
        
        % 2. Si hay ganadores, los mostramos
        ( CultivosGanadores \== [] ->
            
            % Escribimos el texto en la caja negra
            ( member(C, CultivosGanadores),
              atomic_list_concat(['[RECOMENDADO] Siembla ', C, ' sin problemas.'], Fila),
              send(L, append, Fila), fail
            ; true ),
            
            % 3. LA MAGIA: Un solo menu desplegable y un solo boton
            send(V, append, new(_, label(e, ' '))),
            send(V, append, new(MenuFichas, menu('Selecciona para ver Ficha:', cycle))),
            send_list(MenuFichas, append, CultivosGanadores),
            send(V, append, button('Abrir Ficha Tecnica', message(@prolog, mostrar_ficha_cultivo, MenuFichas?selection)))
            
        ;   send(L, append, 'ALERTA: Ningun cultivo se adapta a estos rangos.')
        ),
        
        send(V, append, new(_, label(e2, ' '))),
        send(V, append, button('Cerrar Dictamen', message(V, destroy))), send(V, open_centered)
    ;   send(@display, inform, 'Por favor ingresa la temperatura numerica (Ej: 25.5)')
    ).

% ==========================================
% 3. FORMULARIOS DE CAPTURA
% ==========================================
modulo_recomendar_zoo :-
    new(F, dialog('Perfil de tu Finca (Bovinos)')),
    send(F, append, new(_, label(ayuda, 'Ingresa las condiciones de tu finca para saber que raza comprar:'))),
    send(F, append, new(_, label(e0, ' '))),
    
    send(F, append, new(InProp, menu('Proposito', cycle))), send_list(InProp, append, [carne, leche, doble_proposito]),
    send(F, append, new(BtnProp, button('? carne', message(@prolog, mostrar_tip_dinamico, InProp?selection))), right),
    send(InProp, message, message(@prolog, actualizar_label_boton, InProp?selection, BtnProp)),
    
    send(F, append, new(InNut, menu('Nutricion', cycle))), send_list(InNut, append, [pobre, media, alta]),
    send(F, append, new(BtnNut, button('? pobre', message(@prolog, mostrar_tip_dinamico, InNut?selection))), right),
    send(InNut, message, message(@prolog, actualizar_label_boton, InNut?selection, BtnNut)),
    
    send(F, append, new(InEst, menu('Clima (Estres)', cycle))), send_list(InEst, append, [leve, moderado, severo]),
    send(F, append, new(BtnEst, button('? leve', message(@prolog, mostrar_tip_dinamico, InEst?selection))), right),
    send(InEst, message, message(@prolog, actualizar_label_boton, InEst?selection, BtnEst)),
    
    send(F, append, new(InLuz, menu('Fotoperiodo', cycle))), send_list(InLuz, append, [baja_luz, alta_luz]),
    send(F, append, new(BtnLuz, button('? baja_luz', message(@prolog, mostrar_tip_dinamico, InLuz?selection))), right),
    send(InLuz, message, message(@prolog, actualizar_label_boton, InLuz?selection, BtnLuz)),
    
    send(F, append, new(_, label(e, ' '))),
    send(F, append, button('BUSCAR MEJORES RAZAS', message(@prolog, generar_recomendacion_zoo, InProp?selection, InNut?selection, InEst?selection, InLuz?selection))),
    send(F, append, button('Volver', message(F, destroy))),
    send(F, open_centered).

modulo_recomendar_agro :-
    new(F, dialog('Perfil de tu Tierra (Cultivos)')),
    send(F, append, new(_, label(ayuda, 'Ingresa los datos de tu tierra para saber que semilla comprar:'))),
    send(F, append, new(_, label(e0, ' '))),

    send(F, append, new(MenuPH, menu('pH del Suelo', cycle))), send_list(MenuPH, append, [acido, neutro, alcalino]),
    send(F, append, new(BtnPH, button('? acido', message(@prolog, mostrar_tip_dinamico, MenuPH?selection))), right),
    send(F, append, button('Tips para Medir', message(@prolog, tip_medir_ph)), right),
    send(MenuPH, message, message(@prolog, actualizar_label_boton, MenuPH?selection, BtnPH)),
    
    send(F, append, new(InTemp, text_item('Temperatura', ''))),
    send(F, append, new(MenuT, menu('Unidad', cycle)), right), send_list(MenuT, append, [celsius, fahrenheit]),
    send(F, append, button('Tips para Medir', message(@prolog, tip_medir_temp)), right),
    
    send(F, append, new(MenuHum, menu('Humedad', cycle))), send_list(MenuHum, append, [baja, moderada, alta]),
    send(F, append, new(BtnHum, button('? baja', message(@prolog, mostrar_tip_dinamico, MenuHum?selection))), right),
    send(F, append, button('Tips para Medir', message(@prolog, tip_medir_hum)), right),
    send(MenuHum, message, message(@prolog, actualizar_label_boton, MenuHum?selection, BtnHum)),
    
    send(F, append, new(MenuEst, menu('Temporada', cycle))), send_list(MenuEst, append, [primavera, verano, otono, invierno]),
    send(F, append, new(BtnEst, button('? primavera', message(@prolog, mostrar_tip_dinamico, MenuEst?selection))), right),
    send(MenuEst, message, message(@prolog, actualizar_label_boton, MenuEst?selection, BtnEst)),
    
    send(F, append, new(_, label(e, ' '))),
    send(F, append, button('BUSCAR MEJORES CULTIVOS', message(@prolog, recomendar_agro, MenuPH?selection, InTemp?selection, MenuT?selection, MenuHum?selection, MenuEst?selection))),
    send(F, append, button('Volver', message(F, destroy))),
    send(F, open_centered).

% ==========================================
% 4. PUNTO DE ENTRADA AL SISTEMA
% ==========================================
iniciar_recomendador :-
    new(Menu, dialog('SISTEMA DE RECOMENDACIONES AGROPECUARIAS')),
    send(Menu, append, new(_, label(t1, 'Que vas a producir hoy?'))),
    send(Menu, append, new(_, label(e1, ' '))),
    send(Menu, append, button('Quiero Sembrar (Cultivos)', message(@prolog, modulo_recomendar_agro))),
    send(Menu, append, button('Quiero Ganaderia (Bovinos)', message(@prolog, modulo_recomendar_zoo))),
    send(Menu, append, new(_, label(e2, ' '))),
    send(Menu, append, button('Cerrar Sistema', message(Menu, destroy))),
    send(Menu, open_centered).