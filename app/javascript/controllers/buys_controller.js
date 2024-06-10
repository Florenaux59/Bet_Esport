import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="buys"
export default class extends Controller {
  static targets = ["validate"]

  validate(){
    `${current_user.bank -= this.Item.price}`
  }
}
