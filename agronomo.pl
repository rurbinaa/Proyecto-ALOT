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
recomendar_zoo(Raza, Prop, Nut, Est, Luz) :-
    new(V, dialog('Dictamen de Recomendacion Zootecnica')),
    send(V, append, new(L, list_browser)), send(L, size, size(90, 8)),
    
    eval_zoo(Raza, Prop, M1), send(L, append, M1),
    eval_nut(Prop, Nut, M2), send(L, append, M2),
    eval_cli(Raza, Est, M3), send(L, append, M3),
    eval_luz(Raza, Prop, Luz, M4), send(L, append, M4),
    
    send(V, append, button('Cerrar Dictamen', message(V, destroy))), send(V, open_centered).

recomendar_agro(CatPH, TempStr, UnidadT, CatHum, Estacion) :-
    parse_num(TempStr, ResTemp),
    ( ResTemp = num(N_Temp) ->
        ( UnidadT == fahrenheit -> TempC is (N_Temp - 32) * 5 / 9 ; TempC = N_Temp ),
        new(V, dialog('Dictamen Agricola')),
        send(V, append, new(L, list_browser)), send(L, size, size(70, 8)),
        
        (   cultivo(Nom, MinPH, MaxPH, MinT, MaxT, MinH, MaxH, Estacion),
            eval_ph(CatPH, MinPH, MaxPH), TempC >= MinT, TempC =< MaxT, eval_hum(CatHum, MinH, MaxH),
            atomic_list_concat(['[RECOMENDADO] Siembla ', Nom, ' sin problemas.'], Fila), send(L, append, Fila), fail
        ;   true ),
        ( get(L?members, size, 0) -> send(L, append, 'ALERTA: Ningun cultivo se adapta a estos rangos tan especificos.') ; true ),
        
        send(V, append, button('Cerrar Dictamen', message(V, destroy))), send(V, open_centered)
    ;   send(@display, inform, 'Por favor ingresa la temperatura numerica (Ej: 25.5)')
    ).

% ==========================================
% 3. FORMULARIOS DE CAPTURA
% ==========================================
modulo_recomendar_zoo :-
    new(F, dialog('Recomendador Zootecnico')),
    send(F, append, new(_, label(ayuda, 'TIP: Al seleccionar una opcion, el boton de ayuda se actualiza.'))),
    send(F, append, new(_, label(e0, ' '))),
    
    send(F, append, new(InRaza, menu('Raza', cycle))), send_list(InRaza, append, [brahman, nelore, senepol, holstein, jersey, gyr, girolando, pardo_suizo, angus, hereford, charolais]),
    send(F, append, new(BtnRaza, button('? brahman', message(@prolog, mostrar_tip_dinamico, InRaza?selection))), right),
    send(InRaza, message, message(@prolog, actualizar_label_boton, InRaza?selection, BtnRaza)),
    
    send(F, append, new(InProp, menu('Proposito', cycle))), send_list(InProp, append, [carne, leche, doble_proposito]),
    send(F, append, new(BtnProp, button('? carne', message(@prolog, mostrar_tip_dinamico, InProp?selection))), right),
    send(InProp, message, message(@prolog, actualizar_label_boton, InProp?selection, BtnProp)),
    
    send(F, append, new(InNut, menu('Nutricion', cycle))), send_list(InNut, append, [pobre, media, alta]),
    send(F, append, new(BtnNut, button('? pobre', message(@prolog, mostrar_tip_dinamico, InNut?selection))), right),
    send(InNut, message, message(@prolog, actualizar_label_boton, InNut?selection, BtnNut)),
    
    send(F, append, new(InEst, menu('Estres', cycle))), send_list(InEst, append, [leve, moderado, severo]),
    send(F, append, new(BtnEst, button('? leve', message(@prolog, mostrar_tip_dinamico, InEst?selection))), right),
    send(InEst, message, message(@prolog, actualizar_label_boton, InEst?selection, BtnEst)),
    
    send(F, append, new(InLuz, menu('Fotoperiodo', cycle))), send_list(InLuz, append, [baja_luz, alta_luz]),
    send(F, append, new(BtnLuz, button('? baja_luz', message(@prolog, mostrar_tip_dinamico, InLuz?selection))), right),
    send(InLuz, message, message(@prolog, actualizar_label_boton, InLuz?selection, BtnLuz)),
    
    send(F, append, new(_, label(e, ' '))),
    send(F, append, button('GENERAR RECOMENDACION', message(@prolog, recomendar_zoo, InRaza?selection, InProp?selection, InNut?selection, InEst?selection, InLuz?selection))),
    send(F, append, button('Volver', message(F, destroy))),
    send(F, open_centered).

modulo_recomendar_agro :-
    new(F, dialog('Recomendador Agricola')),
    send(F, append, new(_, label(ayuda, 'TIP: Al seleccionar una opcion, el boton de ayuda se actualiza.'))),
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
    send(F, append, button('GENERAR RECOMENDACION', message(@prolog, recomendar_agro, MenuPH?selection, InTemp?selection, MenuT?selection, MenuHum?selection, MenuEst?selection))),
    send(F, append, button('Volver', message(F, destroy))),
    send(F, open_centered).

% ==========================================
% 4. PUNTO DE ENTRADA AL SISTEMA
% ==========================================
iniciar_recomendador :-
    new(Menu, dialog('SISTEMA DE RECOMENDACIONES AGROPECUARIAS')),
    send(Menu, append, new(_, label(t1, 'Que tipo de recomendacion necesitas hoy?'))),
    send(Menu, append, new(_, label(e1, ' '))),
    send(Menu, append, button('Recomendacion para Sembrar (Suelo)', message(@prolog, modulo_recomendar_agro))),
    send(Menu, append, button('Recomendacion de Lote (Bovinos)', message(@prolog, modulo_recomendar_zoo))),
    send(Menu, append, new(_, label(e2, ' '))),
    send(Menu, append, button('Cerrar Sistema', message(Menu, destroy))),
    send(Menu, open_centered).