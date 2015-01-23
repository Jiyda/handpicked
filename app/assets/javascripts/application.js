// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require jquery.inview
//= require home/login


$(function() {
  var loading_posts;
  loading_posts = false;
  return $('a.load-more-posts').on('inview', function(e, visible) {
    if (loading_posts || !visible) {
      return;
    }
    loading_posts = true;
    return $.getScript($(this).attr('href'), function() {
      return loading_posts = false;
    });
  });
});
