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
//= require_tree .

window.addEventListener("load", function() {
  let previewLinks = document.querySelectorAll("a.preview");

  for (let i = 0; i < previewLinks.length; i++) {
    previewLinks[i].addEventListener("click", function(e) {
      e.preventDefault();
      var link = this;
      var request = new XMLHttpRequest();
      request.open("GET", this.href);
      request.responseType = "json";
      request.addEventListener("load", function() {
        var text = this.response.text;
        var p = document.getElementById("preview-" + link.dataset.id);
        var textNode = document.createTextNode(text);
        p.innerHTML = text;
        p.style = "display: block;";
      });
      request.send();
    });
  }
});
