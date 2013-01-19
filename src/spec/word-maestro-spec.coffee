describe 'WordMaestro', ->
  beforeEach ->
    @wm = new WordMaestro(WORDS,
        'abcdefghijklmnoprstuvxyzåäö',
        '138113231732312411143878444',
    )

  describe 'findWord', ->
    it 'should find a matching word', ->
      expect(@wm.findWord('elefanternas')).toEqual ['elefanternas']
    it 'should find a matching word with ö', ->
      expect(@wm.findWord('ödla')).toEqual ['ödla']
    it 'should find matching words by regexp', ->
      expect(@wm.findWord('ele???ternas')).toEqual ['elefanternas', 'eleganternas']

  describe 'grepWord', ->
    it 'should find a matching word', ->
      expect(@wm.grepWord('elefanternas')).toEqual ['elefanternas']
    it 'should find a matching word with ö', ->
      expect(@wm.grepWord('ödla')).toEqual ['ödla']
    it 'should find matching words by regexp', ->
      expect(@wm.grepWord('ele???ternas')).toEqual ['elefanternas', 'eleganternas']

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
    it 'should return [ab, b a] for ab', ->
      expect(@wm.shortenWord('ab')).toEqual ['ab', 'b', 'a']

    it 'should return an array with length 7 for abc', ->
      expect(@wm.shortenWord('abc').length).toBe 7

  describe 'findPermutedAndShortendWord', ->
    it 'should return permutations for xat', ->
      expect(@wm.findPermutedAndShortendWord('xat')).toEqual ['tax (10)', 'ax (9)', 'ta (2)']

  describe 'findPermutedAndShortendWordLong', ->
    it 'should return ten (max) words for andersek', ->
      expect(@wm.findPermutedAndShortendWord('andersek').length).toEqual 10

  describe 'findPermutedAndShortendWordö', ->
    it 'should return permutations for ödla', ->
      expect(@wm.findPermutedAndShortendWord('ödla').length).toEqual 8

  describe 'calcWordValue', ->
    it 'should return 12 for zoo', ->
      expect(@wm.calcWordValue('zoo')).toEqual 12

