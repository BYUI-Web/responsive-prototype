/* global module */
module.exports = function (grunt) {
    "use strict";

    require("load-grunt-tasks")(grunt);
    var taskList = ["less", "autoprefixer", "jekyll", "uglify"],
        watchList = taskList.concat([]),
        banner = "/* DO NO EDIT THIS FILE.  This file is built from a source file.  Edit that file instead. */\n";

    watchList.push("connect");
    watchList.push("watch");


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
                    compress: true
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
                  compress: true
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

        

        uglify: {
            js: {
                options: {
                    compress: true
                },

                files: {
                    "assets/js/main.min.js" : ["pages/**/*.js", "_includes/**/*.js"]
                }
            }
        },
        
        watch: {
            js: {
                files: ["pages/**/*.js", "_includes/**/*.js"],
                tasks: ["uglify"]
            },
            
            less: {
                files: ["_less/**/*.less", "pages/**/*.less", "_includes/**/*.less"],
                tasks: ["less", "autoprefixer"]
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
