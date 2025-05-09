% ---- DATOS DEL USUARIO ---
usuario(nombre, actividad_fisica).
% Ejemplo: usuario(Usuario, 25, masculino, 70, 175, moderada).

objetivoCuestionario(Usuario, [Objetivo1, Objetivo2]).
% Ejemplo: objetivo(Usuario, perder_peso).

lesion(Usuario, lesion).
% Ejemplo: lesion(Usuario, dolor_espalda).

% ---- OBJETIVOS ---- %
objetivo(ganancia_muscular, fuerza).
objetivo(perdida_peso, resistencia).
objetivo(aerobico, cardiovascular).
objetivo(flexibilidad, movilidad).
objetivo(entrenamiento_funcional, funcional).

% ---- DATOS DE LOS EJERCICIOS ----

% ---- NIVEL DE INTENSIDAD DE LOS ENTRENAMIENTOS ----
ejercicios_por_hora(baja, 2).
ejercicios_por_hora(moderada, 3).
ejercicios_por_hora(alta, 4).

% ejercicio(Nombre, Categoria (objetivo), GrupoMuscular, Intensidad, Equipamiento).

% ---- EJERCICIOS DE FUERZA ----
ejercicio(sentadillas, fuerza, piernas, alta, barra).
ejercicio(prensa_piernas, fuerza, piernas, alta, maquina).
ejercicio(desplantes, fuerza, piernas, media, mancuernas).
ejercicio(extension_cuadriceps, fuerza, piernas, media, maquina).
ejercicio(flexiones, fuerza, pecho, media, ninguno).
ejercicio(press_banca, fuerza, pecho, alta, barra).
ejercicio(press_militar, fuerza, hombros, alta, barra).
ejercicio(elevaciones_laterales, fuerza, hombros, baja, mancuernas).
ejercicio(dominadas, fuerza, espalda, alta, barra_dominadas).
ejercicio(remo_con_mancuerna, fuerza, espalda, media, mancuernas).
ejercicio(curl_biceps, fuerza, brazos, baja, mancuernas).
ejercicio(ext_triceps_polea, fuerza, brazos, media, polea).

% ---- EJERCICIOS DE RESISTENCIA ----
ejercicio(correr, resistencia, cuerpo_completo, alta, ninguno).
ejercicio(bicicleta, resistencia, piernas, media, bicicleta_estatica).
ejercicio(saltar_cuerda, resistencia, cuerpo_completo, alta, ninguno).
ejercicio(remadora, resistencia, cuerpo_completo, media, maquina).
ejercicio(nadar, resistencia, cuerpo_completo, alta, piscina).
ejercicio(escalada, resistencia, cuerpo_completo, alta, ninguno).
ejercicio(paseo_rural, resistencia, piernas, baja, ninguno).

% ---- EJERCICIOS CARDIOVASCULARES ----
ejercicio(caminata, cardiovascular, cuerpo_completo, baja, ninguno).
ejercicio(eliptica, cardiovascular, piernas, media, maquina).
ejercicio(subir_escaleras, cardiovascular, piernas, media, escaladora).
ejercicio(stepper, cardiovascular, piernas, media, maquina).
ejercicio(zumba, cardiovascular, cuerpo_completo, media, ninguno).
ejercicio(andador, cardiovascular, cuerpo_completo, baja, ninguno).
ejercicio(eliptica_inclinada, cardiovascular, piernas, alta, maquina).

% ---- EJERCICIOS DE MOVILIDAD Y FLEXIBILIDAD ----
ejercicio(yoga, movilidad, cuerpo_completo, baja, ninguno).
ejercicio(estiramientos_estaticos, movilidad, cuerpo_completo, baja, ninguno).
ejercicio(estiramientos_dinamicos, movilidad, cuerpo_completo, baja, ninguno).
ejercicio(estiramientos_isquiotibiales, movilidad, piernas, baja, ninguno).
ejercicio(estiramientos_espalda_baja, movilidad, espalda, baja, ninguno).
ejercicio(estiramiento_gemelos, movilidad, piernas, baja, ninguno).
ejercicio(estiramiento_psoas, movilidad, caderas, baja, ninguno).
ejercicio(estiramiento_muslos, movilidad, piernas, baja, ninguno).

% ---- EJERCICIOS FUNCIONALES ----
ejercicio(burpees, funcional, cuerpo_completo, alta, ninguno).
ejercicio(battle_ropes, funcional, cuerpo_completo, alta, cuerdas).
ejercicio(kettlebell_swings, funcional, cuerpo_completo, alta, kettlebell).
ejercicio(sentadilla_salto, funcional, piernas, alta, ninguno).
ejercicio(mountain_climbers, funcional, cuerpo_completo, alta, ninguno).
ejercicio(pesas_rusas, funcional, cuerpo_completo, alta, kettlebell).
ejercicio(lanzamientos_medball, funcional, cuerpo_completo, alta, balón).
ejercicio(slam_ball, funcional, cuerpo_completo, alta, balón).

%restriccion_ejercicio(Lesion, Ejercicio).
% Ejemplo de restricción: si tienes una lesión en la rodilla, no debes hacer sentadillas.

% ---- DOLOR DE ESPALDA ----
restriccion_ejercicio(dolor_espalda, sentadillas).
restriccion_ejercicio(dolor_espalda, remo_con_mancuerna).
restriccion_ejercicio(dolor_espalda, press_militar).
restriccion_ejercicio(dolor_espalda, burpees).
restriccion_ejercicio(dolor_espalda, battle_ropes).

% ---- RODILLAS DEBILES ----
restriccion_ejercicio(rodillas_debiles, sentadillas).
restriccion_ejercicio(rodillas_debiles, prensa_piernas).
restriccion_ejercicio(rodillas_debiles, desplantes).
restriccion_ejercicio(rodillas_debiles, saltar_cuerda).
restriccion_ejercicio(rodillas_debiles, correr).
restriccion_ejercicio(rodillas_debiles, sentadilla_salto).

% ---- LESION DE HOMBRO ----
restriccion_ejercicio(lesion_hombro, press_militar).
restriccion_ejercicio(lesion_hombro, elevaciones_laterales).
restriccion_ejercicio(lesion_hombro, flexiones).
restriccion_ejercicio(lesion_hombro, press_banca).
restriccion_ejercicio(lesion_hombro, burpees).

% ---- DOLOR CERVICAL - CUELLO ----
restriccion_ejercicio(dolor_cuello, press_militar).
restriccion_ejercicio(dolor_cuello, elevaciones_laterales).
restriccion_ejercicio(dolor_cuello, yoga).
restriccion_ejercicio(dolor_cuello, extensiones_cuello).


% ---- DOLOR DE MUÑECA ----
restriccion_ejercicio(dolor_munecas, flexiones).
restriccion_ejercicio(dolor_munecas, burpees).
restriccion_ejercicio(dolor_munecas, battle_ropes).
restriccion_ejercicio(dolor_munecas, press_banca).

% ---- DOLOR DE TOBILLO ----
restriccion_ejercicio(lesion_tobillo, correr).
restriccion_ejercicio(lesion_tobillo, bicicleta).
restriccion_ejercicio(lesion_tobillo, saltar_cuerda).
restriccion_ejercicio(lesion_tobillo, sentadilla_salto).
restriccion_ejercicio(lesion_tobillo, mountain_climbers).

% ---- REGLA DE PROLOG ----
ejercicio_para_objetivo(Usuario, Ejercicio) :-
    objetivoCuestionario(Usuario, Objetivos),
    member(Objetivo, Objetivos), 
    objetivo(Objetivo, Categoria),
    ejercicio(Ejercicio, Categoria, _, _, _).


ejercicio_valido(Usuario, Ejercicio) :-
    ejercicio_para_objetivo(Usuario, Ejercicio),
    \+ (lesion(Usuario, Lesion), restriccion_ejercicio(Lesion, Ejercicio)).


cantidad_ejercicios_dia(Usuario, Dia, Cantidad) :-
    usuario(Usuario, NivelActividad),
    ejercicios_por_hora(NivelActividad, EjerciciosPorHora),
    disponibilidad(Usuario, Dia, Horas),
    (   is_list(Horas) ->
        length(Horas, HorasDisponibles)
    ;   HorasDisponibles = 1
    ),
    CantidadFloat is Horas * EjerciciosPorHora,
    round(CantidadFloat, Cantidad).

rutina_dia(Usuario, Dia, EjerciciosAsignados) :-
    cantidad_ejercicios_dia(Usuario, Dia, MaxEjercicios),
    findall(Ejercicio, ejercicio_valido(Usuario, Ejercicio), EjerciciosValidos),
    length(EjerciciosValidos, TotalDisponibles),
    TotalDisponibles >= MaxEjercicios,
    select_random_exercises(EjerciciosValidos, MaxEjercicios, EjerciciosAsignados).

select_random_exercises(EjerciciosValidos, MaxEjercicios, EjerciciosAsignados) :-
    length(EjerciciosValidos, TotalEjercicios),
    MaxEjercicios =< TotalEjercicios,
    random_permutation(EjerciciosValidos, EjerciciosBarajados), 
    length(EjerciciosAsignados, MaxEjercicios),
    append(EjerciciosAsignados, _, EjerciciosBarajados).

rutina_semanal(Usuario, Rutina) :-
    findall((Dia, Ejercicios),
            (
                disponibilidad(Usuario, Dia, _),
                rutina_dia(Usuario, Dia, Ejercicios)
            ),
            Rutina).


% Ejemplo de consulta
% Definir datos de usuarios
usuario(juan, moderada).
usuario(maria, alta).

% Definir objetivos
objetivoCuestionario(juan, [perdida_peso, ganancia_muscular, entrenamiento_funcional]).
objetivoCuestionario(maria, [flexibilidad, aerobico, ganancia_muscular]).

% Definir lesiones
lesion(juan, dolor_espalda).
lesion(maria, dolor_munecas).

% Definir disponibilidad de los usuarios
disponibilidad(juan, lunes, 1).
disponibilidad(juan, miercoles, 2).
disponibilidad(juan, martes, 3).
disponibilidad(juan, viernes, 2).

disponibilidad(maria, lunes, 2).
disponibilidad(maria, martes, 1).
disponibilidad(maria, jueves, 2).
