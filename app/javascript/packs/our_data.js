// document.addEventListener('mousemove', e => parallax(e));

// const parallax = (e) => {
//   document.querySelectorAll('.layer').forEach(layer => {
//     const speed = layer.getAttribute('data-speed');

//     const x = (window.innerWidth - e.pageX * speed) / 100;
//     const y = (window.innerHeight - e.pageY * speed) / 100;

//     layer.style.transform = `translate(${x}px, ${y}px)`;
//   });
// }

// document.addEventListener("scroll", e => console.log(e))

// // const parallax2 = (e) => {
// //   document.querySelectorAll('#mover').forEach(mover => {
// //     const speed = mover.getAttribute('data-speed');

// //     // for the speed of the scroll

// //     // multiply the background-position: y by a multiple of the object speed?

// //     // const x = (window.innerWidth - e.pageX * speed) / 100;
// //     const y = (window.innerHeight - e.pageY * speed) / 100;

// //     console.log('e', e);
// //     console.log('wins', window.innerHeight);

// //     mover.style.transform = `translate(${0}px, ${y}px)`;
// //   });
// // }

document.addEventListener('mousemove', e => parallax(e));

const parallax = (e) => {
  document.querySelectorAll('.layer').forEach(layer => {
    const speed = layer.getAttribute('data-speed');

    const x = (window.innerWidth - e.pageX * speed) / 100;
    const y = (window.innerHeight - e.pageY * speed) / 100;

    layer.style.transform = `translate(${x}px, ${y}px)`;
  });
}

// document.addEventListener("scroll", e => console.log(e))

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

// --------------------------------------------------------------------------------
// ----------------- Our Data Calculator ------------------------------------------
// --------------------------------------------------------------------------------
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
// --------------------------------------------------------------------------------
// --------------------------------------------------------------------------------

$('.floater').each(function(){
  var img = $(this);
  var imgParent = $(this).parent();

  function parallaxImg () {
    var speed = img.data('speed');
    var winY = $(this).scrollTop();          // current viewport's top distance from document top
    var winH = $(this).height();             // user's notebook viewport height
    var imgY = imgParent.offset().top;       // parent div's top border distance from document top
    var parentH = imgParent.innerHeight();   // div's height
    var winBottom = winY + winH;             // The next pixel to show on screen

    // If block is shown on screen
    if (winBottom > imgY && winY < imgY + parentH) {
      // @TODO(marcos/kam): continue
      // Should we use IntersectionObserver API?
      img.css({ transform: 'translateY(' + imgPercent + ')' });
    }
    console.log('parentH: ', parentH);
    
  }
  $(document).on({
    scroll: function () {
      parallaxImg();
    }, ready: function () {
      parallaxImg();
    }
  });
});


// const observer = new IntersectionObserver(handleIntersection);

// function handleIntersection(entries, observer) {
//   entries.forEach(entry => {
//     if (entry.isIntersecting) {
//       console.log('yes!')
//     };
//   });
// }

// $('.floater').each(div => observer.observe(div));