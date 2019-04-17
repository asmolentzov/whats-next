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
    const items = fetch_items()
      .then(html => {
        $('.items-container').html(html)
      })
  })
})

const fetch_items = () => {
  return fetch('/user_likes')
  .then(function(response) {
    return response.json();
  })
  .then(items => {
    let itemsHtml = '<div class="saved-items"><ul>';
    items.forEach(item => {
      itemsHtml += `<li id="saved-${item.id}">${item.name}</li>`
    })
    return itemsHtml + '</ul></div>'
  })
}