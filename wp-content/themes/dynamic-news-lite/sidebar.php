        <section id="sidebar" class="secondary clearfix" role="complementary">
            
            <!--<div id="navi-wrap"> Prueba de menu vertical
		<nav id="mainnav" class="container clearfix" role="navigation">
			<?php 
				// Get Navigation out of Theme Options
				//wp_nav_menu(array('theme_location' => 'primary', 'container' => false, 'menu_id' => 'mainnav-menu', 'echo' => true, 'fallback_cb' => 'dynamicnews_default_menu', 'before' => '', 'after' => '', 'link_before' => '', 'link_after' => '', 'depth' => 0));
			?>
		</nav>
            </div>-->

		<?php
			// Check if Sidebar has widgets
			if( is_active_sidebar('sidebar') ) : 
			
				dynamic_sidebar('sidebar');
			
			// Show hint where to add widgets
			else : ?>

			<aside class="widget">
				<h3 class="widgettitle"><?php _e('Widget Area', 'dynamicnewslite'); ?></h3>
				<div class="textwidget">
					<p><?php _e('There are no active widgets to be displayed. Please go to Appearance -> Widgets to setup your sidebar.', 'dynamicnewslite'); ?></p>
				</div>
			</aside>
		
		<?php endif; ?>
	</section>