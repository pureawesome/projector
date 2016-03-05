var gulp     = require('gulp'),
del          = require('del'),
changed      = require('gulp-changed'),
imagemin     = require('gulp-imagemin'),
sass       = require('gulp-sass'),
sourcemaps   = require('gulp-sourcemaps'),
autoprefixer = require('gulp-autoprefixer'),
concat       = require('gulp-concat'),
uglify       = require('gulp-uglify');


gulp.task('clean', function (cb) {
  del(["./public/assets"], cb);
});

gulp.task('images', ['clean'], function() {
  var srcPath  = "./app/assets/images/**",
      destPath = "./public/assets/images";

  return gulp.src(srcPath)
    .pipe(changed(destPath)) // Ignore unchanged files
    .pipe(imagemin()) // Optimize images
    .pipe(gulp.dest(destPath)); // Write images to public dir
});

gulp.task('sass', ['clean'], function () {
  var srcPath  = "./app/assets/stylesheets/**/*.scss",
      destPath = "./public/assets";

  gulp.src(srcPath, { base: 'app/assets' })
    .pipe(sourcemaps.init({loadMaps: true})) // Tell gulp we want sourcemaps too
    .pipe(sass().on('error', sass.logError))
    .pipe(concat('application.css'))
    .pipe(sourcemaps.write())
    .pipe(autoprefixer({ browsers: ['last 2 version'] })) // Use browser specific prefixes
    .pipe(gulp.dest(destPath));
});

gulp.task('js', ['clean'], function () {
  var srcPath  = "./app/assets/javascripts/**/*.js",
      destPath = "./public/assets";

  return gulp.src(srcPath)
    .pipe(sourcemaps.init())
    .pipe(uglify())
    .pipe(concat('application.js')) // Merge into 1 file
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(destPath));
});

gulp.task('watch', function() {
  gulp.watch("./app/assets/stylesheets/**/*", ['sass']);
  gulp.watch("./app/assets/javascripts/**/*", ['js']);
  gulp.watch("./app/assets/images/*", ['images']);
});

gulp.task('default', ['watch', 'images', 'sass', 'js']);
