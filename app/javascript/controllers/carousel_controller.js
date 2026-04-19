import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide", "indicator"]
  static values = { 
    index: { type: Number, default: 0 },
    autoplay: { type: Boolean, default: true },
    interval: { type: Number, default: 5000 }
  }

  connect() {
    this.showSlide(this.indexValue)
    if (this.autoplayValue) {
      this.startAutoplay()
    }
  }

  disconnect() {
    this.stopAutoplay()
  }

  next() {
    this.stopAutoplay()
    this.indexValue = (this.indexValue + 1) % this.slideTargets.length
  }

  previous() {
    this.stopAutoplay()
    this.indexValue = this.indexValue === 0 ? this.slideTargets.length - 1 : this.indexValue - 1
  }

  goToSlide(event) {
    this.stopAutoplay()
    this.indexValue = parseInt(event.currentTarget.dataset.index)
  }

  indexValueChanged() {
    this.showSlide(this.indexValue)
  }

  showSlide(index) {
    this.slideTargets.forEach((slide, i) => {
      slide.classList.toggle("hidden", i !== index)
    })

    this.indicatorTargets.forEach((indicator, i) => {
      if (i === index) {
        indicator.classList.add("bg-white")
        indicator.classList.remove("bg-white/50")
        indicator.setAttribute("aria-current", "true")
      } else {
        indicator.classList.add("bg-white/50")
        indicator.classList.remove("bg-white")
        indicator.setAttribute("aria-current", "false")
      }
    })
  }

  startAutoplay() {
    this.autoplayTimer = setInterval(() => {
      this.indexValue = (this.indexValue + 1) % this.slideTargets.length
    }, this.intervalValue)
  }

  stopAutoplay() {
    if (this.autoplayTimer) {
      clearInterval(this.autoplayTimer)
    }
  }
}