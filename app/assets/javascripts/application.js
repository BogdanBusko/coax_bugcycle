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
//= require rails-ujs
//= require bootstrap
//= require_tree .

function delay(fn, duration) {
  var timer;
  return function(){
    clearTimeout(timer);
    timer = setTimeout(fn, duration);
  }
}

function search() {
  var xhr = new XMLHttpRequest();
  var search = document.location.search;
  var path = document.location.pathname;
  var element = document.getElementsByClassName('js-bugcycles');
  var url = search.split('&');

  if (search.includes('page') && document.getElementById('search').value != '') {
    url[1] = 'search=' + document.getElementById('search').value;
    history.pushState({}, null, url[0] + '&' + url[1]);
  } else if (!search.includes('page') && document.getElementById('search').value != '') {
    history.pushState({}, null, '?search=' + document.getElementById('search').value);
  } else if (search.includes('page') && document.getElementById('search').value == '') {
    var url = document.location.search.split('&');
    history.pushState({}, null, url[0]);
  } else { 
    history.pushState({}, null, document.location.pathname);
  }

  var url = document.location.pathname + document.location.search;

  xhr.open('GET',  url, true);
  xhr.send();

  xhr.onreadystatechange = function() {
    if (xhr.readyState != 4) return;

    element[0].innerHTML = parser(xhr.responseText).innerHTML;
  }

  element[0].innerHTML = '<div class="text-center"><h1>Load....</h1></div>';
}

function parser(responseText) {
  var parser = new DOMParser();
  var xmlDoc = parser.parseFromString(responseText,"text/html");
  
  return xmlDoc.getElementsByClassName('js-bugcycles')[0];
}