// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "./main.scss"
import "./offcanvas.css"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

import jQuery from 'jquery'
global.$ = global.jQuery = jQuery
window.$ = window.jQuery = jQuery

import "@fortawesome/fontawesome-free/js/all"
import "bootstrap/dist/js/bootstrap"
//para que sirba el boton

document.addEventListener('turbolinks:load', function(){

  $(function () {
    'use strict'
  
    $('[data-toggle="offcanvas"]').on('click', function () {
      $('.offcanvas-collapse').toggleClass('open')
    })
  })
})