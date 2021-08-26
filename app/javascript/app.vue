<template>
  <v-app>
    <v-main>
      <flash-message />
      <v-container>
        <router-view />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import FlashMessage from './components/commons/FlashMessage';

export default {
  components: {
    FlashMessage
  }
};
</script>