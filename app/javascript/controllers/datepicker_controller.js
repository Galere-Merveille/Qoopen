import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    console.log("toto");
    flatpickr(this.element, {
      mode: "multiple",
      dateFormat: "Y-m-d",
      inline: true,
    });
  }
}
