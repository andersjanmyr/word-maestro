WordMaestro = 

  findWord: (pattern) ->
    regex = new RegExp(pattern, 'i')
    $.grep WORDS, (word) ->
      regex.test word

  permuteWord: (word) ->
    permArr = []
    usedChars = []
    permute = (word) ->
      return if word is ''
      chars = word.split('')
      len = chars.length
      for i in [0...len]
        ch = chars.splice(i, 1)[0]
        usedChars.push(ch)
        if chars.length is 0
          permArr.push usedChars.join("")
        permute(chars.join(''))
        chars.splice(i, 0, ch)
        usedChars.pop()
    permute word
    permArr

window.WordMaestro = WordMaestro

