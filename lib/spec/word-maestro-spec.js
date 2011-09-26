(function() {
  describe('findWord', function() {
    beforeEach(function() {
      return this.wm = window.WordMaestro;
    });
    it('should find a matching word', function() {
      return expect(this.wm.findWord('elefanternas')).toEqual(['elefanternas']);
    });
    return it('should find matching words by regexp', function() {
      console.log(this.wm);
      return expect(this.wm.findWord('ele.anternas')).toEqual(['elefanternas', 'eleganternas']);
    });
  });
}).call(this);
