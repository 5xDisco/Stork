import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
// require("jquery");
import "@fortawesome/fontawesome-free/css/all";
import '@fortawesome/fontawesome-free/scss/solid';
import '@fortawesome/fontawesome-free/css/v4-shims';
import "../stylesheets/application"
import "../channels"
import '../spaces'
import "../controllers"
import "../page-layout"