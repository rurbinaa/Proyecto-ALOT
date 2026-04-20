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