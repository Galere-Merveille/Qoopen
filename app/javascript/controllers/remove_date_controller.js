import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="remove-date"
export default class extends Controller {
  connect() {}

  remove() {
    this.element.remove();
  }
}
