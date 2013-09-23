module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib'
  grunt.loadNpmTasks 'grunt-mocha-test'

  grunt.initConfig
    watch:
      coffee:
        files: [
          "www/coffee/**/*.coffee",
          "www/spec/coffee/**/*.coffee"],
        tasks: ["coffee"]

    coffee:
      compile:
        options:
          join: true
        files:
          'www/js/all.js': [
            "www/coffee/base/signal.coffee",
            "www/coffee/base/mediator_injector.coffee",
            "www/coffee/base/command_signal.coffee",
            "www/coffee/base/command_map.coffee",
            "www/coffee/base/view.coffee",
            "www/coffee/base/context_view.coffee",
            "www/coffee/base/*.coffee",
            "www/coffee/app/*.coffee",
            "www/coffee/app/**/*.coffee",
            "www/coffee/main.coffee"
          ]

    mochaTest:
      test:
        options:
          reporter: 'spec'
          require: 'chai'
        src: ['www/spec/coffee/**/*_spec.coffee']

  grunt.registerTask "run", ["coffee", "watch:coffee"]
  grunt.registerTask "default", ["run"]
