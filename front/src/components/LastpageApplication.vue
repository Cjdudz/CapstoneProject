<template>
  <div id="app">
    <form>
      <h1>I certify that the foregoing answers are true and correct to the best of my knowledge and belief and I agree that any misstatement or omission may be cause for denial of my application for clearance.</h1>
      <label for="signedAt">Signed at:</label>
      <input type="text" id="signedAt" v-model="signedAt">
      <label for="date">Date:</label>
      <input type="date" id="date" v-model="date">
      <label for="leftThumbmark">Left Thumbmark:</label>
      <input type="text" id="leftThumbmark" v-model="leftThumbmark">
      <label for="rightThumbmark">Right Thumbmark:</label>
      <input type="text" id="rightThumbmark" v-model="rightThumbmark">
      <label for="witness1">Witness 1:</label>
      <input type="text" id="witness1" v-model="witness1">
      <label for="witness2">Witness 2:</label>
      <input type="text" id="witness2" v-model="witness2">
      <input type="submit" value="Submit">
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      signedAt: '',
      date: '',
      leftThumbmark: '',
      rightThumbmark: '',
      witness1: '',
      witness2: ''
    }
  }
}
</script>
