/**
 * 郵便番号を取得する
 */

     function getAddressFromPostcode() {
        var postcode = document.getElementById("postnum").value;
        // 郵便番号をAPIに送信して、住所を取得する処理を記述する
        // ここではダミーのAPIを使用する例を示します
        var apiUrl = "https://zipcloud.ibsnet.co.jp/api/search?zipcode=" + postcode;
        
        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                if (data.results) {
                    var address = data.results[0].address1 + data.results[0].address2 + data.results[0].address3;
                    document.getElementById("address").value = address;
                } else {
                    alert("該当する住所が見つかりませんでした");
                }
            })
            .catch(error => {
                console.error("Error:", error);
            });
    }