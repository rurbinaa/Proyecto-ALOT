interfaz(wireshark, escuchando).

estado_red(Mensaje) :-
    interfaz(wireshark, escuchando),
    Mensaje = 'El motor de Prolog esta configurado y listo para ALOT'.