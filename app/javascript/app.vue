<template>
  <v-app class="back">
    <common-header />
    <v-main class="back">
      <v-container>
        <router-view />
      </v-container>
    </v-main>
    <footer-menu />
  </v-app>
</template>

<script>
import CommonHeader from './components/commons/CommonHeader';
import FooterMenu from './components/commons/FooterMenu';

export default {
  components: {
    CommonHeader,
    FooterMenu
  }
};
</script>

<style scoped>
.back {
  background-color: rgba(225, 226, 225, 1);
}
</style>