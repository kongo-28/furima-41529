const pay = () => {
  const form = document.getElementById('button')
  form.addEventListener("click", (e) => {
    console.log("フォーム送信時にイベント発火")
    // e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);