// Generated by CoffeeScript 1.4.0
(function() {
  var wm;

  importScripts('../data/english-word-list.js', 'word-maestro.js', 'messageHandler.js');

  wm = new this.WordMaestro(WORDS, 'abcdefghijklmnopqrstuvwxyz', '144214341A513114A11124484A');

  this.addMessageHandler(this, wm);

}).call(this);