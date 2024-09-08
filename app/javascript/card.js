const pay = () => {

  const publicKey = gon.public_key 
  const payjp = Payjp(publicKey)   // PAY.JPテスト公開鍵 

  // HTML要素をフォームと置き換え
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  // HTML要素をフォームと置き換え

  const form = document.getElementById('charge-form')
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // カードの情報を取り除く
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      // カードの情報を取り除く
      // フォームの情報を送信
      document.getElementById("charge-form").submit();

    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);