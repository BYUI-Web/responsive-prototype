module.exports = function(grunt) {

  // load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  grunt.initConfig({

    less: {
      development: {
        options: {
          paths: ["assets/css"]
        },
        files: {
          "path/to/result.css": "path/to/source.less"
        }
      }
    },

    watch: {
      sass: {
        files: ['assets/sass/**/*.scss'],
        tasks: ['compass:dev']
      },
      /* watch and see if our javascript files change, or new packages are installed */
      js: {
        files: ['assets/js/main.js', 'components/**/*.js'],
        tasks: ['uglify']
      },
      /* watch our files for change, reload */
      livereload: {
        files: ['*.html', 'assets/css/*.css', 'assets/images/*', 'assets/js/{main.min.js, plugins.min.js}'],
        options: {
          livereload: true
        }
      },
    }

  });

  grunt.registerTask('default', 'watch');

}