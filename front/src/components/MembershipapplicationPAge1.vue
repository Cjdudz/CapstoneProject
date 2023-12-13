<template>
  <v-app>
    <v-container class="form-container">
      <v-card class="form-card">
        <h1 class="form-title">PCGPA APPLICATION FORM</h1>
        <v-form @submit.prevent="submitForm" class="form">
          <v-row>
            <v-col cols="12" md="4">
              <v-text-field v-model="lastName" label="Last Name"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="firstName" label="First Name"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="middleName" label="Middle Name"></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="4">
              <v-text-field v-model="suffix" label="Suffix"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-select v-model="maritalStatus" label="Marital Status" :items="maritalStatusOptions"></v-select>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="numChildren" label="No. of Children" type="number"></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12" md="4">
              <v-select v-model="sex" label="Sex" :items="sexOptions"></v-select>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="height" label="Height"></v-text-field>
            </v-col>
            <v-col cols="12" md="4">
              <v-text-field v-model="weight" label="Weight"></v-text-field>
            </v-col>
          </v-row>
          <v-btn type="submit" color="success" class="submit-btn">Submit</v-btn>
        </v-form>
      </v-card>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      lastName: "",
      firstName: "",
      middleName: "",
      suffix: "",
      maritalStatus: "",
      numChildren: 0,
      sex: "",
      height: "",
      weight: "",
      maritalStatusOptions: ["Separated", "Married", "Single", "Widower"],
      sexOptions: ["Male", "Female"],
    };
  },
  methods: {
    submitForm() {
      // Add your form submission logic here
      console.log("Form submitted");
    },
  },
};
</script>

<style scoped>
.form-container {
  max-width: 700px;
  margin: auto;
}

.form-card {
  max-width: 600px;
  margin: auto;
  padding: 20px;
}

.form-title {
  font-size: 28px;
  margin-bottom: 20px;
  text-align: center;
}

.v-text-field,
.v-select {
  width: 100%;
  margin-bottom: 20px;
}

.submit-btn {
  margin-top: 20px;
  width: 100%;
  background-color: #4caf50;
  color: #fff;
}
</style>
