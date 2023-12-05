<template>
    <v-app>
        <v-app-bar>
    <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
    <v-toolbar-title>
      <img src="/img/PCGA.png" alt="Coast Guard Logo" class="coast-guard-logo" />
      505th PCGA Application System
    </v-toolbar-title>
    <v-spacer></v-spacer>
    <v-btn text @click="loginOrLogout">Logout</v-btn>
  </v-app-bar>
  
      <v-navigation-drawer app v-model="drawer">
        <v-list>
          <v-list-item link @click="redirectTo('/home')">
            <v-list-item-content>
              <v-list-item-title>Home</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
  
          <v-divider></v-divider>
  
          <v-list-item link @click="redirectTo('/PcgaapplicationForm')">
            <v-list-item-content>
              <v-list-item-title>Apply Online</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
  
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title @click="startInterviewProcess">Appointment Interview</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
  
          <v-list-item v-if="isLoggedIn" @click="logout">
            <v-list-item-content>
              <v-list-item-title>Logout</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-navigation-drawer>


<v-main>
    <HelloWorld />
</v-main>

      <v-container>
        <v-row v-if="showInterviewForm">
          <v-col>
            <v-container class="my-5">
              <v-dialog v-model="showInterviewForm" max-width="600">
                <v-card>
                  <v-card-title class="headline text-center">Interview Process Form</v-card-title>
                  <v-card-text>
                    <v-form>
                      <v-text-field label="Interviewee Name" v-model="interviewForm.intervieweeName"></v-text-field>
                      <v-text-field label="Interview Date" v-model="interviewForm.interviewDate" type="date"></v-text-field>
                      <v-textarea label="Comments" v-model="interviewForm.comments"></v-textarea>

                      <v-btn color="primary" dark class="mt-4" @click="submitInterviewForm">Submit Interview</v-btn>
                    </v-form>
                  </v-card-text>
                  <v-card-actions class="justify-center">
                    <v-btn @click="showInterviewForm = false" color="grey">Close</v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </v-container>
          </v-col>
        </v-row>
        
      </v-container>
       </v-app>
    </template>

    
<script>
import HelloWorld from './HelloWorld.vue';

export default {
    data() {
        return {
            drawer: false,
            showInterviewForm: false,
            interviewForm: {
                intervieweeName: "",
                interviewDate: "",
                comments: "",
            },
        };
    },
    methods: {
        loginOrLogout() {
            if (this.isLoggedIn) {
                // User is logged in, perform logout action
                this.logout();
            }
            else {
                // User is not logged in, redirect to login page
                this.redirectTo('/LoginComponent');
            }
        },
        logout() {
            // Perform logout actions (e.g., clear session, reset state)
            console.log("Logout clicked");
            this.isLoggedIn = false;
        },
        redirectTo(path) {
            this.$router.push(path);
            this.drawer = false;
        },
        logout() {
            console.log("Logout clicked");
        },
        startInterviewProcess() {
            this.showInterviewForm = true;
            this.showApplicationForm = false;
        },
        submitInterviewForm() {
            console.log("Interview Form submitted:", this.interviewForm);
        },
    },
    components: { HelloWorld }
};
</script>