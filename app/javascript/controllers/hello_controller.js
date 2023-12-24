import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hello"
export default class extends Controller {
  connect() {
    this.element,textContent = "Hello World from Stimulus!"
  }
}    
