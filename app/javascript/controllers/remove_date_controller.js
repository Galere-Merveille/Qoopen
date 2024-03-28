import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="remove-date"
export default class extends Controller {
  static targets = ["link", "list"];
  connect() {}

  remove(event) {
    event.preventDefault();
    console.log(this.linkTarget.href);
    const csrfToken = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content");
    const url = this.linkTarget.href;
    fetch(url, {
      method: "DELETE",
      headers: {
        Accept: "text/plain",
        "X-CSRF-Token": csrfToken,
      },
    })
      .then((response) => response.text())
      .then((data) => {
        console.log(data);
        this.listTarget.innerHTML = data;
      });
  }
}
