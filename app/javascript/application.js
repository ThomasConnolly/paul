// Entry point for the build script in your package.json
import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
import Trix from "trix"
import "@rails/actiontext"
import "@rails/actioncable"

//Import controllers
import "./controllers"
