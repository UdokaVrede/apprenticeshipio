const recalc = () => {
  let selectBox = document.getElementById("city-select-input")
  let companiesInCity = selectBox.value
  let apprenticesInCompany = document.getElementById("apprentices-in-company-input").value
  document.getElementById("city-name").innerHTML = selectBox.options[selectBox.selectedIndex].text
  document.getElementById("city-yearly-apprentices").innerHTML = companiesInCity * apprenticesInCompany
  console.log('called')
};

recalc(document.getElementById("city-select-input").value);

document.getElementById("city-select-input").onchange = recalc
document.getElementById("apprentices-in-company-input").onchange = recalc
