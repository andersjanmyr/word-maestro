(function() {
  var WordMaestro;
  WordMaestro = {
    findWord: function(pattern) {
      var regex;
      console.log(pattern);
      regex = new RegExp(pattern);
      return $.grep(WORDS, function(word) {
        return regex.test(word);
      });
    }
  };
  window.WordMaestro = WordMaestro;
}).call(this);
