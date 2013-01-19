importScripts('../data/swedish-word-list.js', 'word-maestro.js', 'messageHandler.js')

wm = new @WordMaestro(WORDS,
    'abcdefghijklmnoprstuvxyzåäö',
    '138113231732312411143878444',
)
@addMessageHandler(this, wm)
