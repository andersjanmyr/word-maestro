class @WordMaestro
  constructor: (@words, @alfabet, alfavalues) ->
    @alfavalues = (parseInt(c) for c in alfavalues)

  findWord: (pattern) ->
    words = @expandPattern(pattern)
    found = (word for word in words when @binarySearch(@words, word) > 0)
    found

  expandPattern: (pattern) ->
    words = []
    alfabet = @alfabet
    alfalen = @alfabet.length
    expand = (pattern) ->
      if pattern.indexOf('?') is -1
        words.push pattern
        return

      chars = pattern.split('')
      len = chars.length
      for i in [0...len]
        if chars[i] is '?'
          for j in [0...alfalen]
            chars.splice(i, 1, alfabet[j])
            newPattern = chars.join('')
            expand(newPattern)
    expand(pattern)
    @unique(words)


  unique: (list) ->
    return list if list.length < 2
    output = {}
    len = list.length
    output[list[key]] = list[key] for key in [0...len]
    value for key, value of output


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


  flatten: (wordss) ->
    [].concat.apply([], wordss)


  findPermutedWord: (word) ->
    permutations = @unique(@permuteWord word)
    wordss = (@findWord(perm) for perm in permutations)
    @unique(@flatten wordss)

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

  shortenWord: (originalWord) ->
    words = []
    shorten = (word) ->
      return if word is ''
      words.push word
      chars = word.split('')
      len = chars.length
      for i in [0...len]
        ch = chars.splice(i, 1)
        shorten(chars.join(''))
        chars.splice(i, 0, ch)
    shorten originalWord
    @sort @unique(words)

  sort: (words) ->
    pairs = @calcWordValuePairs(@unique(words))
    pairs.sort @sortByValue
    p[0] for p in pairs

  calcWordValuePairs: (words) ->
    [w, @calcWordValue(w)] for w in words

  calcWordValue: (word) ->
    ack  = 0
    for i in [0...word.length]
      val = @alfavalues[@alfabet.indexOf(word[i])]
      ack += val
    ack

  sortByValue: (a, b) =>
    b[1] - a[1]


  findPermutedAndShortendWord: (word) ->
    shorts = @shortenWord word
    words = []
    for short in shorts
      words = words.concat(@findPermutedWord(short))
      if words.length > 10 then break
    "#{w} (#{@calcWordValue(w)})" for w in @unique(words)


