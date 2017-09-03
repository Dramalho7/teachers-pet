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
//course page add student button
$('.new-student-btn').click(function(){
	$('#new-student').toggle()
})
})
