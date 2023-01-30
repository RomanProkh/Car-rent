<template>
  <div class="container">
    <h3>Ota yhteyttä lähettämällä sähköpostia</h3>
    <form ref="contactUsForm" @submit.prevent="sendEmail">
      <label>Nimi</label>
      <input
          type="text"
          required v-model="name"
          name="name"
          placeholder="Nimesi"
      >
      <label>Sähköposti</label>
      <input
          type="email"
          required v-model="email"
          name="email"
          placeholder="Sähköpostiosoitteesi"
          @blur="validateEmail"
      >
      <label>Viesti</label>
      <textarea
          name="message"
          required v-model="message"
          cols="35" rows="7"
          placeholder="Viestisi">
          </textarea>
      <input type="submit" value="Lähetä">
    </form>
  </div>
</template>
<script>
import emailjs from 'emailjs-com';
export default {
  name: 'ContactUs',
  data() {
    return {
      name: '',
      email: '',
      message: ''
    }
  },
  methods: {
    sendEmail() {
      //TODO: Better confirmation and incorrect email alert
      if (!/^[^@]+@\w+(\.\w+)+\w$/.test(this.email)) {
        return
      }
      if(this.name === '' || this.email ==='' || this.message===''){
        return
      }
      try {
        emailjs.sendForm('service_lq23h4p', 'car-rent-template',this.$refs.contactUsForm,
            'RToyCkIHtUm8qk8hy' )
            .then((result) => {
              console.log('SUCCESS!', result.text);
              alert('Lähetys onnistui')
            }, (error) => {
              console.log('FAILED...', error.text);
            });
      } catch(error) {
        console.log({error})
      }
      // Reset form fields
      this.name = ''
      this.email = ''
      this.message = ''
    }
  }
}
</script>
<style scoped>
* {box-sizing: border-box;}

.container {
  display: block;
  margin:auto;
  text-align: center;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width: 50%;
}

label {
  float: left;
}

input[type=text], [type=email], textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
</style>