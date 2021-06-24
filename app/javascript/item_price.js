window.addEventListener('load', () => {


  const priceInput_price = document.getElementById("item-price"); 

  priceInput_price.addEventListener("input", () => {
   const inputValue = priceInput_price.value;
   const priceInput_add_tax = document.getElementById("add-tax-price");
   priceInput_add_tax.innerHTML = Math.floor(inputValue*0.1)
   
   const priceInput_profit = document.getElementById("profit");
   priceInput_profit.innerHTML = Math.floor(inputValue*0.9)
  
  })
})
