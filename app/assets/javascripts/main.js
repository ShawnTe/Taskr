  var toggleNav = function() {
    $('.sticky').on('click', function(e) {
      $('#nav-dropdown').toggleClass('toggle-list');
      console.log("in function")
    })
  }

$(document).ready(toggleNav);