% ==========================================
% ARCHIVO: test_alot.pl
% Tests unitarios para el Sistema ALOT
% ==========================================

:- begin_tests(recomendador).

:- use_module(library(lists)).
:- consult('motor_logico.pl').

% --- TESTS DE EVALUACION DE pH ---
test(eval_ph_acido_valido) :-
    eval_ph(acido, 6.0, 6.5), !.

test(eval_ph_acido_limite) :-
    eval_ph(acido, 6.8, 7.0), !.

test(eval_ph_neutro_valido) :-
    eval_ph(neutro, 6.5, 7.0).

test(eval_ph_neutro_rango_completo) :-
    eval_ph(neutro, 6.0, 7.5).

test(eval_ph_alcalino_valido) :-
    eval_ph(alcalino, 6.5, 7.5), !.

% Test de integracion: pH acido requiere MinPH <= 6.8
test(eval_ph_acido_min_ok) :-
    eval_ph(acido, 6.5, 5.0).

% --- TESTS DE EVALUACION DE HUMEDAD ---
test(eval_hum_baja) :-
    eval_hum(baja, 30.0, 45.0), !.

test(eval_hum_moderada) :-
    eval_hum(moderada, 50.0, 70.0).

test(eval_hum_alta) :-
    eval_hum(alta, 60.0, 85.0), !.

test(eval_hum_baja_falla) :-
    \+ eval_hum(baja, 60.0, 80.0).

% --- TESTS DE TOLERANCIAS PARAMETRIZADAS ---
test(nivel_tolerancia_definiciones) :-
    nivel_tolerancia(severo, 3),
    nivel_tolerancia(moderado, 2),
    nivel_tolerancia(leve, 1).

test(nivel_suficiente_cumple) :-
    nivel_suficiente(leve, leve),
    nivel_suficiente(leve, moderado),
    nivel_suficiente(leve, severo),
    nivel_suficiente(moderado, moderado),
    nivel_suficiente(moderado, severo),
    nivel_suficiente(severo, severo).

test(nivel_suficiente_falla) :-
    \+ nivel_suficiente(moderado, leve),
    \+ nivel_suficiente(severo, leve),
    \+ nivel_suficiente(severo, moderado).

% --- TESTS DEL MOTOR DE BUSQUEDA DE RAZAS ---
test(buscar_raza_carne_clima_severo) :-
    findall(R, buscar_raza_ideal(carne, severo, baja_luz, R), Rs),
    member(brahman, Rs),
    member(nelore, Rs),
    member(senepol, Rs).

test(buscar_raza_leche_clima_leve) :-
    findall(R, buscar_raza_ideal(leche, leve, baja_luz, R), Rs),
    member(holstein, Rs),
    member(jersey, Rs),
    member(gyr, Rs).

test(buscar_raza_sensible_uv_alta_luz) :-
    \+ buscar_raza_ideal(leche, leve, alta_luz, holstein),
    \+ buscar_raza_ideal(carne, leve, alta_luz, hereford).

test(buscar_raza_doble_proposito) :-
    buscar_raza_ideal(doble_proposito, moderado, baja_luz, girolando).

% --- TESTS DE EVALUACION DE NUTRICION ---
test(eval_nut_leche_alta) :-
    eval_nut(leche, alta, Msg),
    Msg = '[NUTRICION] Pico de produccion de leche.'.

test(eval_nut_carne_pobre) :-
    eval_nut(carne, pobre, '[NUTRICION] Animales estaran flacos.').

test(eval_nut_default) :-
    eval_nut(otro, media, '[NUTRICION] Mantenimiento normal.').

% --- TESTS DE EVALUACION DE LUZ ---
test(eval_luz_prod_leche_alta) :-
    eval_luz_prod(leche, alta_luz, '[PRODUCCION] 16hrs luz maximizan lactation.').

test(eval_luz_prod_carne_baja) :-
    eval_luz_prod(carne, baja_luz, '[PRODUCCION] Poca luz hace el engorde lento.').

test(eval_luz_prod_doble_proposito) :-
    eval_luz_prod(doble_proposito, alta_luz, '[PRODUCCION] 16hrs luz maximizan lactation.').

% --- TESTS DE INTEGRACION: CULTIVOS ---
test(cultivo_tomate_primavera) :-
    cultivo('Tomate', 6.0, 7.0, 20.0, 30.0, 60.0, 80.0, primavera).

test(cultivo_arroz_alta_humedad) :-
    cultivo('Arroz', 5.5, 6.5, 20.0, 35.0, 80.0, 100.0, primavera).

test(ficha_cultivo_tomate_existe) :-
    ficha_cultivo('Tomate', _, _, _, _).

% --- TESTS DE INTEGRACION: RECOMENDACION AGRICOLA ---
test(recomendacion_agro_encuentra_cultivos) :-
    findall(Nom,
        (cultivo(Nom, MinPH, MaxPH, MinT, MaxT, MinH, MaxH, primavera),
         eval_ph(neutro, MinPH, MaxPH),
         25.0 >= MinT, 25.0 =< MaxT,
         eval_hum(moderada, MinH, MaxH)),
        Cultivos),
    length(Cultivos, N),
    N > 0.

:- end_tests(recomendador).

% Predicado para ejecutar todos los tests
ejecutar_tests :-
    run_tests.