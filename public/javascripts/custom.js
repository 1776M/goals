// JavaScript Document
Cufon.replace('h1,h2,h3,h4,#demo a,#header_top p,.big_action a',{hover: true,textShadow: '0px 1px #000'});
Cufon.replace('#main_tagline h1,.box_inner a,ul.tabs li a,ul.tabs li.active a',{hover: true});
$(document).ready(function(){
$(document).pngFix();
//Slideshow	for header gallery
$('.slideshow').cycle({
       	speed: 1000,
	    fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
     	timeout: 4000,  // milliseconds between slide transitions (0 to disable auto advance)
		next:   '#next',  // selector for element to use as click trigger for next slide
		prev:  '#prev',  // selector for element to use as click trigger for previous slide
		pause:   1,	  // true to enable "pause on hover"
		cleartypeNoBg:   true// set to true to disable extra cleartype fixing (leave false to force background color setting on slides)
});	
//Fancybox for image gallery
$("a.simple_image").fancybox({
		'opacity'		: true,
		'overlayShow'	       : true,
		'overlayColor': '#000000',
		'overlayOpacity'     : 0.9,
		'titleShow':true,
		'transitionIn'	: 'elastic',
		'transitionOut'	: 'elastic'
});
//Fancybox for video
$(".video").click(function() {
		$.fancybox({
			'padding'		: 0,
			'autoScale'		: false,
			'overlayShow': true,
			'overlayColor': '#000000',
			'overlayOpacity': 0.9,
			'hideOnOverlayClick': true, 
			'transitionIn'		:'elastic',
			'speedIn'			:600,
			'title'			: this.title,
			'width'			: 600,
			'height'		: 400,
			'href'			: this.href.replace(new RegExp("watch\\?v=", "i"), 'v/'),
			'type'			: 'swf',
			'swf'			: {
			'wmode'				: 'transparent',
			'allowfullscreen'	: 'true'
			}
		});
		return false;
});
//On Hover animation Event for social, subscribe button
	$('.social li a img,.btn_subscribe').hover(function(){
			$(this).animate({opacity: 0.8}, 300);
		}, function () {
			$(this).animate({opacity: 1}, 300);
		});
//Tabs
//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
});
//Tab Gallery - On Hover Event 
	$('#tab_gallery li a').mouseenter(function(e) {
            $(this).children('img').animate(300);
            $(this).children('span').fadeIn(400);
        }).mouseleave(function(e) {
            $(this).children('img').animate(300);
            $(this).children('span').fadeOut(400);
});
}); // close document.ready


















