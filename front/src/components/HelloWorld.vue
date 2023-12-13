<template>
  <v-app>

    <v-main style="  background-image: url('https://scontent.fmnl30-2.fna.fbcdn.net/v/t1.15752-9/385484006_730465255796324_334538059090882611_n.png?_nc_cat=110&ccb=1-7&_nc_sid=8cd0a2&_nc_eui2=AeFDXZJtjJ1Z3MIJIPvivsWyTeyjUxuKVXFN7KNTG4pVcaeUtReE_OVHKxy2N-AFpmnmttCsQCwaATNlz1xXEwZf&_nc_ohc=xBIQskDQGwcAX-x7_GB&_nc_ht=scontent.fmnl30-2.fna&oh=03_AdRIv9tBY72xRzE3kUmh7nj1cEtB1VxpWT9zHy17wTUEhA&oe=65A0C06D');">
      <v-container>
       

        <v-row>
          <v-col>
            <v-container class="my-5">
              <v-card elevation="2" class="pa-5 text-center rounded-lg">
                <v-card-title class="display-2 mb-3">Welcome to the 505th PCGA Application System</v-card-title>
                <v-card-subtitle class="subtitle-1">Apply online and schedule your appointment interview with ease.</v-card-subtitle>
              </v-card>
            </v-container>
          </v-col>
        </v-row>
     

   
        <v-row v-if="showApplicationForm">
          <v-col>
            <v-container class="my-5">
              <v-dialog v-model="showApplicationForm" max-width="600">
                <v-card>
                  <v-card-title class="headline text-center">Application Process Form</v-card-title>
                  <v-card-text>
                    <v-form>
                      <v-text-field label="Full Name" v-model="applicationForm.fullName"></v-text-field>
                      <v-text-field label="Email" v-model="applicationForm.email"></v-text-field>
                      <v-text-field label="Phone Number" v-model="applicationForm.phoneNumber"></v-text-field>

                      <v-btn color="primary" dark class="mt-4" @click="submitApplicationForm">Submit Application</v-btn>
                    </v-form>
                  </v-card-text>
                  <v-card-actions class="justify-center">
                    <v-btn @click="showApplicationForm = false" color="grey">Close</v-btn>
                  </v-card-actions>
                </v-card>
              </v-dialog>
            </v-container>
          </v-col>
        </v-row>
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
    </v-main>


  </v-app>
</template>
<script>

</script>