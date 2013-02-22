test("Set up test", ->
    equal(typeof EDJ, "function", "EDJ instantiated")
    equal(typeof EDJ.settings, "object", "EDJ has settings")

    return
)

test("Logging", ->
    equal(typeof EDJ.log, "function", "Found the log method")

    EDJ.settings.debug = true
    console.log typeof(EDJ.log("hello"))
    equal(EDJ.log("testing EDJ.log"), undefined, "Debug is on, logged a string")

    EDJ.settings.debug = false
    equal(EDJ.log("testing EDJ.log"), false, "Debug is off, returned false")

    return
)

test("Navigation", ->
    $accessLinks = $("<ul id='nav_access'><li><a href='#qunit'>qunit</a></li></ul>")

    equal(EDJ.navigation.run(), false, "Navigation not found, didn't run")

    $("body").prepend $accessLinks
    equal(EDJ.navigation.run(), true, "Navigation found, so run")

    EDJ.navigation.init()

    $accessLinks.find("a").trigger "focus"
    ok($accessLinks.find("a").hasClass "focus", "Link got the focus class")

    $accessLinks.find("a").trigger("click")
    ok($("#qunit:focus").length > 0, "Link's target got focus after click")

    $accessLinks.remove()

    return
)
