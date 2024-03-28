import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  static values = { selectedDays: Array };

  connect() {
    flatpickr(this.element, {
      mode: "multiple",
      dateFormat: "Y-m-d",
      enable: this.selectedDaysValue,
      defaultDate: this.selectedDaysValue,
      inline: true,
      minDate: "today",
      onDayCreate: (dObj, dStr, fp, dayElem) => {
        // Convertit chaque date spéciale en format de chaîne 'YYYY-MM-DD' après avoir soustrait un jour
        const selectedDatesStr = this.selectedDaysValue.map((date) => {
          const d = new Date(date);
          d.setDate(d.getDate() - 1); // Soustrait un jour
          return d.toISOString().split("T")[0];
        });

        // Formatte la date du jour actuel pour la comparaison
        const dayDateStr = dayElem.dateObj.toISOString().split("T")[0];

        // Vérifie si le jour actuel fait partie des dates spéciales ajustées
        if (selectedDatesStr.includes(dayDateStr)) {
          // Applique un style CSS personnalisé si la date est spéciale
          dayElem.classList.add("special-date");
        }
      },
    });
  }
}
