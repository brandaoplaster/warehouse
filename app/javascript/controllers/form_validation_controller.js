import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["email", "password", "error"]

  validateEmail() {
    const email = this.emailTarget.value
    const isValid = /\S+@\S+\.\S+/.test(email)
    
    if (!isValid && email.length > 0) {
      this.showError(this.emailTarget, "Email inválido")
    } else {
      this.clearError(this.emailTarget)
    }
  }

  showError(field, message) {
    field.classList.add("border-red-500")
    const errorDiv = field.parentElement.querySelector(".error-message")
    if (errorDiv) errorDiv.textContent = message
  }

  clearError(field) {
    field.classList.remove("border-red-500")
  }
}
