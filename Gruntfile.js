/* global module require */

var ngrok = require("ngrok");

module.exports = function (grunt) {
    "use strict";

    require("load-grunt-tasks")(grunt);
    var taskList = ["less:pages", "less:global", "autoprefixer", "jekyll:build", "uglify", "cssmin"],
        watchList = ["less:pages", "less:global", "autoprefixer", "jekyll:build", "connect:server", "watch"],
        banner = "/* DO NO EDIT THIS FILE.  This file is built from a source file.  Edit that file instead. */";

    grunt.initConfig({

        pkg: grunt.file.readJSON("package.json"),

        connect: {
            server: {
                options: {
                    port: 4100,
                    base: "build",
                    livereload: true
                }
            },
            serve: {
                options: {
                    port: 4100,
                    base: "build",
                    keepalive: true
                }
            }
        },

        jekyll: {
            build: {},
            prod: {
                options: {
                    config: "_config.gh-pages.yml"
                }
            }
        },

        less: {
            pages: {
                options: {
                    paths: ["assets/css"]
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
                    paths: ["assets/css"]
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
            src: "assets/css/**/*.min.css"
        },

        cssmin: {
            build: {
                files: [
                    {
                        expand: true,
                        cwd: "assets/css/",
                        src: "**/*.min.css",
                        dest: "assets/css/"
                    }
               ]
            }
        },

        uglify: {
            js: {
                options: {
                    compress: true
                },

                files: {
                    "assets/js/main.min.js": ["pages/**/*.js", "_includes/**/*.js"]
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
                files: ["assets/**/*", "_includes/**/*.html", "_layouts/**/*.html", "pages/**/*.html", "index.html"],
                tasks: ["jekyll:build"],
                options: {
                    livereload: true
                }
            }
        },
        pagespeed: {
            options: {
                nokey: true,
                locale: "en",
                threshold: 80
            },
            desktop: {
                options: {
                    strategy: "desktop"
                }
            },
            mobile: {
                options: {
                    strategy: "mobile"
                }
            }
        },
        git_deploy: {
            prod: {
                options: {
                    url: "https://github.com/BYUI-Web/responsive-prototype.git"
                },
                src: "build"
            }
        }
    });

    grunt.registerTask("default", taskList);
    grunt.registerTask("dev", watchList);
    grunt.registerTask("test", ["connect:server", "pagespeed-test"]);

    grunt.registerTask("pagespeed-test", "Run pagespeed with ngrok", function () {
        var done = this.async(),
            port = 4100,
            page = grunt.option("page") || "homepage";

        ngrok.connect(port, function (err, url) {
            if (err !== null) {
                grunt.fail.fatal(err);
                return done();
            }
            
            url = url + "/pages/" + page + "/" + page + ".html";
            console.log(url);
            grunt.config.set("pagespeed.options.url", url);
            grunt.task.run("pagespeed");
            done();
        });
    });
    grunt.registerTask("serve", ["jekyll:build", "connect:serve"]);
    grunt.registerTask("ghpages", ["jekyll:prod", "git_deploy"]);
};