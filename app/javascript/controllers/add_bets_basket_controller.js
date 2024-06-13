import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="addbetspanier"
export default class extends Controller {
  static targets = ["team1", "team2", "cards", "display", "title_game", "team1_title", "team2_title", "img_team1","img_team2" ]
  connect() {
    console.log("hello");
  }
 basket(event){
  console.log(this.displayTarget)
  this.cardsTarget.style.gridTemplateColumns = "1fr 1fr"
  this.displayTarget.classList.remove("d-none")
  this.cardsTarget.style.width = "70%"
  console.log(event.currentTarget.parentNode.parentNode.dataset)
  const data = JSON.parse(event.currentTarget.parentNode.parentNode.dataset.match)
  this.title_gameTarget.innerText = data.game
  this.team1_titleTarget.innerText = data.team1.name
  this.team2_titleTarget.innerText = data.team2.name
  this.img_team1Target.setAttribute("src", data.team1.picture)
  this.img_team2Target.setAttribute("src", data.team2.picture)

 }
}
