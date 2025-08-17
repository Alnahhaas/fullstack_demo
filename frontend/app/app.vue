<template>
  <div class="container">
    <h1>Number Power Calculator</h1>

    <p class="description">
      🚀 This demo project showcases a <strong>full-stack containerized application</strong> deployed on Kubernetes.
      It uses <strong>two containers</strong> — frontend and backend — that communicate with each other via an internal Kubernetes service.<br>
      The deployment and configuration are handled using:  
      <br><strong>• Vue.js</strong> — for the interactive UI  
      <br><strong>• Python Flask</strong> — for the backend API  
      <br><strong>• Minikube</strong> — for local Kubernetes  
      <br><strong>• Helm charts</strong> — to manage frontend & backend deployments  
      <br><strong>• Terraform</strong> — for automated infrastructure provisioning
    </p>


    <div class="form-group">
      <input
        v-model.number="number"
        type="number"
        placeholder="Enter a number"
        class="input-box"
      />
      <!-- Button now calls the correct method -->
      <button @click="sendNumber" class="btn">Calculate Power ²</button>
    </div>

    <div v-if="result !== null" class="result">
      Result =: <strong>{{ result }}</strong>
    </div>

    <footer class="footer">
      <p>Project designed by <strong>Hassan Alnahhaas</strong></p>
      <p>Email: <a href="mailto:hassanalnahhaas@gmail.com">hassanalnahhaas@gmail.com</a></p>
      <p>Tel: <a href="tel:+201144585648">+2 01144585648</a></p>
    </footer>
  </div>
</template>

<script>
export default {
  data() {
    return {
      number: '',
      result: null
    }
  },
  methods: {
    async sendNumber() {
    try {
      // Sending the number to the backend via POST request
      const res = await fetch('http://localhost:5000/square', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ number: this.number })
      });

      // Checking if the response is OK
      if (!res.ok) {
        throw new Error('Network response was not ok');
      }

      // Parsing the response data
      const data = await res.json();

      // Assuming 'result' is the key from the backend's response JSON
      this.result = data.result; 
    } catch (error) {
      // Logging any errors to the console
      console.error("Error calling backend:", error);
    }
  }

  }
}
</script>
<style scoped>
.container {
  min-height:fit-content;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
  font-family: Arial, sans-serif;
  padding: 20px;
  padding-bottom: 100px; /* space for fixed footer */
}

h1 {
  margin-bottom: 15px;
  color: #333;
}

.description {
  max-width: 650px;
  text-align:left;
  font-size: 16px;
  color: #444;
  margin-bottom: 30px;
  line-height: 1.6;
  padding: 15px;
  background: #ffffffcc;
  border-radius: 10px;
  box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
}

.form-group {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
}

.input-box {
  padding: 10px;
  border-radius: 8px;
  border: 1px solid #ccc;
  font-size: 16px;
  width: 200px;
  text-align: center;
}

.btn {
  background-color: #4cafef;
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.btn:hover {
  background-color: #3a97d6;
}

.result {
  margin-top: 20px;
  font-size: 18px;
  color: #222;
}

.footer {
  position:absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  background: #2c3e50;
  color: white;
  text-align: center;
  padding: 12px 0;
  font-size: 14px;
}

.footer a {
  color: #f39c12;
  text-decoration: none;
}

.footer a:hover {
  text-decoration: underline;
}
</style>
