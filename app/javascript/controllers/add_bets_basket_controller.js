import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addbetspanier"
export default class extends Controller {
  static targets = ["team1", "team2", "cards", "display"]
  connect() {
    console.log("hello");
  }
 basket(){
  console.log(this.displayTarget)
  this.cardsTarget.style.gridTemplateColumns = "1fr 1fr"
  this.displayTarget.classList.remove("d-none")
 }
}
