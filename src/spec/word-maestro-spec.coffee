describe 'findWord', ->
  beforeEach ->
    @wm = window.WordMaestro

  it 'should find a matching word', ->
   expect(@wm.findWord('elefant')).toBe 'elefant'

