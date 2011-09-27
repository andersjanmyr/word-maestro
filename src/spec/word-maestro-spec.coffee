describe 'WordMaestro', ->
  beforeEach ->
    @wm = window.WordMaestro

  describe 'findWord', ->
    it 'should find a matching word', ->
      expect(@wm.findWord('elefanternas')).toEqual ['elefanternas']

    it 'should find matching words by regexp', ->
      console.log @wm
      expect(@wm.findWord('ele.anternas')).toEqual ['elefanternas', 'eleganternas']

  describe 'permuteWord', ->
    it 'should return [ab, ba] for ab', ->
      expect(@wm.permuteWord('ab')).toEqual ['ab', 'ba']

    it 'should return [abc... cba]', ->
      expect(@wm.permuteWord('abc').length).toBe 6



