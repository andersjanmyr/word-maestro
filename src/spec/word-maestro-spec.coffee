describe 'WordMaestro', ->
  beforeEach ->
    @wm = new WordMaestro(WORDS,
        'abcdefghijklmnoprstuvxyzåää',
        '138113231732312411143878444',
    )

  describe 'findWord', ->
    it 'should find a matching word', ->
      expect(@wm.findWord('elefanternas')).toEqual ['elefanternas']

    it 'should find matching words by regexp', ->
      expect(@wm.findWord('ele?anternas')).toEqual ['elefanternas', 'eleganternas']

  describe 'permuteWord', ->
    it 'should return [ab, ba] for ab', ->
      expect(@wm.permuteWord('ab')).toEqual ['ab', 'ba']

    it 'should return an array with length 6', ->
      expect(@wm.permuteWord('abc').length).toBe 6

  describe 'findPermutedWord', ->
    it 'should return [tax] for xat', ->
      expect(@wm.findPermutedWord('xat')).toEqual ['tax']

    it 'should return an array with length 5 for xat?', ->
      expect(@wm.findPermutedWord('xat?').length).toBe 5

    it 'should return 18 words for ka?o', ->
      expect(@wm.findPermutedWord('ka?o').length).toBe 18
    
  describe 'binarySearch', ->
    it 'should return a number for rederi', ->
      expect(@wm.binarySearch(WORDS, 'rederi')).toBeGreaterThan -1

  describe 'expandPattern', ->
    it 'should return an array with length 27 for one a?', ->
      expect(@wm.expandPattern('a?').length).toBe 27

    it 'should return an array with length 27*27 for ?a?', ->
      expect(@wm.expandPattern('?a?').length).toBe 27*27

  describe 'shortenWord', ->
    it 'should return [ab, ba, a b] for ab', ->
      expect(@wm.shortenWord('ab')).toEqual ['ab', 'b', 'a']

    it 'should return an array with length 6 for abc', ->
      expect(@wm.shortenWord('abc').length).toBe 7

  describe 'findPermutedAndShortendWord', ->
    it 'should return [tax, ax, ta] for xat', ->
      expect(@wm.findPermutedAndShortendWord('xat')).toEqual ['tax', 'ax', 'ta']

  describe 'findPermutedAndShortendWordSlow', ->
    it 'should return ten words  for andersek', ->
      expect(@wm.findPermutedAndShortendWord('andersek').length).toEqual 10

  describe 'calcWordValue', ->
    it 'should return 12 for zoo', ->
      expect(@wm.calcWordValue('zoo')).toEqual 12

