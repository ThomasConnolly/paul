
import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    this.my_modal = new Modal(this.element)
    this.my_modal.show()
    this.element.addEventListener('hidden.bs.modal', (event) => {
      location.reload();
      
    })
  }
}

