// --------------------------------------------------------------------------------
// ----------------- Our Data Calculator ------------------------------------------
// --------------------------------------------------------------------------------
const recalc = () => {
  let selectBox = document.getElementById("city-select-input")
  let companiesInCity = selectBox.value
  let apprenticesInCompany = document.getElementById("apprentices-in-company-input").value
  document.getElementById("city-name").innerHTML = selectBox.options[selectBox.selectedIndex].text
  document.getElementById("city-yearly-apprentices").innerHTML = companiesInCity * apprenticesInCompany
};

recalc(document.getElementById("city-select-input").value);

document.getElementById("city-select-input").onchange = recalc
document.getElementById("apprentices-in-company-input").onchange = recalc
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// --------------------- Mouse Parallax -------------------------------------------
// --------------------------------------------------------------------------------
document.addEventListener('mousemove', e => parallax(e));

const parallax = (e) => {
  document.querySelectorAll('.layer').forEach(layer => {
    const speed = layer.getAttribute('data-speed');

    const x = (window.innerWidth - e.pageX * speed) / 100;
    const y = (window.innerHeight - e.pageY * speed) / 100;

    layer.style.transform = `translate(${x}px, ${y}px)`;
  });
}
// --------------------------------------------------------------------------------

// --------------------------------------------------------------------------------
// ---------------------------- Scroll Parallax -----------------------------------
// --------------------------------------------------------------------------------
$('.floater').each(function(){
  var img = $(this);
  var imgParent = $(this).parent();

  function parallaxImg () {
    var speed = img.data('speed');
    var winTop = $(this).scrollTop();          // current viewport's top distance from document top
    var winH = $(this).height();               // user's device viewport height
    var winBottom = winTop + winH;             // current viewport's bottom distance from document top
    var parentTop = imgParent.offset().top;    // parent div's top border distance from document top
    var parentH = imgParent.innerHeight();     // div's height
    let parentBottom = parentTop + parentH     // parent div's bottom border distance from document top
    
    // Is Window Intersecting Parent?
    if (winBottom > parentTop && winTop < parentBottom) {
      // Image travels a ratio of the distance between winBottom & parentTop
      let travelY = speed * (winBottom - parentTop) / 10;
      img.css('transform', 'translateY(' + travelY + 'px)');
    }
  }

  $(document).on({
    scroll: function () {
      parallaxImg();
    }, ready: function () {
      parallaxImg();
    }
  });
});
// --------------------------------------------------------------------------------