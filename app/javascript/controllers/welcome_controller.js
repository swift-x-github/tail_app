import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "message" ]

  connect() {
    console.log("WelcomeController connected")
  }

  greet() {
    this.messageTarget.textContent = "Hello, Stimulus!"
    this.buttonTarget.classList.add("bg-green-500", "text-white")
    this.buttonTarget.textContent = "Clicked!"
  }
}
