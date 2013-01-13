importScripts('../data/swedish-word-list.js', 'word-maestro.js')

wm = @WordMaestro
messageHandler = (e) ->
  matchingWords = []
  if e.data.cmd is 'findPermutedAndShortendWord'
    matchingWords = wm.findPermutedAndShortendWord e.data.pattern
  else
    matchingWords = wm.findWord e.data.pattern
  postMessage({ matchingWords: matchingWords})

addEventListener('message', messageHandler)

