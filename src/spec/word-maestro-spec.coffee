describe 'findWord', ->
  beforeEach ->
    @wm = window.WordMaestro

  it 'should find a matching word', ->
    console.log @wm
    expect(@wm.findWord('elefant')).toBe 'elefant'

