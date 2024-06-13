import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addbetspanier"
export default class extends Controller {
  static targets = ["team1", "team2", "cards", "display", "title_game", "team1_title", "team2_title", "img_team1", "img_team2", "odd", "match_input", "team_number", "img_rl", "img_lol", "img_valorant"]
  connect() {
    console.log("hello");
  }
  basket(event) {
    this.cardsTarget.style.gridTemplateColumns = "1fr 1fr"
    this.displayTarget.classList.remove("d-none")
    this.cardsTarget.style.width = "70%"
    const data = JSON.parse(event.currentTarget.parentNode.parentNode.dataset.match)
    this.title_gameTarget.innerText = data.game
    this.team1_titleTarget.innerText = data.team1.name
    this.team2_titleTarget.innerText = data.team2.name
    this.img_team1Target.setAttribute("src", data.team1.picture)
    this.img_team2Target.setAttribute("src", data.team2.picture)
    const teamNumber = event.currentTarget.dataset.teamNumber
    let odd = 0;
    if ( teamNumber === "1") {
      odd = data.team1.odd
    } else if ( teamNumber === "2") {
      odd = data.team2.odd
    }
    this.oddTarget.innerText = `côte ${odd}`
    this.match_inputTarget.value = data.id
    this.team_numberTarget.value = teamNumber

    console.log(data.game)

    if(data.game == "League of Legends") {
      this.img_rlTarget.classList.add("d-none")
      this.img_lolTarget.classList.remove("d-none")
      this.img_valorantTarget.classList.add("d-none")
    } else if (data.game == "Rocket League") {
      this.img_lolTarget.classList.add("d-none")
      this.img_rlTarget.classList.remove("d-none")
      this.img_valorantTarget.classList.add("d-none")
    } else {
      this.img_lolTarget.classList.add("d-none")
      this.img_rlTarget.classList.add("d-none")
      this.img_valorantTarget.classList.remove("d-none")
    }
  }


  send() {
    fetch()
  }
}
