
@addMessageHandler = (context, delegate) ->
  messageHandler = (e) ->
    matchingWords = delegate[e.data.cmd](e.data.pattern)
    context.postMessage({ matchingWords: matchingWords})

  context.addEventListener('message', messageHandler)


