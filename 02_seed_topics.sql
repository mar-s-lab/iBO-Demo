-- ============================================================
-- IDPYBA - Seed: Temas / Categorías
-- ============================================================

INSERT INTO topics (slug, name, category, description) VALUES

-- INSTITUCIONAL
('institucional',          'Sobre el IDPYBA',               'institucional', 'Información general de la entidad, misión, visión y estructura'),

-- SERVICIOS
('esterilizacion',         'Esterilización',                'servicio',      'Programa gratuito "Corta a tiempo: Esteriliza"'),
('adopcion',               'Adopción',                      'servicio',      'Programa "Adoptar es Amar Sin Condiciones"'),
('escuadron-anticrueldad', 'Escuadrón Anticrueldad',        'servicio',      'Atención a reportes y casos de crueldad animal'),
('ces',                    'CES – Captura Esteriliza Suelta','servicio',     'Control poblacional de animales callejeros y ferales'),
('urgencias-veterinarias', 'Urgencias Veterinarias',        'servicio',      'Atención crítica a perros y gatos sin tutor'),
('brigadas-medicas',       'Brigadas Médicas',              'servicio',      'Servicios veterinarios gratuitos de baja complejidad'),
('microchip',              'MicroChip Ciudadano',           'servicio',      'Identificación gratuita para mascotas de hogares vulnerables'),
('sinantr',               'Sinantrópicos',                  'servicio',      'Atención veterinaria a palomas y abejas'),
('atencion-juridica',      'Centro de Atención Jurídica',   'servicio',      'Orientación legal en conflictos relacionados con animales'),
('huellitas-calle',        'Huellitas de la Calle',         'servicio',      'Atención a mascotas de ciudadanos en habitabilidad de calle'),
('inspeccion-vigilancia',  'Inspección y Vigilancia',       'servicio',      'Control a prestadores de servicios para animales'),
('animales-granja',        'Animales de Granja',            'servicio',      'Atención veterinaria a especies de granja y exóticas'),
('hogar-de-paso',          'Hogar de Paso',                 'servicio',      'Alojamiento temporal para animales rescatados'),
('proteccionistas',        'Proteccionistas',               'servicio',      'Registro de cuidadores y hogares de paso'),
('televet',                'TeleVet / Teleorientación',     'servicio',      'Orientación veterinaria virtual gratuita'),
('voluntariado',           'Voluntariado – Misma Manada',   'servicio',      'Programa de voluntariado comunitario del IDPYBA'),

-- EDUCACIÓN
('guardianes-online',      'Guardianes Online',             'educacion',     'Estrategia pedagógica para ciudadanos y estudiantes'),
('pisa-el-freno',          'Pisa el Freno Hay Vida en la Vía','educacion',  'Campaña de seguridad vial con animales'),
('ruralidad',              'Ruralidad',                     'educacion',     'Trabajo con comunidades campesinas sobre tenencia responsable'),
('observatorio',           'Observatorio',                  'educacion',     'Investigación sobre cultura cívica y fauna'),
('semilleros',             'Semilleros de Investigación',   'educacion',     'Proyectos de investigación ciudadana sobre animales'),
('servicio-social',        'Servicio Social Estudiantil',   'educacion',     'Servicio social para colegios públicos y privados'),
('aulas-virtuales',        'Aulas Virtuales',               'educacion',     'Talleres virtuales interactivos sobre bienestar animal'),
('propiedad-horizontal',   'Propiedad Horizontal',          'educacion',     'Convivencia con mascotas en conjuntos residenciales'),
('mirar-no-tocar',         'Mirar y No Tocar es Amar',      'educacion',     'Observación responsable de fauna silvestre'),
('sello-zoolidario',       'Sello Zoolidario',              'educacion',     'Reconocimiento a organizaciones comprometidas (Res. 280/2022)'),

-- PARTICIPACIÓN
('participacion',          'Participación Ciudadana',       'participacion', 'Mecanismos para que ciudadanos participen en la gestión del IDPYBA'),

-- CONTACTO
('contacto-general',       'Contacto y Canales de Atención','contacto',     'Teléfonos, correos, redes sociales y PQRSD'),

-- SEDES
('sede-administrativa',    'Sede Administrativa',           'sede',          'Cra 10 #26-51, Edificio Tequendama Torre Sur Piso 5'),
('sede-uca',               'UCA – Unidad de Cuidado Animal','sede',          'Cra 106A #67-02, Barrio El Muelle, Engativá'),
('sede-manitas',           'SuperCADE Manitas',             'sede',          'Cra 18L #70B-50 Sur'),
('sede-americas',          'SuperCADE Américas',            'sede',          'Av Cra 86 #43-55 Sur'),
('sede-suba',              'SuperCADE Suba',                'sede',          'Clle 145 #103B-90'),
('sede-cad',               'SuperCADE CAD',                 'sede',          'Cra 30 #25-90');
