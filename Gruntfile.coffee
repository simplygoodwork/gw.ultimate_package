module.exports = (grunt) ->

    """
    Static vars
    """
    STATIC_PATH = "./public/static/"
    JS_PATH = "#{STATIC_PATH}js/"
    CSS_PATH = "#{STATIC_PATH}css/"

    grunt.initConfig

        pkg: grunt.file.readJSON "package.json"

        concat:
            dist:
                src: [
                    "#{JS_PATH}lib/jquery/jquery.js"
                    "#{JS_PATH}lib/modernizr/modernizr.js"
                    "#{JS_PATH}EDJ.js"
                ]
                dest: "#{JS_PATH}dist/<%= pkg.name %>.js"

        uglify:
            options:
                banner: "/*!\n" +
                    "<%= pkg.title %> - v<%= pkg.version %> - " +
                    "<%= grunt.template.today('yyyy-mm-dd') %>\n" +
                    "<%= pkg.homepage %>\n" +
                    "Copyright (c) <%= grunt.template.today('yyyy') %>" +
                    "<%= pkg.author.name %>\n" +
                    "Licensed <%= _.pluck(pkg.licenses, 'type').join(', ') %>\n" +
                    "*/\n"

                mangle: false
                compress: true
                preserveComments: false
            dist:
                files: [
                    src: "#{JS_PATH}dist/<%= pkg.name %>.js"
                    dest: "#{JS_PATH}dist/<%= pkg.name %>.min.js"
                ]

        coffee:
            compile:
                files: [
                    src: "#{JS_PATH}EDJ.coffee"
                    dest: "#{JS_PATH}EDJ.js"
                ]
                options:
                    bare: true

        grunt.loadNpmTasks "grunt-contrib-coffee"
        grunt.loadNpmTasks "grunt-contrib-concat"
        grunt.loadNpmTasks "grunt-contrib-uglify"

        grunt.registerTask "default", ["coffee", "concat", "uglify"]
