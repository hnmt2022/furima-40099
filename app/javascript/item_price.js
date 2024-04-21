function itemPrice() {

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue*0.1);

    const calcProfit = document.getElementById("profit");
    calcProfit.innerHTML = Math.floor(inputValue-Math.floor(inputValue*0.1));

  })

}

window.addEventListener('turbo:load', itemPrice);
window.addEventListener('turbo:render', itemPrice);
