import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
initMapbox();


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


if (document.querySelector('.flats.index')) {
  window.hilightMarker = (id) => {
    document.querySelector('.marker-' + id).classList.add('active')
  }
  window.unhilightMarker = (id) => {
    document.querySelector('.marker-' + id).classList.remove('active')
  }
}
