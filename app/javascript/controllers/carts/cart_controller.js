import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["shopping_cart"]

  connect() {
    console.log("Controller conectado!")
  }

  toggle() {
    console.log("toggle")
    this.shopping_cartTarget.classList.toggle("translate-x-full")
  }
}