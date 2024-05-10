// index.js

window.onload = function() {
    var itemsUrl = "/BoaSorte/index"; // 商品データを取得するURL

    var xhr = new XMLHttpRequest();
    xhr.open('GET', itemsUrl, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                var items = JSON.parse(xhr.responseText);
                displayItems(items);
            } else {
                console.error('Failed to fetch items: ' + xhr.status);
            }
        }
    };
    xhr.send();
};

function displayItems(items) {
    var itemTilesContainer = document.querySelector('.item-tiles');
    items.forEach(function(item) {
        var itemTile = document.createElement('div');
        itemTile.classList.add('item-tile');
        
        var itemImage = document.createElement('img');
        itemImage.src = item.imagePath;
        itemImage.alt = item.name;
        
        var itemDetails = document.createElement('div');
        itemDetails.classList.add('item-details');
        
        var itemName = document.createElement('h2');
        itemName.textContent = item.name;
        
        var itemPrice = document.createElement('p');
        itemPrice.textContent = 'Price: ' + item.price;
        
        var itemType = document.createElement('p');
        itemType.textContent = item.isCoffee ? 'Coffee' : 'Foods';
        
        itemDetails.appendChild(itemName);
        itemDetails.appendChild(itemPrice);
        itemDetails.appendChild(itemType);
        
        itemTile.appendChild(itemImage);
        itemTile.appendChild(itemDetails);
        
        itemTilesContainer.appendChild(itemTile);
    });
}
