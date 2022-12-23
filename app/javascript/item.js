function post (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener( "keyup", () => {
    const taxPrice = itemPrice.value
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = Math.floor(`${taxPrice / 10}`);
    profit.innerHTML = taxPrice - Math.floor(`${taxPrice / 10}`);
  });
};

window.addEventListener('load', post);