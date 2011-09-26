(function() {
  $(function() {
    var wm;
    wm = WordMaestro;
    return $('#pattern').change(function() {
      var html, matching_words, pattern, word;
      pattern = $('#pattern').val();
      matching_words = wm.findWord("^" + pattern + "$");
      if (matching_words.length > 10) {
        matching_words = matching_words.slice(0, 10);
      }
      html = ((function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = matching_words.length; _i < _len; _i++) {
          word = matching_words[_i];
          _results.push("<li>" + word + "</li>");
        }
        return _results;
      })()).join('\n');
      return $('#matching-words').empty().html(html).listview('refresh');
    });
  });
}).call(this);
