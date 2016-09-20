$(document).ready(function() {
  $('.read-status-button').on('click', updateReadStatus);
  $('#filter-read, #filter-unread').on('click', filterReadByStatus);
  $('#filter-az').on('click', filterAlphabetically);
  $('#search').on('input', filterSearch);
  $('.search-form').submit(function(e) { e.preventDefault(); });
});

function filterSearch() {
  var targetVal = $('#search').val();
  var links = $('.link');

  links.each(function(link) {
    var url = $(this).find('.url').text();
    var title = $(this).find('.title').text();

    if(title.includes(targetVal) || url.includes(targetVal)) {
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function filterReadByStatus(e) {
  e.preventDefault();
  var targetStatus = this.id === "filter-read" ? "true" : "false";
  var links = $('.link');

  links.each(function(link) {
    if($(this).hasClass("read-" + targetStatus)) {
      $(this).hide();
    } else {
      $(this).show();
    }
  });
}

function filterAlphabetically(e) {
  e.preventDefault();

  var links = $('.links');
  var listitems = links.children('.link').get();
  listitems.sort(function(a, b) {
    return $(a).find('.title').text().toUpperCase().localeCompare($(b).find('.title').text().toUpperCase());
  });
  $.each(listitems, function(idx, itm) { links.append(itm); });
}

function updateReadStatus(e) {
  e.preventDefault();
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
      targetLink.find('.read-status-button').html("Click to mark Unread");
    } else {
      targetLink.data("read", false);
      targetLink.toggleClass('read-true read-false');
      targetLink.find('.read-status-button').html("Click to mark Read");
    }
  });
}