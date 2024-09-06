function price (){

  // elementを取得
  const itemPrice = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  // 数字を入力した際の挙動
  itemPrice.addEventListener('input', function(){
    const taxCalc = `${Math.floor(itemPrice.value*0.1)}`;
    tax.innerHTML = `${taxCalc}`;
    profit.innerHTML = `${itemPrice.value - taxCalc}`;
  })
};

window.addEventListener('turbo:load', price);
window.addEventListener("turbo:render", price);