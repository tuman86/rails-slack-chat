$(document).on "turbolinks:load", ->
  $('#new_message').on "keypress", (e) ->
    # console.log e.keyCode;
    if e && e.keyCode == 13
      e.preventDefault();
      $(this).submit();
