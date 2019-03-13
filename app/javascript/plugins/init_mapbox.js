import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import 'mapbox-gl/dist/mapbox-gl.css';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const el = document.createElement('i');
    el.className = 'fas fa-map-marker-alt fa-3x marker marker-' + marker.id;

    new mapboxgl.Marker(el)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};


const addFriendMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const el = document.createElement('i');
    el.className = 'fab fa-facebook-square fa-3x marker marker-' + marker.id;

    new mapboxgl.Marker(el)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));

  map.fitBounds(bounds, { padding: 50, maxZoom: 19 });

  map.scrollZoom.disable();
};


const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    if (mapElement.dataset.friendsCloseMarkers) {
    const friend_markers = JSON.parse(mapElement.dataset.friendsCloseMarkers);
    addFriendMarkersToMap(map, friend_markers);
    }
    fitMapToMarkers(map, markers);
    addMarkersToMap(map, markers);
    // fitMapToMarkers(map, friend_markers);

  }
};

// const initMapbox = () => {
//   if (mapElement) {
//     const map = buildMap();
//     const markers = JSON.parse(mapElement.dataset.markers);
//     fitMapToMarkers(map, markers);
//     addMarkersToMap(map, markers);

//   }
// };


export { initMapbox };
