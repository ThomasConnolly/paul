// Entry point for the build script in your package.json
import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
import "@rails/actioncable"

// Initialize Stimulus
const application = Application.start()

// Manually import controllers
import FlatpickrController from "./controllers/flatpickr_controller"
application.register("flatpickr", FlatpickrController)

// Add other controllers as needed
