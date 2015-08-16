$ ->
  $(".video-id-btn").on "click", (e) ->
    e.preventDefault()
    video_id = $(".video-id-input").val()
    youtube_url = "https://www.youtube.com/embed/" + video_id
    video_iframe = '<iframe width="560" height="315" src="' + youtube_url + '"?rel=0&amp;controls=0&amp;autoplay=1" frameborder="0" allowfullscreen></iframe>'
    $(".video-player").html(video_iframe)

  $("#yt-link-btn").on "click", (e) ->
    e.preventDefault()
    $.ajax
      method: 'POST'
      url: 'validate'
      dataType: 'json'
      data: { video_id: $("#yt-link").val() }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        console.log "Successful AJAX call: #{data}"
        handleValidMedium(data)

handleValidMedium = (data) ->
  medium_name = data.name
  medium_duration = data.length_in_seconds

  message_div = $(".find-it-message")
  success_span = '<span>We found <strong>' + medium_name + '</strong>! If that\'s the right one, let\'s move on to the next step.</span>'
  message_div.empty()
  message_div.append(success_span)
  message_div.addClass('success').show()




