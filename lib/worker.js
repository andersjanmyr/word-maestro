// Generated by CoffeeScript 1.8.0
(function() {
  var wm;

  importScripts('../data/swedish-word-list.js', 'word-maestro.js', 'messageHandler.js');

  wm = new this.WordMaestro(WORDS, 'abcdefghijklmnoprstuvxyzåäö', '138113231732312411143878444');

  this.addMessageHandler(this, wm);

}).call(this);
