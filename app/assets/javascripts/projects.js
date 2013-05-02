function task_status_changer(selector) {
  $(selector).on('change', function(e) {
    var put_url=$(e.target).attr('data-url');
    var that=$(e.target);
    var a=$.ajax({
        url:put_url,
        method:'PUT',
        contentType:'application/json; charset=UTF-8',
        dataType:'json',
        data:JSON.stringify({'status':that.val()}),
    });
    a.done(function(data) {
      if (data===undefined) {
        window.location.href=window.location.href;
      } 
    });
  });
};

$(document).ready(function() {
  $('.task-status-changer').each(function() {
    task_status_changer(this);
  });
  $('.stop-time-record').each(function() {
    $(this).on('click', function(e) {
      var puturl=$(e.target).attr('data-url');
      var a=$.ajax({
          url:puturl,
          method:'PUT',
          contentType:'application/json; charset=UTF-8',
      });
      a.done(function(data) {
        if (data===undefined) {
          window.location.href=window.location.href;
        }
      });
    });
  });
  $('.start_time_record').each(function() {
    $(this).on('click', function(e) {
      var puturl=$(e.target).attr('data-url');
      var a=$.ajax({
          url:puturl,
          method:'POST',
          contentType:'application/json; charset=UTF-8',
      });
      a.done(function(data) {
        if (data===undefined) {
          window.location.href=window.location.href
        }
      });
    });
  });
});
