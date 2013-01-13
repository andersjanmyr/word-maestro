$ ->

  showMatches = (matchingWords) ->
    matchingWords = matchingWords[0...10] if matchingWords.length > 10
    matchingWords = ['Inga träffar!'] if matchingWords.length is 0
    html = ("<li>#{word}</li>" for word in matchingWords).join('\n')
    $('#matching-words').empty().html(html).listview('refresh')

  worker = new Worker('lib/worker.js')
  worker.addEventListener('message', (e) ->
    console.log(e.data)
    showMatches(e.data.matchingWords)
    $('#spinner').hide()
    false)

  $('#pattern').change ->
    $('#spinner').show()
    pattern = $('#pattern').val()

    if $('#scrambled').is(':checked')
      if pattern.length > 8
        matching_words = ['Inte mer än 8 tecken med blandad sökning!']
      else
        return worker.postMessage({ cmd: 'findPermutedAndShortendWord', pattern:  pattern })
    else
      worker.postMessage({ cmd: 'findWord', pattern:  pattern })


