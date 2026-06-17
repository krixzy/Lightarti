import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="folder-form-removel"
export default class extends Controller {
  static values = {
  id: String
  }
  remove() {
    document.getElementById(this.idValue).remove()
  }
}
