function item_price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const commission_rate = 0.1;
    const profitCalculation = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * commission_rate);
    profitCalculation.innerHTML = Math.floor(inputValue - inputValue * commission_rate);
  });
}
window.addEventListener("load", item_price);