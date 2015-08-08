$ ->
  $(".video-id-btn").on "click", (e) ->
    e.preventDefault()
    video_id = $(".video-id-input").val()
    youtube_url = "https://www.youtube.com/embed/" + video_id
    video_iframe = '<iframe width="560" height="315" src="' + youtube_url + '"?rel=0&amp;controls=0&amp;autoplay=1" frameborder="0" allowfullscreen></iframe>'
    $(".video-player").html(video_iframe)




