<template>
  <div id="app">
    <p>{{ title }}</p>
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