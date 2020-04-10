'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/manifest.json": "d7ef05a93b361570ba5855a8847fd6ad",
"/assets/LICENSE": "e02ba7432846744ce9b961df7e71be15",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/packages/open_iconic_flutter/assets/open-iconic.woff": "3cf97837524dd7445e9d1462e3c4afe2",
"/assets/assets/images/twitter.png": "d39c18c21b2e8556ee0ef1a94ac2b583",
"/assets/assets/images/vid.mp4": "5b778d1eb18552ef17054be4bfe0c15f",
"/assets/assets/images/image.jpg": "1f6de7457259ecd47f86a6672064f10b",
"/assets/assets/images/youtube.png": "6b07b2faffe4564a32ca54209d16e67d",
"/assets/assets/images/facebook.png": "58d3ed76bdbc10dc4dcd53f312f26f96",
"/assets/assets/images/image.png": "22890a6110aeb0e6736579350e8834be",
"/assets/AssetManifest.json": "4b5943bb8bcc9cf1444707ee67cd30ab",
"/assets/FontManifest.json": "96880f5cbd12a15751331cdbdac93202",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/index.html": "378e0c9fdce60808154a5dfa36cf7b96",
"/main.dart.js": "a706f2fb014d73a78a6d3a24c19ae042"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
