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
  
  flatten: (wordss) ->
    [].concat.apply([], wordss)
  
  unique: (list) ->
    output = {}
    len = list.length
    output[list[key]] = list[key] for key in [0...len]
    value for key, value of output

  findPermutedWord: (word) ->
    permutations = @unique(@permuteWord word)
    console.log permutations.length
    if '.' in word
      wordss = (@findWord("^#{perm}$") for perm in permutations)
      console.log 'done'
      @unique(@flatten wordss)
    else
      words = (perm for perm in permutations when @binarySearch(WORDS, perm) > 0)
      console.log 'done'
      @unique(words)

  binarySearch: (items, value) ->
    value = value.toLowerCase()
    start = 0
    stop  = items.length - 1
    pivot = Math.floor (start + stop) / 2
    
    while items[pivot] isnt value and start < stop
      stop  = pivot - 1 if value < items[pivot]
      start = pivot + 1 if value > items[pivot]

      pivot = Math.floor (stop + start) / 2

    if items[pivot] is value then pivot else -1

window.WordMaestro = WordMaestro

