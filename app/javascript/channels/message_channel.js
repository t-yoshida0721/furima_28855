import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const html = `<p><a> ${data.nickname} :  ${data.content.text}</p>`;
    const messages = document.getElementById('comment');
    const newMessage = document.getElementById('message_text');
    const inputElement = document.getElementById('input');
    inputElement.disabled = false;
    messages.insertAdjacentHTML('afterend', html);
    newMessage.value='';
  }
});
