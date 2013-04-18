$(->
    $("#nav_access a").on("focus blur", -> $(this).toggleClass "focus")
)