$ ->
  $(".video-id-btn").on "click", (e) ->
    e.preventDefault()
    video_id = $(".video-id-input").val()
    youtube_url = "https://www.youtube.com/embed/" + video_id
    video_iframe = '<iframe width="560" height="315" src="' + youtube_url + '"?rel=0&amp;controls=0&amp;autoplay=1" frameborder="0" allowfullscreen></iframe>'
    $(".video-player").html(video_iframe)

  $(".yt-link-btn").on "click", (e) ->
    e.preventDefault()
    video_id = $(".yt-link").val()
    $.ajax
      url: 'yt_validator'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('body').append "Successful AJAX call: #{data}"




