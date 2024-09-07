const pay = () => {
  const publicKey = gon.public_key // PAY.JPテスト公開鍵 
  const payjp = Payjp(publicKey)

  // HTML要素をフォームと置き換え
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');
  // HTML要素をフォームと置き換え


  const form = document.getElementById('button')
  form.addEventListener("click", (e) => {
    console.log("フォーム送信時にイベント発火")
    // e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);