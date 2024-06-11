import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addbetspanier"
export default class extends Controller {
  static targets = ["team1", "team2"]
  connect() {
    console.log("hello");
  }
 basket(){

  this.team1Target.classList.add("")
 }
}
