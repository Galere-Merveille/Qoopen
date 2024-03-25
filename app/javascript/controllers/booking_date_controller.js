import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="booking-date"
export default class extends Controller {
  static target = ["button"];
  submit(event) {
    console.log("titi");
    event.preventDefault();
  }
}
