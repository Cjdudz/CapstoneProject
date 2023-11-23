        <template>
            <div id="app">
            <form>
                <h1>PCGPA APPLICATION FORM</h1>
                <label class="form-label">Last Name: <input v-model="lastName"></label><br>
                <label class="form-label">First Name: <input v-model="firstName"></label><br>
                <label class="form-label">Middle Name: <input v-model="middleName"></label><br>
                <label class="form-label">Suffix: <input v-model="suffix"></label><br>
                <label class="form-label">Marital Status: 
                <select v-model="maritalStatus">
                    <option>Separated</option>
                    <option>Married</option>
                    <option>Single</option>
                    <option>Widower</option>
                </select>
                </label><br>
                <label class="form-label">No. of Children: <input type="number" v-model="numChildren"></label><br>
                <label class="form-label">Sex: 
                <select v-model="sex">
                    <option>Male</option>
                    <option>Female</option>
                </select>
                </label><br>
                <label class="form-label">Height: <input v-model="height"></label><br>
                <label class="form-label">Weight: <input v-model="weight"></label><br>
                <button type="submit" class="submit-button">Submit</button>
            </form>
            </div>
        </template>
        
        <script>
        export default {
            data() {
            return {
                lastName: '',
                firstName: '',
                middleName: '',
                suffix: '',
                maritalStatus: '',
                numChildren: 0,
                sex: '',
                height: '',
                weight: ''
            }
            }
        }
        </script>
        
        <style scoped>
            #app {
            font-family: 'Arial', sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            }
        
            form {
            margin-top: 20px;
            width: auto;
            }
        
            h1 {
            font-size: 24px;
            margin-bottom: 20px;
            }
        
            .form-label {
            display: block;
            margin-bottom: 10px;
            }
        
            input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            }
        
            .submit-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            }
        
            .submit-button:hover {
            background-color: #45a049;
            }
        </style>
        