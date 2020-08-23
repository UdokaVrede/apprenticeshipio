document.addEventListener('mousemove', e => parallax(e));

const parallax = (e) => {
  document.querySelectorAll('.layer').forEach(layer => {
    const speed = layer.getAttribute('data-speed');

    const x = (window.innerWidth - e.pageX * speed) / 100;
    const y = (window.innerHeight - e.pageY * speed) / 100;

    layer.style.transform = `translate(${x}px, ${y}px)`;
  });
}

// document.getElementsByClassName("parallax-body")[0].addEventListener("scroll", e => parallax2(e))

// const parallax2 = (e) => {
//   document.querySelectorAll('#mover').forEach(mover => {
//     const speed = mover.getAttribute('data-speed');

//     // for the speed of the scroll

//     // multiply the background-position: y by a multiple of the object speed?

//     // const x = (window.innerWidth - e.pageX * speed) / 100;
//     const y = (window.innerHeight - e.pageY * speed) / 100;

//     console.log('e', e);
//     console.log('wins', window.innerHeight);

//     mover.style.transform = `translate(${0}px, ${y}px)`;
//   });
// }

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
