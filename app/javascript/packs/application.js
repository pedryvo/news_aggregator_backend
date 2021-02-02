// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap/dist/js/bootstrap.bundle'
import 'mdbootstrap/css/bootstrap'
import 'mdbootstrap/css/mdb'
import '@fortawesome/fontawesome-free/js/all'

require("stylesheets/application.scss")

Rails.start()
Turbolinks.start()
ActiveStorage.start()


$( document ).on('turbolinks:load', function() {

  // Carousel

  $(".carousel").carousel({
      interval: false,
      pause: true
  });

  $( ".carousel .carousel-inner" ).swipe( {
  swipeLeft: function ( event, direction, distance, duration, fingerCount ) {
      this.parent( ).carousel( 'next' );
  },
  swipeRight: function ( ) {
      this.parent( ).carousel( 'prev' );
  },
  threshold: 0,
  tap: function(event, target) {
      window.location = $(this).find('.carousel-item.active a').attr('href');
  },
  excludedElements:"label, button, input, select, textarea, .noSwipe"
  } );

  $('.carousel .carousel-inner').on('dragstart', 'a', function () {
      return false;
  });  

});