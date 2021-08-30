<template>
  <v-app>
    <v-main>
      <flash-message />
      <v-container>
        <router-view />
      </v-container>
    </v-main>
    <footer-menu />
  </v-app>
</template>

<script>
import FlashMessage from './components/commons/FlashMessage';
import FooterMenu from './components/commons/FooterMenu';

export default {
  components: {
    FlashMessage,
    FooterMenu
  }
};
</script>