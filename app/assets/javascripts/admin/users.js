$(document).ready(function() {
  $('#admin_users_index table tbody').find('tr').each(function() {
    $(this).find('td[data-cell="true"]').each(function() {
      $(this).off('click');
      $(this).on('click',function(e) {
        window.location.href=$(this).parent().attr('data-edit-url');
        e.preventDefault();
      });
    });
  });
});
