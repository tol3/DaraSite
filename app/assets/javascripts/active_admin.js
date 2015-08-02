//= require active_admin/base
//= require tinymce
//= require bootstrap-tagsinput
//= require jquery
//= require jquery_ujs
//= require chartkick

$(document).ready(function() {
  $('.tags').tagsinput();

  tinyMCE.init({
  	theme : 'modern',
    skin: 'light',
    mode: 'textareas',
    plugins: "fullscreen, image, link, print, charmap, colorpicker, uploadimage, media, code, preview, lists, textcolor",
    toolbar: [
      "undo redo | styleselect forecolor backcolor | bold italic bullist numlist | link media image uploadimage | alignleft aligncenter alignright | code preview fullscreen "
    ],
    menubar: false,
    statusbar: true,
    relative_urls: false,
    remove_script_host: false,
    pagebreak_separator: "<p class='page-separator'>&nbsp;</p>",
    document_base_url: (!window.location.origin ? window.location.protocol + "//" + window.location.host : window.location.origin) + "/"
  });
});