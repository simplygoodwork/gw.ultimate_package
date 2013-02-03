module.exports = (grunt) ->

    grunt.initConfig

        pkg: grunt.file.readJSON "package.json"

        paths:
            static: "./public/static/"

        concat:
            dist:
                src: [
                    "<%= paths.static %>js/lib/jquery/jquery.js"
                    "<%= paths.static %>js/lib/modernizr/modernizr.js"
                    "<%= paths.static %>js/EDJ.js"
                ]
                dest: "<%= paths.static %>js/dist/<%= pkg.name %>.js"

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
                    src: "<%= paths.static %>js/dist/<%= pkg.name %>.js"
                    dest: "<%= paths.static %>js/dist/<%= pkg.name %>.min.js"
                ]

        coffee:
            compile:
                files: [
                    src: "<%= paths.static %>js/EDJ.coffee"
                    dest: "<%= paths.static %>js/EDJ.js"
                ]
                options:
                    bare: true

        sass:
            compile:
                files: [
                    src: "<%= paths.static %>scss/screen.scss"
                    dest: "<%= paths.static %>css/screen.css"
                ]

        watch:
            compile:
                files: [
                    "<%= paths.static %>scss/*"
                    "<%= paths.static %>js/*.coffee"
                ]
                tasks: ["coffee", "sass", "concat", "uglify"]

        grunt.loadNpmTasks "grunt-contrib-sass"
        grunt.loadNpmTasks "grunt-contrib-coffee"
        grunt.loadNpmTasks "grunt-contrib-concat"
        grunt.loadNpmTasks "grunt-contrib-uglify"
        grunt.loadNpmTasks "grunt-contrib-watch"

        grunt.registerTask "default", ["coffee", "sass", "concat", "uglify"]
