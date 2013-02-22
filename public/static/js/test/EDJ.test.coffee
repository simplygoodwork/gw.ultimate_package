test("Set up test", =>
    equal(typeof EDJ, "function", "EDJ has not been instantiated")
    equal(typeof EDJ.settings, "object", "EDJ has no settings")
)

###
test("Logging", function() {

    equal(typeof(EDJ.log), "function", "Can't find the log method");

    EDJ.settings.debug = true;
    equal(EDJ.log("testing EDJ.log"), undefined);

    EDJ.settings.debug = false;
    equal(EDJ.log("testing EDJ.log"), false)
});

test("Navigation", function() {
    var $accessLinks = $("<ul id='nav_access'><li><a href='#qunit'>qunit</a></li></ul>");

    equal(EDJ.navigation.run(), false); 

    $("body").prepend($accessLinks);
    equal(EDJ.navigation.run(), true, "Navigation didn't run");
    EDJ.navigation.init();

    $accessLinks.find("a").trigger("focus");
    ok($accessLinks.find("a").hasClass("focus"), "Link never got the focus class");

    $accessLinks.find("a").trigger("click");
    ok($("#qunit:focus").length > 0, "Link's target didn't get focus after click");

    $accessLinks.remove();
});
###
