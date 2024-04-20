// Entry point for the build script in your package.json
import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"
import "@rails/actioncable"

//Import controllers
import "./controllers"
document.addEventListener('trix-initialize', function(event) {
  var trix = event.target;
  var toolBar = trix.toolbarElement;

  // Add align left button
  var alignLeftButton = document.createElement("button");
  alignLeftButton.setAttribute("type", "button");
  alignLeftButton.setAttribute("data-trix-action", "align-left");
  alignLeftButton.setAttribute("title", "Align Left");
  alignLeftButton.textContent = "L";
  toolBar.appendChild(alignLeftButton);

  // Add align center button
  var alignCenterButton = document.createElement("button");
  alignCenterButton.setAttribute("type", "button");
  alignCenterButton.setAttribute("data-trix-action", "align-center");
  alignCenterButton.setAttribute("title", "Align Center");
  alignCenterButton.textContent = "C";
  toolBar.appendChild(alignCenterButton);

  // Add align right button
  var alignRightButton = document.createElement("button");
  alignRightButton.setAttribute("type", "button");
  alignRightButton.setAttribute("data-trix-action", "align-right");
  alignRightButton.setAttribute("title", "Align Right");
  alignRightButton.textContent = "R";
  toolBar.appendChild(alignRightButton);
});
