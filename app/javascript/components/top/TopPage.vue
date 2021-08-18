<template>
  <div id="app">
    <p>{{ title }}</p>
    <v-btn>Vuetify</v-btn>
    <p><router-link :to="{ name: 'RegisterPage' }">to register</router-link></p>
  </div>
</template>

<script>

export default {
  data() {
    return {
      title: 'Dummy Top'
    }
  } 
}
</script>