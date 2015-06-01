var gulp = require('gulp'),
    less = require('gulp-less'),
    path = require('path');
    minifyCSS = require('gulp-minify-css');

var themeDir = './themes/hexo-clean-blog/';

gulp.task('css', function() {
  return gulp.src(themeDir + 'source/less/style.less')
    .pipe(less({
      loadPath: [
        themeDir + 'source/less'
      ]})
    )
    .pipe(minifyCSS())
    .pipe(gulp.dest(themeDir + 'source/css'));
});
