WordMaestro = 

  findWord: (pattern) ->
    console.log pattern
    regex = new RegExp(pattern)
    $.grep WORDS, (word) ->
      regex.test word


window.WordMaestro = WordMaestro

