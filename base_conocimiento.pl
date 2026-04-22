% ==========================================
% ARCHIVO: base_conocimiento.pl
% ==========================================

% --- 1. DATOS AGRICOLAS (52 Cultivos Comerciales) ---
% Estructura: cultivo(Nombre, MinPH, MaxPH, MinTempC, MaxTempC, MinHum, MaxHum, Temporada).

% [PRIMAVERA]
cultivo('Tomate', 6.0, 7.0, 20.0, 30.0, 60.0, 80.0, primavera).
cultivo('Frijol', 6.0, 7.5, 20.0, 28.0, 50.0, 70.0, primavera).
cultivo('Maiz', 5.8, 7.0, 20.0, 30.0, 50.0, 80.0, primavera).
cultivo('Lechuga', 6.0, 7.0, 15.0, 20.0, 60.0, 80.0, primavera).
cultivo('Pepino', 5.5, 6.8, 20.0, 30.0, 60.0, 80.0, primavera).
cultivo('Pimiento', 6.0, 6.8, 20.0, 25.0, 60.0, 75.0, primavera).
cultivo('Berenjena', 5.5, 6.8, 22.0, 30.0, 60.0, 80.0, primavera).
cultivo('Calabacin', 6.0, 7.5, 18.0, 25.0, 50.0, 75.0, primavera).
cultivo('Melon', 6.0, 7.0, 25.0, 35.0, 60.0, 85.0, primavera).
cultivo('Fresa', 5.5, 6.5, 15.0, 25.0, 60.0, 80.0, primavera).
cultivo('Mani', 5.8, 6.2, 20.0, 30.0, 50.0, 70.0, primavera).
cultivo('Girasol', 6.0, 7.5, 20.0, 25.0, 40.0, 60.0, primavera).
cultivo('Cilantro', 6.0, 6.8, 15.0, 25.0, 50.0, 70.0, primavera).
cultivo('Albahaca', 6.0, 7.5, 20.0, 30.0, 50.0, 70.0, primavera).
cultivo('Soya', 6.0, 6.8, 20.0, 30.0, 50.0, 70.0, primavera).
cultivo('Menta', 6.0, 7.0, 15.0, 25.0, 60.0, 80.0, primavera).
cultivo('Romero', 6.0, 7.5, 15.0, 25.0, 30.0, 50.0, primavera).
cultivo('Tomillo', 6.5, 7.5, 15.0, 25.0, 30.0, 50.0, primavera).
cultivo('Oregano', 6.0, 8.0, 15.0, 25.0, 30.0, 50.0, primavera).
cultivo('Arroz', 5.5, 6.5, 20.0, 35.0, 80.0, 100.0, primavera).

% [VERANO]
cultivo('Sandia', 6.0, 7.5, 25.0, 35.0, 60.0, 85.0, verano).
cultivo('Calabaza', 5.5, 6.8, 20.0, 30.0, 50.0, 75.0, verano).
cultivo('Quinoa', 6.0, 8.5, 15.0, 25.0, 40.0, 60.0, verano).
cultivo('Sorgo', 5.5, 8.5, 20.0, 30.0, 30.0, 50.0, verano).
cultivo('Camote', 5.5, 6.5, 20.0, 30.0, 60.0, 80.0, verano).
cultivo('Yuca', 5.5, 6.5, 25.0, 35.0, 60.0, 80.0, verano).
cultivo('Okra', 6.0, 6.8, 25.0, 35.0, 60.0, 80.0, verano).

% [OTONO]
cultivo('Zanahoria', 5.5, 6.8, 15.0, 22.0, 50.0, 70.0, otono).
cultivo('Espinaca', 6.5, 7.5, 10.0, 20.0, 70.0, 90.0, otono).
cultivo('Brocoli', 6.0, 7.0, 15.0, 20.0, 60.0, 80.0, otono).
cultivo('Coliflor', 6.0, 7.0, 15.0, 22.0, 60.0, 80.0, otono).
cultivo('Repollo', 6.0, 7.5, 15.0, 20.0, 60.0, 80.0, otono).
cultivo('Rabano', 5.5, 6.8, 10.0, 20.0, 50.0, 70.0, otono).
cultivo('Remolacha', 6.0, 7.0, 15.0, 22.0, 50.0, 70.0, otono).
cultivo('Acelga', 6.0, 7.0, 15.0, 25.0, 60.0, 80.0, otono).
cultivo('Puerro', 6.0, 7.0, 13.0, 24.0, 50.0, 75.0, otono).
cultivo('Apio', 6.0, 7.0, 15.0, 20.0, 70.0, 90.0, otono).
cultivo('Nabo', 5.5, 6.8, 10.0, 20.0, 50.0, 70.0, otono).
cultivo('Guisante', 6.0, 7.5, 13.0, 18.0, 50.0, 70.0, otono).
cultivo('Lenteja', 6.0, 7.0, 15.0, 25.0, 40.0, 60.0, otono).
cultivo('Garbanzo', 6.0, 8.0, 20.0, 30.0, 30.0, 50.0, otono).
cultivo('Perejil', 6.0, 7.0, 15.0, 25.0, 50.0, 70.0, otono).

% [INVIERNO]
cultivo('Papa', 5.0, 6.5, 10.0, 20.0, 60.0, 80.0, invierno).
cultivo('Cebolla', 6.0, 7.0, 13.0, 24.0, 40.0, 60.0, invierno).
cultivo('Ajo', 6.0, 7.5, 12.0, 24.0, 40.0, 60.0, invierno).
cultivo('Trigo', 6.0, 7.0, 10.0, 20.0, 40.0, 60.0, invierno).
cultivo('Avena', 5.5, 7.0, 10.0, 20.0, 40.0, 60.0, invierno).
cultivo('Cebada', 6.0, 7.5, 10.0, 20.0, 40.0, 60.0, invierno).
cultivo('Centeno', 5.0, 7.0, 5.0, 15.0, 40.0, 60.0, invierno).
cultivo('Habas', 6.0, 7.5, 10.0, 20.0, 50.0, 75.0, invierno).
cultivo('Esparrago', 6.5, 7.5, 15.0, 25.0, 50.0, 70.0, invierno).
cultivo('Alcachofa', 6.0, 7.0, 15.0, 24.0, 50.0, 75.0, invierno).


% --- 2. DATOS ZOOTECNICOS (Razas con Gen UV) ---
raza(brahman, carne, severo, resistente_uv).
raza(nelore, carne, severo, resistente_uv).
raza(senepol, carne, severo, resistente_uv).
raza(holstein, leche, leve, sensible_uv).
raza(jersey, leche, moderado, resistente_uv).
raza(gyr, leche, severo, resistente_uv).
raza(girolando, doble_proposito, moderado, resistente_uv).
raza(pardo_suizo, doble_proposito, moderado, resistente_uv).
raza(angus, carne, leve, resistente_uv).
raza(hereford, carne, leve, sensible_uv).
raza(charolais, carne, leve, sensible_uv).


% --- 3. DICCIONARIO DE AYUDAS DINAMICAS (ZOO) ---
info_ayuda(brahman, 'Brahman: Piel oscura bajo pelo blanco. Tolera sol extremo sin quemarse.').
info_ayuda(nelore, 'Nelore: Origen indio, alta resistencia al calor y garrapatas. Ideal para engorde.').
info_ayuda(senepol, 'Senepol: Raza taurina adaptada al tropico. Pelo muy corto y tolerancia termica extrema.').
info_ayuda(holstein, 'Holstein: Campeona mundial en leche, pero muy debil ante el calor extremo.').
info_ayuda(jersey, 'Jersey: Leche con mucha grasa. Soporta el calor mejor que la Holstein.').
info_ayuda(gyr, 'Gyr: Excelente lechera tropical. Sus orejas largas actuan como radiadores de calor.').
info_ayuda(girolando, 'Girolando: Cruce (Holstein x Gyr). Mezcla perfecta de produccion y resistencia.').
info_ayuda(pardo_suizo, 'Pardo Suizo: Produce leche con alta proteina, ideal para quesos premium.').
info_ayuda(angus, 'Angus: Carne marmoleada. Clima frio o templado, sufre mucho con el calor.').
info_ayuda(hereford, 'Hereford: Excelente convertidor de pasto a carne, pero prefiere climas templados.').
info_ayuda(charolais, 'Charolais: Gran tamano muscular. Sensible al estres calorico severo.').

info_ayuda(carne, 'Proposito Carne: Requiere dietas altas en energia para ganar peso rapido.').
info_ayuda(leche, 'Proposito Leche: Demanda muchisima agua diaria y suplementos de calcio.').
info_ayuda(doble_proposito, 'Doble Proposito: Se ordenan en la manana y se engorda el ternero en la tarde.').

info_ayuda(pobre, 'Condicion Pobre (1-2): Se ven costillas. Urge suplemento proteinico.').
info_ayuda(media, 'Condicion Media (3): Costillas no visibles pero palpables. Estado ideal productivo.').
info_ayuda(alta, 'Condicion Alta (4-5): Lomo cuadrado de grasa. Solo util en fase de matadero.').

info_ayuda(leve, 'Estres Leve: <60 respiraciones/min. Respiracion normal, sin babeo.').
info_ayuda(moderado, 'Estres Moderado: 60-90 resp/min. El animal busca sombra y baja consumo de pasto.').
info_ayuda(severo, 'Estres Severo: >100 resp/min. Babeo, cuello estirado. Peligro de infarto.').

info_ayuda(baja_luz, 'Baja Luz: Menos de 12 hrs. Reduce metabolismo y consumo de alimento.').
info_ayuda(alta_luz, 'Alta Luz: 14-16 hrs. Inhibe melatonina, dispara produccion de leche (15%+).').


% --- 4. DICCIONARIO DE AYUDAS DINAMICAS (AGRO) ---
info_ayuda(acido, 'pH Acido (<6.8): Limita el fosforo. Ideal para papas y zanahorias.').
info_ayuda(neutro, 'pH Neutro (6.5-7.5): Tierra perfecta. Todos los nutrientes fluyen bien.').
info_ayuda(alcalino, 'pH Alcalino (>7.5): Tierra caliza. Puede bloquear la absorcion de hierro.').

info_ayuda(baja, 'Humedad Baja (<40%): La tierra se desmorona. Requiere riego urgente.').
info_ayuda(moderada, 'Humedad Moderada (50-70%): Formas una bola de tierra que no escurre. Perfecto.').
info_ayuda(alta, 'Humedad Alta (>80%): Escurre agua al exprimir. Riesgo de hongos pudriendo raices.').

info_ayuda(primavera, 'Primavera: Dias largos y clima suave. Ideal para germinacion.').
info_ayuda(verano, 'Verano: Exceso de sol y calor. Requiere cultivos que no se marchiten facil.').
info_ayuda(otono, 'Otono: Clima fresco, ideal para hojas verdes y tuberculos.').
info_ayuda(invierno, 'Invierno: Riesgo de heladas mortales para cultivos tropicales.').

% ==========================================
% 5. FICHAS TECNICAS DE CULTIVOS (52 Cultivos)
% Estructura: ficha_cultivo(Nombre, MesSiembra, MesCosecha, Riego, Extra).
% ==========================================

% --- Fichas de Primavera ---
ficha_cultivo('Tomate', 'Marzo a Mayo', 'Junio a Agosto', 'Riego diario por goteo a la raiz.', 'Requiere tutoreo. Susceptible a hongos.').
ficha_cultivo('Frijol', 'Febrero a Abril', 'Mayo a Julio', 'Moderado cada 3 dias.', 'Fija nitrogeno. Excelente para rotar suelos.').
ficha_cultivo('Maiz', 'Marzo a Mayo', 'Julio a Septiembre', 'Abundante durante la floracion (espigamiento).', 'Demanda mucho nitrogeno. Sembrar en bloques.').
ficha_cultivo('Lechuga', 'Marzo a Mayo', 'Mayo a Julio', 'Frecuente y superficial.', 'Sensible al sol directo extremo.').
ficha_cultivo('Pepino', 'Marzo a Mayo', 'Junio a Agosto', 'Abundante y regular.', 'Requiere entutorado o malla para trepar.').
ficha_cultivo('Pimiento', 'Marzo a Mayo', 'Julio a Septiembre', 'Moderado a la raiz.', 'Sensible a cambios bruscos de temperatura.').
ficha_cultivo('Berenjena', 'Marzo a Mayo', 'Julio a Septiembre', 'Abundante.', 'Muy exigente en nutrientes, usar composta.').
ficha_cultivo('Calabacin', 'Marzo a Mayo', 'Junio a Agosto', 'Frecuente.', 'Cosechar inmaduro para mejor textura y sabor.').
ficha_cultivo('Melon', 'Marzo a Mayo', 'Julio a Septiembre', 'Abundante, suspender antes de cosecha.', 'El exceso de agua al final raja la fruta.').
ficha_cultivo('Fresa', 'Marzo a Mayo', 'Junio a Agosto', 'Goteo constante.', 'Usar plastico o paja para que la fruta no toque el suelo.').
ficha_cultivo('Mani', 'Marzo a Mayo', 'Agosto a Octubre', 'Moderado.', 'La flor fecundada se entierra para formar el mani.').
ficha_cultivo('Girasol', 'Marzo a Mayo', 'Agosto a Septiembre', 'Poco frecuente pero profundo.', 'Excelente atrayente de abejas polinizadoras.').
ficha_cultivo('Cilantro', 'Marzo a Mayo', 'Mayo a Julio', 'Frecuente.', 'Tiende a espigar rapido con calor excesivo.').
ficha_cultivo('Albahaca', 'Marzo a Mayo', 'Junio a Agosto', 'Moderado.', 'Cortar las flores para mantener el sabor de las hojas.').
ficha_cultivo('Soya', 'Marzo a Mayo', 'Julio a Septiembre', 'Moderado.', 'Cultivo fijador de nitrogeno, enriquece el suelo.').
ficha_cultivo('Menta', 'Marzo a Mayo', 'Todo el ano', 'Abundante.', 'Invasiva. Recomendable plantar en macetas.').
ficha_cultivo('Romero', 'Marzo a Mayo', 'Todo el ano', 'Escaso, tolera la sequia.', 'Prefiere suelos arenosos y muy bien drenados.').
ficha_cultivo('Tomillo', 'Marzo a Mayo', 'Todo el ano', 'Escaso.', 'Muy sensible al encharcamiento y hongos de raiz.').
ficha_cultivo('Oregano', 'Marzo a Mayo', 'Todo el ano', 'Moderado.', 'Mejora su aroma si crece en suelos algo pobres.').
ficha_cultivo('Arroz', 'Marzo a Mayo', 'Agosto a Octubre', 'Inundacion parcial o constante.', 'Requiere nivelacion perfecta del terreno.').

% --- Fichas de Verano ---
ficha_cultivo('Sandia', 'Abril a Junio', 'Julio a Septiembre', 'Abundante, suspender al final.', 'Demanda muchisimo espacio para extender sus guias.').
ficha_cultivo('Calabaza', 'Mayo a Julio', 'Septiembre a Noviembre', 'Moderado.', 'Soporta suelos pesados y algo arcillosos.').
ficha_cultivo('Quinoa', 'Mayo a Julio', 'Agosto a Octubre', 'Poco riego, resistente a sequia.', 'Sensible al exceso de humedad en el suelo.').
ficha_cultivo('Sorgo', 'Mayo a Julio', 'Septiembre a Noviembre', 'Escaso.', 'Altamente tolerante al calor extremo.').
ficha_cultivo('Camote', 'Mayo a Julio', 'Septiembre a Noviembre', 'Moderado.', 'El suelo debe estar muy suelto para engrosar la raiz.').
ficha_cultivo('Yuca', 'Mayo a Julio', 'Diciembre a Febrero', 'Poco riego.', 'Cultivo rustico, crece bien incluso en suelos pobres.').
ficha_cultivo('Okra', 'Mayo a Julio', 'Julio a Septiembre', 'Moderado.', 'Cosechar las vainas tiernas antes de que se pongan fibrosas.').

% --- Fichas de Otono ---
ficha_cultivo('Zanahoria', 'Agosto a Octubre', 'Noviembre a Enero', 'Ligero y constante.', 'El suelo no debe tener piedras o crecera deforme.').
ficha_cultivo('Espinaca', 'Agosto a Octubre', 'Octubre a Diciembre', 'Frecuente.', 'Sufre y se marchita con el calor extremo.').
ficha_cultivo('Brocoli', 'Agosto a Octubre', 'Noviembre a Enero', 'Frecuente.', 'Exigente en boro. Cosechar antes de que abra la flor amarilla.').
ficha_cultivo('Coliflor', 'Agosto a Octubre', 'Diciembre a Febrero', 'Moderado.', 'Atar las hojas sobre la cabeza para que se mantenga blanca.').
ficha_cultivo('Repollo', 'Agosto a Octubre', 'Diciembre a Febrero', 'Frecuente.', 'Vigilar constantemente plagas como pulgones y orugas.').
ficha_cultivo('Rabano', 'Agosto a Octubre', 'Septiembre a Noviembre', 'Frecuente.', 'Crecimiento super rapido, cosecha en solo 30 a 40 dias.').
ficha_cultivo('Remolacha', 'Agosto a Octubre', 'Noviembre a Enero', 'Moderado.', 'Se pueden consumir tanto sus hojas como la raiz.').
ficha_cultivo('Acelga', 'Agosto a Octubre', 'Noviembre a Enero', 'Frecuente.', 'Permite multiples cosechas cortando las hojas externas.').
ficha_cultivo('Puerro', 'Agosto a Octubre', 'Diciembre a Febrero', 'Moderado.', 'Aporcar (echar tierra al tallo) para mantenerlo blanco.').
ficha_cultivo('Apio', 'Agosto a Octubre', 'Noviembre a Enero', 'Abundante y constante.', 'Cultivo lento y muy exigente en humedad y nutrientes.').
ficha_cultivo('Nabo', 'Agosto a Octubre', 'Octubre a Diciembre', 'Frecuente.', 'Sufre mucho si pasa periodos de sequia cortos.').
ficha_cultivo('Guisante', 'Agosto a Octubre', 'Noviembre a Enero', 'Moderado.', 'Requiere malla o tutoreo para sostener la planta.').
ficha_cultivo('Lenteja', 'Agosto a Octubre', 'Diciembre a Febrero', 'Poco riego.', 'Muy sensible a la humedad excesiva (pudricion).').
ficha_cultivo('Garbanzo', 'Agosto a Octubre', 'Diciembre a Febrero', 'Escaso.', 'Extremadamente tolerante a condiciones de sequia.').
ficha_cultivo('Perejil', 'Agosto a Octubre', 'Noviembre a Enero', 'Moderado.', 'Germinacion muy lenta (puede tardar hasta un mes).').

% --- Fichas de Invierno ---
ficha_cultivo('Papa', 'Octubre a Diciembre', 'Febrero a Abril', 'Profundo 2 veces por semana.', 'Aporcar es vital para que las papas no se pongan verdes.').
ficha_cultivo('Cebolla', 'Octubre a Diciembre', 'Marzo a Mayo', 'Frecuente al inicio, nulo al final.', 'Suspender riego semanas antes de cosecha para curar el bulbo.').
ficha_cultivo('Ajo', 'Octubre a Diciembre', 'Mayo a Julio', 'Moderado.', 'Plantar el diente de ajo siempre con la punta hacia arriba.').
ficha_cultivo('Trigo', 'Octubre a Diciembre', 'Mayo a Julio', 'Depende de lluvia (secano).', 'Vigilar enfermedades fungicas como la roya.').
ficha_cultivo('Avena', 'Octubre a Diciembre', 'Abril a Junio', 'Moderado.', 'Excelente cultivo como forraje invernal para ganado.').
ficha_cultivo('Cebada', 'Octubre a Diciembre', 'Mayo a Julio', 'Poco riego.', 'Tiene un ciclo mas corto y es mas rustica que el trigo.').
ficha_cultivo('Centeno', 'Octubre a Diciembre', 'Mayo a Julio', 'Escaso.', 'El cereal mas resistente, crece en suelos helados y pobres.').
ficha_cultivo('Habas', 'Octubre a Diciembre', 'Marzo a Mayo', 'Moderado.', 'Planta robusta que resiste heladas moderadas sin problemas.').
ficha_cultivo('Esparrago', 'Octubre a Diciembre', 'Marzo a Mayo', 'Frecuente en verano.', 'Cultivo perenne. La misma planta puede producir por 10 anos.').
ficha_cultivo('Alcachofa', 'Octubre a Diciembre', 'Marzo a Mayo', 'Abundante.', 'Planta gigante, requiere mas de 1 metro cuadrado por individuo.').

% Seguro de vida (Si falta alguna ficha, esta evita que el sistema explote)
ficha_cultivo(Cultivo, 'Consultar calendario local', 'Variable', 'Riego regular segun el clima.', 'Monitorear plagas de la region.') :- \+ ficha_cultivo(Cultivo, _, _, _, _).