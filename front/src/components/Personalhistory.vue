<template>
  <v-app>
    <v-container class="form-container">
      <v-card>
        <h1 class="form-title">Sample Form</h1>
        <v-form @submit.prevent="submitForm" class="form">
          <v-row>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.name" label="Name"></v-text-field>
            </v-col>
            <v-col cols="12" md="6">
              <v-text-field v-model="form.address" label="Address"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="form.age" label="Age" type="number"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="form.height" label="Height" type="number"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="form.weight" label="Weight" type="number"></v-text-field>
            </v-col>
            <v-col cols="12">
              <v-text-field v-model="form.physicalCondition" label="Physical Condition"></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <v-btn type="submit" class="submit-btn" color="primary">Submit</v-btn>
            </v-col>
          </v-row>
        </v-form>
      </v-card>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      form: {
        name: '',
        address: '',
        age: null,
        height: null,
        weight: null,
        physicalCondition: ''
      }
    };
  },
  methods: {
    submitForm() {
      console.log(this.form);
      // You can add your form submission logic here
    }
  }
};
</script>

<style scoped>
.form-container {
  margin-top: 50px;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.form-title {
  font-size: 24px;
  text-align: center;
  margin-bottom: 20px;
}

.form {
  width: 100%;
  padding: 20px;
}

.v-text-field {
  width: 100%;
  margin-bottom: 20px;
}

.submit-btn {
  margin-top: 20px;
  width: 100%;
}
</style>
