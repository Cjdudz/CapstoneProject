<template>
    <div>
      <div class="chat-container">
        <div class="chat-messages">
          <div v-for="message in messages" :key="message.id" :class="messageClass(message)">
            <strong>{{ message.sender }}:</strong> {{ message.text }}
          </div>
        </div>
      </div>
      <div class="chat-input">
        <div v-if="isOnline">Online</div>
        <input v-model="newMessage" @keyup.enter="sendMessage" placeholder="Type your message..." />
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        messages: [],
        newMessage: '',
        currentUserType: 'User', // Default user type is 'User'
        isOnline: true, // Set the default online status
      };
    },
    methods: {
      sendMessage() {
        if (this.newMessage.trim() !== '') {
          const message = { id: Date.now(), sender: this.currentUserType, text: this.newMessage };
          this.messages.push(message);
          this.newMessage = '';
        }
      },
      messageClass(message) {
        return {
          'admin-message': message.sender === 'Admin',
          'staff-message': message.sender === 'Staff',
          'user-message': message.sender === 'User',
        };
      },
    },
  };
  </script>
  
  
  <style scoped>
  .chat-container {
    max-width: 400px;
    margin: 0 auto;
  }
  
  .chat-messages {
    border: 1px solid #ccc;
    padding: 10px;
    height: 200px;
    overflow-y: scroll;
  }
  
  .admin-message {
    margin-bottom: 10px;
    padding: 8px;
    background-color: #ffeeba;
    border-radius: 5px;
  }
  
  .staff-message {
    margin-bottom: 10px;
    padding: 8px;
    background-color: #d4edda;
    border-radius: 5px;
  }
  
  .user-message {
    margin-bottom: 10px;
    padding: 8px;
    background-color: #f0f0f0;
    border-radius: 5px;
  }
  
  .chat-input {
  margin-top: 10px;
  display: flex;
  align-items: center;
}

/* Additional style for online status */
.chat-input div {
  margin-right: 10px;
  font-weight: bold;
  color: #28a745; /* Green color for online status */
}

input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  /* Style the input placeholder */
  input::placeholder {
    color: #999;
  }
  
  /* Style the input on focus */
  input:focus {
    outline: none;
    border-color: #66afe9;
    box-shadow: 0 0 5px rgba(102, 175, 233, 1);
  }
  
</style>
  