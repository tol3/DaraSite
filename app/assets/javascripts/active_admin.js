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
      "undo redo | styleselect fontsizeselect forecolor backcolor | bold italic bullist numlist | link media image uploadimage | alignleft aligncenter alignright | code preview fullscreen "
    ],
    menubar: false,
    statusbar: true,
    relative_urls: false,
    remove_script_host: false,
    // file_browser_callback: function(field_name, url, type, win) {
    //         // if(type=='image') $('#my_form input').click();
    //         console.log('xxx');
    //     },
    pagebreak_separator: "<p class='page-separator'>&nbsp;</p>",
    document_base_url: (!window.location.origin ? window.location.protocol + "//" + window.location.host : window.location.origin) + "/"
  });

});

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#img_prev')
      .attr('src', e.target.result)
      .width(100);
    };

    reader.readAsDataURL(input.files[0]);
  }
}

function readURLs(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#poster_prev')
      .attr('src', e.target.result)
      .width(100);
    };

    reader.readAsDataURL(input.files[0]);
  }
}

// tinymce.PluginManager.add('exampl', function(editor, url) {
//     // Add a button that opens a window
//     editor.addButton('exampl', {
//         text: 'Images',
//         icon: true,
//         onclick: function() {
//             // Open window
//             editor.windowManager.open({
//                 title: 'Upload Images',
//                 body: [
//                     {type: 'textbox', name: 'title', label: 'Title'}
//                 ],
//                 onsubmit: function(e) {
//                     // Insert content when the window form is submitted
//                     // editor.insertContent('Title: ' + e.data.title);
//                     console.log("ooooooooooo");
//                 }
//             });
//         }
//     });

//     // Adds a menu item to the tools menu
//     editor.addMenuItem('exampl', {
//         text: 'Upload Images',
//         context: 'tools',
//         onclick: function() {
//             // Open window with a specific url
//             editor.windowManager.open({
//                 title: 'TinyMCE site',
//                 url: 'http://www.tinymce.com',
//                 width: 800,
//                 height: 600,
//                 buttons: [{
//                     text: 'Close',
//                     onclick: 'close'
//                 }]
//             });
//         }
//     });
// });