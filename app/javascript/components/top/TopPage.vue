<template>
  <div id="app">
    <h1>{{ title }}</h1>
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