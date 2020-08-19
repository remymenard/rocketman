// Register an event listener to be called when the page is loaded.
window.addEventListener("load", eventWindowLoaded, false);

// Define the event listener to initialize Web WorldWind.
function eventWindowLoaded() {
  // Create a WorldWindow for the canvas.
  var wwd = new WorldWind.WorldWindow("canvasOne");
  // Add some image layers to the WorldWindow's globe.
  wwd.addLayer(new WorldWind.BMNGOneImageLayer());
  wwd.addLayer(new WorldWind.BMNGLandsatLayer());
  let location = new WorldWind.Location(47.317520, -2.188230);
  // Go to the posiion
  wwd.goTo(location);

  let cards = document.querySelectorAll(".rocket-card");

  placeAllMarkers(cards, wwd);
  cards.forEach((card) => {
    card.addEventListener("mouseenter", () => {
      // Create the custom image for the placemark with a 2D canvas.


      // Create a layer manager for controlling layer visibility.
      wwd.goTo(new WorldWind.Location(card.dataset.latitude, card.dataset.longitude));
    })
  })

  //PLACEMENT DE TOUS LES MARQUEURS

}

function placeAllMarkers(cards, wwd) {
  var canvas = document.createElement("canvas"),
    ctx2d = canvas.getContext("2d"),
    size = 64,
    c = size / 2 - 0.5,
    innerRadius = 5,
    outerRadius = 20;

  canvas.width = size;
  canvas.height = size;

  var gradient = ctx2d.createRadialGradient(c, c, innerRadius, c, c, outerRadius);
  gradient.addColorStop(0, 'rgb(255, 0, 0)');
  gradient.addColorStop(0.5, 'rgb(0, 255, 0)');
  gradient.addColorStop(1, 'rgb(255, 0, 0)');

  ctx2d.fillStyle = gradient;
  ctx2d.arc(c, c, outerRadius, 0, 2 * Math.PI, false);
  ctx2d.fill();

  // Set placemark attributes.
  var placemarkAttributes = new WorldWind.PlacemarkAttributes(null);
  // Wrap the canvas created above in an ImageSource object to specify it as the placemarkAttributes image source.
  placemarkAttributes.imageSource = new WorldWind.ImageSource(canvas);
  // Define the pivot point for the placemark at the center of its image source.
  placemarkAttributes.imageOffset = new WorldWind.Offset(WorldWind.OFFSET_FRACTION, 0.5, WorldWind.OFFSET_FRACTION, 0.5);
  placemarkAttributes.imageScale = 1;
  placemarkAttributes.imageColor = WorldWind.Color.WHITE;

  // Set placemark highlight attributes.
  // Note that the normal attributes are specified as the default highlight attributes so that all properties
  // are identical except the image scale. You could instead vary the color, image, or other property
  // to control the highlight representation.
  var highlightAttributes = new WorldWind.PlacemarkAttributes(placemarkAttributes);
  highlightAttributes.imageScale = 1.2;

  // Create the placemark with the attributes defined above.


  // Now set up to handle highlighting.
  var highlightController = new WorldWind.HighlightController(wwd);
  cards.forEach((card) => {
    var placemarkPosition = new WorldWind.Position(card.dataset.latitude, card.dataset.longitude, 1e2);
    var placemark = new WorldWind.Placemark(placemarkPosition, false, placemarkAttributes);
    // Draw placemark at altitude defined above, relative to the terrain.
    placemark.altitudeMode = WorldWind.RELATIVE_TO_GROUND;
    // Assign highlight attributes for the placemark.
    placemark.highlightAttributes = highlightAttributes;

    // Create the renderable layer for placemarks.
    var placemarkLayer = new WorldWind.RenderableLayer("Custom Placemark");

    // Add the placemark to the layer.
    placemarkLayer.addRenderable(placemark);

    // Add the placemarks layer to the WorldWindow's layer list.
    wwd.addLayer(placemarkLayer);
  })
}
