describe 'findWord', ->
  beforeEach ->
    @wm = window.WordMaestro

  it 'should find a matching word', ->
    expect(@wm.findWord('elefanternas')).toEqual ['elefanternas']

  it 'should find matching words by regexp', ->
    console.log @wm
    expect(@wm.findWord('ele.anternas')).toEqual ['elefanternas', 'eleganternas']

