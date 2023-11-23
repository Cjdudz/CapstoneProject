<template>
  <v-app>
    <v-container class="form-container">
      <v-form @submit.prevent="submitForm">
        <h1 class="form-title">PCGPA APPLICATION FORM</h1>
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field v-model="lastName" label="Last Name"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field v-model="firstName" label="First Name"></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="6">
            <v-text-field v-model="middleName" label="Middle Name"></v-text-field>
          </v-col>
          <v-col cols="12" md="6">
            <v-text-field v-model="suffix" label="Suffix"></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="6">
            <v-select v-model="maritalStatus" label="Marital Status" :items="maritalStatusOptions"></v-select>
          </v-col>
          <v-col cols="12" md="6">
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
        <v-btn type="submit" color="success">Submit</v-btn>
      </v-form>
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
  max-width: 600px;
  margin: 0 auto;
  padding: 20px;
}

.form-title {
  font-size: 24px;
  margin-bottom: 20px;
}

v-text-field,
v-select {
  width: 100%;
  margin-bottom: 20px;
}

v-btn {
  margin-top: 20px;
}
</style>
