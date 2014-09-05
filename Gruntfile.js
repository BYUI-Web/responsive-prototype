/* global module */
module.exports = function (grunt) {
    "use strict";

    require("load-grunt-tasks")(grunt);
    var taskList = ["less:pages", "less:global", "autoprefixer", "jekyll"],
        watchList = taskList.concat([]),
        banner = "/* DO NO EDIT THIS FILE.  This file is built from a source file.  Edit that file instead. */\n";

    watchList.push("connect");
    watchList.push("watch:less");
    watchList.push("watch:jekyll");


    grunt.initConfig({

        pkg: grunt.file.readJSON("package.json"),


        connect: {
            server: {
                options: {
                    port: 4100,
                    base: "build",
                    livereload: true
                }
            }
        },

        jekyll: {
            build: {}
        },

        less: {
            pages: {
                options: {
                    paths: ["assets/css"],
                    compress: true,
                    banner: banner,
                    report: "min"
                },
                files: [
                    {
                        expand: true,
                        flatten: true,
                        src: ["pages/**/*.less"],
                        dest: "assets/css",
                        ext: ".min.css"
                    }
                ]
            },
            global: {
                options: {
                    paths: ["assets/css"],
                    compress: true,
                    banner: banner
                },
                files: {
                    "assets/css/global.min.css": ["_less/global.less", "_includes/**/*.less"]
                }
            }
        },

        autoprefixer: {
            options: {
                browsers: ["last 2 versions", "ie 8", "ie 9"]
            },
            src: "assets/css/**/*.css"
        },

        watch: {
            less: {
                files: ["_less/**/*.less", "pages/**/*.less", "_includes/**/*.less"],
                tasks: ["less", "autoprefixer", "cssmin"]
            },

            jekyll: {
                files: ["assets/**/*", "**/*.html"],
                tasks: ["jekyll"],
                options: {
                    livereload: true
                }
            }

        }
    });

    grunt.registerTask("default", taskList);
    grunt.registerTask("dev", watchList);
};