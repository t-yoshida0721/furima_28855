window.addEventListener("load",  () => {
  
  

  
  const price = document.getElementById('item-price');
  
  price.addEventListener("keyup", () => {

    const item_price = price.value
   
    const tax = document.getElementById ('add-tax-price');
    const profit  = document.getElementById ('profit');
  
    const tax_price = Math.round(item_price*0.1)
    const profit_price = Math.round(item_price-tax_price)

tax.innerHTML = tax_price
profit.innerHTML = profit_price

   })
})
