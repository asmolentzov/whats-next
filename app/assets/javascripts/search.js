$(document).ready(function() {
  $(".save-button").click(function(event) {
    event.preventDefault();
    const itemId = this.parentElement.id.split('-')[1]
    fetch('/user_likes', {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ "id": itemId })
    })
  })
})