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
//= require rails-ujs
//= require turbolinks
//= require_tree .

window.onload = function() {
    var menuTog = document.getElementById('menuToggle');
    var navBar = document.getElementById('navBar');
  
    if (menuTog !== null) {
      menuTog.addEventListener('click', togNav);
    }
  
    if (navBar !== null) {
      window.addEventListener('scroll', fixNav);
    }
  };
  
  function fixNav() {
    var head = document.getElementById('head');
    var pushBack = document.getElementById('pushBack');
    var headBot;
    
    if (head !== null) {
      headBot = head.getBoundingClientRect().bottom;
    }
  
    if (pushBack !== null) {
      if (headBot > 0) {
        navBar.style.position = 'static';
        pushBack.style.height = '0em';
      } else {
        navBar.style.position = 'fixed';
        pushBack.style.height = '3em';
      }
    }
  }
  
  function togNav() {
    var navMenu = document.getElementById('menu');
  
    if (navMenu !== null) {
      if (navMenu.className === "showing") {
        navMenu.className = "";
      } else {
        navMenu.className = "showing";
      }
    }
  }