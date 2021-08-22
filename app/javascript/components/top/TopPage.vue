<template>
  <v-app>
    <v-main>
      <h1>{{ title }}</h1>
      <p>
        <router-link :to="{ name: 'RegisterPage' }">
          to register
        </router-link>
      </p>
    </v-main>
  </v-app>
</template>

<script>

export default {
  data() {
    return {
      title: 'Dummy Top'
    };
  }
};
</script>
