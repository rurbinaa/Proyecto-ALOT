:- use_module(library(pce)).

:- consult('src/base_hechos.pl').

% Conocimiento base
protocolo_vulnerable(http).
protocolo_vulnerable(ftp).
protocolo_vulnerable(telnet).

servicio_critico(ssh).
servicio_critico(rdp).

% Regla 1: Texto plano
buscar_texto_plano :-
    write('--- BUSCANDO TRAFICO NO CIFRADO ---'), nl,
    paquete(ID, _, Protocolo, IPSrc, IPDst, Info),
    protocolo_vulnerable(Protocolo),
    write('ID: '), write(ID), write(' | '), write(Protocolo), 
    write(' | Origen: '), write(IPSrc), write(' -> Destino: '), write(IPDst), nl,
    write('Contenido interceptado: '), write(Info), nl,
    write('-------------------------------------------'), nl,
    fail.
buscar_texto_plano :- write('Analisis 1 finalizado.'), nl, nl.

% Regla 2: Fuga de credenciales
buscar_credenciales :-
    write('--- BUSCANDO CREDENCIALES (PASSWORD) ---'), nl,
    paquete(ID, _, Protocolo, IPSrc, _, InfoExtra),
    protocolo_vulnerable(Protocolo),
    % downcase_atom convierte el texto capturado a minúsculas
    downcase_atom(InfoExtra, InfoMin),
    sub_atom(InfoMin, _, _, _, 'password'),
    write('ALERTA: Fuga en paquete '), write(ID), write(' desde IP: '), write(IPSrc), nl,
    write('Contenido: '), write(InfoExtra), nl,
    write('-------------------------------------------'), nl,
    fail.
buscar_credenciales :- write('Analisis 2 finalizado.'), nl, nl.

% Regla 3: Detección de Reconocimiento (Ping)
buscar_pings :-
    write('--- BUSCANDO RECONOCIMIENTO (ICMP/PING) ---'), nl,
    paquete(ID, _, icmp, IPSrc, IPDst, _),
    write('Ping detectado - ID: '), write(ID), 
    write(' | Atacante: '), write(IPSrc), write(' -> Objetivo: '), write(IPDst), nl,
    fail.
buscar_pings :- write('Analisis 3 finalizado.'), nl, nl.

% Regla 4: Conexiones a servicios de administración
buscar_servicios_criticos :-
    write('--- BUSCANDO ACCESOS A SERVICIOS CRITICOS ---'), nl,
    paquete(ID, _, Protocolo, IPSrc, _, _),
    servicio_critico(Protocolo),
    write('Intento de acceso a '), write(Protocolo), write(' - Paquete ID: '), write(ID), 
    write(' desde IP: '), write(IPSrc), nl,
    fail.
buscar_servicios_criticos :- write('Analisis 4 finalizado.'), nl, nl.

iniciar_alot :-
    new(Ventana, dialog('ALOT - Analizador Logico de Trafico')),
    send(Ventana, size, size(500, 350)), 
    
    send(Ventana, append, new(_, label(titulo, 'Panel de Control de Ciberseguridad ALOT'))),
    send(Ventana, append, new(_, label(subtitulo, 'Las alertas se imprimiran en esta terminal.'))),
    send(Ventana, append, new(_, label(espacio, ' '))), % Espacio en blanco
    
    send(Ventana, append, button('1. Detectar Trafico Inseguro (HTTP/FTP)', message(@prolog, buscar_texto_plano))),
    send(Ventana, append, button('2. Buscar Fuga de Passwords', message(@prolog, buscar_credenciales))),
    send(Ventana, append, button('3. Detectar Pings (Escaneo ICMP)', message(@prolog, buscar_pings))),
    send(Ventana, append, button('4. Accesos a SSH / RDP', message(@prolog, buscar_servicios_criticos))),
    
    send(Ventana, append, new(_, label(espacio2, ' '))),
    
    send(Ventana, append, button('Cerrar ALOT', message(Ventana, destroy))),
    
    send(Ventana, open_centered).