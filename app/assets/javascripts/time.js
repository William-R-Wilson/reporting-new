$(document).ready(function(){
  var getTotal = function(){
    var hours = 0;
    $(".time_report").each(function() {
      hours += Number($(this).val());
      console.log(hours);
    })
    return String(hours);
  };

  $("#hours_count").html(getTotal());
  $(".time_report").change(function(){
    $("#hours_count").html(getTotal());
  })
})
