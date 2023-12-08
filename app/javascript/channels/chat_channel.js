import consumer from "channels/consumer"

const chatChannel = consumer.subscriptions.create(
  { channel: "ChatChannel", room: "main" },
  { connected: () => console.log("connected to ChatChannel") }
  )
  
  // Export subscription to use in components
  export default chatChannel  
