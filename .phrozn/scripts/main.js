$(document).ready(function(){
    $('body').delegate('.event-time', 'mouseover', function(){
        $('.add-google-calendar').show();
    });
    $('body').delegate('.event-time', 'mouseout', function(){
        $('.add-google-calendar').hide();
    });
});