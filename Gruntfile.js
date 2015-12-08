module.exports = function(grunt) {
    grunt.initConfig({
        less: {
            production: {
                options: {
                    plugins: [
                        new (require('less-plugin-autoprefix'))({
                            browsers: ["last 2 versions"]
                        }),
                        new (require('less-plugin-clean-css'))({
                            keepSpecialComments: 0
                        })
                    ],
                },
                files: {
                    "css/iabootstrap-default.css": "less/iabootstrap-default.less",
                    "css/iabootstrap-dark.css": "less/iabootstrap-dark.less",
                }
            }
        },
        imagemin: {
            options: {
                optimizationLevel: 6,
            },
            dynamic: {
                files: [{
                    expand: true,
                    cwd: 'img/',
                    src: ['**/*.{png,jpg}'],
                    dest: 'img/'
                }]
            }
        },
        watch: {
            less: {
                files: "**/*.less",
                tasks: ["less"],
                options: {
                    spawn: false
                },
            },
            images: {
                files: "img/*",
                tasks: ["imagemin"],
                options: {
                    spawn: false
                },
            }
            
        }
    });

    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-imagemin');
};
