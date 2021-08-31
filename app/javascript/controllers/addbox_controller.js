import { Controller } from "stimulus";

export default class extends Controller {
    static targets = [ "page" ]

    connect() {
        console.log("hello from StimulusJS")
    }

    close(){
        console.log(this.pageTarget);
        console.log(this.pageTarget.classList.add('close-page'));
    }
}