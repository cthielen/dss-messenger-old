$(function () {
	
	// Preload images
	$.preloadCssImages();
	
	
	
	// CSS tweaks
	$('#header #nav li:last').addClass('nobg');
	$('.block_head ul').each(function() { $('li:first', this).addClass('nobg'); });
	$('.block form input[type=file]').addClass('file');
			
			
	
	
	// Sort table
	$("table.sortable").tablesorter({
		headers: { 0: { sorter: false}, 5: {sorter: false} },		// Disabled on the 1st and 6th columns
		widgets: ['zebra']
	});
	
	$('.block table tr th.header').css('cursor', 'pointer');
		
	
	
	// Check / uncheck all checkboxes
	$('.check_all').click(function() {
		$(this).parents('form').find('input:checkbox').attr('checked', $(this).is(':checked'));   
	});
		
	
	
	// Set WYSIWYG editor
	$('.wysiwyg').wysiwyg({css: base_uri + "/assets/wysiwyg/wysiwyg.css"});
	
	
	
	// Modal boxes - to all links with rel="facebox"
	$('a[rel*=facebox]').facebox()
	
	
	
	// Messages
	$('.block .message').hide().append('<span class="close" title="Dismiss"></span>').fadeIn('slow');
	$('.block .message .close').hover(
		function() { $(this).addClass('hover'); },
		function() { $(this).removeClass('hover'); }
	);
		
	$('.block .message .close').click(function() {
		$(this).parent().fadeOut('slow', function() { $(this).remove(); });
	});
	
	
	
	// Form select styling
	$("form select.styled").select_skin();
	
	
	
	// Tabs
	$(".tab_content").hide();
	$("ul.tabs li:first-child").addClass("active").show();
	$(".block").find(".tab_content:first").show();

	$("ul.tabs li").click(function() {
		$(this).parent().find('li').removeClass("active");
		$(this).addClass("active");
		$(this).parents('.block').find(".tab_content").hide();
			
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).show();
		
		// refresh visualize for IE
		$(activeTab).find('.visualize').trigger('visualizeRefresh');
		
		return false;
	});
	
	
	// Block search
	$('.block .block_head form .text').bind('click', function() { $(this).attr('value', ''); });
	
	
	
	// Image actions menu
	$('ul.imglist li').hover(
		function() { $(this).find('ul').css('display', 'none').fadeIn('fast').css('display', 'block'); },
		function() { $(this).find('ul').fadeOut(100); }
	);
	
	
		
	// Image delete confirmation
	$('ul.imglist .delete a').click(function() {
		if (confirm("Are you sure you want to delete this image?")) {
			return true;
		} else {
			return false;
		}
	});
	
	
	
	// Style file input
	$("input[type=file]").filestyle({ 
	    image: "upload.gif",
	    imageheight : 30,
	    imagewidth : 80,
	    width : 250
	});
	
	
	
	// Date picker
	var default_date = new Date($("input.date_picker").val())
	$('input.date_picker').datepicker();
	$('input.date_picker').datepicker( "option", "dateFormat", "d M yy" );
	$('input.date_picker').datepicker( "setDate", default_date );


	// Navigation dropdown fix for IE6
	if(jQuery.browser.version.substr(0,1) < 7) {
		$('#header #nav li').hover(
			function() { $(this).addClass('iehover'); },
			function() { $(this).removeClass('iehover'); }
		);
	}
	
	
	// IE6 PNG fix
	$(document).pngFix();
		
});