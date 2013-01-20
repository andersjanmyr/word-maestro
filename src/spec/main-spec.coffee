describe 'main', ->
  main = window.mainTest
  describe 'capitalize', ->
    it 'capitalizes a word', ->
      expect(main.capitalize('elefant')).toEqual 'Elefant'

