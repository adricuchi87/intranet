<?php
/*
Plugin Name: WP Fecha de Hoy
Plugin URI: http://www.vicentedica.com/mostrar-fecha-hoy-wordpress
Description: Muestra la Fecha de Hoy solo con introducir el siguiente codigo en cualquier Entrada o Pagina: <strong>[hoy]</strong>
Version: 2.0
Author: Vicente DiCa
Author URI: http://www.vicentedica.com
*/

function fechadehoy_shortcode( $atts ) {
	extract(shortcode_atts(array(
	    'format' => '1',
	), $atts));
	switch ($format) {
		case 1 :
			$fechadehoy = '<script>
		    var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
            var diasSemana = new Array("Domingo","Lunes","Martes","Mi&eacute;rcoles","Jueves","Viernes","S&aacute;bado");
            var f=new Date();
            document.write(diasSemana[f.getDay()] + ", " + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
            </script>';
		break;
	}
	return $fechadehoy;
}
add_shortcode('hoy', 'fechadehoy_shortcode');
add_filter('widget_text', 'do_shortcode');
?>