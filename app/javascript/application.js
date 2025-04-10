// Entry point for the build script in your package.json
import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
window.bootstrap = bootstrap // This makes it globally available

// Import all Bootstrap modules explicitly for use
import { Dropdown, Collapse, Modal } from "bootstrap"

// Initialize Stimulus
const application = Application.start()

// Manually import controllers
import FlatpickrController from "./controllers/flatpickr_controller"
application.register("flatpickr", FlatpickrController)

// Add other controllers as needed
