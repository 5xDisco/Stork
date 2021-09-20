import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["center", "menu", "deletepath", "editpath"];

  menu(e) {
    e.preventDefault();

    const changelinkid = (id) => {
      let idAry = id.split(",");

      console.log("leave channel id"  id); // channel id 用於變更 linkpath 物件 hrer 網址
      this.deletepathTarget.href = `/spaces/${idAry[0]}/leave/${idAry[1]}`;
      this.editpathTarget.href = `/spaces/${idAry[0]}/channels/${idAry[1]}/edit`;
    };

    const setPosition = ({ top, left }) => {
      menu.style.left = `${left}px`;
      menu.style.top = `${top}px`;

      toggleMenu("show");
    };

    const origin = {
      left: e.pageX,
      top: e.pageY,
    };

    if (e.target.id == "item") {
      changelinkid(e.target.dataset.chanid);
      setPosition(origin);
     }

    return false;
  }

  connect() {
    const menu = this.menuTarget;
    //const menuOption =  this.menuoptionsTarget;
    let menuVisible = false;

    const hideMenu = () => {
      if (menuVisible) toggleMenu("hide");
    };

    window.addEventListener("click", (e) => {
      hideMenu();
    });

    const toggleMenu = (command) => {
      menu.style.display = command === "show" ? "block" : "none";
      menuVisible = !menuVisible;
    };
  }

