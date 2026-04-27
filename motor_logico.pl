% ==========================================
% ARCHIVO: motor_logico.pl
% El "Cerebro": Pura logica sin interfaz grafica
% ==========================================

:- consult('base_conocimiento.pl').

% Jerarquia de tolerancias climaticas (severo > moderado > leve)
nivel_tolerancia(severo, 3).
nivel_tolerancia(moderado, 2).
nivel_tolerancia(leve, 1).

nivel_suficiente(Requerido, Ofrecido) :-
    nivel_tolerancia(Requerido, NReq),
    nivel_tolerancia(Ofrecido, NOfe),
    NOfe >= NReq.

% EL MOTOR DE BUSQUEDA: Encuentra la raza perfecta usando tablas parametrizadas
buscar_raza_ideal(Prop, EstresOfrecido, Luz, Raza) :-
    raza(Raza, Prop, _, _),
    tolerancia_climatica(Raza, _, EstresMinimo),
    nivel_suficiente(EstresMinimo, EstresOfrecido),
    tolerancia_uv(Raza, TipoPiel),
    (Luz = alta_luz -> TipoPiel = resistente_uv ; true).

% Evaluaciones secundarias (Nutricion y Luz para produccion)
eval_nut(carne, pobre, '[NUTRICION] Animales estaran flacos.').
eval_nut(carne, alta, '[NUTRICION] Engorde rapido premium.').
eval_nut(leche, pobre, '[NUTRICION] Caida lechera asegurada.').
eval_nut(leche, alta, '[NUTRICION] Pico de produccion de leche.').
eval_nut(doble_proposito, pobre, '[NUTRICION] Baja leche y perdida de peso.').
eval_nut(doble_proposito, alta, '[NUTRICION] Excelente leche y engorde.').
eval_nut(_, media, '[NUTRICION] Mantenimiento normal.').

eval_luz_prod(leche, alta_luz, '[PRODUCCION] 16hrs luz maximizan lactancia.').
eval_luz_prod(leche, baja_luz, '[PRODUCCION] Poca luz baja la leche.').
eval_luz_prod(carne, alta_luz, '[PRODUCCION] Luz acelera el engorde.').
eval_luz_prod(carne, baja_luz, '[PRODUCCION] Poca luz hace el engorde lento.').
eval_luz_prod(doble_proposito, Luz, M) :- eval_luz_prod(leche, Luz, M).

% --- REGLAS AGRICOLAS ---
parse_num(Str, num(N)) :- Str \== '', catch(atom_number(Str, N), _, fail), !.
parse_num(_, vacio).

eval_ph(acido, Min, _) :- Min =< 6.8.
eval_ph(neutro, Min, Max) :- Max >= 6.0, Min =< 7.5.
eval_ph(alcalino, _, Max) :- Max >= 7.0.

eval_hum(baja, Min, _) :- Min =< 50.0.
eval_hum(moderada, Min, Max) :- Min =< 80.0, Max >= 40.0.
eval_hum(alta, _, Max) :- Max >= 70.0.