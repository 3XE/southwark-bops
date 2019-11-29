const L = require("leaflet")

/* shamelessly copied from smpa-frontend */
export function map_init(id, geojson, options = {})
{
  var map = L.map(id).setView([51.505, -0.09], 13);

  var Mapbox_Basemap = L.tileLayer('https://api.mapbox.com/styles/v1/hackneygis/cjk8lmw5r9mlz2sohv2n6xnfq/tiles/256/{z}/{x}/{y}?access_token={accessToken}', {
    maxZoom: 18,
    opacity: 1.0,
    attribution: 'Contains OS data © Crown copyright and database right (2018) - Licensed under the Open Government Licence',
    accessToken: options.mapbox_access_token
  }).addTo(map);

  map.addLayer(Mapbox_Basemap);

  var overlay_OSMM_light_1 = L.tileLayer.wms("https://map.hackney.gov.uk/geoserver/wms", {
    layers: 'osmm:OSMM_outdoor',
    format: 'image/png',
    uppercase: true,
    transparent: true,
    continuousWorld : true,
    tiled: true,
    info_format: 'text/html',
    opacity: 1,
    identify: false,
    minZoom: 10,
    maxZoom: 20
  });

  map.addLayer(overlay_OSMM_light_1);

  function style_BLPU() {
    return {
      pane: 'pane_BLPU',
      opacity: 0.5,
      color: 'rgba(255,0,0,1.0)',
      dashArray: '',
      lineCap: 'butt',
      lineJoin: 'miter',
      weight: 4.0,
      fill: true,
      fillOpacity: 1,
      fillColor: 'rgba(222,80,58,0.0)',
    }
  }
  map.createPane('pane_BLPU');

  var layer_BLPU = L.geoJson(null, {
    attribution: '<a href=""></a>',
    style: style_BLPU,
    pane: 'pane_BLPU',
  });

  layer_BLPU.addData(geojson);

  if (layer_BLPU.getLayers().length>0){
    map.fitBounds(layer_BLPU.getBounds());
  }
  else {
    map.setView([51.545032, -0.056434], 15);
  }

  map.addLayer(layer_BLPU);

  var treesOrdersPointsLayers = L.tileLayer.wms('https://map.hackney.gov.uk/geoserver/wms/', {
    layers: 'lbhdesign:Tree Preservation Orders Points',
    transparent: true,
    format: 'image/png',
    maxZoom: 20
  });

  map.addLayer(treesOrdersPointsLayers);

  var treesOrdersPointsAreas = L.tileLayer.wms('https://map.hackney.gov.uk/geoserver/wms/', {
    layers: 'lbhdesign:Tree Preservation Orders Areas',
    transparent: true,
    format: 'image/png',
    maxZoom: 20
  });

  map.addLayer(treesOrdersPointsAreas);

  var conservationAreas = L.tileLayer.wms('https://map.hackney.gov.uk/geoserver/wms/', {
    layers: 'lbhdesign:PLA Conservation Area',
    transparent: true,
    format: 'image/png',
    maxZoom: 20
  });

  map.addLayer(conservationAreas);

  var locallyListedBuildings = L.tileLayer.wms('https://map.hackney.gov.uk/geoserver/wms/', {
    layers: 'lbhdesign:Locally Listed Building',
    transparent: true,
    format: 'image/png',
    maxZoom: 20
  });

  map.addLayer(locallyListedBuildings);

  var statuaryListedBuildings = L.tileLayer.wms('https://map.hackney.gov.uk/geoserver/wms/', {
    layers: 'lbhdesign:Statutory Listed Buildings',
    transparent: true,
    format: 'image/png',
    maxZoom: 20
  });

  map.addLayer(statuaryListedBuildings);
}
