const formJs = document.querySelector(".form-js");
const bookingStart = document.querySelector("#booking_start_date");
const bookingEnd = document.querySelector("#booking_end_date");
const bookingPricePerDay = document.querySelector("#booking_total_price");
const bookingTime = document.querySelector("#booking-time");
const bookingPrice = document.querySelector("#booking-price");

const myButton = document.querySelector("#mybtn");
mybtn.addEventListener('click', (event) => {
  const oneDay = 24*60*60*1000;
  const startDate = new Date(bookingEnd.value);
  const endDate = new Date(bookingStart.value);
  const bookingDuration = Math.round(Math.abs((startDate.getTime() - endDate.getTime())/(oneDay)));
  const bookingValue = bookingDuration * parseInt(bookingPricePerDay.value);
  bookingTime.insertAdjacentHTML('afterbegin', `du <strong> ${bookingStart.value} </strong>`);
  bookingTime.insertAdjacentHTML('beforeend', `<strong> ${bookingEnd.value} </strong>`);

  bookingPrice.insertAdjacentHTML('beforeend', `<strong> ${bookingValue}€ </strong>`);
})
