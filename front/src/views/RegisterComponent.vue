<script>
import axios from 'axios';

export default {
  data() {
    return {
      email: '',
      mobileNumber: '',
      username: '',
      password: '',
      passwordConfirm: '',
      message: '',
      passwordError: '',
      showPassword: false,
      showPasswordConfirm: false
    };
  },
  methods: {
    async register() {
      // Check if passwords match
      if (this.password === this.passwordConfirm) {
        // Check if password is valid
        if (this.validatePassword(this.password)) {
          try {
            const response = await axios.post('api/register', {
              email: this.email,
              number: this.mobileNumber,
              username: this.username,
              password: this.password,
              role: 'user', // Hardcoded role as 'user'
            });

            if (response.data.msg === 'okay') {
              alert('Registered successfully');
              this.$router.push('/LoginComponent');
            } else {
              this.message = 'registrationFailed';
            }
          } catch (error) {
            console.error('Error during registration:', error);
            this.message = 'error';
          }
        } else {
          this.message = 'invalidPassword';
        }
      } else {
        this.message = 'passwordMismatch';
      }
    },
    // Password validation function
    validatePassword(password) {
      const minLength = 8;
      const hasUpperCase = /[A-Z]/.test(password);
      const hasLowerCase = /[a-z]/.test(password);
      const hasNumbers = /\d/.test(password);
      const hasSpecialChar = /[!@#\$%\^\&*\)\(+=._-]/.test(password);

      if (password.length < minLength) {
        this.passwordError = `Password must be at least ${minLength} characters long.`;
        return false;
      } else if (!hasUpperCase) {
        this.passwordError = 'Password must contain at least one uppercase letter.';
        return false;
      } else if (!hasLowerCase) {
        this.passwordError = 'Password must contain at least one lowercase letter.';
        return false;
      } else if (!hasNumbers) {
        this.passwordError = 'Password must contain at least one number.';
        return false;
      } else if (!hasSpecialChar) {
        this.passwordError = 'Password must contain at least one special character.';
        return false;
      } else {
        this.passwordError = ''; // Clear error message if valid
        return true;
      }
    },
  },
};
</script>

<template>
  <v-app>
    <div class="background">
      <v-container class="login-container" fluid fill-height>
        <v-row>
          <v-col cols="12" sm="8" md="6" lg="5" class="login-col">
            <v-card class="login-card rounded-xl">
              <v-card-title class="title">Register</v-card-title>
              <v-card-text class="form">
                <v-form @submit.prevent="register">
                  <!-- Alerts for errors -->
                  <v-alert
                    v-if="message === 'error'"
                    type="error"
                    dense
                    dismissible
                    class="error-message"
                  >
                    Invalid response
                  </v-alert>
                  <!-- Email field -->
                  <v-text-field
                    v-model="email"
                    label="Email"
                    required
                    dense
                    outlined
                    color="black"
                    class="bold-label"
                  ></v-text-field>
                  <!-- Mobile Number field -->
                  <v-text-field
                    v-model="mobileNumber"
                    label="Mobile Number"
                    required
                    dense
                    outlined
                    color="black"
                  ></v-text-field>
                  <!-- Username field -->
                  <v-text-field
                    v-model="username"
                    label="Username"
                    required
                    dense
                    outlined
                    color="black"
                  ></v-text-field>
                  <!-- Password field with eye icon toggle -->
                  <v-text-field
                    v-model="password"
                    :type="showPassword ? 'text' : 'password'"
                    label="Password"
                    required
                    dense
                    outlined
                    color="black"
                    :error-messages="passwordError"
                    :append-icon="showPassword ? 'mdi-eye-off' : 'mdi-eye'"
                    @click:append="showPassword = !showPassword"
                  ></v-text-field>
                  <!-- Confirm Password field with eye icon toggle -->
                  <v-text-field
                    v-model="passwordConfirm"
                    :type="showPasswordConfirm ? 'text' : 'password'"
                    label="Confirm Password"
                    required
                    dense
                    outlined
                    color="black"
                    :append-icon="showPasswordConfirm ? 'mdi-eye-off' : 'mdi-eye'"
                    @click:append="showPasswordConfirm = !showPasswordConfirm"
                  ></v-text-field>
                  <!-- Password Mismatch Alert -->
                  <v-alert
                    v-if="message === 'passwordMismatch'"
                    type="error"
                    dense
                    dismissible
                    class="error-message"
                  >
                    Passwords do not match
                  </v-alert>
                  <!-- Invalid Password Alert -->
                  <v-alert
                    v-if="message === 'invalidPassword'"
                    type="error"
                    dense
                    dismissible
                    class="error-message"
                  >
                    {{ passwordError }}
                  </v-alert>
                  <!-- Registration Failed Alert -->
                  <v-alert
                    v-if="message === 'registrationFailed'"
                    type="error"
                    dense
                    dismissible
                    class="error-message"
                  >
                    Registration failed. Please try again.
                  </v-alert>
                  <!-- Submit button -->
                  <v-btn
                    type="submit"
                    block
                    class="login-button color--success"
                    :disabled="!email || !mobileNumber || !username || !password || !passwordConfirm"
                    >Submit</v-btn
                  >
                </v-form>
              </v-card-text>
              <v-card-actions class="center-links">
                <div class="center-links-text">
                  <span class="caption">Already have an account?</span>
                  <router-link to="/loginComponent" class="register-link"
                    >Login here</router-link
                  >
                </div>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </div>
  </v-app>
</template>

showPassword: false,
      showPasswordConfirm: false

<style scoped>
.background {
  background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)),
    url('C:/laragon/www/CapstoneProject/front/public/img/pcga-loginpage.png');
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center;
  height: 100vh; /* Full-page background */
}

.login-container {
  height: 100vh;
  display: flex;
  align-items: center;
  padding-left: 150px; /* Shift form slightly to the right */
}

.login-col {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: column;
  padding: 30px; /* Increased padding */
}

.login-card {
  border-radius: 20px; /* Rounded corners for the login form */
  width: 100%; /* Take the full width of the column */
  background-color: rgba(255, 255, 255, 0.95); /* Slightly more opaque for better contrast */
  border: 2px solid #005cb2; /* Adjusted blue for stronger contrast */
  box-shadow: none; /* Removed shadow */
  padding: 20px; /* Padding inside the card */
}

.title {
  text-align: center;
  color: #005cb2; /* Adjusted blue for text */
  margin-bottom: 16px;
  font-size: 25px;
  font-weight: 700;
  padding-bottom: 10px; /* Added padding to the title */
}

.form {
  padding-top: 50px;
  padding-left: 50px;
  padding-right: 50px;
  padding-bottom: 20px;
}

.login-button {
  margin-top: 16px;
  background-color: #005cb2; /* Stronger blue color */
  color: #fff;
  border: none;
  border-radius: 5px;
}

.login-button:hover {
  background-color: #004080; /* Darker hover effect */
}

.register-link {
  text-align: center;
  margin-top: 8px;
  color: #005cb2;
  text-decoration: none;
}

.register-link:hover {
  color: #004080;
}

.center-links {
  justify-content: center; /* Center the links */
  display: flex;
  width: 100%;
}

.center-links-text {
  text-align: center;
  width: 100%;
}

.error-message {
  margin-top: 16px;
  color: #f44336;
}

.bold-label .v-label {
  font-weight: bold;
}

.caption {
  font-size: 14px;
  margin-top: 8px;
  display: block;
  color: #757575;
}
</style>