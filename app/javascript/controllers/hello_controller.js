import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Stimulus connected the Hello Controller")
    this.element.textContent = "Hello World!"
  }
}
