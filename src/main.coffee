$ ->

  worker = new Worker('lib/worker.js')
  worker.addEventListener('message', (e) ->
    showMatches(e.data.matchingWords)
    $.mobile.hidePageLoadingMsg())

  capitalize = (word) ->
    return word.charAt(0).toUpperCase() + word.slice(1)

  showMatches = (matchingWords) ->
    matchingWords = matchingWords[0...10] if matchingWords.length > 10
    matchingWords = ['Inga träffar!'] if matchingWords.length is 0
    html = ("<li>#{capitalize(word)}</li>" for word in matchingWords).join('\n')
    $('#matching-words').empty().html(html).listview('refresh')

  postMessage = (cmd, pattern) ->
    $.mobile.showPageLoadingMsg()
    worker.postMessage({ cmd: cmd, pattern:  pattern })

  search = ->
    pattern = $('#pattern').val().toLowerCase()

    if $('#scrambled').is(':checked')
      if pattern.length > 8
        showMatches(['Inte mer än 8 tecken med blandad sökning!'])
      else
        postMessage('findPermutedAndShortendWord', pattern)
    else
      postMessage('findWord', pattern)


  $('#pattern').change search

  $('#scrambled').click search

