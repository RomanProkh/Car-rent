<template>
  <nav>
    <div id="logo">
      <router-link to="/">
        <img :src="logo" alt="Logo">
      </router-link>
    </div>
    <div id="pageMenu">
      <router-link to="/">Home</router-link>
      <router-link to="/contactUs">Ota yhteyttä</router-link>
      <!--
      <router-link to="/about">Meistä</router-link>
      <router-link to="/signIn">Kirjaudu</router-link>
      -->
    </div>
  </nav>
  <div v-if="displayNav">
    <OrderNav :vehicleRegNumber="vehicleRegNumber"
              :orderStartTime="orderStartTime"
              :orderEndTime="orderEndTime"
    ></OrderNav>
  </div>
  <router-view/>
  <footer>
    <h1>Autovuokraamo</h1>
    <div class="footer-container">
      <div class="footer-heading">
        <h2>Navigointi</h2>
        <router-link to="/">Pääsivu</router-link>
        <!--TODO: Create real pages and update links -->
        <router-link to="/"> Blogi</router-link>
        <router-link to="/"> Kaikki autot</router-link>
        <router-link to="/contactUs">Ilmoita virheesta</router-link>
      </div>
      <div class="footer-heading">
        <h2>Tietoa meistä</h2>
        <!--TODO: Create real pages and update links -->
        <router-link to="/"> Tekijät</router-link>
        <router-link to="/"> Lisenssit ja käyttöehdot</router-link>
        <router-link to="/contactUs"> Ota yhteyttä</router-link>
      </div>
    </div>
    <p class="copyright">COPYRIGHT &copy; Meidän ryhmä</p>
  </footer>
</template>
<script>

import OrderNav from '@/components/OrderNav.vue'

export default {
  components: {
    OrderNav
  },
  props: {},
  computed: {
    displayNav() {
      return this.$store.state.displayOrderNav;
    }
  },
  data() {
    return {
      logo: require('@/assets/images/logo.png'),
      order: [],
      cars: [],
      orderStartTime: '',
      orderEndTime: '',
      //order: false, // if true, the order nav is showed
      search: true, // if true, the search form and car listing are showed
      vehicleRegNumber: ''
    }
  },
  created() {

  }
}

</script>

