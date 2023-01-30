<template>

  <div id="navContainer">
    <div class="navStepContainer" v-bind:style='{"background-color" : "#418F14","color":"white"}'>
      <h2>1. Tilauksen päivämäärät</h2>
      <div class="navStepInfo" v-if="showNavStep(1)">
        <p>Ajoneuvon nouto: {{getOrderStartDate}} {{getOrderStartTime}}</p>
        <p>Ajoneuvon palautus: {{getOrderEndDate}} {{getOrderEndTime}}</p>
      </div>
    </div>
    <div class="navStepContainer" v-if="showNavStep(1)" v-bind:style='{"background-color" : (isActive? "#5AC41C" : "#418F14"),"color":"white"}'>
      <h2>2. Ajoneuvon valinta</h2>
      <div class="navStepInfo" v-if="showNavStep(3)">
        <p>Ajoneuvon tyyppi: {{getOrderVehicleType}}</p>
        <p>Ajoneuvon malli: {{getOrderVehicleModel}}</p>
      </div>
    </div>
    <div  class="navStepContainer" v-else>
      <h2>2. Ajoneuvon valinta</h2>
    </div>
    <div class="navStepContainer" v-if="showNavStep(3)" v-bind:style='{"background-color" : (isActive? "#5AC41C" : "#418F14"),"color":"white"}'>
      <h2>3. Tilaajan tiedot</h2>
      <div class="navStepInfo" v-if="showNavStep(4)">
        <p>Tilaajan nimi: {{getOrderFirstName}} {{getOrderLastName}}</p>
        <p>Tilaajan e-mail: {{getOrderEmail}}</p>
      </div>
    </div>
    <div class="navStepContainer" v-else>
      <h2>3. Tilaajan tiedot</h2>
    </div>
    <div class="navStepContainer" v-if="showNavStep(4)" v-bind:style='{"background-color" : (isActive? "#5AC41C" : "#418F14"),"color":"white"}'>
      <h2>4. Tilauksen yhteenveto</h2>
      <div class="navStepInfo" v-if="showNavStep(4)">
      </div>
    </div>
    <div class="navStepContainer" v-else>
      <h2>4. Tilauksen yhteenveto</h2>
    </div>
  </div>
</template>

<script>

export default {
  name: "OrderNav",
  isActive: true,
  el: '#navContainer',
  props: {
  },

  computed: {
    getOrderStartDate(){
      return this.$store.state.order.orderStartDate;
    },
    getOrderEndDate(){
      return this.$store.state.order.orderEndDate;
    },
    getOrderStartTime(){
      return this.$store.state.order.orderStartTime;
    },
    getOrderEndTime(){
      return this.$store.state.order.orderEndTime;
    },
    getOrderVehicleType(){
      return this.$store.state.order.vehicleType;
    },
    getOrderVehicleModel(){
      return this.$store.state.order.vehicleModel;
    },
    getOrderFirstName(){
      return this.$store.state.order.firstName;
    },
    getOrderLastName(){
      return this.$store.state.order.lastName;
    },
    getOrderEmail(){
      return this.$store.state.order.email;
    },
  },
  methods: {
    showNavStep(step){
      this.isActive = this.$store.state.orderStep <= step;
      return this.$store.state.orderStep >= step;
    }
  }

}
//console.log(this.$store.state.order);
</script>
