$(document).ready(function() {
  $(".rec-button").click(function(event) {
    event.preventDefault();
    const name = $(this.parentElement).contents()[0].textContent.trim();
    $('#staging-box').children().append(`<li>${name}</li>`)
  })
  
  $(".get-recs-button").click(function(event) {
    event.preventDefault();
    const items = Array.from($('#items-for-recs').children()).map(child => {
       return child.textContent;
     });
    window.location.href = `/search?query=${items.join(',')}`
  })
})