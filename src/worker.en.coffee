importScripts('../data/english-word-list.js', 'word-maestro.js', 'messageHandler.js')

wm = new @WordMaestro(WORDS,
    'abcdefghijklmnopqrstuvwxyz',
    '144214341A513114A11124484A',
)
@addMessageHandler(this, wm)
