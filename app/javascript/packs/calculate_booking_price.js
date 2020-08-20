// selectionner le start et le end date et le nombre de jours
// transformer en date
// soustraire date de fin et date de debut
// multiplier par le nombre de jours
// afficher a l'écran

const begin_date = document.querySelector(".begin_date");
const end_date = document.querySelector(".end_date");
const total_price = document.querySelector("#price");
const calcul = document.querySelector("#calcul");

const button = document.querySelector('#click-me');
end_date.addEventListener('change', (event) => {

  if (begin_date.value != null && end_date.value != null) {
    const dailyPrice = calcul.dataset.dailyprice;
    var date1 = new Date(begin_date.value);
    var date2 = new Date(end_date.value);
    var Difference_In_Time = date2.getTime() - date1.getTime();
    calcul.innerText = `$${dailyPrice} x ${Difference_In_Time / (1000 * 3600 * 24)} days`
    total_price.innerText = `$${(Difference_In_Time / (1000 * 3600 * 24))*dailyPrice}`
  }
});


