App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    acive_chatroom = $("[data-behaviour='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if acive_chatroom.length > 0
      acive_chatroom.append(data.message)
    else
      $("[data-behaviour='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")
    # Called when there's incoming data on the websocket for this channel
