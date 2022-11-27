import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    
  }
  popup(event) {
    console.log(event.params.time)
    let minutes = parseInt(event.params.time);
    if(minutes !== 0) {
      minutes = minutes % 60;
      let hours = Math.floor(parseInt(event.params.time) /60);
      alert(event.params.technician + " has " + hours + " hours and " + minutes + " minutes free before their next appointment.");
    }
  }
}
