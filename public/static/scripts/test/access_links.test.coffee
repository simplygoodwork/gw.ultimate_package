$(->
    module("access_links",
        setup: ->
            @$skipLink = $("#nav_access a[href='#content_wrapper']")
    )

    test("Access links get focus class", ->
        ok(!@$skipLink.hasClass("focus"), "link doesn't have focus class before")
        @$skipLink.trigger("focus")
        ok(@$skipLink.hasClass("focus"), "link got focus class when focused")
        @$skipLink.trigger("blur")
        ok(!@$skipLink.hasClass("focus"), "link lost focus class when blurred")
    )
)