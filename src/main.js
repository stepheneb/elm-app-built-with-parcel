import './main.scss'

const removeFileExtension = (str) => str.replace(/\.(png|jpe?g|svg|gif)$/, '');

const toDashes = (str) => str.replace('_', '-');

const toCamelCase = (str) => str.replace(/(?:^\w|[A-Z]|\b\w)/g, (ltr, idx) => idx === 0 ? ltr.toLowerCase() : ltr.toUpperCase()).replace(/(\s|\W)+/g, '');

const toElmName = (str) => toCamelCase(toDashes(removeFileExtension(str)));

const isString = (a) => { return typeof a === "string" };

function convertPaths(imagePaths) {
  let images = {};
  let imageTypeMatcher = RegExp("(png|jpg|jpeg|gif|svg)");
  Object.keys(imagePaths).forEach(function(key) {
    if (isString(imagePaths[key])) {
      images[toElmName(key)] = imagePaths[key];
    } else {
      let imageType = Object.keys(imagePaths[key])[0];
      if (imageTypeMatcher.test(imageType)) {
        images[toElmName(key)] = imagePaths[key][imageType]
      }
    }
  })
  return images;
}

// Tell Parcel this JS file uses the images in ../assets/images
// image names are converted to 'camelCase' and file suffixes are removed
const imagePaths = require('../assets/images/*.*');
const images = convertPaths(imagePaths)

const { Elm } = require('./Main.elm');

Elm.Main.init({
  node: document.querySelector('main'),
  flags: images
});
