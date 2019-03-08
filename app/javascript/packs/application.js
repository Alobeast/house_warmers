import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();


// var preloadedScript = document.createElement("script");
// preloadedScript.src = "application.js";
// document.body.appendChild(preloadedScript);

const node = document.querySelector(".home-banner");

if(node) {
  const nextImage = () => {
    const activeImage = document.querySelector(".home-banner.active")
    activeImage.classList.toggle("active")
    let next = activeImage.nextElementSibling
    if (!next) {
      next = document.querySelector('.home-banner')
    }
    next.classList.toggle("active")
  }

  setInterval(nextImage, 600)
}
