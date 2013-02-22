module.exports = (grunt) ->

    grunt.initConfig

        pkg: grunt.file.readJSON "package.json"

        paths:
            static: "./public/static/"

        concat:
            scripts:
                src: ["<%= paths.static %>js/**/**/*.js", "!<%= paths.static %>js/dist/*.js"]
                dest: "<%= paths.static %>js/dist/<%= pkg.name %>.js"
            styles:
               src: "<%= paths.static %>css/**/*.css"
               dest: "<%= paths.static %>css/dist/<%= pkg.name %>.css"

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
            scripts:
                files: [
                    src: "<%= paths.static %>js/dist/<%= pkg.name %>.js"
                    dest: "<%= paths.static %>js/dist/<%= pkg.name %>.min.js"
                ]

        coffee:
            glob_to_multiple:
                expand: true
                cwd: "<%= paths.static %>js/"
                src: ["**/*.coffee", "!EDJ.coffee", "!test/*.coffee"]
                dest: "<%= paths.static %>js/"
                ext: ".js"

            edj:
                files: [
                    src: "<%= paths.static %>js/EDJ.coffee"
                    dest: "<%= paths.static %>js/EDJ.js"
                ]
                options:
                    bare: true

            tests:
                expand: true
                cwd: "<%= paths.static %>js/test/"
                src: "*.coffee"
                dest: "<%= paths.static %>js/test/"
                ext: ".test.js"
                options:
                    bare: true

        sass:
            glob_to_multiple:
                expand: true
                cwd: "<%= paths.static %>scss/"
                src: ["**/*.scss", "!**/_*.scss"]
                dest: "<%= paths.static %>css/"
                ext: ".css"

        watch:
            compile:
                files: [
                    "<%= paths.static %>scss/**/*.scss"
                    "<%= paths.static %>js/**/*.js"
                ]
                tasks: ["sass", "concat"]

        qunit:
            dist: ["<%= paths.static %>js/test/*.html"]

        grunt.loadNpmTasks "grunt-contrib-sass"
        grunt.loadNpmTasks "grunt-contrib-coffee"
        grunt.loadNpmTasks "grunt-contrib-concat"
        grunt.loadNpmTasks "grunt-contrib-uglify"
        grunt.loadNpmTasks "grunt-contrib-watch"
        grunt.loadNpmTasks "grunt-contrib-qunit"

        grunt.registerTask "default", ["coffee", "sass", "concat", "uglify", "qunit"]
        grunt.registerTask "buildDev", ["coffee", "sass", "qunit"]
