$ ->

  wm = WordMaestro

  $('#pattern').change -> 
    matching_words = wm.findWord pattern
    matching_words = matching_words[0..10] if matching_words.length > 10
    html = ("<li>#{word}</li>" for word in matching_words).join('\n')
    console.log html
    $('#matching-words').empty().append(html)


