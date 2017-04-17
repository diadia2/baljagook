/* Tripline V2 Analytics Javascript  */
$( document ).ready(function() {
	
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	if (Tripline.ga_id && Tripline.ga_domain) {
		//environment-specific ids
    	ga('create', Tripline.ga_id, Tripline.ga_domain);
    	ga('require', 'displayfeatures');
    	//ga('require', 'ec'); no ecommerce yet
    } else {
    	//default, just in case
    	ga('create', 'UA-12519681-1', 'www.tripline.net');
    	ga('require', 'displayfeatures');
    }
    
    /* DOM ELEMENT LISTENERS */

    /* TEMPLATE
    $('#id .class').on('click', function() {
        ga('send', {
            'hitType': 'event',
            'eventCategory': '',
            'eventAction': '',
            'eventLabel': $(this).attr('data-linktarget'),
            'page': window.location.pathname
        });
    });
    */
    
    
    /*LISTENERS FOR ASYNC LOADED DOM ELEMENTS*/
    
    /* TEMPLATE
    $('body').on('customEvent', function(){
    
    	//listeners
    
    });
    */
    
    
});

$(window).load(function(){
	
	//Some listeners will need to be here
	
	//Send the pageview
	ga('send', 'pageview');
	
});

