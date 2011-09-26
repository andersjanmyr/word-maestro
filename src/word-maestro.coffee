WordMaestro = 

  findWord: (pattern) ->
    console.log pattern
    regex = new RegExp(pattern, 'i')
    $.grep WORDS, (word) ->
      regex.test word


window.WordMaestro = WordMaestro

