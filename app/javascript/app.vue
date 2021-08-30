<template>
  <v-app>
    <common-header />
    <v-main>
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