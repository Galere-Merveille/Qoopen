import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
// Connects to data-controller="booking-subscription"
export default class extends Controller {
  static values = { bookingId: Number };
  static targets = ["messages"];

  connect() {
    // console.log(this.inputTarget);
    this.subscription = createConsumer().subscriptions.create(
      { channel: "BookingChannel", id: this.bookingIdValue },
      {
        received: (data) => {
          this.messagesTarget.insertAdjacentHTML("beforeend", data);
          this.insertMessageAndScrollDown();
        },
      }
    );
    console.log(
      `Subscribe to the chatroom with the id ${this.bookingIdValue}.`
    );
  }

  insertMessageAndScrollDown() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }
  resetForm(event) {
    event.target.reset();
    // this.inputTarget.value = "";
  }
  disconnect() {
    console.log("Unsubscribed from the chatroom");
    this.subscription.unsubscribe();
  }
}
