import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["price", "total_price"];
  connect() {
    console.log("toto");
    flatpickr(this.element, {
      mode: "range",
      dateFormat: "Y-m-d",
      minDate: "today",
    });
  }
  calculatePrice(event) {
    const selectedDates = event.target._flatpickr.selectedDates;
    const numberOfDays = selectedDates.length;
    const pricePerWeek = parseInt(this.priceTarget.value, 10); // Prix par semaine en euros
    const pricePerDay = pricePerWeek / 7; // Prix par jour
    const totalPrice = pricePerDay * numberOfDays; // Prix total pour la période sélectionnée
    this.totalPriceTarget.innerHTML = `Total: ${totalPrice}$`;
    this.savePrice(totalPrice);
  }

  savePrice(totalPrice) {
    fetch("/bookings", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
        "X-CSRF-Token": document
          .querySelector('meta[name="csrf-token"]')
          .getAttribute("content"),
      },
      body: JSON.stringify({ booking: { total_amount: totalPrice } }),
    });
  }
}
