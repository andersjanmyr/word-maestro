$ ->

  wm = WordMaestro

  $('#pattern').change ->
    $('#spinner').show()
    pattern = $('#pattern').val()

    if $('#scrambled').is(':checked')
      if pattern.length > 8
        matching_words = ['Inte mer än 8 tecken med blandad sökning!']
      else
        matching_words = wm.findPermutedAndShortendWord pattern
    else
      matching_words = wm.findWord pattern
    matching_words = matching_words[0...10] if matching_words.length > 10
    matching_words = ['Inga träffar!'] if matching_words.length is 0
    html = ("<li>#{word}</li>" for word in matching_words).join('\n')
    $('#matching-words').empty().html(html).listview('refresh')
    $('#spinner').hide()


