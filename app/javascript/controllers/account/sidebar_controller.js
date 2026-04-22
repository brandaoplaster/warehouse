import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static identifier = "account--sidebar"
  static targets = ["sidebar"]

  connect() {
    this.handleResize()
    window.addEventListener("resize", this.handleResize.bind(this))
  }
  disconnect() {
    window.removeEventListener("resize", this.handleResize.bind(this))
  }
  handleResize() {
    if (window.innerWidth >= 1024) {
      this.show()
    } else {
      this.close()
    }
  }
  toggle() {
    console.log("click here!")
    this.sidebarTarget.classList.contains("-translate-x-full")
      ? this.show()
      : this.close()
  }
  show() {
    this.sidebarTarget.classList.remove("-translate-x-full")
    this.sidebarTarget.classList.add("translate-x-0", "border-e", "border-stone-200", "shadow-lg")
  }
  close() {
    this.sidebarTarget.classList.add("-translate-x-full")
    this.sidebarTarget.classList.remove("translate-x-0", "border-e", "border-stone-200", "shadow-lg")
  }
  closeOnOutside(event) {
    if (window.innerWidth < 1024 &&
      !this.sidebarTarget.contains(event.target) &&
      !this.sidebarTarget.classList.contains("-translate-x-full")) {
      this.close()
    }
  }
}
