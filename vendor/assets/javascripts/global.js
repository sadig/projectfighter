// library

function convert_date_to_locale(class_selector) {
  $(class_selector).each(function() {

    var localdate=new Date(Date.parse($(this).text()));
    $(this).text(localdate.toLocaleDateString()+' '+localdate.toLocaleTimeString());
  });
};

function convert_seconds_to_dhms(selector) {
  $(selector).each(function() {
    var seconds=$(this).text();
    var days=Number.toInteger(seconds/86400);
    if (days > 0) {
      seconds=seconds-(days*86400);
    }
    var hours=Number.toInteger(seconds/3600);
    if (hours > 0) {
      seconds=seconds-(hours*3600);
    }
    var minutes=Number.toInteger(seconds/60);
    if (minutes > 0) {
      seconds=seconds-(minutes*60);
    }
    $(this).text(days+' Days '+hours+' Hours '+minutes+' Minutes '+seconds+' Seconds');
  });
};
