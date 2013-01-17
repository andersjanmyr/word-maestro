importScripts('../data/swedish-word-list.js', 'word-maestro.js')

wm = new @WordMaestro(WORDS,
    'abcdefghijklmnoprstuvxyzåäö',
    '138113231732312411143878444',
)
messageHandler = (e) ->
  matchingWords = []
  if e.data.cmd is 'findPermutedAndShortendWord'
    matchingWords = wm.findPermutedAndShortendWord e.data.pattern
  else
    matchingWords = wm.findWord e.data.pattern
  postMessage({ matchingWords: matchingWords})

addEventListener('message', messageHandler)

