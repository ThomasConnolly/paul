import { Controller } from "stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      dateFormat: "Y-m-d"
    });
  }
}
