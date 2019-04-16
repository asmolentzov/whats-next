$(document).ready(function() {
  $(".rec-button").click(function(event) {
    event.preventDefault();
    const name = $(this.parentElement).contents()[0].textContent.trim();
    const id = this.parentElement.id.split('-')[1]
    $('#staging-box').children().append(`<li id="rec-${id}">${name}</li>`)
  })
  
  $(".get-recs-button").click(function(event) {
    event.preventDefault();
    const itemIds = Array.from($('#items-for-recs').children()).map(child => {
       return (child.id).split('-')[1];
     });
    window.location.href = `/search?query=${itemIds.join(',')}`
  })
})