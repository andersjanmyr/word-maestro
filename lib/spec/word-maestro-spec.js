(function() {
  describe('WordMaestro', function() {
    beforeEach(function() {
      return this.wm = window.WordMaestro;
    });
    describe('findWord', function() {
      it('should find a matching word', function() {
        return expect(this.wm.findWord('elefanternas')).toEqual(['elefanternas']);
      });
      return it('should find matching words by regexp', function() {
        console.log(this.wm);
        return expect(this.wm.findWord('ele.anternas')).toEqual(['elefanternas', 'eleganternas']);
      });
    });
    describe('permuteWord', function() {
      it('should return [ab, ba] for ab', function() {
        return expect(this.wm.permuteWord('ab')).toEqual(['ab', 'ba']);
      });
      return it('should return [abc... cba]', function() {
        return expect(this.wm.permuteWord('abc').length).toBe(6);
      });
    });
    describe('findPermutedWord', function() {
      it('should return [tax] for xat', function() {
        return expect(this.wm.findPermutedWord('xat')).toEqual(['tax']);
      });
      it('should return [tax] for xat.', function() {
        return expect(this.wm.findPermutedWord('xat.').length).toBe(5);
      });
      return it('should return many words for ka.o', function() {
        return expect(this.wm.findPermutedWord('ka.o').length).toBe(18);
      });
    });
    describe('binarySearch', function() {
      return it('should return a number for rederi', function() {
        return expect(this.wm.binarySearch(WORDS, 'rederi')).toBeGreaterThan(-1);
      });
    });
    describe('expandPattern', function() {
      it('should return an array with length 29 for one .', function() {
        return expect(this.wm.expandPattern('a.').length).toBe(29);
      });
      return it('should return an array with length 29*29 for one .', function() {
        return expect(this.wm.expandPattern('.a.').length).toBe(29 * 29);
      });
    });
    return describe('shortenWord', function() {
      it('should return [ab, ba, a b] for ab', function() {
        return expect(this.wm.shortenWord('ab')).toEqual(['ab', 'b', 'a']);
      });
      return it('should return an array with length 6 for abc', function() {
        return expect(this.wm.shortenWord('abc').length).toBe(7);
      });
    });
  });
}).call(this);
