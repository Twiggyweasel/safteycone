$(document).on('turbolinks:load', function() {
  $('#has_defects').click(function() {
    if($(this).is(":checked")) {
      $('#defect_box').show();
    } else {
      $('#defect_box').hide();
    }
  });  
});
