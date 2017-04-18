##Websocket Notifications

For recieving websocket notifications, use our ```PusherClient``` library. More details here: https://github.com/tokenly/pusher-client

### Client-side Usage

See the [pusher-client.js example](examples/js/pusher-client.js) for the client javascript code.

#### Step 1: Include the two libraries

This is best toward the end of your body tag.

```html
<script src="https://pusher.tokenly.com/public/client.js"></script>
<script src="/path/to/js/pusher-client.js"></script>
```

#### Step 2: Subscribe and respond to events

After the two script tags below are loaded, you can subscribe to a channel

```html
<script>
    var subscribedClient = PusherClient.subscribeToPusherChanel('instant-invoice/{uuid}', function(dataReceived) {
        // received a websocket message on channel /instant-invoice/{uuid}
        console.log('user '+dataReceived.fromUser+' said '+messageText);
    });
</script>
```

##Webhook Notifications

If you have a webhook URL set in your Markets Settings, you can receive instant invoice notifications
whenever a bitcoin/token payment is detected or when the invoice is paid and complete.

Notifications are signed with your API public/private key pair.

**Webhook Notification Data:** ```invoice (Instant Invoice Object)```

