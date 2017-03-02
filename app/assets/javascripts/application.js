// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require cocoon

$(document).ready(function(){
    
    function dropDown() {
        if ($(window).width() > 767) {
            $('.nav-pills .dropdown').on('mouseover', function(){
                $('.dropdown-toggle', this).closest('a').css({ 'background-color': 'rgb(240,30,30)', 'color': 'white'});
                $('.dropdown-toggle', this).next('.dropdown-menu').show();
            });
            
            $('.nav-pills .dropdown').on('mouseout', function(){
                $('.dropdown-toggle', this).closest('a').css({ 'background-color': 'white', 'color': 'rgb(0,130,255)'});
                $('.dropdown-toggle', this).next('.dropdown-menu').hide();
            });
            
            $('.dropdown-toggle').click(function() {
                if ($(this).next('.dropdown-menu').is(':visible')) {
                    window.location = $(this).attr('href');
                }
            });
        }
        else {
            $('.nav-pills .dropdown').off('mouseover').off('mouseout');
        }
    }
    
    $(window).resize(function() {
        dropDown();
    }) ;
    
    dropDown();
});