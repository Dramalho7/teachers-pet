// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require tabs
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require Chart.bundle
//= require chartkick

//  turbolinks needs to quickfire loads in doc.on for entire app to keep js running smoothly.
$( document ).on('turbolinks:load',function(){
$('.new-class-btn').click(function(){
	$('#new-class').toggle()
})
$('.new-class-btn').click(function(){
	$(this).find('span').toggleClass('fa-minus-circle');
})
//course page add student button
$('.new-student-btn').click(function(){
	$('#new-student').toggle()
})
$('.new-student-btn').click(function(){
	$('#new-student').toggle()
})
$('.new-student-btn').click(function(){
	$(this).find('span').toggleClass('fa-minus-circle');
})
//course page add student button
$('.new-student-btn').click(function(){
	$('#new-student').toggle()
})
//for index scroll bar
$(window).scroll( function(){

  //get scroll position
  var topWindow = $(window).scrollTop();
  //multipl by 1.5 so the arrow will become transparent half-way up the page
  var topWindow = topWindow * 1.5;

  //get height of window
  var windowHeight = $(window).height();

  //set position as percentage of how far the user has scrolled
  var position = topWindow / windowHeight;
  //invert the percentage
  position = 1 - position;

  //define arrow opacity as based on how far up the page the user has scrolled
  //no scrolling = 1, half-way up the page = 0
  $('.arrow-wrap').css('opacity', position);

});






//Code stolen from css-tricks for smooth scrolling:
$(function() {
  $('a[href*=content]:not([href=index])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000);
        return false;
      }
    }
  });
});
})
