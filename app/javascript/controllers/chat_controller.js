// app/javascript/controllers/chat_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.channel = this.application.consumer.subscriptions.create("ChatChannel", {
      received: data => {
        this.element.insertAdjacentHTML('beforeend', data)  
      },
      send_message: message => { 
        this.channel.send({message: message})
      }
    })
  }
}