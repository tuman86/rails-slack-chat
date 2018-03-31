App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    acive_chatroom = $("[data-behaviour='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if acive_chatroom.length > 0


      if document.hidden
        if $('.strike').length == 0
          acive_chatroom.append("<div class='strike'><span>Unread Message</span></div>");


        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body});
      else
        App.last_read.update_record(data.chatroom_id)

      acive_chatroom.append("<div><strong>#{data.username}:</strong>#{data.body}</div>")

    else
      $("[data-behaviour='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").css("font-weight", "bold")
    # Called when there's incoming data on the websocket for this channel

  send_message: (chatroom_id, message) ->
    @perform "send_message", {chatroom_id: chatroom_id, body: message}
