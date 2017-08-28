<?php
/** 
 * Configuración básica de WordPress.
 *
 * Este archivo contiene las siguientes configuraciones: ajustes de MySQL, prefijo de tablas,
 * claves secretas, idioma de WordPress y ABSPATH. Para obtener más información,
 * visita la página del Codex{@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} . Los ajustes de MySQL te los proporcionará tu proveedor de alojamiento web.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** Ajustes de MySQL. Solicita estos datos a tu proveedor de alojamiento web. ** //
/** El nombre de tu base de datos de WordPress */
define('DB_NAME', 'intranet');

/** Tu nombre de usuario de MySQL */
define('DB_USER', 'root');

/** Tu contraseña de MySQL */
define('DB_PASSWORD', '123456');

/** Host de MySQL (es muy probable que no necesites cambiarlo) */
define('DB_HOST', 'localhost');

/** Codificación de caracteres para la base de datos. */
define('DB_CHARSET', 'utf8');

/** Cotejamiento de la base de datos. No lo modifiques si tienes dudas. */
define('DB_COLLATE', '');

/**#@+
 * Claves únicas de autentificación.
 *
 * Define cada clave secreta con una frase aleatoria distinta.
 * Puedes generarlas usando el {@link https://api.wordpress.org/secret-key/1.1/salt/ servicio de claves secretas de WordPress}
 * Puedes cambiar las claves en cualquier momento para invalidar todas las cookies existentes. Esto forzará a todos los usuarios a volver a hacer login.
 *
 * @since 2.6.0
 */
define('AUTH_KEY', '[D)F:v7G}ck|K>Sv,+zFvHl~!mm7S#9q3U,WW&Uad>)^wJp[F}nKj2:o9a?15[,5'); // Cambia esto por tu frase aleatoria.
define('SECURE_AUTH_KEY', '[LgS+RoVNrET)+}<BXC~4p4Y+XuK!/)[k@9;7KScR<xk~tq0w+/+@Q7U825+t%g#'); // Cambia esto por tu frase aleatoria.
define('LOGGED_IN_KEY', 'B5R3RNWY9].5zBd|LQ|I/|6n)ZS7zxfnYy;ncmf`}NB{GcU8J?@IIze82^XV?XC]'); // Cambia esto por tu frase aleatoria.
define('NONCE_KEY', '=YX771k%?dAyc#:wPBS$z7*>%~Jk-2QLyPz7AZM&nW~^Rn/Ad/TdfL|+C1QlueoM'); // Cambia esto por tu frase aleatoria.
define('AUTH_SALT', 'n{rpy?d]?*Bti[KLpPU Ft-gGn5A[ 6;R* U`$F1-E|q`,U+d>p-ZBp&3GWi1 xw'); // Cambia esto por tu frase aleatoria.
define('SECURE_AUTH_SALT', '9[2N|XpEEM:@z|6$2dEdO<WfRFn]tEV@MqlerXsw*0uj^.|9M(u:>lFi^0i{|vKa'); // Cambia esto por tu frase aleatoria.
define('LOGGED_IN_SALT', 'n.|KR7)y2T{nsEJoRl!@1X5[xzkGH^ME1vT:$Y$64#? }mx$I(&9+qLS9^=SdzHX'); // Cambia esto por tu frase aleatoria.
define('NONCE_SALT', 'hC}4hP`(-l>v9j.j1U9c?r{+4F{U,U8,!d!@~XR|x}y(i`fT:L+fIS*#g{y:/Z Z'); // Cambia esto por tu frase aleatoria.

/**#@-*/

/**
 * Prefijo de la base de datos de WordPress.
 *
 * Cambia el prefijo si deseas instalar multiples blogs en una sola base de datos.
 * Emplea solo números, letras y guión bajo.
 */
$table_prefix  = 'wp_';


/**
 * Para desarrolladores: modo debug de WordPress.
 *
 * Cambia esto a true para activar la muestra de avisos durante el desarrollo.
 * Se recomienda encarecidamente a los desarrolladores de temas y plugins que usen WP_DEBUG
 * en sus entornos de desarrollo.
 */
define('WP_DEBUG', false);

/* ¡Eso es todo, deja de editar! Feliz blogging */

/** WordPress absolute path to the Wordpress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

/**Verificar errores en el servidor creando un log***/
/**ini_set('log_errors',TRUE);
ini_set('error_reporting', E_ALL);
ini_set('error_log', dirname(__FILE__) . '/error_logWP.txt');*/
#This will create an error_logWP.txt file in your site's root directory. Let's see what it includes.