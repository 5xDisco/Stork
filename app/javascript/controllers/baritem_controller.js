import { Controller } from "stimulus";

export default class extends Controller {
    static targets = [ "center","menu","menuoptions" ]

    connect() {

        const menu =  this.menuTarget;
        const menuOption =  this.menuoptionsTarget;
        let menuVisible = false;
        
        this.centerTarget.addEventListener("contextmenu", e => {
            
                e.preventDefault();
                const origin = {
                    left: e.pageX,
                    top: e.pageY
                  };

                  if(e.target.id == "item"){
                    setPosition(origin);
                  }
                  return false;
            
          });
          
          const hideMenu = ()=>{
            if (menuVisible) toggleMenu("hide");
          };

          window.addEventListener("click", e => {
            hideMenu();
          });

          const toggleMenu = command => {
              
              menu.style.display = command === "show" ? "block" : "none";
              menuVisible = !menuVisible;
            };
            
            const setPosition = ({ top, left }) => {
              menu.style.left = `${left}px`;
              menu.style.top = `${top}px`;
              toggleMenu("show");
            };

            window.addEventListener("click", e => {
                hideMenu();
              });
            
            menuOption.addEventListener("click", e => {
                hideMenu();
                console.log("mouse-option", e.target.innerHTML);
            });
    }
}