import { Controller } from "stimulus";

export default class extends Controller {
    static targets = [ "page" ]

    connect() {
        console.log(`new.js.erb do stimulus js`);
    }

    close(){
        this.pageTarget.remove();
        console.log(`new.js.erb destory self`)
    }
}