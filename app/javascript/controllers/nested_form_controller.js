import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["links", "template"];

  connect() {
    console.log(this.targets);
  }

  add_association(event) {
    event.preventDefault();
    console.log(this);
    console.log(this.hasTemplateTarget);

    // var content = this.templateTarget.innerHTML.replace(
    //   /NEW_RECORD/g,
    //   new Date().getTime()
    // );

    // this.linksTarget.insertAdjacentHTML("beforebegin", content);
  }
}
