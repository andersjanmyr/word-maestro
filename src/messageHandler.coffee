
@addMessageHandler = (context, wm) ->
  messageHandler = (e) ->
    matchingWords = []
    if e.data.cmd is 'findPermutedAndShortendWord'
      matchingWords = wm.findPermutedAndShortendWord e.data.pattern
    else
      matchingWords = wm.findWord e.data.pattern
    context.postMessage({ matchingWords: matchingWords})

  context.addEventListener('message', messageHandler)


