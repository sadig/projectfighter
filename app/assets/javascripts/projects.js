$(document).ready(function() {
  $('.task-status-changer').each(function() {
    $(this).on('change', function(e) {
      var put_url=$(e.target).attr('data-url');
      var that=$(e.target);
      console.log(put_url);
      var a=$.ajax({
          url:put_url,
          method:'PUT',
          contentType:'application/json; charset=UTF-8',
          dataType:'json',
          data:JSON.stringify({'status':that.val()}),
      });
      a.done(function(data) {
        if (data===undefined) {
          window.location.href=window.location.href
        }
      });
    });
  });
});
