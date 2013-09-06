module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib'

  grunt.initConfig
    watch:
      coffee:
        files: "www/coffee/**/*.coffee",
        tasks: ["coffee"]

    coffee:
      compile:
        options:
          join: true
        files:
          'www/js/all.js': [
            "www/coffee/base/*.coffee",
            "www/coffee/main.coffee"
          ]

  grunt.registerTask "run", ["coffee", "watch:coffee"]
  grunt.registerTask "default", ["run"]
