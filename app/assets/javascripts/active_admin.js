//= require active_admin/base
//= require tinymce
//= require bootstrap-tagsinput
//= require jquery
//= require jquery_ujs

$(document).ready(function() {
  $('.tags').tagsinput();

  tinyMCE.init({
  	theme : 'modern',
    mode: 'textareas',
    plugins: "fullscreen, image, link, print, charmap, colorpicker, uploadimage",
    toolbar: [
      "undo redo | styleselect | bold italic | link image | alignleft aligncenter alignright | fullscreen uploadimage"
    ],
    menubar: false,
    statusbar: false,
    relative_urls: false,
    remove_script_host: false,
    pagebreak_separator: "<p class='page-separator'>&nbsp;</p>",
    document_base_url: (!window.location.origin ? window.location.protocol + "//" + window.location.host : window.location.origin) + "/"
  });
});