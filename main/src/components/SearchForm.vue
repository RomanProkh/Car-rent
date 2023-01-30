<template>
  <!-- Vehicle search form by type, date and time -->
  <div id="searchFormContainer">
    <h2>Syötä päivämääräväli</h2>
    <form @submit="checkForm"
          action="/car-results"
          method="get"
          novalidate="true">
      <div>
        <div id="formRow">
          <label for="vehicleType">Ajoneuvon tyyppi:</label>
          <select name="vehicleType">
            <option
                v-for='type in vehicleType' :key='type'
                v-bind:value="type.Type_id">{{ type.Type_name }}
            </option>
          </select>
          <div class="formErrorContainer">{{ formErrors.vehicleType }}</div>
        </div>
        <div class="formRow">
          <div class="formColumn">
            <label for="orderStartDate">Alkupäivämäärä:</label>
            <input
                type="date"
                v-model="orderStartDate"
                id="orderStartDate"
                name="orderStartDate">
            <div class="formErrorContainer">
              {{ formErrors.orderStartDate }}
            </div>
          </div>
          <div class="formColumn">
            <label for="orderStartTime">Alkuaika:</label>
            <select
                v-model="orderStartTime"
                name="orderStartTime">
              <option disabled value="">Valitse aika</option>
              <option>00:00</option>
              <option>01:00</option>
              <option>02:00</option>
              <option>03:00</option>
              <option>04:00</option>
              <option>05:00</option>
              <option>06:00</option>
              <option>07:00</option>
              <option>08:00</option>
              <option>09:00</option>
              <option>10:00</option>
              <option>11:00</option>
              <option>12:00</option>
              <option>13:00</option>
              <option>14:00</option>
              <option>15:00</option>
              <option>16:00</option>
              <option>17:00</option>
              <option>18:00</option>
              <option>19:00</option>
              <option>20:00</option>
              <option>21:00</option>
              <option>22:00</option>
              <option>23:00</option>
            </select>
            <div class="formErrorContainer">
              {{ formErrors.orderStartTime }}
            </div>
          </div>
        </div>
        <div class="formRow">
          <div class="formColumn">
            <label for="orderEndDate">Loppupäivämäärä:</label>
            <input
                type="date"
                v-model="orderEndDate"
                id="orderEndDate"
                name="orderEndDate">
            <div class="formErrorContainer">
              {{ formErrors.orderEndDate }}
            </div>
          </div>
          <div class="formColumn">
            <label for="orderStartDate">Loppuaika:</label>
            <select
                v-model="orderEndTime"
                name="orderEndTime">
              <option disabled value="">Valitse aika</option>
              <option>00:00</option>
              <option>01:00</option>
              <option>02:00</option>
              <option>03:00</option>
              <option>04:00</option>
              <option>05:00</option>
              <option>06:00</option>
              <option>07:00</option>
              <option>08:00</option>
              <option>09:00</option>
              <option>10:00</option>
              <option>11:00</option>
              <option>12:00</option>
              <option>13:00</option>
              <option>14:00</option>
              <option>15:00</option>
              <option>16:00</option>
              <option>17:00</option>
              <option>18:00</option>
              <option>19:00</option>
              <option>20:00</option>
              <option>21:00</option>
              <option>22:00</option>
              <option>23:00</option>
            </select>
            <div class="formErrorContainer">
              {{ formErrors.orderEndTime }}
            </div>
          </div>
        </div>
        <div class="formRow">
          <input type="submit" id="submitBtn" value="Etsi autoja">
        </div>
      </div>
    </form>
  </div>
</template>

<script>

export default {

  data() {
    return {
      displayOrderNav: 1,  // Value for search form hidden field
      orderStartDate: '',
      orderEndDate: '',
      orderStartTime: '',
      orderEndTime: '',
      vehicleType: [],

      // Form errors
      formErrors: {
        orderStartDate: '',
        orderEndDate: '',
        orderStartTime: '',
        orderEndTime: '',
        vehicleType: ''
      },
    }

  },
  methods: {

    // Fetching vehicle type's data
    async getVehicleTypeData() {
      try {
        let response = await fetch("/api/vehicle_type");
        this.vehicleType = await response.json();
        //console.log(this.vehicleType);
      } catch (error) {
        console.log(error);
      }

    },

    // Vehicle search form validation
    checkForm: function (e) {
      this.formErrors = [];
      let now = Date.now();

      if (!this.orderStartDate) {
        this.formErrors.orderStartDate = 'Anna tilauksen päivämäärä';
      }
      if (!this.orderStartTime) {
        this.formErrors.orderStartTime = 'Anna tilauksen kellonaika';
      }
      if ((Date.parse(this.orderStartDate + " " + this.orderStartTime) < now)) {
        this.formErrors.orderStartTime = null;
        this.formErrors.orderStartDate = 'Alkuaika ei voi olla pienempi kun nyt';
      }
      if ((Date.parse(this.orderEndDate + " " + this.orderStartTime) < now)) {
        this.formErrors.orderStartTime = null;
        this.formErrors.orderEndDate = 'Loppuaika ei voi olla pienempi kun nyt';
      }
      if (!this.orderEndDate) {
        this.formErrors.orderEndDate = 'Anna tilauksen loppupäivämäärä';
      }
      if (!this.orderEndTime) {
        this.formErrors.orderEndTime = 'Anna tilauksen loppukellonaika';
      }
      if(this.orderEndDate < this.orderStartDate){
        this.formErrors.orderEndDate = 'Loppupäivämäärä ei voi olla pienempi kuin alkupäivämäärä';
      }
      if (!this.vehicleType) {
        this.formErrors.vehicleType = 'Valitse ajoneuvon tyyppi!';
      }
      if (!this.formErrors.orderStartDate
          && !this.formErrors.orderEndDate && !this.formErrors.orderStartTime
          && !this.formErrors.orderEndTime && !this.formErrors.vehicleType) {
        return true;
      }
      e.preventDefault();
    }
  },
  created() {
    this.getVehicleTypeData();
  }
}
</script>


