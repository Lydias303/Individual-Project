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
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap-modal
//= require bootstrap-modalmanager
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .


$.getScript("http://www.urimalo.com/assets/admin/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js", function(){

var startDate = new Date('01/01/2012');
var FromEndDate = new Date();
var ToEndDate = new Date();

ToEndDate.setDate(ToEndDate.getDate()+365);

$(".from_date").datepicker({

    weekStart: 1,
    startDate: "01/01/2012",
    endDate: FromEndDate,
    autoclose: true
})
    .on("changeDate", function(selected){
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
        $(".to_date").datepicker("setStartDate", startDate);
    });
$(".to_date")
    .datepicker({

        weekStart: 1,
        startDate: startDate,
        endDate: ToEndDate,
        autoclose: true
    })
    .on("changeDate", function(selected){
        FromEndDate = new Date(selected.date.valueOf());
        FromEndDate.setDate(FromEndDate.getDate(new Date(selected.date.valueOf())));
        $(".from_date").datepicker("setEndDate", FromEndDate);
    });
});

$('.dropdown-toggle').dropdown();

$('#openBtn').click(function(){
    $('#myModal').on('show', function () {

  });
    $('#myModal').modal({show:true})
});
