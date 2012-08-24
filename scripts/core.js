/**
 *  
 * 
 * Description
 * 
 * @author		Siopoudis Athanasios
 * @link		http://www.appcake.co.uk
 * @email		info@appcake.co.uk
 * 
 * @file		core.js
 * @version		1.0
 * @date		01/26/2012
 * 
 * Copyright (c) 2012 AppCake Ltd.
 */
(function() {
	
	// Initialise the Core JS Object
	$(function() {
		MacAssistant.Core.init();
	});
	
	MacAssistant.Core = {
	
		/**
		 * 	Function: init
		 * 
		 *  This function initialises all core functions and listeners
		 *  as well as base element variables for later use
		 *	on the webpage
		 */
		init: function() {
			var base = this;
			base.$body = $('body');
			
			// Attach the Main Listeners
			base.attachMainListeners();
		},
		
		/**
		 * Function attachMainListeners	
		 * 
		 * Attaches all generic listeners to elements
		 */
		attachMainListeners: function() {
			var base = this;
			
		}
	}
})(jQuery);