function count (){
  const priceInt  = document.getElementById("item-price");
  priceInt.addEventListener("keyup", () => {
    const priceAll = priceInt.value;
    const ProfitPrice = Math.floor(priceAll * 0.9);
    const systemTax  = priceAll - ProfitPrice;
    const addTaxPrice  = document.getElementById("add-tax-price");
    const profit  = document.getElementById("profit");
    addTaxPrice.innerHTML = `${systemTax}`;
    profit.innerHTML = `${ProfitPrice}`;

  });
}

window.addEventListener('load', count);