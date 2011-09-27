(function() {
  var WordMaestro;
  var __indexOf = Array.prototype.indexOf || function(item) {
    for (var i = 0, l = this.length; i < l; i++) {
      if (this[i] === item) return i;
    }
    return -1;
  };
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
    },
    flatten: function(wordss) {
      return [].concat.apply([], wordss);
    },
    unique: function(list) {
      var key, len, output, value, _results;
      output = {};
      len = list.length;
      for (key = 0; 0 <= len ? key < len : key > len; 0 <= len ? key++ : key--) {
        output[list[key]] = list[key];
      }
      _results = [];
      for (key in output) {
        value = output[key];
        _results.push(value);
      }
      return _results;
    },
    findPermutedWord: function(word) {
      var perm, permutations, words, wordss;
      permutations = this.unique(this.permuteWord(word));
      console.log(permutations.length);
      if (__indexOf.call(word, '.') >= 0) {
        wordss = (function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = permutations.length; _i < _len; _i++) {
            perm = permutations[_i];
            _results.push(this.findWord("^" + perm + "$"));
          }
          return _results;
        }).call(this);
        console.log('done');
        return this.unique(this.flatten(wordss));
      } else {
        return words = (function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = permutations.length; _i < _len; _i++) {
            perm = permutations[_i];
            if (this.binarySearch(WORDS, perm) > 0) {
              _results.push(perm);
            }
          }
          return _results;
        }).call(this);
      }
    },
    binarySearch: function(items, value) {
      var pivot, start, stop;
      start = 0;
      stop = items.length - 1;
      pivot = Math.floor((start + stop) / 2);
      while (items[pivot] !== value && start < stop) {
        if (value < items[pivot]) {
          stop = pivot - 1;
        }
        if (value > items[pivot]) {
          start = pivot + 1;
        }
        pivot = Math.floor((stop + start) / 2);
      }
      if (items[pivot] === value) {
        return pivot;
      } else {
        return -1;
      }
    }
  };
  window.WordMaestro = WordMaestro;
}).call(this);
