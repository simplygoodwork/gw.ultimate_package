class EDJ
    @settings:
        debug: false
        STATIC_URL: "/static/"

    constructor: (settings) ->
        ###
        Cache some stuff, set off some methods
        -----------------------------------------------------------------------
        ###
        # Extend the settings object with any vars passed in
        $.extend(@constructor.settings, settings)

        # Fire all functions that eval
        @constructor.go_go_go()

    @log = (args...) =>
        ###
        If we have a log, and we're in debug then use it
        -----------------------------------------------------------------------
        ###
        if @settings.debug and console?
            # Log each arg separately
            return console.log message for message in args

        return false

    @go_go_go = () =>
        ###
        Determines all methods to run, and runs them
        -----------------------------------------------------------------------
        ###
        for prop of this
            _run = this[prop].run
            # If the run property is a true (evald function or boolean)
            if (typeof _run is "boolean" and _run) or (typeof _run is "function" and _run())
                # Tell the log we're off
                @log("EDJ running #{prop}")
                # Run the init method
                this[prop].init()

    @navigation =
        ###
        Sets up keyboard controls for skipping to navigation
        -----------------------------------------------------------------------
        ###
        $accessLinks: {}

        run: =>
            @$accessLinks = $("#nav_access a")
            return @$accessLinks.length > 0

        init: =>
            # Add focus / blur class on those actions
            @$accessLinks.on("focus blur", ->
                $(this).toggleClass("focus")
            )
        
            # Give the anchor"s target focus on click
            @$accessLinks.on("click", ->
                $($(this).attr("href")).focus()
            )
