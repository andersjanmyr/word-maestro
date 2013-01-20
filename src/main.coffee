$ ->

  worker = new Worker(workerFile)
  worker.addEventListener('message', (e) ->
    showMatches(e.data.matchingWords)
    $.mobile.hidePageLoadingMsg())

  search = ->
    pattern = $('#pattern').val().toLowerCase()

    if $('#scrambled').is(':checked')
      if pattern.length > 8
        showMatches(['Inte mer än 8 tecken med blandad sökning!'])
      else
        postMessage('findPermutedAndShortendWord', pattern)
    else
      postMessage('findWord', pattern)

  showMatches = (matchingWords) ->
    matchingWords = matchingWords[0...10] if matchingWords.length > 10
    matchingWords = ['Inga träffar!'] if matchingWords.length is 0
    html = ("<li>#{capitalize(word)}</li>" for word in matchingWords).join('\n')
    $('#matching-words').empty().html(html).listview('refresh')

  capitalize = (word) ->
    return word.charAt(0).toUpperCase() + word.slice(1)

  postMessage = (cmd, pattern) ->
    $.mobile.showPageLoadingMsg()
    worker.postMessage({ cmd: cmd, pattern:  pattern })

  # Main
  $('#pattern').change search
  $('#scrambled').click search

