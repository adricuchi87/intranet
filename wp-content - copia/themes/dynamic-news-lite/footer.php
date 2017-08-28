<div class="pie_titulo">
    <h3><span>MPPT Y ENTES ADSCRITOS</span></h3>
</div>
<?php  echo do_shortcode('[wpaft_logo_slider category="entes_adscritos"]'); ?>	
<div id="footer-wrap">
	
		<footer id="footer" class="container clearfix" role="contentinfo">
			<nav id="footernav" class="clearfix" role="navigation">
				<?php 
					// Get Navigation out of Theme Options
					wp_nav_menu(array('theme_location' => 'footer', 'container' => false, 'menu_id' => 'footernav-menu', 'echo' => true, 'fallback_cb' => '', 'before' => '', 'after' => '', 'link_before' => '', 'link_after' => '', 'depth' => 1));
				?>
			</nav>
                        
                    <div id="credit-link"><?php //dynamicnews_credit_link(); ?>
                        <!--Se agrega navegadores recomendados-->
                        <p>Desarrollado por la Gerencia de Tecnología de la Información y</p><br>
                        <p>Diseñado por la Gerencia de Relaciones Institucionales de Fontur</p><br>
                        <p>Se recomienda el uso de los navegadores    <a href="https://www.mozilla.org/es-ES/firefox/new/" target="_blank"><img src="wp-content/uploads/navegadores/mozilla.png" title="Mozilla Firefox" width="25px" height="25px"></a><a href="https://www.google.com.ve/chrome/browser/desktop/" target="_blank"><img src="wp-content/uploads/navegadores/chrome.png" title="Google Chrome" width="25px" height="25px"></a></p>
                        <!--Fin Se agrega navegadores recomendados-->
                    </div>
		</footer>
	</div>

</div><!-- end #wrapper -->

<?php wp_footer(); ?>
</body>
</html>