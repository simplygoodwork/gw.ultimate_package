$(->
    $("#nav_access a")
        .on("focus blur", -> $(this).toggleClass "focus")
        .on("click", -> $($(this).attr("href")).focus())
)