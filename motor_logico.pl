% ==========================================
% ARCHIVO: motor_logico.pl
% ==========================================

:- consult('base_conocimiento.pl').

% --- REGLAS ZOOTECNICAS ---
eval_zoo(Raza, Prop, M1) :- 
    raza(Raza, Prop, _, _), 
    atomic_list_concat(['[EXITO] ', Raza, ' es ideal para ', Prop], M1), !.
eval_zoo(Raza, Prop, M1) :- 
    atomic_list_concat(['[ALERTA] No se recomienda ', Raza, ' para ', Prop], M1).

% AQUI ESTABA EL ERROR: Agregadas las combinaciones de Doble Proposito
eval_nut(carne, pobre, '[ADVERTENCIA] Animales flacos, carne dura.').
eval_nut(carne, alta, '[EXITO] Engorde rapido y carne marmoleada premium.').
eval_nut(leche, pobre, '[ADVERTENCIA] Caida lechera asegurada.').
eval_nut(leche, alta, '[EXITO] Pico de produccion de leche.').
eval_nut(doble_proposito, pobre, '[ADVERTENCIA] Baja produccion de leche y perdida de peso.').
eval_nut(doble_proposito, alta, '[EXITO] Excelente rendimiento en leche y engorde.').
eval_nut(_, media, '[OK] Mantenimiento normal de nutrientes.').

eval_cli(Raza, Est, M) :- 
    raza(Raza, _, T, _),
    (Est == severo, T == leve -> atomic_list_concat(['[PELIGRO] ', Raza, ' no soporta este clima.'], M)
    ; Est == severo, T == moderado -> atomic_list_concat(['[ALERTA] ', Raza, ' bajara su rendimiento por calor.'], M)
    ; atomic_list_concat(['[OK] ', Raza, ' se adaptara bien al clima.'], M)).

% Regla de Fotoperiodo y Riesgo UV
eval_luz(Raza, _, alta_luz, M) :- 
    raza(Raza, _, _, sensible_uv), 
    atomic_list_concat(['[PELIGRO LUZ] ', Raza, ' sufre quemaduras/cancer con exceso de sol. Requiere techo'], M), !.
eval_luz(_, leche, alta_luz, '[EXITO LUZ] 16hrs de luz maximizan la lactancia.').
eval_luz(_, leche, baja_luz, '[ALERTA LUZ] Poca luz baja la produccion de leche.').
eval_luz(_, carne, alta_luz, '[EXITO LUZ] Buena luz acelera el engorde.').
eval_luz(_, carne, baja_luz, '[ALERTA LUZ] Comen menos de noche, engordan lento.').
eval_luz(Raza, doble_proposito, Luz, M) :- eval_luz(Raza, leche, Luz, M).

% --- REGLAS AGRICOLAS ---
parse_num(Str, num(N)) :- Str \== '', catch(atom_number(Str, N), _, fail), !.
parse_num(_, vacio).

% AQUI SE RELAJARON LAS MATEMATICAS PARA DAR MAS RESULTADOS
eval_ph(acido, Min, _) :- Min =< 6.8.
eval_ph(neutro, Min, Max) :- Max >= 6.0, Min =< 7.5.
eval_ph(alcalino, _, Max) :- Max >= 7.0.

eval_hum(baja, Min, _) :- Min =< 50.0.
eval_hum(moderada, Min, Max) :- Min =< 80.0, Max >= 40.0.
eval_hum(alta, _, Max) :- Max >= 70.0.