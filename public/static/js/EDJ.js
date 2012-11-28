// Set up our global Erskine Design Javascript object
var $,
    console,
    EDJ = {
    settings: {
        debug: true,
        STATIC_URL: '/static/'
    },
    is_touch: false,
    run_list: [],
    $body: {}
};


EDJ.run_list = [
    'ios_rotate_fix',
    'navigation'
];


/**
 * On ready
 *
 * Called when document is ready
 *
 * Used on: all pages
 *
 * @param settings
 * ---------------------------------------------------------------------------------------------------
*/
EDJ.on_ready = function(settings) {
    var i = 0,
        functions_to_run = EDJ.run_list.length;

    // Extend the settings object with any vars passed in
    $.extend(EDJ.settings, settings);

    // Cache the body object for use later
    EDJ.$body = $('body');
    
    // Loop through our functions and run those that exist and said they should
    for (i=0; i<functions_to_run; i++) {
        // If the init function exists, and the run key is set to true
        if (
            (typeof EDJ[EDJ.run_list[i]].run === 'function' && EDJ[EDJ.run_list[i]].run() === true) ||
            (typeof EDJ[EDJ.run_list[i]].run === 'boolean' && EDJ[EDJ.run_list[i]].run === true)
        ) {
            // Log that we've called the init function
            EDJ.log('initialising EDJ.'+EDJ.run_list[i]);

            // Call the init function!
            EDJ[EDJ.run_list[i]].init();

            // Log that we've finished the init function
            EDJ.log('finished running EDJ.'+EDJ.run_list[i]);

        }

    }

};


/**
 * Log
 *
 * Will log any arguments (arrays, objects, strings etc.) to the console
 * if it exists, and EDJ.settings.debug is set to true
 *
 * Used on: all pages
 *
 * ---------------------------------------------------------------------------------------------------
*/
EDJ.log = function() {
    if (EDJ.settings.debug === true && typeof(console) !== 'undefined') {
        console.log('[EDJ] ' + Array.prototype.join.call(arguments, ' '));
    }
};


/**
 * iOS rotate fix
 *
 * Alter viewport meta when device rotates (http://adactio.com/journal/4470/)
 *
 * Used on: all pages
 *
 * ---------------------------------------------------------------------------------------------------
*/
EDJ.ios_rotate_fix = {
    run: false,

    init: function() {
        if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
            var viewportmeta = document.querySelectorAll('meta[name="viewport"]')[0];
            if (viewportmeta) {
                viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0';
                document.body.addEventListener('gesturestart', function() {
                    viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=1.6';
                }, false);
            }
        }

    }

};


/**
 * Navigation
 *
 * Various helpers for naviation
 *
 * Used on: all pages
 *
 * ---------------------------------------------------------------------------------------------------
*/
EDJ.navigation = {
    run: true,

    init: function() {
        var $access_links = EDJ.$body.find('ul#nav_access li a');

        $access_links.on('focus blur', function(){ 
            $(this).toggleClass('focus');
        });

        $access_links.on('click', function(){
            $($(this).attr('href')).focus();
        });

    }

};

