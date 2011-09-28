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

  describe 'findPermutedWord', ->
    it 'should return [tax] for xat', ->
      expect(@wm.findPermutedWord('xat')).toEqual ['tax']

    it 'should return [tax] for xat.', ->
      expect(@wm.findPermutedWord('xat.').length).toBe 5

    it 'should return many words for ka.o', ->
      expect(@wm.findPermutedWord('ka.o').length).toBe 18
    
  describe 'binarySearch', ->
    it 'should return a number for rederi', ->
      expect(@wm.binarySearch(WORDS, 'rederi')).toBeGreaterThan -1

  describe 'expandPattern', ->
    it 'should return an array with length 29 for one .', ->
      expect(@wm.expandPattern('a.').length).toBe 29

    it 'should return an array with length 29*29 for one .', ->
      expect(@wm.expandPattern('.a.').length).toBe 29*29

  describe 'shortenWord', ->
    it 'should return [ab, ba, a b] for ab', ->
      expect(@wm.shortenWord('ab')).toEqual ['ab', 'b', 'a']

    it 'should return an array with length 6 for abc', ->
      expect(@wm.shortenWord('abc').length).toBe 7


