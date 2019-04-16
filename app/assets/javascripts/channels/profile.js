$(document).ready(function() {
  $(".rec-button").click(function(event) {
    event.preventDefault();
    const name = $(this.parentElement).contents()[0].textContent.trim();
    $('#staging-box').children().append(`<li>${name}</li>`)
  })
})