import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="date"
export default class extends Controller {
  static targets = ["price", "startDate", "endDate", "totalPrice"];
  connect() {}
  total() {
    const price = parseInt(this.priceTarget.innerHTML, 10);

    const startDay = parseInt(this.startDateTarget.value.split("-")[2], 10);
    const endDay = parseInt(this.endDateTarget.value.split("-")[2], 10);

    const startMonth = parseInt(this.startDateTarget.value.split("-")[1], 10);
    const endMonth = parseInt(this.endDateTarget.value.split("-")[1], 10);

    const sameMonth = endMonth - startMonth;

    if (sameMonth == 0) {
      const total = price * (endDay - startDay + 1);
      this.totalPriceTarget.innerHTML = `Total: ${total}$`;
    } else {
      const total = price * (30 * sameMonth - (endDay - startDay));
      this.totalPriceTarget.innerHTML = `Total: ${total}$`;
    }
  }
}
