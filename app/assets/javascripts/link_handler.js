$(document).ready(function() {
  $('.read-status-button').on('click', updateReadStatus);
});

function updateReadStatus(e) {
  var targetLink = $(this.parentElement);

  $.ajax({
    type: "PATCH",
    url: "api/v1/links/" + targetLink.data("id") + "?read=" + !targetLink.data("read"),
    dataType: "JSON"
  })
  .success(function(json) {
    if(json.read) {
      targetLink.data("read", true);
      targetLink.toggleClass('read-false read-true');
      targetLink.find('.read-status-button').html("Click to mark Read");
    } else {
      targetLink.data("read", false);
      targetLink.toggleClass('read-true read-false');
      targetLink.find('.read-status-button').html("Click to mark Unread");
    }
  });
}