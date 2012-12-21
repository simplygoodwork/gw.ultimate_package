Using the EDJ
==========================================

The Erskine Design Javascript (EDJ) object is used to speed up JS and cut out 
unessesary function calls. You can add functions to call on page load herein
and the EDJ will decide if they should be run, as well as caching jQuery
selected items for further use later.

To create a function to run on load, you need to first determine if it's
valid with the `run` method / boolean. You then put your code in the `init`
method which will only execute if `run` validates as true. A good example is
this imaginary slideshow:

    @slideshow =
    ###
    Makes a slideshow from several list items
    ###
    $slides: {}

    run: =>
       @$slides = $(".slides li")
        return @$slides.length > 0

    init: =>
        $slides.slideshowPlugin {parameter: 'param'}

In `run` we've cached `this.$slides` and then returned `true` only if there
are 1 or more list items within the `.slides` class. In `init` we then
execute our slideshow stuff.

While there is some overhead in `run`, that is offset by never needing to
execute `init` and that benchmarks at roughly 300% performance increase in
testing.
