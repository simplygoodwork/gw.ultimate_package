module.exports = (grunt) ->

    """
    Static vars
    """
    STATIC_PATH = "./public/static/"
    JS_PATH = "#{STATIC_PATH}js/"
    CSS_PATH = "#{STATIC_PATH}css/"

    grunt.initConfig

        pkg: '<json:package.json>'
        meta:
            banner: '/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> -' +
                '<%= grunt.template.today("yyyy-mm-dd") %>n' +
                '<%= pkg.homepage ? "* " + pkg.homepage + "n" : "" %>' +
                '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
                'Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */'

        concat:
            dist:
                src: [
                    "#{JS_PATH}lib/jquery/jquery.js"
                    "#{JS_PATH}lib/modernizr/modernizr.js"
                    "#{JS_PATH}EDJ.js"
                ]
                dest: "#{JS_PATH}dist/<%= pkg.name %>.js"

        min:
            dist:
                src: ["<banner:meta.banner>", "<config:concat.dist.dest>"]
                dest: "#{JS_PATH}dist/<%= pkg.name %>.min.js"

        coffee:
            compile:
                src: ["#{JS_PATH}EDJ.coffee"]
                dest: "#{JS_PATH}EDJ.js"
                options:
                    bare: true

        grunt.loadNpmTasks "grunt-contrib-coffee"
        grunt.registerTask "default", "coffee concat min"
