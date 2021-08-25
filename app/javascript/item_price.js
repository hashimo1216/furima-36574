function sellingPrice () {
  const priceInput = document.getElementById('item-price')
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const valueResult = (Math.floor(inputValue * 0.1));

    const addTaxPrice = document.getElementById('add-tax-price')
    addTaxPrice.innerHTML = valueResult;
    
    const profit = document.getElementById('profit')
    profit.innerHTML = inputValue - valueResult;
  });

}

window.addEventListener('load',sellingPrice)