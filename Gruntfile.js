module.exports = function(grunt) {

  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    less: {
      development: {
        options: {
          paths: ["assets/css"]
        },
        files: {
          "assets/css/global.css": "_less/global.less"
        }
      }
    },

    connect: {
      server: {
        options: {
          port: 4000,
          base: '../',
          livereload: true
        }
      }
    },

    jekyll: {
      build: {}
    },

    watch: {
      less: {
        files: ["_less/**/*.less"],
        tasks: ['less'],
      },

      jekyll: {
        files: ['assets/**/*', '**/*.html'],
        tasks: ['jekyll'],
        options: { livereload: true }
      }

    },
  });

  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-jekyll');

  grunt.registerTask('default', ['less', 'jekyll', 'connect', 'watch']);

};