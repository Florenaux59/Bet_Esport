import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="games"
export default class extends Controller {
  static targets = ["rocket", "lol", "valorant", "games"]
  connect() {
    console.log(this.valorantTarget)
  }

  lol(){
    this.lolTarget.classList.add("active_lol")
    this.rocketTarget.classList.remove("active_rocket")
    this.valorantTarget.classList.remove("active_valorant")
    this.gamesTarget.classList.remove("change_background")
    this.rocketTarget.classList.remove("border_rocket_right")
    this.rocketTarget.classList.add("border_rocket_left")

  }
  rocket(){
    this.lolTarget.classList.remove("active_lol")
    this.rocketTarget.classList.add("active_rocket")
    this.valorantTarget.classList.remove("active_valorant")
    this.gamesTarget.classList.add("change_background")
  }

  valorant() {
    this.lolTarget.classList.remove("active_lol")
    this.rocketTarget.classList.remove("active_rocket")
    this.valorantTarget.classList.add("active_valorant")
    this.rocketTarget.classList.add("border_rocket_right")
    this.rocketTarget.classList.remove("border_rocket_left")
    this.gamesTarget.classList.remove("change_background")
    this.gamesTarget.classList.remove("border_rocket_left").removeAttribute("disabled");
  }

}
