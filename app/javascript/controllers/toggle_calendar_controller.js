import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-calendar"
export default class extends Controller {
  static targets = ["button", "dayCalendar", "rangeCalendar"];
  connect() {
    this.rangeCalendarTarget.classList.add("d-none");
  }

  toggle() {
    console.log("hello");
    if (this.buttonTarget.innerHTML === "Mode jour") {
      this.buttonTarget.innerHTML = "Mode range";
    } else {
      this.buttonTarget.innerHTML = "Mode jour";
    }
    this.dayCalendarTarget.classList.toggle("d-none");
    this.rangeCalendarTarget.classList.toggle("d-none");
  }
}
