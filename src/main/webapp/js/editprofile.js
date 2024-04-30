// editProfile.js

function showEditForm(field) {
    var currentValue = document.querySelector('td[data-field="' + field + '"]');
    if (!currentValue) {
        console.error('データフィールドを持つtd要素が見つかりませんでした');
        return;
    }
    currentValue = currentValue.innerText.trim(); // trim()で前後の空白を削除
    var formHtml = `
        <form id="editForm">
            <input type="text" name="${field}" value="${currentValue}">
            <button type="button" onclick="cancelEdit()">キャンセル</button>
            <button type="button" onclick="updateField('${field}')">更新</button>
        </form>
    `;
    currentValue.innerHTML = formHtml;
}

function cancelEdit() {
    // キャンセルボタンがクリックされたときの処理
}

function updateField(field) {
    var newValue = document.querySelector('input[name="' + field + '"]').value.trim(); // trim()で前後の空白を削除
    var accountId = document.querySelector('input[name="account_id"]').value; // ユーザーのIDを取得

    // フォームデータを作成
    var formData = new FormData();
    formData.append('field', field);
    formData.append('value', newValue);
    formData.append('account_id', accountId);

    // Ajaxリクエストを使用して更新を行う
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'update-profile');
    xhr.onload = function() {
        if (xhr.status === 200) {
            // 成功した場合の処理
            location.reload(); // ページをリロードして変更を反映
        } else {
            // エラーが発生した場合の処理
            console.error('更新に失敗しました');
        }
    };
    xhr.send(formData);
}
