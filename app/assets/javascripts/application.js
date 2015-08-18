// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require social-share-kit.min.js
//= require scripts
//= require tinymce_assets
//= require classie
//= require uisearch
//= require jquery.flexslider

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.4&appId=1877713805787981";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function date_time(id) {
  date = new Date;
  year = date.getFullYear();
  month = date.getMonth();
  months = new Array('January', 'February', 'March', 'April', 'May', 'June', 'Jully', 'August', 'September', 'October', 'November', 'December');
  d = date.getDate();
  day = date.getDay();
  days = new Array('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');
  h = date.getHours();
  if(h<10)
  {
          h = "0"+h;
  }
  m = date.getMinutes();
  if(m<10)
  {
          m = "0"+m;
  }
  s = date.getSeconds();
  if(s<10)
  {
          s = "0"+s;
  }
  result = ''+days[day]+' '+months[month]+' '+d+' '+year+' '+h+':'+m+':'+s;
  document.getElementById(id).innerHTML = result;
  setTimeout('date_time("'+id+'");','1000');
  return true;
}


// $(document).ready(function() {
//   function allcoder_ppopup()  {
//     var sec = 15
//     var timer = setInterval(function() {
//       $("#acfooter span").text(sec--);

//       if (sec == 0) {
//         $("#allcoderpopup").fadeOut("slow");
//         clearInterval(timer);
//       }
//     },1000);

//     var acwh = $(window).height();
//     var acpph = $("#allcoderpopup").height();
//     var acfromTop = $(window).scrollTop()+50;

//     $("#allcoderpopup").css({"top": acfromTop});
//   }

//   $(window).fadeIn(allcoder_ppopup).resize(allcoder_ppopup)

//    //alert($.cookie('sreqshown'));
//    //var acww = $(window).width();
//    //var acppw = $("#allcoderpopup").width();
//    //var acleftm = (acww-acppw)/2;
//    var acleftm = 500;
//    //var acwh = $(window).height();
//    //var acpph = $("#allcoderpopup").height();
//    //var acfromTop = ($(window).scrollTop()+acwh-acpph) / 2;

//   $("#allcoderpopup").animate({opacity: "1", left: "0" , left:  acleftm}, 0).show();

//   $("#acclose").click(function() {
//     $("#allcoderpopup").animate({
//       opacity: "0",
//       left: "-5000000"}
//     , 1000).show();
//   });

// });


