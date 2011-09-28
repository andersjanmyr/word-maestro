(function() {
  var WordMaestro;
  WordMaestro = {
    findWord: function(pattern) {
      var found, word, words;
      words = this.expandPattern(pattern);
      found = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = words.length; _i < _len; _i++) {
          word = words[_i];
          if (this.binarySearch(WORDS, word) > 0) {
            _results.push(word);
          }
        }
        return _results;
      }).call(this);
      return found;
    },
    expandPattern: function(pattern) {
      var alfabet, expand, words;
      words = [];
      alfabet = 'abcdefghijklmnopqrstuvwxyzåäö';
      expand = function(pattern) {
        var chars, i, j, len, newPattern, _results;
        if (pattern.indexOf('.') === -1) {
          words.push(pattern);
          return;
        }
        chars = pattern.split('');
        len = chars.length;
        _results = [];
        for (i = 0; 0 <= len ? i < len : i > len; 0 <= len ? i++ : i--) {
          _results.push((function() {
            var _results2;
            if (chars[i] === '.') {
              _results2 = [];
              for (j = 0; j < 29; j++) {
                chars.splice(i, 1, alfabet[j]);
                newPattern = chars.join('');
                _results2.push(expand(newPattern));
              }
              return _results2;
            }
          })());
        }
        return _results;
      };
      expand(pattern);
      return this.unique(words);
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
    binarySearch: function(items, value) {
      var pivot, start, stop;
      value = value.toLowerCase();
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
    },
    flatten: function(wordss) {
      return [].concat.apply([], wordss);
    },
    findPermutedWord: function(word) {
      var perm, permutations, wordss;
      permutations = this.unique(this.permuteWord(word));
      console.log(permutations.length);
      wordss = (function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = permutations.length; _i < _len; _i++) {
          perm = permutations[_i];
          _results.push(this.findWord(perm));
        }
        return _results;
      }).call(this);
      console.log('done');
      return this.unique(this.flatten(wordss));
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
