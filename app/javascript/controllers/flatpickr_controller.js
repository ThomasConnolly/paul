import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static values = {
    dateFormat: { type: String, default: "Y-m-d" }
  }
  
  connect() {
    console.log("Flatpickr controller connected")
    flatpickr(this.element, {
      dateFormat: this.dateFormatValue
    })  
  }
}