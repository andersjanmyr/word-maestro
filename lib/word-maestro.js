(function() {
  var WordMaestro;
  WordMaestro = {
    findWord: function(pattern) {
      var regex;
      regex = new RegExp(pattern, 'i');
      return $.grep(WORDS, function(word) {
        return regex.test(word);
      });
    },
    permuteWord: function(word) {
      var permArr, permute, usedChars;
      permArr = [];
      usedChars = [];
      permute = function(word) {
        var ch, chars, i, len, _results;
        if (word === '') {
          return;
        }
        chars = word.split('');
        len = chars.length;
        _results = [];
        for (i = 0; 0 <= len ? i < len : i > len; 0 <= len ? i++ : i--) {
          ch = chars.splice(i, 1)[0];
          usedChars.push(ch);
          if (chars.length === 0) {
            permArr.push(usedChars.join(""));
          }
          permute(chars.join(''));
          chars.splice(i, 0, ch);
          _results.push(usedChars.pop());
        }
        return _results;
      };
      permute(word);
      return permArr;
    }
  };
  window.WordMaestro = WordMaestro;
}).call(this);
