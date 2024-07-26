-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 26-07-2024 a las 03:50:15
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mrbs`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personal` int UNSIGNED NOT NULL,
  `nombre` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `responsable` tinyint(1) NOT NULL,
  `semblanza` text NOT NULL,
  `web` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `face` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `insta` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tik` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `id_personal`, `nombre`, `responsable`, `semblanza`, `web`, `face`, `insta`, `tik`) VALUES
(1, 1, '	Conocimiento y Manejo de Sistemas Costeros	 ', 0, '		 ', '		 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(2, 2, '	Biología de la conservación	 ', 1, '	El Laboratorio de Biología de la Conservación (BIOCON) forma parte de las unidades de investigación que el campus de la UNAM tiene en el Parque Científico Tecnológico de Yucatán, Es un punto de encuentro de académicos y estudiantes adscritos a la UMDI Sisal, a la ENES Mérida y al PCML, entre otras entidades académicas que forman el campus, Los grupos de trabajo adscritos a BIOCON desarrollan proyectos para apoyar la labor de conservación del patrimonio natural de la península de Yucatán, BIOCON además resguarda una colección de peces, fundada en el 2011 y registrada ante la Secretaría del Medio Ambiente y Recursos Naturales (SEMARNAT, clave de registro YUC-PEC-239-01-11), que tiene como objetivo principal documentar la biodiversidad regional de peces que habitan en los diversos ambientes que se presentan en la costa de Yucatán, Incluye, especies dulceacuícolas, estuarinos, marinos y de ambientes kársticos, Asimismo, es una herramienta para el entrenamiento básico en la identificación de peces para que los alumnos de licenciatura y posgrado, de diferentes carreras, puedan disponer y generar información de calidad para la toma de decisiones ecológicamente verosímiles, Esta riqueza representa cerca del 6% de las especies de peces reportadas para México y buena parte de este esfuerzo ha sido posible gracias a los proyectos de investigación que se llevan a cabo en el Laboratorio de Biología de la Conservación, Asimismo cuenta con la Colección de otolitos de peces del golfo de México y el mar Caribe, que se encuentra registrada ante la Secretaría del Medio Ambiente y Recursos Naturales (SEMARNAT, clave de registro DGVS-CC-305-18), Estas colecciones han resultado ser herramientas útiles para el entrenamiento básico en la identificación de peces para que investigadores y alumnos de licenciatura y posgrado puedan disponer y generar información de calidad para la toma de decisiones científicamente verosímiles, Fruto del trabajo de esta colección ha sido el Catálogo de peces de la costa norte de Yucatán en sus dos ediciones y el Catálogo de otolitos sagitta de peces del golfo de México. Otras especies se siguen integrando a este acervo y estamos generando un banco de imágenes y claves dinámicas para su identificación que está disponible a través de internet	 ', '	www.biocon.unam.mx	 ', '	https://www.facebook.com/BioConUNAM	 ', '	No aplica	 ', '	No aplica	 '),
(3, 3, '	Programa de Investigación Espacial en Ambientes Costeros y Marinos (PIESACOM)	 ', 1, '	\"Las líneas de investigación del Programa de Investigación Espacial en Ambientes Costeros y Marinos se enfocan en la caracterización, evaluación y cartografía de arrecifes coralinos del Mar Caribe, Golfo de México y Atlántico Occidental, \r\nLas principales herramientas utilizadas en estas líneas de investigación son la adquisición de imágenes de video y fotografías digitales submarinas a través de buceo científico. Utilizando cámaras de video avanzadas y de fotografía multiespectral,\r\nEstas actividades subacuáticas generan datos ecológicos y biológicos relevantes que se combinan con el uso de imágenes de satélite y de otras plataformas aéreas (drones), así como con Sistemas de Información Geográfica para la generación de productos espacialmente explícitos, cuyo objetivo final es el soporte a la toma de desiciones en manejo costero,\r\nEn este programa también se hace énfasis en la formación de recursos humanos de excelencia a nivel de licenciatura, maestría, doctorado y posdoctorado; y se procura participar en la socialización de la información científica a través de actividades de difusión, tanto en foros académicos y científicos especializados, como en medios dirigidos a todo público\"	 ', '	http://redoctober.sisal.unam.mx	 ', '	https://www.facebook.com/profile.php?id=100057422569465&mibextid=LQQJ4d	 ', '	@PIESACOM	 ', '	No aplica	 '),
(4, 4, '	Programa camarón	 ', 1, '	\"El área de reproducción de camarones peneidos se encuentra ubicada en el invernadero de camarón de la UMDI-Sisal, Esta área es la encargada de la selección, transporte y mantenimiento de reproductores para la producción de nauplios, Estos Nauplios posteriormente son trasferidos al área de cría larvaria para su desarrollo y que posteriormente son usados en los experimentos y en la conformación de banco de reproductores, El area de reproducción cuenta con estanques circulares de 4 metros de diámetro,  en estos estanques son controlados los parámetros de calidad de agua   como temperatura; por medio de un controlador automático además de contar con un sistema de recirculación de agua para el control de los compuestos nitrogenados; cuenta con sistemas instalados para mantener la turbidez del agua en niveles aceptables, para el manejo adecuado de los reproductores, Al mantenerse estos parámetros en los niveles óptimos se contribuye en el bienestar de los organismos, Los estanques de desove y eclosión se encuentran en un área con temperatura ambiental y luminosidad   controlada, esto para favorecer el desarrollo embrionario y desarrollo de los primeros estadíos después de la eclosión, así como facilitar el proceso de cosecha de nauplios cuando deben ser trasferidos al área de larvicultura, En el área son desarrollados experimentos enfocados a la evaluación de la calidad nutricional mediante parámetros zootécnicos y bioquímicos de diferentes especies de camarones peneidos dentro de los cuales destacan Farfantepenaeus brasiliensis, Farfantepenaeus duorarum, Litopenaeus setiferus y litopenaeus vannamei, Para el manejo de los reproductores son aplicadas medidas de bioseguridad durante todo el proceso;  desde la selección de reproductores, mantenimiento, manejo del alimento y disposición final de materia orgánica  proveniente de la limpieza de los estanques de maduración\r\n\"	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(5, 5, '	Biología de la Conservación	 ', 0, '		 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(6, 6, '	Laboratorio de Biología de la conservación	 ', 0, '		 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(7, 7, '	Laboratorio de Nutrición	 ', 1, '	El Laboratorio de Nutrición Acuícola cuenta con una trayectoria amplia y consolidada. Ha facilitado la formación de estudiantes tanto nacionales como extranjeros en diversos niveles académicos, desde licenciados en biología hasta Médicos Veterinarios, Licenciados en Manejo Integral de Zonas Costeras y carreras afines, así como profesionales con estudios de postdoctorado, El laboratorio de nutrición consolidó su posición en 2014 con la inauguración de sus nuevas instalaciones, las cuales proporcionan mejores oportunidades no solo para continuar con la formación de recursos humanos, sino también para iniciar un camino hacia la prestación de servicios externos a la industria acuícola, El objetivo general del laboratorio es estudiar la efectividad de ingredientes alternativos a la harina y aceite de pescado en la elaboración de alimentos balanceados para crustáceos, peces y moluscos marinos, Esto se lleva a cabo con el propósito de disminuir la dependencia de los océanos y estabilizar el suministro de dichos ingredientes en la actividad acuícola, contribuyendo así a desarrollar una industria acuícola amigable con el medio ambiente, Estos estudios no solo buscan generar conocimiento, sino también realizar una transferencia de tecnología a la industria acuícola	 ', '	No aplica	 ', '	https://www.facebook.com/profile.php?id=100090857896184	 ', '	No aplica	 ', '	No aplica	 '),
(8, 8, '	Cómputo científico	 ', 1, '	Esta área se creó con la idea de apoyar a los investigadores y técnicos académicos en la parte computacional, creando programación de alto nivel para resolver los problemas que se presenten, esto es apoyando en: Análisis de datos, Los datos son la parte fundamental en la investigación, se recojen datos en campo, históricos o de laboratorio y con estos se procesan para obtener tendencias, aproximaciones, probabilidades o graficarlos, Visualización de resultados, Es fundamental que despues de realizarse alguna investigación se obtienen resultados que quisieran visualizarse o compartirse y no dejarlos en el olvido, para ello se realizan cualquier tipo de gráficas, páginas web, aplicaciones móviles o bases de datos, Optimización de procesos, En algunas ocasiones el tiempo de procesamiento para analizar datos suele ser tardado por lo que se toma dias en obtenerlo, para ello se realiza una programación en paralelo utilizando los cores de las computadoras y asi reducir el tiempo de manera considerable	 ', '	https://cc.sisal.unam.mx/AreaCC/index.php	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(9, 9, '	ESTANQUES DE ENGORDA EXPERIMENTAL DE CAMARON	 ', 1, '	Área de 24 estanques circulares para producción piloto de camarón marino con sistema BFT sin recambio de agua y fertilización orgánica, todo integrado en un Cultivo Multitrófico Integrado (IMTA) asociado con cultivo de peces filtradores (mugílidos) macroalgas y halófitas de importancia comercial, Destinados a la experimentación con especies de camarón nativas del Golfo de México, Esta área tiene como objetivo generar condiciones lo más parecidas al medio natural pero también replicar el ambiente de las granjas de cultivo comercia,  Permite participar en la INVESTIGACIÓN para saber nuevos métodos de cultivo y procedimientos para mejorar la eficiencia y la sustentabilidad de la acuacultura, DOCENCIA: A través de la formación de recursos humanos capacitados y entrenados en el cultivo, que sean capaces de desarrollarse en la industria acuícola,  EXTENSION Y DIFUSIÓN: Participando en eventos y recibiendo visitas durante todo el año con una perspectiva específica para cada grupo de edad y/o nivel académico	 ', '	No aplica	 ', '	https://www.facebook.com/pcamaronunam	 ', '	https://www.instagram.com/acuacultura_sisal/	 ', '	No aplica	 '),
(10, 10, '	Conocimiento y Manejo de Sistemas Costeros	 ', 0, '		 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(11, 11, '	Unidad de Biología de la Conservación, Laboratorio de Ecología Geográfica	 ', 0, '		 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(12, 12, '	Área de Salidas a campo	 ', 1, '	El área de salidas a campo es un espacio equipado y destinado para brindar apoyo técnico especializado a personal académico (profesores y técnicos) y alumnos regulares de la UNAM, en el trabajo realizado en diferentes ecosistemas terrestres, marinos y costeros, El personal del área provee de un servicio profesional, ético y eficiente en la planeación, logística y ejecución de trabajo en campo que permita obtener información relevante y apta de ser utilizada en los diferentes proyectos de investigación de los académicos de la UNAM en Yucatán, así como para la formación de recursos humanos de educación superior y posgrado, Está conformada por un edificio que cuenta con área de carga y descarga, tres bodegas de almacenamiento, un baño/vestidor y la oficina del Técnico Académico en Salidas a Campo (TASC), ubicada en la planta alta                                                                                                                                                                 	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(13, 13, '	Área Experimental de Ecología y Conducta	 ', 1, '	\"En las instalaciones del Área Experimental de Ecología y Conducta en la UMDI, Sisal, se lleva a cabo el Programa de Investigaciones en Ecología y Cultivo de Especies Marinas de Ornato (PIECEMO). Durante los últimos 20 años, este programa ha generado información científica y tecnológica enfocada a la conservación de diferentes especies de interés ornamental, El trabajo realizado a abarcado aspectos tales como: el establecimiento de procedimientos de manejo de crías recién nacidas, juveniles y adultos, así como la producción de alimentos de alta calidad nutricional requerida en cada etapa de desarrollo, De la misma forma se ha llevado a cabo investigación relacionada responder preguntas de investigación que van desde la biología básica, aspectos fisiológicos y conductuales hasta estudios relacionados a dinámica poblacional de las especies, Durante los últimos años, los esfuerzos se han centrado en la especie de caballito de mar Hippocampus erectus con trabajos de investigación enfocados en conocer las respuestas fisiológicas y conductuales ante variaciones de temperatura con el fin de prever las alteraciones en los límites de distribución de estas especies y el impacto de sus poblaciones naturales, Actualmente en el laboratorio, se cuenta con un banco de reproductores nacidos en cautiverio, así como con la tecnología desarrollada para la producción sustentable de organismos, Los esfuerzos actuales están enfocados a llevar a cabo la transferencia del conocimiento generado a lo largo de estos años que permita al sector productivo del país interesado, llevar a cabo el cultivo comercial de caballitos de mar adecuados para el comercio de especies vivas y que contribuya a reducir su pesca ilegal. De la misma forma, en el PIECEMO se ha establecido un programa de monitoreo en campo con el fin de identificar el estado de conservación de las poblaciones tanto de Hippocampus erectus como de las otras dos especies que se encuentran en la región (H. zoosterae e H. reidi)   \r\n\"	 ', '	http://piecemo.sisal.unam.mx/	 ', '	https://www.facebook.com/profile.php?id=100064141743571&locale=es_LA	 ', '	No aplica	 ', '	No aplica	 '),
(14, 14, '	Área de Ecología y Conducta, PIECEMO	 ', 1, '	\"En estas instalaciones de la Facultad de Ciencias estudiamos diversos aspectos sobre la ecología y conducta de especies marinas ornamentales, La información que se origina promueve esfuerzos de conservación de las especies tan carismáticas como vulnerables, en conjunto con los ecosistemas costeros de los que forman parte, Los principales objetivos están relacionados a generar y difundir el conocimiento científico, promover la educación ambiental, la formación de conciencia para la conservación y conocimiento de la biodiversidad, así como la formación de recursos humanos a diferentes niveles, El poco conocimiento sobre especies marinas ornamentales en México, aunado a su alto valor ecológico y económico, originó la creación de esta linea de investigación en 2008, constituyéndose como el Programa de Investigaciones en Ecología y Cultivo de Especies Marinas de Ornato (PIECEMO), El programa está dirigido al estudio de la biología, fisiología y conducta de especies con potencial ornamental, principalmente del Golfo de México y Mar Caribe, y enfoca parte de su quehacer en el desarrollo de protocolos que permitan la reproducción, cría, engorda y/o propagación en cautiverio de las especies de interés. Entre éstas se encuentran cnidarios (como las anémonas Condilactis gigantea, Bartholomea annulata, o el coral blando, Ricordea florida), camarones carideos (como Ancylomenes pedersoni, Alpheus armatus, o Tozeuma carolinense) y peces (como el pez ángel, Pterophyllum scalare o el Gramma Loreto), A partir del 2010, un interés creciente sobre los caballitos de mar nos llevó a dirigir esfuerzos al estudio de Hippocampus erectus, ampliamente distribuido en la costa atlántica de América. A la fecha hemos desarrollado investigación sobre la conducta sexual, de alimentación y la biología térmica de la especie, así como diversos estudios sobre aspectos zootécnicos, incluidos aquellos sobre bienestar animal. A lo largo de estos años, PIECEMO ha formado a más de 100 estudiantes de todos los niveles educativos, tanto nacionales como extranjeros, y ha capacitado tanto a profesionales de la acuariofilia, como a docentes de los institutos de educación superior de la región para la constitución de una red monitoreo de caballitos en aguas someras (REMCAS), Actualmente colaboramos con los acuarios públicos más importantes de México y con diversas organizaciones nacionales e internacionales de acuariofilia; albergamos la primer Unidad de Manejo Ambiental de caballitos de mar en el país y llevamos cabo acciones que promueven la conservación de los hipocampos a través de nuestra participación con la organización Project Seahorse, incluidas la elaboración de infografías y libros infantiles gratuitos\r\n\"	 ', '	http://piecemo.sisal.unam.mx/	 ', '	https://www.facebook.com/piecemo.sisal?locale=es_LA	 ', '	No aplica	 ', '	No aplica	 '),
(15, 15, '	Gestión y manejo integrado de áreas costeras	 ', 1, '	\"\r\nLa gestión ambiental para el Manejo integrado de las áreas costeras (MIZC) es el proceso dinámico de tomar decisiones para desarrollar e implementar estrategias coordinadas que asignen recursos ambientales, socio-culturales e institucionales con el objetivo de preservar la integridad y el uso múltiple sustentable del área costero-marina. Incorpora el diagnóstico y las propuestas de mejora sobre las políticas públicas, la regulación y la participación social que inciden en los retos de aprovechamiento conservación y restauración de las áreas costeras.  La naturaleza interdisciplinaria de MIZC permite la integración de diferentes tipos de conocimientos, enfoques, usuarios, marcos conceptuales y metodologías para permitir, a largo plazo, preservar los valores y la riqueza de las áreas costeras; deseablemente en un escenario de gobernanza adaptada al dinamismo de sus sistemas. Por ahora la UMDI Sisal, continúa construyendo capacidades de incorporar el conocimiento científico que se genera en este proceso de incidir en la toma de decisiones, por tanto, esta área de conocimiento sobre Gestión y MIZC está muy vinculado al laboratorio de Ecología y colabora con otros laboratorios de la unidad académica\r\n\"	 ', '	en proceso	 ', '	IIGOBSECO UNAM	 ', '	en proceso	 ', '	en proceso	 '),
(16, 16, '	Peces, Ecología Costera	 ', 1, '	Peces y Ecología Costera es un laboratorio en donde se realizan diversas actividades docentes y de investigación, enfocadas a temas de distribución, ecología, alimentación y diversos aspectos ecológicos sobre peces costeros, Las investigaciones principalmente se han enfocado en ciénegas, lagunas costeras, manglares y arrecifes rocosos y de coral, Dentro de las líneas de investigación se tiene colaboración con los laboratorios de Biología de la Conservación de la UMDI Sisal, sede Parque científico y el laboratorio de Ecotoxicología de la UMDI Sisal, así como con el laboratorio de calidad ambiental de la ENES Mérida, En este laboratorio hay posibilidad de realizar estancias de servicio social, prácticas profesionales, tesis de licenciatura, maestría y doctorado, así como también  la realización de estancias posdoctorales, Los proyectos en los últimos años han estado enfocados a: Variaciones nictemerales en peces costeros, Distribución y abundancia de pez león en el Caribe Mexicano, Alimentación de pez león en el Caribe Mexicano, Variaciones en la alimentación de peces costeros en ciclos día y noche, Distribución y abundancia y alimentación en peces de cenotes, Peces de manglar enfocados a proyectos de restauración en la península de Yucatán, Hábitats lagunares como zonas de crianza de peces marinos en diversas lagunas de la península de Yucatá, Variaciones espaciales y temporales en diversos aspectos funcionales en la comunidad de peces de la laguna de Celestún, También participamos de forma activa en divulgación de la ciencia con la asistencia a congresos, elaboración de material audiovisual y participación en ferias científicas	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(17, 17, '	LABORATORIO DE TECNOLOGIA ACUICOLA	 ', 1, '	El Laboratorio de Tecnología Acuícola (LTA) es un espacio de investigación dirigida al desarrollo de nuevos insumos a partir de los descartes de la producción pesquera y acuícola útiles para su inclusión en alimentos para organismos acuáticos cultivados y con potencial de cultivo así como en la producción agrícola, En el LTA se realizan estudios del comportamiento del proceso de transformación de desechos de pescado a través del ensilaje químico considerando las condiciones fisicoquimicas como temperatura, pH, generacion de proteína solubilizada y rancidez oxidativa del componente graso, Así también, se desarrollan alimentos con la inclusión de hidrolizados proteicos y ensilados para todas las etapas del desarrollo de peces, crustáceos y moluscos, Para el grupo de peces se han desarrollado alimentos para preadultos y reproductores de robalo blanco (Centropomus undecimalis), juveniles de pargo canane (Ocyurus chrysurus) y recientemente pampano, En el caso de crustáceos se han realizado estudios de la inclusión de ensilados en alimentos para Litopenaeus vannamei y Farfantepenaus duorarum. En el caso de los moluscos se realizan estudios  de la inclusión de los ensilados y proteínas solubilizadas en paralarvas, crias y reproductores de Octopus vulgaris, Octopus maya y Paroctopus diguetti, Los ensilados también han sido evaluados como fertilizante en la producción de microalgas (Tetraselmis chuii, Dunallliela tertiolecta y Chaetoceros ceratosporum), asi como en el crecimiento de rotiferos Brachionus plicatilis, En la linea de investigación del uso de ensilados en la producción agrícola, se han realizado estudios sobre el uso de los ensilados en la emergencia, desarrollo y crecimiento de chile habanero, pimiento rojo y calabacín, El objetivo es desarrollar estrategias de aprovechamiento de los descartes de la pesca y su transformación en un producto útil para su uso como fertilizante en cultivos agrícolas	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(18, 18, '	Laboratorio de Análisis Espacial de Zonas Costeras (Costalab)	 ', 1, '	En el Laboratorio de Análisis Espacial de Zonas Costeras (Costalab), ubicado en el Parque Científico y Tecnológico de Yucatán, tenemos como objetivo generar conocimiento espacialmente explícito mediante el uso de tecnología, herramientas y métodos de vanguardia que permitan determinar el estado de los ecosistemas arrecifales y de manglar, considerando su variación como consecuencia de las perturbaciones naturales y antropogénicas, Nuestros proyectos de investigación analizan procesos en escalas de paisaje amplias, mediante el uso de Sistemas de Información Geográfica, imágenes satelitales, imágenes obtenidas por drones y fotogrametría digital. Impartimos cátedra y formamos estudiantes a nivel de licenciatura, maestría y doctorado en la Licenciatura en Manejo Sustentable de Zonas Costeras y en el Posgrado en Ciencias del Mar y Limnología, Contamos con el equipamiento necesario para la colecta de datos en campo, así como la capacidad de cómputo y programas informáticos para su procesamiento, En el Costalab, también participamos en actividades de difusión y en acciones encaminadas a la conservación de los arrecifes coralinos y manglares, en colaboración con el sector público y privado.	 ', '	https://analisisespacial.pcyt.unam.mx/	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(19, 19, '	Laboratorio de Ecología y Manejo de Costas y Mares	 ', 1, '	\"El Laboratorio de Ecología y Manejo de Costas y Mares realizar investigación en biología y ecología básica sobre ecosistemas  marino-costeros, Además de fungir como eje principal en la generación de conocimiento, concentración  en bases de datos y en colecciones científicas, Asimismo, coadyuva en la formación de personal especializado en socioecosistemas costero-marinos, llevando a cabo estudios multidisciplinarios encaminados a la conservación, manejo y restauración de los socioecosistemas costeros, Por otro lado, también difunde el conocimiento biológico, ecológico y social adquirido, y colabora con instituciones regionales, nacionales y extranjeras en la investigación, así como en la solución de problemas socioambientales, Los estudios que se llevan a cabo incluyen los socioecosistemas de arrecifes  marinos, manglares, pastos marinos, lagunas costeras, dunas costeras, selva baja  caducifolia, selva baja inundable, tasistales, petenes y cenotes; así como  diferentes aspectos sociales y ambientales relacionados con las comunidades  humanas que interaccionan con ellos, Brindando un espacio de trabajo que incluye un área de laboratorio con mesones y tarjas, estufas, balanzas, drones, sala de microscopía, sala de colecciones científicas e invernaderos que brinda  apoyo a la comunidad académica y estudiantil, así como al público en general\r\n\"	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(20, 20, '	Cultivo de Peces Marinos	 ', 0, '		 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(21, 21, '	Ecotoxicología de ambientes costeros y marinos	 ', 1, '	El grupo de trabajo se encarga de la caracterización del estado de contaminantes en ambientes costeros de la Península de Yucatán, de la evaluación del efecto de contaminantes de relevancia local y global en organismos de importancia ecológica y económica de ambientes costeros y marinos, Se han estandarizado y aplicado biomarcadores e indicadores integrales de la condición de salud de los organismos de interés, Para el desarrollo de los estudios se han integrado alumnos(as) de las carreras de biología, manejo sustentable de zonas costeras, ciencias ambientales, así como alumnos(as) de posgrado, El propósito es aportar información científica para el manejo y gestión de contaminantes ambientales y de actividades contaminantes, así como informar a la sociedad sobre los principales hallazgos y contribuir hacia un cambio de actitud para la mitigación de la contaminación	 ', '	ecotoxicologiacostera.com	 ', '	No aplica	 ', '	@ecotoxicologiacostera	 ', '	No aplica	 '),
(22, 22, '	INVERNADERO DE PECES MARINOS	 ', 1, '	\"El invernadero de peces marinos es un área que incluye el AREA DE REPRODUCCION donde se localizan los bancos de reproductores de peces marinos y estuarinos del Golfo de México de importancia comercial y ecológica, Aquí pueden mantenerse también ejemplares adultos en cautiverio para estudios biológicos y/o ecológicos, En el AREA DE LARVICULTURA se aplican y desarrollan metodologías para la producción de juveniles con el apoyo de producción de alimento vivo,\r\nDentro del invernadero de peces marinos se lleva a cabo la investigación enfocada en la generación de tecnologías para la reproducción de peces marinos en condiciones controladas, así como la producción de crías, Se realizan algunos estudios ecológicos en peces marinos y estuarinos endémicos en condiciones controladas, Se realiza docencia mediante enseñanza teórico-práctica, así como entrenamiento en la actividad acuícola y la divulgación del conocimiento generado y el potencial de especies para su cultivo en la región\"	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(23, 23, '	Área Experimental de Fisiología e Inmunología	 ', 1, '	\"La Eco-inmunología es una disciplina relativamente nueva, que estudia la salud de los animales como una característica de todo el organismo, en lugar de una serie de mecanismos aislados, a través de una visión integradora que combina conocimientos sobre inmunología, eco-fisiología, nutrición, genética y conducta, entre otros, En la UMDI-Sisal hemos utilizado este abordaje para estudiar la condición de salud de organismos silvestres y cultivados en especies marinas de importancia económica (camarones, en la langosta espinosa del Caribe, el pulpo maya, el robalo blanco y el caballito de mar), Generar este tipo de conocimiento ha sido útil para la formación de estudiantes con esta visión, y también, para realizar servicios de investigación para el sector productivo, La eco-inmunología brinda un marco conceptual sólido para estudios sobre bienestar animal, siendo un área que requiere mucha atención a nivel mundial para lograr procedimientos respetuosos con los organismos acuáticas\r\n\"	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(24, 24, '	Área de Buceo Científico	 ', 1, '	El área de buceo científico de la UMDI-Sisal es un espacio vital para investigadores y estudiantes que realizan investigación científica utilizando al buceo como herramienta subacuática al norte de la península de Yucatán, Cuenta con instalaciones especializadas, como la bodega de Salidas a Campo, destinada al almacenamiento de equipos y provista con vestidores/regaderas, y el cubículo de la responsable del área que ofrecen un entorno óptimo para la planificación y ejecución de actividades de buceo, Esta área es utilizada por diversos programas de la UMDI, incluyendo Biodiversidad Marina, Cenoteando, Conducta Animal, Estudio de Pesquerías, Gestión y Manejo de Zonas Costeras, y el programa PIESACOM, facilitando muestreos y monitoreos que contribuyen al conocimiento científico de los ambientes anquialinos, costeros y marinos, Gracias a su ubicación estratégica y a su infraestructura en crecimiento, el área de buceo de la UMDI es un lugar privilegiado para la investigación subacuática	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 ', '	No aplica	 '),
(25, 25, '	Laboratorio de Ecofisiología Aplicada	 ', 1, '	\"En el Laboratorio de Ecofisiología Aplicada (LABECOA) se realizan proyectos de investigación dirigidos a establecer la capacidad adaptativa de las especies acuáticas ante los cambios ambientales, entendiendo al ambiente tanto en sus componentes físicos como químicos, incluidos los contaminantes. Las especies acuáticas de mayor interés son las del ambiente marino que tienen importancia ecológica, pesquera o acuícola, Aunque el pulpo Octopus maya ha sido la especie de mayor interés, también se llevan a cabo estudios en caballitos de mar, langostas, jaibas del género Callinectes, pepinos de mar, peces marinos, camarones peneidos y otros moluscos, También se trabaja con especies anquihalinas que habitan en los cuerpos de agua contenidos en cuevas y cavernas de la Península de Yucatán,  En este laboratorio se abordan diferentes disciplinas y líneas de investigación entre las que destacan, la nutrición, ecología y conducta; fisiología de organismos acuáticos, inmunología y bienestar animal\r\n\"	 ', '	No aplica	 ', '	https://www.facebook.com/labecoa?mibextid=kFxxJD	 ', '	https://www.instagram.com/labecoa?igsh=NHZrbTMwZmM2ZTUw	 ', '	No aplica	 '),
(26, 26, '	Oceanografía Física y Procesos Costeros	 ', 1, '	Estudios de hidrodinámica marina y costera y transporte de materia y propiedades, Aplicaciones: seguimiento de sargazo, de mareas rojas, de larvas; morfodinámica; dispersión de contaminantes; estudios de intrusión salina y descargas submarinas del acuífero en la zona costera; investigación para la obtención de energía del océano	 ', '	No aplica	 ', '	No aplica	 ', '	No Aplica	 ', '	No aplica	 ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas`
--

DROP TABLE IF EXISTS `lineas`;
CREATE TABLE IF NOT EXISTS `lineas` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personal` int UNSIGNED NOT NULL,
  `linea` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lineas_ibfk_1` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `lineas`
--

INSERT INTO `lineas` (`id`, `id_personal`, `linea`) VALUES
(1, 1, 'Gestión ambiental en empresas y consumidores, resiliencia social de negocios turísticos y valoración económica del medio ambiente, todas estas investigaciones se realizan en zonas costeras de México'),
(2, 2, 'Ecología de poblaciones y comunidades'),
(3, 3, 'Arrecifes Coralinos, Percepción Remota y SIG'),
(4, 4, 'Nutrición de reproductores de camarones marinos, Manejo zootécnico de reproductores de camarones marinos, Parámetros fisiológicos y bioquímicos en la preproducción de camarones marinos'),
(5, 5, 'Colecciones científicas, ecología de peces	   '),
(6, 6, 'Ictiología, Ecología, Colecciones científicas	   '),
(7, 7, 'Biotecnología aplicada, Nutrición Acuícola, Transferencia de Tecnología 	   '),
(8, 8, 'No tengo una línea específica	   '),
(9, 9, 'CULTIVO MULTITROFICO INTEGRADO, MARICULTURA, ACUACULTURA	   '),
(10, 10, 'Educación ambiental, Ciencia ciudadana e Investigación Acción Participativa	   '),
(11, 11, 'Ecología geográfica, Macroecología, Biogeografía	   '),
(12, 12, 'Ecología de peces arrecifales, Ecología de peces de lagunas costeras y Arrecifes artificiales	   '),
(13, 13, 'Producción de especies marinas ornamentales (EMO) y de alimentos no convencionales (anfípodos marinos), Responsable técnico de la UMA del caballito de mar Hippocampus erectus, Coordinadora del proyecto Red de Monitoreo de Caballitos de Mar en Aguas Someras (REMCAS)	   '),
(14, 14, 'Ecología y conducta de animales acuáticos, Diseño experimental y análisis de datos biológicos, Enseñanza de la estadística a no-matemáticos	   '),
(15, 15, 'Gestión y gobernanza costera, Vulnerabilidad de áreas costeras ante  efectos del cambio climático, Pesca recreativa y deportiva en áreas costero-marinas	   '),
(16, 16, 'Distribución y Ecología de Peces, Dinámica trófica en peces costeros, Peces como indicadores de restauración de Manglar	   '),
(17, 17, 'APROVECHAMIENTO Y TRANSFORMACION DE DESCARTES DE LA PESCA, NUTRICION ACUICOLA, TECNOLOGIA DE ALIMENTOS ACUICOLAS	   '),
(18, 18, 'Ecología y Dinámica Espacio Temporal en sistemas arrecifales y ecosistemas de manglar mediante SIG y Sensores Remotos, Uso de drones para la caracterización y monitoreo de ecosistemas costeros, Caracterización de atributos ecológicos de arrecifes coralinos mediante el uso de fotogrametría subacuática digital	   '),
(19, 19, 'Restauración costera, Ecología vegetal, Hongos micorrizógenos arbusculares	   '),
(20, 20, 'Desarrollo ontogénico temprano del sistema inmunológico de teleósteos, Larvas de peces marinos como modelo para estudiar la inmunidad entrenada, Alimento vivo y larvicultura de peces marinos tropicales	   '),
(21, 21, 'Ecotoxicologia de ambientes costeros y marinos, Evaluación de riesgo ecológico por contaminantes, Manejo de contaminantes de zonas costeras	   '),
(22, 22, 'ACUACULTURA, PISCICULTURA MARINA, REPRODUCCION DE PECES MARINOS	   '),
(23, 23, 'Eco-inmuniología de organismos marinos, Bienestar Animal de especies acuáticas, Estado de salud de organismos acuáticos	   '),
(24, 24, 'Buceo Científico (monitoreo, muestreo, entrenamiento), Biodiversidad Marina, Fotogrametría Bentónica, Primeros Auxilios	   '),
(25, 25, 'Ecofisiología de organismos acuáticos, Reproducción y cultivo de cefalópodos  	   '),
(26, 26, 'Hidrodinámica y transporte, Flujos oceano-continente-atmósfera, Energías marinas	   ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_area`
--

DROP TABLE IF EXISTS `mrbs_area`;
CREATE TABLE IF NOT EXISTS `mrbs_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disabled` tinyint NOT NULL DEFAULT '0',
  `area_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_key` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_admin_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `resolution` int DEFAULT NULL,
  `default_duration` int DEFAULT NULL,
  `default_duration_all_day` tinyint NOT NULL DEFAULT '0',
  `morningstarts` int DEFAULT NULL,
  `morningstarts_minutes` int DEFAULT NULL,
  `eveningends` int DEFAULT NULL,
  `eveningends_minutes` int DEFAULT NULL,
  `private_enabled` tinyint DEFAULT NULL,
  `private_default` tinyint DEFAULT NULL,
  `private_mandatory` tinyint DEFAULT NULL,
  `private_override` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_create_ahead_enabled` tinyint DEFAULT NULL,
  `min_create_ahead_secs` int DEFAULT NULL,
  `max_create_ahead_enabled` tinyint DEFAULT NULL,
  `max_create_ahead_secs` int DEFAULT NULL,
  `min_delete_ahead_enabled` tinyint DEFAULT NULL,
  `min_delete_ahead_secs` int DEFAULT NULL,
  `max_delete_ahead_enabled` tinyint DEFAULT NULL,
  `max_delete_ahead_secs` int DEFAULT NULL,
  `max_per_day_enabled` tinyint NOT NULL DEFAULT '0',
  `max_per_day` int NOT NULL DEFAULT '0',
  `max_per_week_enabled` tinyint NOT NULL DEFAULT '0',
  `max_per_week` int NOT NULL DEFAULT '0',
  `max_per_month_enabled` tinyint NOT NULL DEFAULT '0',
  `max_per_month` int NOT NULL DEFAULT '0',
  `max_per_year_enabled` tinyint NOT NULL DEFAULT '0',
  `max_per_year` int NOT NULL DEFAULT '0',
  `max_per_future_enabled` tinyint NOT NULL DEFAULT '0',
  `max_per_future` int NOT NULL DEFAULT '0',
  `max_secs_per_day_enabled` tinyint NOT NULL DEFAULT '0',
  `max_secs_per_day` int NOT NULL DEFAULT '0',
  `max_secs_per_week_enabled` tinyint NOT NULL DEFAULT '0',
  `max_secs_per_week` int NOT NULL DEFAULT '0',
  `max_secs_per_month_enabled` tinyint NOT NULL DEFAULT '0',
  `max_secs_per_month` int NOT NULL DEFAULT '0',
  `max_secs_per_year_enabled` tinyint NOT NULL DEFAULT '0',
  `max_secs_per_year` int NOT NULL DEFAULT '0',
  `max_secs_per_future_enabled` tinyint NOT NULL DEFAULT '0',
  `max_secs_per_future` int NOT NULL DEFAULT '0',
  `max_duration_enabled` tinyint NOT NULL DEFAULT '0',
  `max_duration_secs` int NOT NULL DEFAULT '0',
  `max_duration_periods` int NOT NULL DEFAULT '0',
  `custom_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `approval_enabled` tinyint DEFAULT NULL,
  `reminders_enabled` tinyint DEFAULT NULL,
  `enable_periods` tinyint DEFAULT NULL,
  `periods` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `confirmation_enabled` tinyint DEFAULT NULL,
  `confirmed_default` tinyint DEFAULT NULL,
  `times_along_top` tinyint NOT NULL DEFAULT '0',
  `default_type` char(1) NOT NULL DEFAULT 'E',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_area_name` (`area_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mrbs_area`
--

INSERT INTO `mrbs_area` (`id`, `disabled`, `area_name`, `sort_key`, `timezone`, `area_admin_email`, `resolution`, `default_duration`, `default_duration_all_day`, `morningstarts`, `morningstarts_minutes`, `eveningends`, `eveningends_minutes`, `private_enabled`, `private_default`, `private_mandatory`, `private_override`, `min_create_ahead_enabled`, `min_create_ahead_secs`, `max_create_ahead_enabled`, `max_create_ahead_secs`, `min_delete_ahead_enabled`, `min_delete_ahead_secs`, `max_delete_ahead_enabled`, `max_delete_ahead_secs`, `max_per_day_enabled`, `max_per_day`, `max_per_week_enabled`, `max_per_week`, `max_per_month_enabled`, `max_per_month`, `max_per_year_enabled`, `max_per_year`, `max_per_future_enabled`, `max_per_future`, `max_secs_per_day_enabled`, `max_secs_per_day`, `max_secs_per_week_enabled`, `max_secs_per_week`, `max_secs_per_month_enabled`, `max_secs_per_month`, `max_secs_per_year_enabled`, `max_secs_per_year`, `max_secs_per_future_enabled`, `max_secs_per_future`, `max_duration_enabled`, `max_duration_secs`, `max_duration_periods`, `custom_html`, `approval_enabled`, `reminders_enabled`, `enable_periods`, `periods`, `confirmation_enabled`, `confirmed_default`, `times_along_top`, `default_type`) VALUES
(2, 0, 'Biología Molecular', 'Biología Molecular', 'America/Merida', '', 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 0, 36000, 0, 90000, 0, 360000, 0, 360000, 0, 7200, 2, NULL, 0, 1, 0, '[\"Period 1\",\"Period 2\"]', 1, 1, 0, 'I'),
(3, 0, 'Docencia', 'Docencia', 'Europe/London', NULL, 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 0, 36000, 0, 90000, 0, 360000, 0, 360000, 0, 7200, 2, NULL, 0, 1, 0, '[\"Period 1\",\"Period 2\"]', 1, 1, 0, 'I'),
(4, 0, 'Bioquimica', 'Bioquimica', 'Europe/London', NULL, 1800, 3600, 0, 7, 0, 18, 30, 0, 0, 0, 'none', 0, 0, 0, 604800, 0, 0, 0, 604800, 0, 1, 0, 5, 0, 10, 0, 50, 0, 100, 0, 7200, 0, 36000, 0, 90000, 0, 360000, 0, 360000, 0, 7200, 2, NULL, 0, 1, 0, '[\"Period 1\",\"Period 2\"]', 1, 1, 0, 'I');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_entry`
--

DROP TABLE IF EXISTS `mrbs_entry`;
CREATE TABLE IF NOT EXISTS `mrbs_entry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` int NOT NULL DEFAULT '0' COMMENT 'Unix timestamp',
  `end_time` int NOT NULL DEFAULT '0' COMMENT 'Unix timestamp',
  `entry_type` int NOT NULL DEFAULT '0',
  `repeat_id` int DEFAULT NULL,
  `room_id` int NOT NULL DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `reminded` int DEFAULT NULL,
  `info_time` int DEFAULT NULL,
  `info_user` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ical_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ical_sequence` smallint NOT NULL DEFAULT '0',
  `ical_recur_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_registration` tinyint NOT NULL DEFAULT '0',
  `registrant_limit` int NOT NULL DEFAULT '0',
  `registrant_limit_enabled` tinyint NOT NULL DEFAULT '1',
  `registration_opens` int NOT NULL DEFAULT '1209600' COMMENT 'Seconds before the start time',
  `registration_opens_enabled` tinyint NOT NULL DEFAULT '0',
  `registration_closes` int NOT NULL DEFAULT '0' COMMENT 'Seconds before the start_time',
  `registration_closes_enabled` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `repeat_id` (`repeat_id`),
  KEY `idxStartTime` (`start_time`),
  KEY `idxEndTime` (`end_time`),
  KEY `idxRoomStartEnd` (`room_id`,`start_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_participants`
--

DROP TABLE IF EXISTS `mrbs_participants`;
CREATE TABLE IF NOT EXISTS `mrbs_participants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int NOT NULL,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_entryid_username` (`entry_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_repeat`
--

DROP TABLE IF EXISTS `mrbs_repeat`;
CREATE TABLE IF NOT EXISTS `mrbs_repeat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` int NOT NULL DEFAULT '0' COMMENT 'Unix timestamp',
  `end_time` int NOT NULL DEFAULT '0' COMMENT 'Unix timestamp',
  `rep_type` int NOT NULL DEFAULT '0',
  `end_date` int NOT NULL DEFAULT '0' COMMENT 'Unix timestamp',
  `rep_opt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `room_id` int NOT NULL DEFAULT '1',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_by` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'E',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rep_interval` smallint NOT NULL DEFAULT '1',
  `month_absolute` smallint DEFAULT NULL,
  `month_relative` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `reminded` int DEFAULT NULL,
  `info_time` int DEFAULT NULL,
  `info_user` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ical_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ical_sequence` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `room_id` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_room`
--

DROP TABLE IF EXISTS `mrbs_room`;
CREATE TABLE IF NOT EXISTS `mrbs_room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disabled` tinyint NOT NULL DEFAULT '0',
  `area_id` int NOT NULL DEFAULT '0',
  `room_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sort_key` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int NOT NULL DEFAULT '0',
  `room_admin_email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `invalid_types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON encoded',
  `custom_html` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_room_name` (`area_id`,`room_name`),
  KEY `idxSortKey` (`sort_key`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mrbs_room`
--

INSERT INTO `mrbs_room` (`id`, `disabled`, `area_id`, `room_name`, `sort_key`, `description`, `capacity`, `room_admin_email`, `invalid_types`, `custom_html`) VALUES
(1, 0, 4, 'Bioquimica', 'Bioquimica', 'Area de Bioquimica', 4, '', NULL, NULL),
(2, 0, 2, 'Biologia Molecular', 'Biologia Molecular', 'Area de Biologia Molecular', 2, '', NULL, NULL),
(3, 0, 3, 'Aula 1', 'Aula 1', 'Aula 1', 30, '', NULL, NULL),
(4, 0, 3, 'Aula 2', 'Aula 2', 'Aula 2', 30, '', NULL, NULL),
(5, 0, 3, 'Aula 3', 'Aula 3', 'Aula 3', 30, '', NULL, NULL),
(6, 0, 3, 'Aula 4', 'Aula 4', 'Aula 4', 30, '', NULL, NULL),
(7, 0, 3, 'Aula 5', 'Aula 5', 'Aula 5', 30, '', NULL, NULL),
(8, 0, 3, 'Sala de Estudios', 'Sala de Estudios', 'Sala de Estudios', 30, '', NULL, NULL),
(9, 0, 3, 'Aula posgrado 1', 'Aula posgrado 1', 'Aula posgrado 1', 30, '', NULL, NULL),
(10, 0, 3, 'Aula posgrado 2', 'Aula posgrado 2', 'Aula posgrado 2', 30, '', NULL, NULL),
(11, 0, 3, 'Sala de Juntas Posgrado', 'Sala de Juntas Posgrado', 'Sala de Juntas Posgrado', 30, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_sessions`
--

DROP TABLE IF EXISTS `mrbs_sessions`;
CREATE TABLE IF NOT EXISTS `mrbs_sessions` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int UNSIGNED DEFAULT NULL COMMENT 'Unix timestamp',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idxAccess` (`access`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mrbs_sessions`
--

INSERT INTO `mrbs_sessions` (`id`, `access`, `data`) VALUES
('33t4j7u9kbt534ll9jn9sr9918', 1721786767, 'csrf_token|s:64:\"9e05b21f17587a8a4ace1fa53e29a79e8c65c11758e0b24d0f68e3bb21497621\";'),
('3gu79b8kpab5nn6ifrd0k5d7s8', 1720685343, 'csrf_token|s:64:\"59d7e846718bb9e531ffe4fd153b80bb6ffc13f843ebd6dc7ac6c4d8a7ce7156\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1720684038;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}'),
('532mcd941j9muieulfdhd7vdae', 1720683924, 'csrf_token|s:64:\"b8bd50ce75a60a55c6dff81a52be7d7c80797a68ba845cf5373c49502357fe31\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1720683735;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}'),
('6lut1a8dmihhal0btbnvudcrfe', 1720688654, 'csrf_token|s:64:\"5b93a56a014742cd30501257ddcca964a50b2cd27f7088df9fd1c8f7cb8dbdfb\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1720685373;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}'),
('8fjciqo022rq776go4rpl42mdp', 1721786873, 'csrf_token|s:64:\"f3e07180d02962cf91a73103c070c8ee09a7b607323eb16931fcbd52af73f4ff\";'),
('d042nv0gihi3a6mvg0rhhh431v', 1719373774, 'csrf_token|s:64:\"439edbc88338b6b66c5bc0a4748e268620af72e6f972bd44ecd1938bd9d110c2\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1719293553;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}'),
('miqoh6b39odllk6rka2romkagk', 1721965732, 'csrf_token|s:64:\"f4bcad01244bf2c48748b6b34e468fa630b54a720725d97ed1b1b6c728d28662\";last_page|s:43:\"index.php?view=day&view_all=1&area=2&room=2\";this_page|s:53:\"index.php?view=day&page_date=2024-08-29&area=2&room=2\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1721804998;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}'),
('mqsidgkfbmlbe4ni1i5vn7h87k', 1720833755, 'csrf_token|s:64:\"74fe2659f659ad3b93ff078a2760ab7623b67b319665db52eaa394f5be0e7ead\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1720766349;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}'),
('unpk1u6tfq0626g5603h90rj2s', 1720683262, 'csrf_token|s:64:\"f9c0446c2a1df83e760554a03238d1d3b4b3a30888967b46bd747b1fd3cb75d8\";user|O:9:\"MRBS\\User\":5:{s:8:\"username\";s:14:\"yukeni jimenez\";s:12:\"display_name\";s:6:\"Yukeni\";s:5:\"email\";s:25:\"yukenisonic1006@gmail.com\";s:5:\"level\";i:2;s:7:\"\0*\0data\";a:6:{s:2:\"id\";i:1;s:13:\"password_hash\";s:60:\"$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO\";s:9:\"timestamp\";s:19:\"2024-05-27 02:30:00\";s:10:\"last_login\";i:1720664858;s:14:\"reset_key_hash\";N;s:16:\"reset_key_expiry\";i:0;}}last_page|s:53:\"index.php?view=day&page_date=2024-07-12&area=2&room=2\";this_page|s:53:\"index.php?view=day&page_date=2024-07-11&area=2&room=2\";'),
('v5o7i7lkq4eku6id0qv6c5aqpf', 1721785289, 'csrf_token|s:64:\"be9fdb0bf2dd1b3aafecc17b0bba6e302f3847097083a1e90b438a1049570604\";'),
('vpktnujn9j5t0a6pqhdogjhmf5', 1720683359, 'csrf_token|s:64:\"6f5be49e9d6f51884f4767519705a4d134452e7bda0cb45713d2d5d51afbb185\";');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_users`
--

DROP TABLE IF EXISTS `mrbs_users`;
CREATE TABLE IF NOT EXISTS `mrbs_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` smallint NOT NULL DEFAULT '0',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` int NOT NULL DEFAULT '0',
  `reset_key_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_key_expiry` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mrbs_users`
--

INSERT INTO `mrbs_users` (`id`, `level`, `name`, `display_name`, `password_hash`, `email`, `timestamp`, `last_login`, `reset_key_hash`, `reset_key_expiry`) VALUES
(1, 2, 'yukeni jimenez', 'Yukeni', '$2y$10$RS4wvc8.iR9S5321S1gpiu4SPJSXsWtQDjOl39WSQTElMCTaM2MLO', 'yukenisonic1006@gmail.com', '2024-05-27 08:30:00', 1721804998, NULL, 0),
(2, 1, 'pedro pech', 'Pedro', '$2y$10$nlHUzMtoNrhHLl2ux89JxOwqs9TmsHu6T1pq/67PoQwhcJTRq.CeK', 'Pechkoh1619@hotmail.com', '2024-05-27 08:40:50', 1719293524, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_variables`
--

DROP TABLE IF EXISTS `mrbs_variables`;
CREATE TABLE IF NOT EXISTS `mrbs_variables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `variable_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variable_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_variable_name` (`variable_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mrbs_variables`
--

INSERT INTO `mrbs_variables` (`id`, `variable_name`, `variable_content`) VALUES
(1, 'db_version', '82'),
(2, 'local_db_version', '1'),
(3, 'message', '{\"text\":\"Verificar disponibilidad\",\"from\":\"2024-06-24T00:00:00\",\"until\":\"2026-01-01T00:00:00\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mrbs_zoneinfo`
--

DROP TABLE IF EXISTS `mrbs_zoneinfo`;
CREATE TABLE IF NOT EXISTS `mrbs_zoneinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timezone` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `outlook_compatible` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `vtimezone` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_updated` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_timezone` (`timezone`,`outlook_compatible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE IF NOT EXISTS `personal` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lugartra` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apepat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apema` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `puesto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `extension` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grupo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sni` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `correo`, `lugartra`, `apepat`, `apema`, `nombre`, `foto`, `grado`, `puesto`, `extension`, `tipo`, `grupo`, `sni`) VALUES
(1, 'dianadeyta3@gmail.com', 'Parque Científico', 'de Yta', 'Castillo', 'Diana', 'https://drive.google.com/open?id=1xuEzRYpURhl-S3RV-nAOkqyhEzUjKfxd', 'Doctorado', 'Investigadora por México', '7608', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(2, 'xcc@ciencias.unam.mx', 'Parque Científico', 'Chiappa', 'Carrara', 'Xavier', 'https://drive.google.com/open?id=194IacgiSi2RKmz-GQImjI1iGRhuhmOuC', 'Doctorado', 'Profesor titular C', '7701', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '2'),
(3, 'rgarza@ciencias.unammx', 'UMDI-Sisal', 'Garza', 'Pérez', 'Joaquín Rodrigo', 'https://drive.google.com/open?id=1zaCS5_lOqLx3Dg4qOFoCsrxhnAMm-ve9', 'Doctorado', 'Profesor Titular B de Tiempo Completo', '7150', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(4, 'mal@ciencias.unam.mx', 'UMDI-Sisal', 'Arévalo', 'López', 'Miguel', 'https://drive.google.com/open?id=198Fec_piMk3dTZsA8S2vpf0QKM93pg5b', 'Maestría', 'Técnico Académico, Responsable del Área de Preproducción de Camarones peneidos', '7163', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '0'),
(5, 'maribaam@ciencias.unam.mx', 'Parque Científico', 'Badillo', 'Alemán', 'Maribel', 'https://drive.google.com/open?id=1a-KygtF4sA62C8SEHRXQrfHQWJa6jvI4', 'Maestría', 'Técnico Académico Titular \"C\"', '7626', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '0'),
(6, 'gallalf@ciencias.unam.mx', 'Parque Científico', 'Gallardo', 'Torres', 'Alfredo', 'https://drive.google.com/open?id=1N4o70BpkxwbbbsW5jq0OfX7WEr0tKLUC', 'Maestría', 'Técnico Académico Tit.C TC', '9993410866', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '0'),
(7, 'carlos_maldonado@ciencias.unam.mx', 'UMDI-Sisal', 'Maldonado', 'FLores', 'Juan Carlos', 'https://drive.google.com/open?id=1eDtejyP2AzZo2u-rMN_tShF20VIz2gR9', 'Doctorado', 'Tec. Academico Titular C', '7432', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '1'),
(8, 'epacheco@ciencias.unam.mx', 'UMDI-Sisal', 'Pacheco', 'Góngora', 'Rafael Eduardo', 'https://drive.google.com/open?id=1l15pHUWBn9zWKXgiEgOp937wVb-TO4Pl', 'Maestría', 'Técnico académico titular \"B\" de tiempo completo', '7207', 'Académico', 'Coordinación General', '0'),
(9, 'mvalenzuela@ciencias.unam.mx', 'UMDI-Sisal', 'VALENZUELA', 'JIMENEZ', 'MANUEL ANGEL', 'https://drive.google.com/open?id=1MFCnVYDPfCHqmGIc9He6vk3Q7ROeSaJ7', 'Doctorado', 'TECNICO ACADEMICO TIT  C DE TC', '7160', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '1'),
(10, 'paredes.arely@ciencias.unam.mx', 'Parque Científico', 'Paredes', 'Chi', 'Arely Anahy', 'https://drive.google.com/open?id=17mnFHXYiySVuJ1KmDI9pDQ0I6tfXw5VC', 'Doctorado', 'Investigadora CONAHCyT', '0000', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(11, 'carlos_yanez@ciencias.unam.mx', 'Parque Científico', 'Yañez', 'Arenas', 'Carlos Alberto', 'https://drive.google.com/open?id=1bmwSO9xOHEhd-Z35RUi5CqdnFQMFW5KK', 'Doctorado', 'Profesor Titular A de Tiempo Completo', '6769', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(12, 'jvaldezi@ciencias.unam.mx', 'UMDI-Sisal', 'Valdez', 'iuit', 'Johnny Omar', 'https://drive.google.com/open?id=1cPHqtIytnSJkfq_xooYBzNXRlGgUESK-', 'Maestría', 'Salidas a campo/Técnico Asociado C', '7222', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '0'),
(13, 'glmm@ciencias.unam.mx', 'UMDI-Sisal', 'Martínez', 'Moreno', 'Gemma Leticia', 'https://drive.google.com/open?id=1UxJ67z7hFUmgazRnegIkyiTnz3ZeOtbF', 'Maestría', 'Técnica Académica Titular B', '7156', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '0'),
(14, 'mmm@ciencias.unam.mx', 'UMDI-Sisal', 'MASCARÓ', 'MIQUELAJAUREGUI', 'MAITE', 'https://drive.google.com/open?id=1vt7TNjmCOnnunaFQAeSIxejn9Mk8_hJF', 'Doctorado', 'PROF. CARRERA TITULAR C', '7135', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '2'),
(15, 'laurae.vidal@ciencias.unam.mx', 'UMDI-Sisal', 'Vidal', 'Hernández', 'Laura Elena', 'https://drive.google.com/open?id=1Z2SPWJ8SI9t_p_HB082FVtuYx054srsm', 'Doctorado', 'Profesor Asociado C', '7133', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(16, 'darceo@ciencias.unam.mx', 'UMDI-Sisal', 'Arceo', 'Carranza', 'Daniel', 'https://drive.google.com/open?id=1ubOWkH_kXNAXV1h-AFFs9cwx9QI3xKdh', 'Doctorado', 'Profesor Titular A TC', '7149', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(17, 'ppge@ciencias.unam.mx', 'UMDI-Sisal', 'GALLARDO', 'ESPINOSA', 'PEDRO PABLO', 'https://drive.google.com/open?id=1lBXMKPAWTV_tNNQ41DWI9Blitqh5feOr', 'Doctorado', 'PROF. DE CARRERA TIT.B T.C.', '7136', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '1'),
(18, 'rrioja@ciencias.unam.mx', 'Parque Científico', 'Rioja', 'Nieto', 'Rodolfo', 'https://drive.google.com/open?id=1Ql_1bejsFOiWVCoUbDq24gwFmEncoj0t', 'Doctorado', 'Profesor de Carrera Titular B de Tiempo Completo', '7614', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '2'),
(19, 'pguadarrama@ciencias.unam.mx', 'UMDI-Sisal', 'Guadarrama', 'Chávez', 'María Patricia', 'https://drive.google.com/open?id=1BFyWkodYVFHUaWg7jJov_ZVqwB4wMARm', 'Doctorado', 'Técnico Académico Titular C', '7156', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '1'),
(20, 'angel.rojo@ciencias.unam.mx', 'UMDI-Sisal', 'Rojo', 'Cebreros', 'Angel Humberto', 'https://drive.google.com/open?id=1cj8OZnSGlwQTpv_1VGjBNVnFV9VZGPD8', 'Doctorado', 'Profesor Asociado “C” de Tiempo Completo', '7144', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '1'),
(21, 'rmc@ciencias.unam.mx', 'UMDI-Sisal', 'Robles', 'Mendoza', 'Cecilia', 'https://drive.google.com/open?id=19DvUqz2Y7YVYkohvRFPP-osfmX3gCJK2', 'Doctorado', 'Profesora Asociada C', '7205', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '0'),
(22, 'cvdl@ciencias.unam.mx', 'UMDI-Sisal', 'DURRUTY', 'LAGUNES', 'CLAUDIA VERONICA', 'https://drive.google.com/open?id=1B0Jplcv8BVzDAn1V_7zeld3ZGfxQfZSX', 'Doctorado', 'TECNICA ACADEMICA TITULAR C DEF. T.C.', '7162', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', 'c'),
(23, 'pascual.cristina@ciencias.unam.mx', 'UMDI-Sisal', 'Pascual', 'Jiménez', 'Cristina', 'https://drive.google.com/open?id=1ijxA_0A_xinzxTgRD012W97BsZqVG6Q0', 'Doctorado', 'Profesora de Carreta', '7148', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '2'),
(24, 'quetzalli.hernandez@ciencias.unam.mx', 'UMDI-Sisal', 'Hernández', 'Díaz', 'Yoalli Quetzalli', 'https://drive.google.com/open?id=1FEcmNzfOBg206xIyRv44jr2E7tTFSOCJ', 'Maestría', 'Técnica Académica Asociada C de TC', '000000', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '0'),
(25, 'cpcm@ciencias.unam.mx', 'UMDI-Sisal', 'Caamal', 'Monsreal', 'Claudia Patricia', 'https://drive.google.com/open?id=11G0wOr7dZRrImdRV2dqEz9QK1EHqLDV-', 'Maestría', 'Técnica Académica Titular C de Tiempo Completo', '7220', 'Académico', 'Biología Experimental para la Acuacultura y Conservación de Organismos Acuáticos', '0'),
(26, 'cenriqz@ciencias.unam.mx', 'UMDI-Sisal', 'Enríquez', 'Ortiz', 'Cecilia Elizabeth', 'https://drive.google.com/open?id=1CITd1EZuoYe0gCdcRvaZnMVMh795q0qS', 'Doctorado', 'Profesora Titular en Oceanografía Física', '0000', 'Académico', 'Conocimiento y Manejo de Sistemas Costeros', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id_personal` int UNSIGNED NOT NULL,
  `vigentes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  KEY `id_personal` (`id_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_personal`, `vigentes`) VALUES
(1, 'Conservación y restauración de la duna costera de Sisal, Yucatán, Institución que financia: Programa de Pequeñas Donaciones (PPD) del Fondo Mundial del Ambiente (FMAM),  Responsable técnico del proyecto: KALANBIO A.C., Periodo de realización: de 2023 a la fecha'),
(2, 'Diversidad de otolitos de peces del golfo de México y mar Caribe: Una visión multidisciplinaria para la integración de colecciones existentes en la UNAM como una herramienta de apoyo en estudios ambientales, arqueológicos y de reconocimiento de imágenes, Sonidos naturales en oídos artificiales: redes neuronales aplicadas al monitoreo acústico de la biodiversidad mexicana en ecosistemas terrestres y acuáticos, Estandarización de la metodología CRISPR/Cas9 para su implementación en las licenciaturas en Ciencias ambientales, Ecología, Manejo de zonas costeras y Biología, Colaboración interinstitucional entre la ENES Mérida, Facultad de Ciencias y FES-Iztacala'),
(3, 'DGAPA-PAPIIT, Sensores Remotos Emergentes y su Aplicación para Mapeo y Evaluación de Arrecifes Coralinos'),
(4, 'Proyecto protocolos de sedación y eutanasia de organismos marinos PAPIME, participante,  Responsable Dra. Gabriela Gaxiola, Producción de nauplios de L. vamnnamei y F. brasiliensis  para el desarrollo de experimentos de de estudiantes de licenciatura, maestría y doctorado'),
(5, 'Antologías digitales como apoyo a la enseñanza teórico-práctica de la asignatura de ecología de poblaciones y comunidades de la licenciatura en manejo sustentable de zonas costeras'),
(6, 'Repositorio digital de la Colección ictiológica regional de la UMDI Sisal como una herramienta de apoyo a la enseñanza en la Licenciatura en Ecología, Colaboración entre la Facultad de Ciencias y la ENES Mérida, PAPIME PE206623'),
(7, 'Estudios sobre la utilización de proteínas derivadas de insectos como fuente alternativa de alimentación de crustáceos, La utilización de microalgas como sustituto como fuente nutricional en la industria acuícola, Estudios de Digestibilidad en organismos marinos'),
(8, 'Repositorio digital de la colección ictiológica regional de la UMDI Sisal como una herramienta de apoyo a la enseñanza en la licenciatura en ecología en colaboración entre la facultad de ciencias y la enes Mérida, Antologías digitales como una propuesta didáctica para el apoyo a la enseñanza-aprendizaje de la asignatura de Ecología de Poblaciones y Comunidades de la Licenciatura en Manejo Sustentable de Zonas Costeras, Elaboración de un simulador educativo para la enseñanza de Calidad de agua en sistemas acuáticos para carreras del área ciencias biológicas'),
(9, 'Desarrollo de un cultivo Multitrófico integrado a partir de un sistema biofloc en la costa del Golfo de México, como un método de cultivo de bajo impacto ambiental, de alta eficiencia para el reciclaje de nutrientes y con reducción en el consumo de agua, a través de la evaluación de indicadores zootécnicos y microbiológicos, PODCAST EDUCATIVOS A TRAVES DE ESTUDIOS DE CASO PARA LA ENSEÑANZA DE LA ACUACULTURA EN LAS CARRERAS DE BIOLOGIA, CIENCIAS AMBIENTALES, MANEJO SUSTENTABLE DE LA ZONA COSTERA Y MEDICINA VETERINARIA Y ZOOTECNIA, Factibilidad del cultivo del camarón rojo del Caribe (SEPASY), Servicio: Pre-engorda y engorda de camarón (NUTEC)'),
(10, ''),
(11, 'PAPIIT/DGAPA/UNAM: Proyecto: IN217123 Análisis diferenciado del impacto humano sobre los mamíferos terrestres medianos y grandes de la península de Yucatán: una mirada a través de escalas espaciales, Actividad: Investigador responsable. 2023-2025, CONAHCYT Ciencia de Frontera 2023: Proyecto: Impacto carretero sobre los vertebrados terrestres: nuevas tecnologías para el análisis espacial predictivo y estrategias de mitigación, Actividad: Investigador responsable. 2023-2025'),
(12, ''),
(13, 'Fisiología adaptativa de juveniles de Hippocampus erectus ante un ambiente cambiante: el efecto combinado de la alta temperatura y la hipoxia (Co-responsable), Red de monitoreo de caballitos de mar en aguas someras (ReMCAS) (co-responsable)'),
(14, 'Fisiología adaptativa de juveniles de Hippocampus erectus ante un ambiente cambiante: el efecto combinado de la alta temperatura y la hipoxia'),
(15, 'Gestión y manejo costero integral (material bibliográfico), Diagnóstico de la pesca recreativa-deportiva en el Golfo de México, Análisis de la vulnerabilidad de comunidades costeras ante los efectos del cambio climático, Conflictos en sistemas socioecológicos de las áreas costeras, Resiliencia de socioecosistemas costeros asociados al turismo ante covid 19 y cambio climático'),
(16, 'Importancia de la heterogeneidad ambiental como hábitat juvenil de peces, un enfoque hacia especies de importancia comercial en lagunas costeras del sureste de México, Restauración hidrológica de los humedales en los cordones litorales de la Península de Atasta, Campeche, Enhancement of coastal wetlands as foraging habitats for priority migratory bird’s species in Chicxhulub, Yucatan'),
(17, 'PAPIIT IT201621 Caracterizacion y evaluacion nutritiva de proteina soluble obtenida de subproductos de origen marino en dietas formuladas para el pulpo rojo Octopus maya'),
(18, 'Dinámica de los presupuestos de carbonato arrecifal, grado de perturbación y priorización sistemática en un sistema arrecifal remoto del Golfo de México, Persistencia y Vulnerabilidad de Servicios Ambientales en Ecosistemas Costeros, Elaboración de manual y videos tutoriales para el desarrollo de habilidades en la implementación de nuevas tecnologías espacialmente explícitas para la caracterización y monitoreo de ecosistemas costeros'),
(19, 'LANRESC, Bi-5 Diseño e implementación de un programa ambiental para la conservación y restauración de la vegetación costera nativa del socio-ecosistema Sisal. Responsable, Reciclando dunas. Fundación BEPENSA Yucatán A.C. Responsable Académico, Proyecto PPD-PNUM Conservación y Restauración de las dunas costeras de Yucatán con enfoque socio ambiental PPD Programa se pequeñas donaciones  del Programa de las Naciones Unidas para el Desarrollo. Inicio enero 2024'),
(20, ''),
(21, 'Relación del estado de salud del pez pargo mulato Lutjanus griseus con los niveles de microplásticos en humedales de Yucatán, Estudios histopatológicos en peces humedales de Yucatán, Cuantificación de microplásticos en ecosistemas costeros de la Península de Yucatán, Estandarización de prácticas bioéticas compatibles son estudios histopatológicos, Efecto del método de eutanasia con la calidad de la carne de peces comerciales'),
(22, 'Biotecnología del mero rojo Epinephelus morio, Producción de crías de lisa (Mugil sp) para su inclusión en cultivos multitróficos integrados'),
(23, 'Estado de salud y desempeño reproductivo de organismos de robalo blanco, Centropomus undecimalis, criados en cautiverio (F0) (propuesta PAPIIT IN217322), Indicadores de Bienestar Animal en el Cultivo de Especies Acuáticas, Hacia un Centro de Referencia en Bienestar Animal de Especies Acuáticas en Latinoamérica y el Caribe (Agencia Española de Cooperación Internacional para el Desarrollo)'),
(24, ''),
(25, 'resiliencia al calentamiento. CONACYT 61503. Responsable: Carlos Rosas Vázquez, Termo sensibilidad y capacidad adaptativa de Octopus maya: Alteraciones metabólicas y epigenéticas. DGAPA-PAPIIT IN203022 UNAM. Responsable: Carlos Rosas Vázquez, Hacia un centro de referencia en bienestar animal de especies acuáticas en Latinoamérica y el Caribe”. CEREBAL-INTERCONECTA, Agencia Española de Cooperación Internacional para el Desarrollo. Responsable: Guimar Rotllant Esterlric'),
(26, 'Evaluación del servicio ecosistémico de protección costera por parte de los arrecifes de coral en Punta Maroma, Quintana Roo. Financiado por Fundación Iberostar. Corresponsable. (2023-indefinido), Estudio hidrológico de Ixchil, Yucatán, para el Plan de Ordenamiento Ecológico Local Participativo de Ixil, Yucatán (OELP Ixil). Adjudicado a la UADY por la Secretaría de Medio Ambiente y Recursos Naturales. Corresponsable. (2023 - 2024), Monitoreo del acuífero a traves de un pozo profundo en la ENES-Mérida. Desde 2019, Proyecto Sostenibilidad del Caribe mexicano: cambiando debilidades en fortalezas de Grupos Interdisciplinarios de Investigación del Instituto de Ingeniería, UNAM (GII-IIUNAM) ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
CREATE TABLE IF NOT EXISTS `publicaciones` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personal` int UNSIGNED NOT NULL,
  `titulo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `doi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `id_personal`, `titulo`, `doi`) VALUES
(1, 1, ' Personal values in relation to environmental attitudes and behavior in handicraft enterprises in Oaxaca and Guanajuato, Mexico', 'http://dx.doi.org/10.22201/fca.24488410e.2025.4731 '),
(2, 1, 'Conflictos entre el uso pesquero y la conservación de la naturaleza para el bienestar humano.', ''),
(3, 1, 'Socioecosistemas tropicales de México Aprovechamiento, recuperación y conservación', ''),
(4, 2, 'PRODUCCIÓN RECIENTE', ' http://doi.org/10.7717/peerj.14587'),
(5, 2, 'Regional Studies in Marine Science', 'https://doi.org/10.1016/j.rsma.2023.102865'),
(6, 2, ' Marine Environmental Research ', 'https://doi.org/10.1016/j.marenvres.2023.105926'),
(7, 2, ' Biological conservation', 'https://doi.org/10.1016/j.biocon.2023.110042'),
(8, 2, ' Frontiers in Bioengineering and Biotechnology (Biosensors and Biomolecular Electronics)', ' 10.3389/fbioe.2023.1085976'),
(9, 2, ' Regional Studies in Marine Science', 'https://doi.org/10.1016/j.rsma.2023.103223'),
(10, 3, ' Alacranes reef: A refuge for structurally complex coral species from increasing stressors', ' https://doi.org/10.1016/j.ocecoaman.2023.106817'),
(11, 3, ' Linear breakwater reefs of the greater Caribbean: Classification, distribution & morphology', 'https://doi.org/10.1371/journal.pone.0270053'),
(12, 3, 'Coral Reef Benthos Classification Using Data from a Short-Range Multispectral Sensor', 'https://doi.org/10.3390/rs14225782'),
(13, 3, 'The effects of coral assemblage shift on reef functions in Akumal, Mexico', 'https://doi.org/10.3354/meps14099'),
(14, 3, 'The role of coral diseases in the flattening of a Caribbean Coral Reef over 23 years', 'https://doi.org/10.1016/j.marpolbul.2022.113855'),
(15, 4, 'Effects of using the biofloc system and eyestalk ablation on reproductive performance and egg quality of Litopenaeus vannamei', ''),
(16, 4, 'Effect of water salinity on the oxidative system of juveniles of the North Atlantic white shrimp Litopenaeus setiferus reared in biofloc technology', ''),
(17, 4, 'Partial substitution of frozen-fresh food by an experimental diet in Litopenaeus vannamei   broodstock', ''),
(18, 4, 'Sperm quality of Litopenaeus vannamei fed fresh or experimental food in two culture systems', ''),
(19, 5, ' Feeding ecology of the waterbirds in a tropical mangrove in the southeast Gulf of Mexico. Studies on Neotropical Fauna and Environment', ''),
(20, 5, 'Invariant morphological descriptors from otolith shape in environment automatic classification', ''),
(21, 5, 'Metazoan parasites of the ocellated killifish, Floridichthys polyommus (Cyprinodontidae) in La Carbonera coastal lagoon,Yucatán, México', ''),
(22, 5, ' Familias de condrictios de México', ''),
(23, 6, 'Catálogo de reptiles de la península de Yucatán', ''),
(24, 6, ' Invariant morphological descriptors from otolith shape in environment automatic classification Journal of applied', ''),
(25, 6, ' Peces de los cenotes de Yucatán. En: Los ojos de Yucatán. Una ventana al mundo subterráneo', ''),
(26, 6, ' Familias de condrictios de México', ''),
(27, 6, 'Una historia trágica de contaminación por plásticos', ''),
(28, 7, '', ''),
(29, 8, 'Effect of water salinity on the oxidative system of juveniles of the North Atlantic white shrimp Litopenaeus setiferus reared in biofloc technology. Journal of the World Aquaculture Society', ' https://doi.org/10.1111/jwas.12845'),
(30, 9, ' Aquaculture Research 2018', ' https://doi.org/10.1111/are.13632'),
(31, 9, 'Journal of the World Aquaculture Society', ' https://doi.org/10.1111/jwas.12513'),
(32, 9, 'Lat. Am. J. Aquat. Res. 2020', ' https://doi.org/10.3856/vol48-issue2-fulltext-2306'),
(33, 9, ' Lat. Am. J. Aquat. Res.. 2021', '10.3856/vol49-issue3-fulltext-2513 '),
(34, 9, 'Journal of the World Aquaculture Society', ' https://doi.org/10.1111/jwas.12845'),
(35, 10, 'Marine macrophyte strandings in the Yucatán peninsula: Citizen science as a potential tool for long-term monitoring', ''),
(36, 10, 'No todo es sargazo: Aprendizaje en un proyecto de ciencia ciudadana W13marino-costera', ''),
(37, 10, 'Conflictos entre el uso pesquero y la conservación de la naturaleza: implicaciones para el bienestar humano. En Gavito, Socioecosistemas tropicales de México. Aprovechamiento, recuperación y conservación.', ''),
(38, 10, ' ¿Qué podemos hacer para afrontar el cambio climático en la zona costera? ', ''),
(39, 11, 'The niche centrality hypothesis: key points about unfilled niches and the potential use of supraspecific modeling units', ' https://doi.org/10.17161/bi.v15i2.13218'),
(40, 11, ' Supraspecific units in correlative niche modeling improves the prediction of biological invasions', ' https://doi.org/10.7717/peerj.10454'),
(41, 11, ' Relationships between population densities and niche-centroid distances in North American birds', 'https://doi.org/10.7717/peerj.10454'),
(42, 11, 'An exhaustive evaluation of modeling ecological niches above species level to predict marine biological invasions', 'https://doi.org/10.1016/j.marenvres.2023.105926\r\n'),
(43, 11, 'The expected impacts of sea level on the Mexican Atlantic coast', ' https://doi.org/10.1016/j.scitotenv.2023.166317'),
(44, 12, 'Registro de pez león Pterois volitans/miles (Linnaeus, 1758) en la zona costera de Dzilam de Bravo, Yucatán, México', 'https://doi.org/10.15741/revbio.10.e1317'),
(45, 13, ' Marine amphipods as a new live prey for ornamental aquaculture: exploring the potential of Parhyale hawaiensis and Elasmopus pectenicrus', ' http://doi.org/10.7717/peerj.10840'),
(46, 13, 'Marine amphipods (Paryhale hawaiensis) as an alternative to feeding the lined seahorse   (Hippocampus erectus): feeding trial and nutritional value', '   https://doi.org/10.7717/peerj.12288'),
(47, 14, ' Thermoregulatory response in juvenile Hippocampus erectus: Effect of magnitude and rate of thermal increase on metabolism and antioxidative defence', 'https://doi.org/10.1002/ece3.10977 '),
(48, 14, 'Photosynthetic animals and where to find them: abundance and size of a solar‑powered sea slug in different light conditions', 'https://doi.org/10.1007/s00227-023-04301-5 '),
(49, 14, 'Transcriptomic response in thermally challenged seahorses Hippocampus erectus: The effect of magnitude and rate of temperature change', ' https://doi.org/10.1016/j.cbpb.2022.110771 '),
(50, 14, 'Marine amphipods (Parhyale hawaiensis) as an alternative feed for the lined seahorse (Hippocampus erectus, Perri 1810): nutritional value and feeding trial', ' https://doi.org/10.7717/peerj.12288'),
(51, 14, 'SSP: an R package to estimate sampling effort in studies of ecological communities', ' http//doi.org/10.1111/ecog.05284'),
(52, 14, 'Distribution patterns, carbon sources and niche partitioning in cave shrimps ', 'https://doi.org/10.1038/s41598-020-69562-2'),
(53, 15, ' La Década del Océano en México', 'doi 10.26359/EPOMEX01202310'),
(54, 15, 'Fiscal Economic Instruments for Sustainable Management of Natural Resources in coastal marine areas of the Yucatan Peninsula. Sustainability', '10.3390/su131911103'),
(55, 15, ' Adaptative governance and coping strategies in the Yucatan peninsula coasts facing COVID-19. Ocean and Coastal Management 212', '10.1016/j.ocecoaman.2021.105814'),
(56, 15, ' Capítulo “Construcción de los socio-ecosistemas costeros y retos para medir su resiliencia”. En libro: Resiliencia de Socioecosistemas costeros', '978-607-30-3152-3'),
(57, 15, 'Crafting Socio-Environmental Governance at the coast of Campeche, Mexico', '10.1016/j.ocecoaman.2021.105518'),
(58, 16, ' Temporal variability in fish assemblages at a neotropical estuarine system: climate against COVID-19 pandemic effects', 'https://doi.org/10.3390/d15080934'),
(59, 16, 'Spatial-temporal variations of discarded ichthyofauna from a small-scale shrimp fishery: Influence of ecological patterns in a Yucatan coastal lagoon', 'https://doi.org/10.2112/JCOASTRES-D-21-00077.1'),
(60, 16, ' Estuarine fish feeding changes as indicator to mangrove restoration success in seasonal karstic wetlands', '10.3389//ffgc.2021.743232'),
(61, 16, 'Energetic contribution of the Whale Shark preys (Rhincodon typus, Smith 1828), in the northern Mexican Caribbean', 'https://doi.org/10.1016/j.rsma.2021.101696'),
(62, 16, 'Temporal shifts in the abundance and feeding of a marine fish community in a coastal lagoon in southeastern Mexico', 'https://doi.org/10.7773/cm.v47i1.3103'),
(63, 17, 'Sea Surface Temperature Modulates Physiological and Immunological Condition of Octopus maya', '10.3389/fphys.2019.00739'),
(64, 17, 'Effect of triploidy on digestive enzymes activity of early stages of turbot (Scophthalmus maximus)', 'https://DOI:10.1007/s10695-019-00610-z'),
(65, 17, 'Effect of different proportions of crab and squid in semi-moist diets for Octopus maya juveniles', ' https://doi.org/10.1016/j.aquaculture.2020.735233'),
(66, 17, 'Changes in Biochemical Composition and Energy Reserves Associated With Sexual Maturation of Octopus maya', '10.3389/fphys.2020.00022'),
(67, 17, 'Effect of the processing of four marine species on their in vitro digestibility of Octopus vulgaris adults', ' https://doi.org/10.1007/s10499-020-00524-\r\n'),
(68, 17, 'Pelleted diet with thermal treatment of ingredients for Octopus vulgaris type II ongrowing: growth performance and enzymatic activity', '10.1111/are.14968'),
(69, 17, 'Changes in digestive enzymes and nutritional ontogeny reserves in newly hatched Pacific pygmy octopus, Paroctopus digueti', ' https://doi.org/10.1016/j.aquaculture.2023.739873'),
(70, 18, 'Prediction of mangrove recovery in natural protected areas of the Yucatan Peninsula. Regional Environmental Change', 'https://doi.org/10.1007/s10113-024-02203-w'),
(71, 18, 'Natural protected areas effect on the cover change rate of mangrove forests in the Yucatan Peninsula, Mexico', 'https://doi.org/10.1007/s13157-023-01697-0'),
(72, 18, 'Seasonal changes in beach resilience along an urbanized barrier island. Frontiers in Marine Science', 'https://doi.org/10.3389/fmars.2022.889820'),
(73, 18, 'Effectiveness of management of the Mesoamerican Biological Corridor in Mexico', 'https://doi.org/10.1016/j.landurbplan.2022.104504'),
(74, 18, 'Range shifts in the worldwide expansion of Oenothera drummondii subsp. drummondii, a plant species of coastal dunes', 'https://doi.org/10.3390/d13110603'),
(75, 19, 'Arbuscular Mycorrhizal association in Conocarpus erectus L. in mangroves from Yucatan, Mexico', 'https://doi.org/10.17129/botsci.2363'),
(76, 19, 'Arbuscular Mycorrhizal Fungi diversity and distribution in tropical low flooding forest in Mexico', '195-204 DOI 10.1007/s11557-019-01550-x'),
(77, 19, 'Relationship between Arbuscular Mycorrhizal Association and Edaphic Variables in Mangroves of the Coast of Yucatán, Mexico', 'https://doi.org/10.1007/s13157-019-01196-1 '),
(78, 19, '-Mycorrhizal status of Coccothrinax crinita (Arecaceae), an endangered endemic species from western Cuba', '10.22201/ib.20078706e.2020.91.3048'),
(79, 19, 'Evaluation of environmental heterogeneity and its effect on arbuscular mycorrhizal interaction in coastal dunes', '10.33885/sf.2021.51.1371'),
(80, 19, 'High phylogenetic diversity in plants does not imply high mycorrhizal fungal phylogenetic diversity in wetland ecosystems', ''),
(81, 20, ' Alimento vivo para cultivo larvario de Lutjánidos, Cap.18 en Aspectos biológicos para la maricultura de Lutjánidos', 'doi.org/10.52501/cc.151.18.'),
(82, 20, 'Benchmarking of early ontogeny parameters as predictors of the first-feeding larvae vitality in spotted rose snapper Lutjanus guttatus', 'doi.org/10.1016/j.aqrep.2023.101619 '),
(83, 20, 'The effect of nitrogen limitation on carbohydrates and β-glucan accumulation in Nannochloropsis oculate', 'doi.org/10.1016/j.algal.2023.103125'),
(84, 20, 'A new efficient method for the mass production of juvenile spotted rose snapper Lutjanus guttatus', ''),
(85, 20, 'Immunostimulation and trained immunity in marine fish larvae', 'doi:10.1016/j.fsi.2018.05.044'),
(86, 21, '', ''),
(87, 22, ' North Atlantic white shrimp Litopenaeus setiferus (Decapoda: Penaeidea) as an aquaculture target species for farming: a review', 'https://doi.org/10.3856/vol48-issue2-fulltext-2306'),
(88, 22, 'The effect of biofloc and clear water at low and high salinity concentration on growth performance and antioxidant response of wild juveniles of Atlantic white shrimp Litopenaeus setiferus” Latin American Journal of Aquatic', 'https://doi.org/10.3856/vol49-issue3-fulltext-2513'),
(89, 22, ' Prototipo de un sistema para el monitoreo de parámetros del agua en cultivos acuícolas', ''),
(90, 23, ' Short and long-term effects of anesthesia in octopus maya (cephalopoda, octopodidae) juveniles', 'doi:10.3389/fphys.2020.00697 '),
(91, 23, 'Welfare Indicators in Tilapia: an epidemiological approach', 'doi: 10.3389/fvets.2022.882567 '),
(92, 23, 'Changes in biochemical composition and energy reserves associated with sexual maturation of Octopus maya', 'doi: 10.3389/fphys.2020.00022 '),
(93, 23, 'Chapter 7. Octopus maya, the Mayan octopus. In Octopus Biology and Ecology', ''),
(94, 23, 'Changes in digestive enzymes and nutritional ontogeny reserves in newly hatched Pacific pygmy octopus, Paroctopus digueti', 'doi.org/10.1016/j.aquaculture.2023.739873'),
(95, 23, ' Immune Response to Natural and Experimental Infection of Panulirus argus Virus 1 (PaV1) in Caribbean Spiny Lobster', ' doi.org/10.3390/ani12151951 '),
(96, 23, ' Sea surface temperature modulates physiological and immunological condition of octopus maya', 'doi: 10.3389/fphys.2019.00739'),
(97, 24, 'Discovery of adults linked to cloning oceanic starfish larvae (Oreaster, Asteroidea: Echinodermata)', 'DOI: 10.1086/703233'),
(98, 24, ' Coral and substratum monitoring Cayo Arcas', 'DOI: 10.5281/zenodo.3814452'),
(99, 24, 'Echinoderms from the Gulf of Mexico and Mexican Caribbean at the “Colección Regional de Equinodermos de la Península de Yucatán” at UMDI-Sisal, Facultad de Ciencias, UNAM, México', 'DOI: 10.5281/zenodo.3893272'),
(100, 24, ' Evaluation of the use of Autonomous Reef Monitoring Structures (ARMS) for describing the species diversity of two coral reefs in the Yucatan Peninsula, Mexico', 'DOI: 10.3390/d13110579'),
(101, 24, 'Integrative species delimitation in the common ophiuroid Ophiothrix angulata (Echinodermata: Ophiuroidea): insights from COI, ITS2, arm coloration, and geometric morphometrics', 'DOI: 10.7717/peerj.15655'),
(102, 25, '', 'https://doi.org/10.1016/j.ecolind.2018.09.036'),
(103, 25, '', 'DOI 10.7717/peerj.6618'),
(104, 25, '', 'https://doi.org/10.1016/j.jtherbio.2020.102753'),
(105, 25, '', 'https://doi.org/10.1111/are.15387'),
(106, 25, '', 'https://doi.org/10.1111/are.15553'),
(107, 25, '', 'https://doi.org/10.1016/j.jtherbio.2021.103078'),
(108, 25, '', 'https://doi.org/10.1371/journal.pone.0273554'),
(109, 25, '', 'https://doi.org/10.3389/fphys.2022.1089164'),
(110, 25, '', 'https://doi.org/10.1007/s00227-023-04183-7'),
(111, 25, '', 'https://doi.org/10.1016/j.jtherbio.2023.103495'),
(112, 25, '', 'https://doi.org/10.1007/s00128-023-03706-8'),
(113, 25, '', 'https://doi.org/10.1007/s00227-023-04200-9'),
(114, 26, 'Ocean Circulation in the Western Gulf of Mexico Using Self-Organizing Maps. Journal of Geophysical Research: Oceans', 'https://doi.org/10.1029/2018JC014377'),
(115, 26, 'Natural and anthropogenic effects on microplastic distribution in a hypersaline lagoon', 'https://doi.org/10.1016/j.scitotenv.2021.145803'),
(116, 26, 'Rapid assessment tool for oil spill planning and contingencies', 'https://doi.org/10.1016/j.marpolbul.2021.112196'),
(117, 26, 'Sargassum transport towards Mexican Caribbean shores: Numerical modeling for research and forecasting', ' https://doi.org/10.1016/J.JMARSYS.2023.103923');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lineas`
--
ALTER TABLE `lineas`
  ADD CONSTRAINT `lineas_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mrbs_entry`
--
ALTER TABLE `mrbs_entry`
  ADD CONSTRAINT `mrbs_entry_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `mrbs_entry_ibfk_2` FOREIGN KEY (`repeat_id`) REFERENCES `mrbs_repeat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mrbs_participants`
--
ALTER TABLE `mrbs_participants`
  ADD CONSTRAINT `mrbs_participants_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `mrbs_entry` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mrbs_repeat`
--
ALTER TABLE `mrbs_repeat`
  ADD CONSTRAINT `mrbs_repeat_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `mrbs_room` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `mrbs_room`
--
ALTER TABLE `mrbs_room`
  ADD CONSTRAINT `mrbs_room_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `mrbs_area` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
