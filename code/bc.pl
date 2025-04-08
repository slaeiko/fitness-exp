% ---- DATOS DEL USUARIO ---
usuario(nombre, edad, sexo, peso, estatura, actividad_fisica).
% Ejemplo: usuario(Usuario, 25, masculino, 70, 175, moderada).

objetivo(Usuario, Objetivo).
% Ejemplo: objetivo(Usuario, perder_peso).

lesion(Usuario, Lesion).
% Ejemplo: lesion(Usuario, dolor_espalda).

disponibilidad(Usuario, Dias, Horas).
% Ejemplo: disponibilidad(Usuario, [(lunes, 10), (miercoles, 11), (viernes, 10)]).
% disponibilidad(juan, lunes, 10).
% disponibilidad(juan, miercoles, 11).
% disponibilidad(juan, viernes, 10).

% ---- DIAS DE LA SEMANA----
dia_semana(lunes).
dia_semana(martes).
dia_semana(miercoles).
dia_semana(jueves).
dia_semana(viernes).
dia_semana(sabado).
dia_semana(domingo).

% ---- OBJETIVOS ---- %
objetivo(ganancia_muscular, fuerza).
objetivo(perdida_peso, resistencia).
objetivo(resistencia, cardiovascular).
objetivo(flexibilidad, movilidad).
objetivo(entrenamiento_funcional, funcional).

% ---- DATOS DE LOS EJERCICIOS ----

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

% ---- EJERCICIOS CARDIOVASCULARES ----
ejercicio(caminata, cardiovascular, cuerpo_completo, baja, ninguno).
ejercicio(eliptica, cardiovascular, piernas, media, maquina).
ejercicio(subir_escaleras, cardiovascular, piernas, media, escaladora).

% ---- EJERCICIOS DE MOVILIDAD Y FLEXIBILIDAD ----
ejercicio(yoga, movilidad, cuerpo_completo, baja, ninguno).
ejercicio(estiramientos_estaticos, movilidad, cuerpo_completo, baja, ninguno).
ejercicio(estiramientos_dinamicos, movilidad, cuerpo_completo, baja, ninguno).

% ---- EJERCICIOS FUNCIONALES ----
ejercicio(burpees, funcional, cuerpo_completo, alta, ninguno).
ejercicio(battle_ropes, funcional, cuerpo_completo, alta, cuerdas).
ejercicio(kettlebell_swings, funcional, cuerpo_completo, alta, kettlebell).
ejercicio(sentadilla_salto, funcional, piernas, alta, ninguno).
ejercicio(mountain_climbers, funcional, cuerpo_completo, alta, ninguno).


%restriccion_ejercicio(Lesion, Ejercicio).
% Ejemplo de restricción: si tienes una lesión en la rodilla, no debes hacer sentadillas.

% ---- DOLOR DE ESPALDA ----
restriccion_ejercicio(dolor_espalda, peso_muerto).
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

