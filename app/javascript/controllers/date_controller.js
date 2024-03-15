import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="date"
export default class extends Controller {
  static targets = ["price", "startDate", "endDate", "totalPrice"];
  connect() {}
  total() {
    console.log("test");
    const price = parseInt(this.priceTarget.innerHTML, 10);
    console.log(price);
    const startDay = parseInt(this.startDateTarget.value.split("-")[2], 10);

    const endDay = parseInt(this.endDateTarget.value.split("-")[2], 10);
    const startMonth = parseInt(this.startDateTarget.value.split("-")[1], 10);
    const endMonth = parseInt(this.endDateTarget.value.split("-")[1], 10);
    const sameMonth = endMonth - startMonth;

    if (sameMonth == 0) {
      const total = price * (endDay - startDay);
      this.totalPriceTarget.innerHTML = `Total: ${total}$`;
    } else {
      const total = price * (30 * sameMonth - (endDay - startDay));
      this.totalPriceTarget.innerHTML = `Total: ${total}$`;
    }
  }
}
