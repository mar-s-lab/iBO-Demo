-- ============================================================
-- IDPYBA - Seed: Preguntas y Respuestas (~115 registros)
-- ============================================================

INSERT INTO faq (topic_id, question, answer, keywords, source_url) VALUES

-- ============================================================
-- INSTITUCIONAL
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'institucional'),
  '¿Qué es el IDPYBA?',
  'El Instituto Distrital de Protección y Bienestar Animal (IDPYBA) es la entidad del Distrito de Bogotá encargada de proteger y velar por el bienestar de los animales domésticos, de calle y silvestres en la ciudad. Coordina programas de esterilización, adopción, atención veterinaria, educación ciudadana y control de crueldad animal.',
  ARRAY['IDPYBA','instituto','entidad','bienestar animal','protección'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'institucional'),
  '¿Cuál es la misión del IDPYBA?',
  'El IDPYBA tiene como misión garantizar la protección y bienestar de los animales en Bogotá mediante políticas públicas, servicios veterinarios, educación ciudadana y control de la crueldad animal, contribuyendo a consolidar a Bogotá como una ciudad que ama a los animales.',
  ARRAY['misión','objeto','función','qué hace'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'institucional'),
  '¿Quién dirige el IDPYBA?',
  'El Director General es Antonio Hernández Llamas, abogado de la Universidad de los Andes con especialización en Resolución de Conflictos en el Marco del Conflicto Armado. La estructura también incluye subdirecciones de Atención a la Fauna, Cultura Ciudadana y Gestión Corporativa.',
  ARRAY['director','jefe','directivo','liderazgo'],
  'https://www.animalesbog.gov.co/nosotros/directivos'
),
(
  (SELECT id FROM topics WHERE slug = 'institucional'),
  '¿Qué normativa rige al IDPYBA?',
  'El IDPYBA opera bajo la Resolución 548 de 2025, que actualizó su mapa de procesos institucionales. Gestiona 14 procesos categorizados en procesos estratégicos, misionales y de apoyo.',
  ARRAY['resolución','normativa','mapa de procesos','regulación'],
  'https://www.animalesbog.gov.co/nosotros/caracterizacion-y-procedimientos'
),
(
  (SELECT id FROM topics WHERE slug = 'institucional'),
  '¿Cuáles son todos los servicios que ofrece el IDPYBA?',
  'El IDPYBA ofrece 16 servicios: Esterilización, Adopción, Escuadrón Anticrueldad, CES (Captura-Esteriliza-Suelta), Urgencias Veterinarias, Brigadas Médicas, MicroChip Ciudadano, Sinantrópicos, Centro de Atención Jurídica, Huellitas de la Calle, Inspección y Vigilancia, Animales de Granja, Hogar de Paso, Proteccionistas, TeleVet y Voluntariado. Además cuenta con 10 estrategias educativas.',
  ARRAY['servicios','programas','qué ofrecen','catálogo'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/te-ayudamos'
),

-- ============================================================
-- ESTERILIZACIÓN
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Qué es el programa de esterilización del IDPYBA?',
  'Es el programa "Corta a tiempo: Esteriliza", que ofrece esterilización quirúrgica GRATUITA para perros y gatos de ambos sexos en Bogotá. Está dirigido a hogares de estratos 0, 1, 2 y 3, animales de calle, fundaciones y refugios.',
  ARRAY['esterilización','castración','programa','gratuito','corta a tiempo'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿La esterilización tiene algún costo?',
  'No. El servicio de esterilización del IDPYBA es completamente gratuito. Si alguien le pide dinero por un turno o por el procedimiento, es fraude. Puede denunciarlo a las autoridades.',
  ARRAY['costo','precio','cobro','gratis','pago','fraude'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Quiénes pueden acceder al servicio de esterilización gratuita?',
  'Pueden acceder propietarios de perros o gatos que cumplan al menos una de estas condiciones: vivir en estrato 0, 1, 2 o 3; tener animales en situación de calle; tener animales ferales, semiferales o de cuadra; ser ciudadanos con discapacidad; pertenecer a refugios, fundaciones o albergues. Solo se asignan turnos a mayores de edad y el animal debe residir en Bogotá.',
  ARRAY['requisitos','elegibilidad','quién puede','estrato','discapacidad','fundación'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Cómo se agenda una cita de esterilización?',
  'Las citas se asignan mediante un sistema de turnos digital en línea. También puede agendarse presencialmente en los SuperCADE (Américas, Manitas, Suba) o por teléfono al +57 (601) 647 71 17. Solo se permiten máximo 2 citas por ciudadano.',
  ARRAY['agendar','cita','turno','cómo','SuperCADE','teléfono','online'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Qué documentos debo llevar el día de la esterilización?',
  'El día de la cita debe llevar: código QR de confirmación, documento de identidad original, fotocopia de cédula y fotocopia de un recibo de servicio público (agua, luz o gas).',
  ARRAY['documentos','cédula','recibo','QR','requisitos','qué llevar'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Qué cuidados previos necesita mi mascota antes de la esterilización?',
  'La mascota debe estar en buen estado de salud. Se recomienda realizar exámenes prequirúrgicos. El día de la cirugía: ayuno de 8 horas para alimentos sólidos y ayuno de 3 horas para líquidos (agua).',
  ARRAY['ayuno','preparación','prequirúrgico','cuidados previos','salud'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Qué debo llevar el día de la esterilización para transportar a mi mascota?',
  'Para perros: correa y traílla. Para gatos: guacal seguro. Además debe llevar un collar isabelino (para la recuperación postoperatoria) y una manta o cobija.',
  ARRAY['guacal','correa','collar isabelino','cobija','transporte','qué llevar'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Puedo esterilizar a mi mascota si vivo en otro municipio?',
  'No. El IDPYBA solo atiende animales que residan en Bogotá. No se atienden mascotas de otros municipios.',
  ARRAY['municipio','otro municipio','Cundinamarca','fuera de Bogotá','restricción'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),
(
  (SELECT id FROM topics WHERE slug = 'esterilizacion'),
  '¿Cuántas citas de esterilización puede pedir una misma persona?',
  'Cada ciudadano puede solicitar máximo 2 citas de esterilización.',
  ARRAY['límite','máximo','cuántas citas','dos mascotas'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/esterilizaciones'
),

-- ============================================================
-- ADOPCIÓN
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿Cómo funciona el proceso de adopción en el IDPYBA?',
  'El programa "Adoptar es Amar Sin Condiciones" ofrece perros y gatos recuperados de situaciones de maltrato, negligencia o de la calle para ser adoptados responsablemente. Se puede iniciar el proceso de forma presencial en la UCA o a través de la plataforma adopciones.animalesbog.gov.co/adoptar.',
  ARRAY['adopción','adoptar','proceso','cómo adoptar','mascota'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/adopciones'
),
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿Qué requisitos necesito para adoptar una mascota?',
  'Para adoptar debe: ser mayor de edad, presentar fotocopia del documento de identidad, fotocopia de recibo de servicio público, enviar o mostrar un video de la vivienda donde vivirá el animal. Para perros: llevar correa (y bozal si es raza de manejo especial). Para gatos: llevar guacal. También debe estar disponible para una entrevista sobre adopción responsable.',
  ARRAY['requisitos','adoptar','documentos','video vivienda','entrevista'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/adopciones'
),
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿Dónde queda la Unidad de Cuidado Animal donde puedo adoptar?',
  'La UCA (Unidad de Cuidado Animal) está en la Carrera 106A #67-02, Barrio El Muelle, localidad de Engativá, Bogotá.',
  ARRAY['UCA','dirección','dónde','Engativá','ubicación','adopción'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/adopciones'
),
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿Cuál es el horario de atención para adopciones?',
  'La UCA atiende adopciones de martes a viernes y también los sábados, domingos y festivos, de 10:00 a.m. a 3:00 p.m. Los lunes no hay atención.',
  ARRAY['horario','atención','días','adopción','UCA','festivos'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/adopciones'
),
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿Puedo ver los animales disponibles para adopción en línea?',
  'Sí. Puede consultar los animales disponibles en la plataforma digital de adopciones: adopciones.animalesbog.gov.co/adoptar',
  ARRAY['en línea','online','plataforma','adopciones','disponibles','link'],
  'https://adopciones.animalesbog.gov.co/adoptar'
),
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿Qué tipo de animales se pueden adoptar en el IDPYBA?',
  'Se pueden adoptar perros y gatos que han sido recuperados de situaciones de maltrato, negligencia o de la calle, y que han pasado por procesos de rehabilitación.',
  ARRAY['perros','gatos','animales','tipo','adoptar','qué animales'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/adopciones'
),
(
  (SELECT id FROM topics WHERE slug = 'adopcion'),
  '¿La adopción tiene algún costo?',
  'El proceso de adopción en el IDPYBA no tiene costo. Es un servicio gratuito del Distrito para fomentar la tenencia responsable de animales.',
  ARRAY['costo','precio','gratis','adopción','pago'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/adopciones'
),

-- ============================================================
-- ESCUADRÓN ANTICRUELDAD
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'escuadron-anticrueldad'),
  '¿Qué es el Escuadrón Anticrueldad del IDPYBA?',
  'Es el equipo especializado del IDPYBA que atiende denuncias y casos de maltrato y crueldad animal. Interviene en seis formas de crueldad que pueden afectar tanto a animales domésticos como silvestres.',
  ARRAY['maltrato','crueldad','escuadrón','denuncia','anticrueldad'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'escuadron-anticrueldad'),
  '¿Cómo puedo reportar un caso de maltrato animal en Bogotá?',
  'Puede reportar un caso de maltrato animal llamando a la línea de emergencias 123 disponible las 24 horas, o comunicándose con el IDPYBA al +57 (601) 647 71 17 en horario hábil (lunes a viernes de 8 a.m. a 5 p.m.).',
  ARRAY['reportar','denuncia','maltrato','123','cómo denunciar','emergencia'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'escuadron-anticrueldad'),
  '¿Qué tipos de crueldad animal atiende el IDPYBA?',
  'El Escuadrón Anticrueldad atiende seis formas de crueldad animal que afectan a animales domésticos (perros, gatos, etc.) y silvestres. Esto incluye maltrato físico, abandono, negligencia, entre otros.',
  ARRAY['tipos','crueldad','formas','maltrato','abandono'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'escuadron-anticrueldad'),
  '¿Qué pasa después de que denuncio un caso de maltrato animal?',
  'El IDPYBA investiga el caso a través del Escuadrón Anticrueldad. Si se confirma la situación de maltrato, los funcionarios pueden intervenir para proteger al animal. También existe el Centro de Atención Jurídica para orientación legal.',
  ARRAY['después','qué pasa','proceso','investigación','denuncia'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- CES
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'ces'),
  '¿Qué es el programa CES del IDPYBA?',
  'CES significa Captura-Esteriliza-Suelta. Es un programa de control poblacional que consiste en capturar animales callejeros, ferales o de cuadra, esterilizarlos quirúrgicamente y devolverlos a su territorio. Busca reducir la sobrepoblación sin sacrificio.',
  ARRAY['CES','captura','esteriliza','suelta','callejeros','ferales','control poblacional'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'ces'),
  '¿Cuál es la diferencia entre el CES y la esterilización para mascotas?',
  'La esterilización regular está dirigida a mascotas de hogares (con dueño) en estratos 0-3. El CES es para animales sin dueño: callejeros, ferales o de cuadra. En el CES el animal es capturado, esterilizado y devuelto a su territorio.',
  ARRAY['diferencia','CES','esterilización','mascotas','callejeros'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'ces'),
  '¿Cómo puedo solicitar el CES para un animal callejero de mi barrio?',
  'Puede comunicarse con el IDPYBA al teléfono +57 (601) 647 71 17 o al correo proteccionanimal@animalesbog.gov.co para reportar la presencia de animales callejeros o ferales que requieran el programa CES.',
  ARRAY['solicitar','CES','callejero','barrio','feral','cómo pedir'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- URGENCIAS VETERINARIAS
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'urgencias-veterinarias'),
  '¿Qué son las urgencias veterinarias del IDPYBA?',
  'Es el servicio de atención crítica y de emergencia para perros y gatos que se encuentran en situación de calle y no tienen un tutor o responsable. No es un servicio para mascotas con dueño.',
  ARRAY['urgencias','emergencia','veterinaria','calle','sin dueño'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'urgencias-veterinarias'),
  '¿Cómo reporto un animal herido o enfermo en la calle?',
  'Puede llamar a la línea de emergencias 123 (disponible 24 horas) o al IDPYBA al +57 (601) 647 71 17 en horario hábil. Describa la ubicación exacta del animal y el estado en que se encuentra.',
  ARRAY['animal herido','enfermo','calle','emergencia','123','reportar'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'urgencias-veterinarias'),
  '¿El IDPYBA atiende urgencias de mascotas que tienen dueño?',
  'No. El servicio de urgencias veterinarias del IDPYBA está destinado exclusivamente a animales de calle sin tutor responsable. Para mascotas con dueño, se recomienda acudir a una clínica veterinaria privada o consultar TeleVet.',
  ARRAY['con dueño','mascota','urgencias','exclusivo','calle'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- BRIGADAS MÉDICAS
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'brigadas-medicas'),
  '¿Qué son las brigadas médicas del IDPYBA?',
  'Son jornadas de atención veterinaria gratuita de baja complejidad para perros y gatos. Incluyen servicios básicos de salud animal dirigidos a hogares en situación de vulnerabilidad.',
  ARRAY['brigadas','médicas','veterinaria','gratuita','jornada'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'brigadas-medicas'),
  '¿Cómo me entero de cuándo hay una brigada médica cerca de mi casa?',
  'Puede consultar el Calendario IDPYBA en la página web animalesbog.gov.co, o seguir las redes sociales @AnimalesBOG en Twitter, Instagram, Facebook y YouTube, donde se publican las fechas y lugares de las brigadas.',
  ARRAY['brigada','calendario','cuándo','fechas','redes sociales','evento'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'brigadas-medicas'),
  '¿Qué servicios ofrecen las brigadas médicas?',
  'Las brigadas médicas ofrecen servicios veterinarios básicos como desparasitación, vacunación, revisión general y otros procedimientos de baja complejidad, de forma gratuita.',
  ARRAY['servicios','desparasitación','vacunación','brigada','qué hacen'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- MICROCHIP
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'microchip'),
  '¿Qué es el MicroChip Ciudadano del IDPYBA?',
  'Es un servicio gratuito de identificación electrónica para mascotas (perros y gatos) de hogares en situación de vulnerabilidad. El microchip permite identificar al animal y a su propietario en caso de pérdida.',
  ARRAY['microchip','identificación','chip','gratuito','mascotas'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'microchip'),
  '¿Quiénes pueden acceder al microchip gratuito?',
  'El microchip ciudadano está dirigido a hogares en situación de vulnerabilidad o bajos ingresos (estratos 0, 1, 2 y 3) que tengan mascotas (perros o gatos).',
  ARRAY['requisitos','quién puede','vulnerabilidad','estrato','microchip'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'microchip'),
  '¿Cómo solicito el microchip para mi mascota?',
  'Puede solicitar el microchip comunicándose con el IDPYBA al +57 (601) 647 71 17 o asistiendo a alguna de las sedes (SuperCADE Manitas, Américas, Suba o CAD) en horario hábil.',
  ARRAY['solicitar','cómo','microchip','teléfono','SuperCADE'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- SINANTRÓPICOS
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'sinantr'),
  '¿Qué son los animales sinantrópicos y cómo los atiende el IDPYBA?',
  'Los animales sinantrópicos son especies que conviven en el entorno humano sin ser domésticas, como palomas y abejas. El IDPYBA tiene un programa especializado de atención veterinaria y manejo para estas especies.',
  ARRAY['sinantrópicos','palomas','abejas','convivencia','urbano'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'sinantr'),
  '¿Cómo reporto un enjambre de abejas o una colonia de palomas que representa un riesgo?',
  'Puede reportarlo llamando al IDPYBA al +57 (601) 647 71 17 o a la línea de emergencias 123. El equipo de sinantrópicos evaluará la situación y coordinará el manejo adecuado.',
  ARRAY['abejas','enjambre','palomas','riesgo','reportar','colonia'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- CENTRO DE ATENCIÓN JURÍDICA
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'atencion-juridica'),
  '¿Qué es el Centro de Atención Jurídica del IDPYBA?',
  'Es un servicio de orientación y asesoría legal gratuita para ciudadanos que enfrentan conflictos o situaciones relacionadas con animales, como disputas de vecindad por mascotas, maltrato animal, o preguntas sobre la normativa de protección animal.',
  ARRAY['jurídica','asesoría','legal','conflicto','derecho','normativa'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'atencion-juridica'),
  '¿Cómo accedo a la asesoría jurídica del IDPYBA?',
  'Puede solicitar orientación jurídica comunicándose con el IDPYBA al +57 (601) 647 71 17 o escribiendo al correo proteccionanimal@animalesbog.gov.co en horario hábil (lunes a viernes de 8 a.m. a 5 p.m.).',
  ARRAY['asesoría','jurídica','cómo acceder','teléfono','correo'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- HUELLITAS DE LA CALLE
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'huellitas-calle'),
  '¿Qué es el programa Huellitas de la Calle?',
  'Es un programa de atención integral a las mascotas de ciudadanos en situación de habitabilidad de calle (personas sin hogar). Busca garantizar el bienestar de estos animales sin separarlos de sus dueños.',
  ARRAY['habitabilidad','calle','personas sin hogar','Huellitas','mascotas'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'huellitas-calle'),
  '¿Cómo puedo reportar una mascota en riesgo de una persona en habitabilidad de calle?',
  'Puede reportarlo al IDPYBA al +57 (601) 647 71 17 o a la línea de emergencias 123. También puede usar el canal PQRSD de Bogotá Te Escucha.',
  ARRAY['reportar','habitabilidad','calle','mascota','riesgo'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- INSPECCIÓN Y VIGILANCIA
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'inspeccion-vigilancia'),
  '¿Qué hace el área de Inspección y Vigilancia del IDPYBA?',
  'Se encarga de monitorear y controlar el cumplimiento de normas de bienestar animal por parte de establecimientos que prestan servicios para animales, como clínicas veterinarias, peluquerías, criaderos, circos y cualquier actividad relacionada con animales.',
  ARRAY['inspección','vigilancia','clínicas','criaderos','control','normas'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'inspeccion-vigilancia'),
  '¿Cómo puedo denunciar un establecimiento que maltrate animales?',
  'Puede presentar una denuncia formal ante el IDPYBA al +57 (601) 647 71 17, por correo a proteccionanimal@animalesbog.gov.co, o a través de la plataforma PQRSD Bogotá Te Escucha.',
  ARRAY['denuncia','establecimiento','maltrato','clínica','veterinaria'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- ANIMALES DE GRANJA
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'animales-granja'),
  '¿Qué servicios ofrece el IDPYBA para animales de granja?',
  'El IDPYBA ofrece servicios veterinarios para animales de granja y especies exóticas, especialmente en zonas rurales de Bogotá. Esto incluye atención médica y orientación sobre tenencia responsable de estas especies.',
  ARRAY['granja','bovinos','equinos','exóticos','rurales','ganado'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'animales-granja'),
  '¿El IDPYBA atiende animales exóticos?',
  'Sí. El IDPYBA tiene un programa de atención para animales de granja y especies exóticas en Bogotá. Para más información puede llamar al +57 (601) 647 71 17.',
  ARRAY['exóticos','granja','especies','atención'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- HOGAR DE PASO
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'hogar-de-paso'),
  '¿Qué es el Hogar de Paso del IDPYBA?',
  'Es un programa de alojamiento temporal para animales rescatados mientras son rehabilitados y encontrados un hogar definitivo a través de la adopción. Los animales son cuidados por hogares voluntarios o en la UCA.',
  ARRAY['hogar de paso','temporal','rescatado','alojamiento','rehabilitación'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'hogar-de-paso'),
  '¿Cómo puedo ofrecer mi hogar como hogar de paso temporal?',
  'Puede registrarse como hogar de paso contactando al IDPYBA al +57 (601) 647 71 17 o por correo a proteccionanimal@animalesbog.gov.co. También puede revisar la sección de Proteccionistas en la página web.',
  ARRAY['hogar de paso','voluntario','registro','cómo','proteccionista'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- PROTECCIONISTAS
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'proteccionistas'),
  '¿Qué es el registro de Proteccionistas del IDPYBA?',
  'Es un registro oficial de cuidadores de animales y hogares de paso que trabajan junto al IDPYBA para proteger y rehabilitar animales rescatados. Estar registrado permite acceder a apoyos y articulación con la entidad.',
  ARRAY['proteccionistas','registro','cuidadores','hogares de paso'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'proteccionistas'),
  '¿Cómo me registro como proteccionista animal ante el IDPYBA?',
  'Puede iniciar el proceso de registro comunicándose con el IDPYBA al +57 (601) 647 71 17 o escribiendo a proteccionanimal@animalesbog.gov.co. El equipo le informará los requisitos y pasos para formalizar su registro.',
  ARRAY['registro','cómo','proteccionista','inscripción','cuidador'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- TELEVET
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'televet'),
  '¿Qué es TeleVet del IDPYBA?',
  'TeleVet es el servicio de teleorientación veterinaria gratuita del IDPYBA. Permite a propietarios de mascotas en situación de vulnerabilidad recibir orientación veterinaria virtual sin necesidad de desplazarse.',
  ARRAY['TeleVet','teleorientación','virtual','veterinaria','online','gratis'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'televet'),
  '¿Quiénes pueden usar TeleVet?',
  'TeleVet está dirigido principalmente a propietarios de mascotas en situación de vulnerabilidad económica. Es un servicio gratuito de orientación (no reemplaza una consulta veterinaria presencial compleja).',
  ARRAY['TeleVet','quién','requisitos','vulnerabilidad','gratis'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'televet'),
  '¿Cómo accedo al servicio TeleVet?',
  'Puede acceder comunicándose con el IDPYBA al +57 (601) 647 71 17 en horario hábil (lunes a viernes de 8 a.m. a 5 p.m.) para ser orientado sobre cómo conectarse a la consulta virtual.',
  ARRAY['TeleVet','cómo','acceder','teléfono','virtual','horario'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'televet'),
  '¿TeleVet puede dar diagnósticos médicos para mi mascota?',
  'TeleVet es un servicio de orientación y guía, no de diagnóstico médico formal. Si su mascota presenta una emergencia o síntomas graves, debe acudir a una clínica veterinaria presencialmente o llamar al 123.',
  ARRAY['TeleVet','diagnóstico','emergencia','límites','veterinaria'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- VOLUNTARIADO
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'voluntariado'),
  '¿Cómo puedo ser voluntario en el IDPYBA?',
  'El programa "Somos una misma manada" es el espacio de voluntariado del IDPYBA. Puede unirse comunicándose con el IDPYBA al +57 (601) 647 71 17 o por correo a proteccionanimal@animalesbog.gov.co.',
  ARRAY['voluntario','voluntariado','misma manada','cómo','inscripción'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'voluntariado'),
  '¿Qué actividades realizan los voluntarios del IDPYBA?',
  'Los voluntarios del programa "Somos una misma manada" apoyan diversas iniciativas del IDPYBA, incluyendo brigadas médicas, jornadas de adopción, actividades educativas y el cuidado de animales en la UCA.',
  ARRAY['voluntariado','actividades','qué hacen','brigadas','adopción'],
  'https://www.animalesbog.gov.co'
),

-- ============================================================
-- EDUCACIÓN – 10 ESTRATEGIAS
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'guardianes-online'),
  '¿Qué es el programa Guardianes Online del IDPYBA?',
  'Es una estrategia pedagógica del IDPYBA que motiva a ciudadanos y estudiantes a convertirse en guardianes y defensores de los animales. Busca generar conciencia y cultura de protección animal desde la educación.',
  ARRAY['Guardianes Online','educación','estudiantes','pedagogía','ciudadanos'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'pisa-el-freno'),
  '¿Qué es la campaña "Pisa el Freno Hay Vida en la Vía"?',
  'Es una campaña de seguridad vial del IDPYBA que busca reducir accidentes de tránsito que involucran animales en las vías de Bogotá, educando a conductores y peatones sobre cómo actuar.',
  ARRAY['vial','accidentes','tránsito','animales','freno','campaña'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'ruralidad'),
  '¿Qué hace el IDPYBA en zonas rurales de Bogotá?',
  'El programa de Ruralidad trabaja directamente con comunidades campesinas de las zonas rurales de Bogotá para fortalecer conocimientos sobre tenencia responsable de animales de compañía y de granja.',
  ARRAY['rural','campesinos','ruralidad','zonas rurales','Bogotá'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'observatorio'),
  '¿Qué es el Observatorio del IDPYBA?',
  'Es un equipo de investigación del IDPYBA que analiza la cultura cívica y las relaciones entre ciudadanos y los animales (domésticos y silvestres) en Bogotá, para informar políticas públicas de bienestar animal.',
  ARRAY['observatorio','investigación','cultura cívica','datos','fauna'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'semilleros'),
  '¿Qué son los Semilleros de Investigación del IDPYBA?',
  'Son espacios de reflexión y trabajo donde ciudadanos pueden desarrollar proyectos de investigación propios sobre bienestar y protección animal, con el acompañamiento del IDPYBA.',
  ARRAY['semilleros','investigación','proyectos','ciudadanos','reflexión'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'servicio-social'),
  '¿Puede un estudiante hacer el servicio social en el IDPYBA?',
  'Sí. El IDPYBA cuenta con el programa de Servicio Social Estudiantil, abierto a estudiantes de colegios públicos y privados de Bogotá que deseen cumplir su servicio social trabajando en favor del bienestar animal.',
  ARRAY['servicio social','estudiantes','colegio','bachillerato','IDPYBA'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'servicio-social'),
  '¿Cómo se inscribe un estudiante para hacer servicio social en el IDPYBA?',
  'Para inscribirse al Servicio Social Estudiantil puede comunicarse con el IDPYBA al +57 (601) 647 71 17 o escribir a proteccionanimal@animalesbog.gov.co. El equipo de Cultura Ciudadana le orientará sobre los pasos a seguir.',
  ARRAY['servicio social','inscripción','cómo','estudiante'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'aulas-virtuales'),
  '¿Qué son las Aulas Virtuales del IDPYBA?',
  'Son talleres virtuales interactivos donde ciudadanos pueden aprender sobre los programas del IDPYBA, bienestar animal, tenencia responsable y otros temas relacionados con la protección animal.',
  ARRAY['aulas virtuales','talleres','online','cursos','aprender'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'propiedad-horizontal'),
  '¿Qué es la estrategia de Propiedad Horizontal del IDPYBA?',
  'Es un programa que promueve la convivencia pacífica entre propietarios de mascotas y vecinos en conjuntos residenciales, edificios y urbanizaciones. Busca resolver conflictos y establecer acuerdos de coexistencia.',
  ARRAY['propiedad horizontal','conjunto','edificio','vecinos','mascotas','convivencia'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'mirar-no-tocar'),
  '¿Qué es la iniciativa "Mirar y No Tocar es Amar" del IDPYBA?',
  'Es una estrategia de educación ambiental que enseña a los ciudadanos a observar y documentar responsablemente la fauna silvestre de Bogotá, sin interferir ni poner en riesgo a los animales o al observador.',
  ARRAY['fauna silvestre','observación','naturaleza','mirar','tocar','silvestre'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),
(
  (SELECT id FROM topics WHERE slug = 'sello-zoolidario'),
  '¿Qué es el Sello Zoolidario?',
  'Es un reconocimiento oficial del IDPYBA creado mediante Resolución 280 de 2022, que se otorga a organizaciones, empresas o establecimientos que demuestran un compromiso real con el bienestar y la protección animal.',
  ARRAY['Sello Zoolidario','reconocimiento','empresas','organizaciones','Resolución 280'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/tramites-y-servicios/aprende'
),

-- ============================================================
-- PARTICIPACIÓN CIUDADANA
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'participacion'),
  '¿Cómo puedo participar en la gestión del IDPYBA como ciudadano?',
  'El IDPYBA ofrece 6 mecanismos de participación ciudadana: diagnóstico de necesidades, planeación participativa, consulta ciudadana, colaboración abierta, rendición de cuentas y control social. Puede acceder a través de la web o los canales de atención.',
  ARRAY['participación','ciudadano','mecanismos','control social','consulta'],
  'https://www.animalesbog.gov.co/participa'
),
(
  (SELECT id FROM topics WHERE slug = 'participacion'),
  '¿Dónde puedo presentar una queja, reclamo o sugerencia al IDPYBA?',
  'Puede presentar PQRSD (Peticiones, Quejas, Reclamos, Sugerencias y Denuncias) a través de la plataforma Bogotá Te Escucha en bogota.gov.co, por correo a proteccionanimal@animalesbog.gov.co, o presencialmente en cualquier sede.',
  ARRAY['PQRSD','queja','reclamo','sugerencia','denuncia','Bogotá te Escucha'],
  'https://www.animalesbog.gov.co/participa'
),
(
  (SELECT id FROM topics WHERE slug = 'participacion'),
  '¿Cuándo hace el IDPYBA su rendición de cuentas?',
  'El IDPYBA realiza rendición de cuentas como parte de su ciclo de gestión anual. Las fechas se publican en el Calendario IDPYBA en la página web y se difunden por redes sociales @AnimalesBOG.',
  ARRAY['rendición de cuentas','informe','gestión','anual','calendario'],
  'https://www.animalesbog.gov.co/participa'
),

-- ============================================================
-- CONTACTO GENERAL
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'contacto-general'),
  '¿Cuál es el teléfono de contacto del IDPYBA?',
  'El teléfono principal del IDPYBA es +57 (601) 647 71 17, disponible de lunes a viernes de 8:00 a.m. a 5:00 p.m. Para emergencias animales llame al 123 (24 horas).',
  ARRAY['teléfono','contacto','llamar','número','emergencia','123'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'contacto-general'),
  '¿Cuál es el correo electrónico del IDPYBA?',
  'El correo general es proteccionanimal@animalesbog.gov.co. Para temas disciplinarios: disciplinarios@animalesbog.gov.co. Para notificaciones judiciales: notificacionesjudiciales@animalesbog.gov.co.',
  ARRAY['correo','email','contacto','escribir'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'contacto-general'),
  '¿Cuál es el horario de atención del IDPYBA?',
  'El horario de atención general del IDPYBA es lunes a viernes de 8:00 a.m. a 5:00 p.m. Los SuperCADE atienden de lunes a viernes de 7:00 a.m. a 4:30 p.m. y los sábados de 8:00 a.m. a 12:00 p.m. La UCA atiende adopciones de martes a domingo de 10:00 a.m. a 3:00 p.m.',
  ARRAY['horario','atención','días','horas','cuándo'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'contacto-general'),
  '¿Cuáles son las redes sociales del IDPYBA?',
  'El IDPYBA está en Twitter, Instagram, Facebook y YouTube con el usuario @AnimalesBOG.',
  ARRAY['redes sociales','Instagram','Twitter','Facebook','YouTube','@AnimalesBOG'],
  'https://www.animalesbog.gov.co'
),
(
  (SELECT id FROM topics WHERE slug = 'contacto-general'),
  '¿Cómo denuncio corrupción relacionada con el IDPYBA?',
  'Puede denunciar actos de corrupción a través de la Línea 195 o al teléfono +57 (601) 647 71 17. Por correo escriba a disciplinarios@animalesbog.gov.co.',
  ARRAY['corrupción','denuncia','ética','transparencia','línea 195'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),

-- ============================================================
-- SEDES
-- ============================================================
(
  (SELECT id FROM topics WHERE slug = 'sede-administrativa'),
  '¿Dónde queda la sede principal del IDPYBA?',
  'La sede administrativa principal del IDPYBA está en Carrera 10 #26-51, Edificio Residencias Tequendama, Torre Sur, Piso 5, Bogotá D.C. Atiende de lunes a viernes de 8:00 a.m. a 5:00 p.m.',
  ARRAY['sede','dirección','dónde','principal','Tequendama','ubicación'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'sede-uca'),
  '¿Dónde queda la UCA (Unidad de Cuidado Animal)?',
  'La UCA está en Carrera 106A #67-02, Barrio El Muelle, localidad de Engativá. Es el lugar principal para adopciones. Atiende de martes a domingo (incluyendo festivos) de 10:00 a.m. a 3:00 p.m. Los lunes está cerrada.',
  ARRAY['UCA','unidad','cuidado animal','Engativá','adopciones','dirección'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'sede-manitas'),
  '¿Dónde queda el SuperCADE Manitas del IDPYBA?',
  'El SuperCADE Manitas está en Carrera 18L #70B-50 Sur. Atiende de lunes a viernes de 7:00 a.m. a 4:30 p.m. y los sábados de 8:00 a.m. a 12:00 p.m.',
  ARRAY['SuperCADE','Manitas','sur','dirección','horario'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'sede-americas'),
  '¿Dónde queda el SuperCADE Américas del IDPYBA?',
  'El SuperCADE Américas está en Avenida Carrera 86 #43-55 Sur. Atiende de lunes a viernes de 7:00 a.m. a 4:30 p.m. y los sábados de 8:00 a.m. a 12:00 p.m.',
  ARRAY['SuperCADE','Américas','sur','dirección','horario'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'sede-suba'),
  '¿Dónde queda el SuperCADE Suba del IDPYBA?',
  'El SuperCADE Suba está en Calle 145 #103B-90. Atiende de lunes a viernes de 7:00 a.m. a 4:30 p.m. y los sábados de 8:00 a.m. a 12:00 p.m.',
  ARRAY['SuperCADE','Suba','norte','dirección','horario'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'sede-cad'),
  '¿Dónde queda el SuperCADE CAD del IDPYBA?',
  'El SuperCADE CAD está en Carrera 30 #25-90. Atiende de lunes a viernes de 7:00 a.m. a 4:30 p.m. y los sábados de 8:00 a.m. a 12:00 p.m.',
  ARRAY['SuperCADE','CAD','centro','dirección','horario'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
),
(
  (SELECT id FROM topics WHERE slug = 'contacto-general'),
  '¿Cuántas sedes tiene el IDPYBA en Bogotá?',
  'El IDPYBA tiene 6 puntos de atención en Bogotá: la Sede Administrativa (Cra 10 #26-51), la UCA en Engativá (Cra 106A #67-02), y cuatro SuperCADE: Manitas (sur), Américas (sur), Suba (norte) y CAD (centro).',
  ARRAY['sedes','puntos de atención','dónde','cuántos','SuperCADE','UCA'],
  'https://www.animalesbog.gov.co/atencion-y-servicios-a-la-ciudadania/canales-de-atencion'
);
