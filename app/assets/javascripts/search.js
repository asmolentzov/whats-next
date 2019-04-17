$(document).ready(function() {
  $(".save-button").click(function(event) {
    event.preventDefault();
    const itemId = this.parentElement.id.split('-')[1]
    fetch('/user_likes', {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ "id": itemId })
    })
  });
  
  $(".saved-button").click(function(event) {
    event.preventDefault();
    fetch('/user_likes')
    .then(function(response) {
      return response.json();
    })
    .then(function(items) {
      console.log(JSON.stringify(items))
    })
  })
})