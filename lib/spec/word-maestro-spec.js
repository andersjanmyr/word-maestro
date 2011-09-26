(function() {
  describe('findWord', function() {
    beforeEach(function() {
      return this.wm = window.WordMaestro;
    });
    return it('should find a matching word', function() {
      return expect(this.wm.findWord('elefant')).toBe('elefant');
    });
  });
}).call(this);
