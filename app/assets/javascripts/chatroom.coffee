$(document).on "turbolinks:load", ->
  $('#new_message').on "keypress", (e) ->
    # console.log e.keyCode;
    if e && e.keyCode == 13
      e.preventDefault();
      $(this).submit();

  $('#new_message').on 'submit', (e) ->
    e.preventDefault();
    chatroom_id = $("[data-behaviour='messages']").data("chatroom-id");
    body = $("#message_body");

    App.chatrooms.send_message(chatroom_id, body.val());

    body.val("")
