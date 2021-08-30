<template>
  <v-app-bar
    app
    bottom
    color="blue"
    fixed
    flat
  >
    <v-container>
      <v-row>
        <footer-menu-item-after-login v-if="isLoggedIn === true" />
        <footer-menu-item-before-login v-else />
      </v-row>
    </v-container>
  </v-app-bar>
</template>

<script>
import { mapState } from 'vuex';
import FooterMenuItemAfterLogin from '../parts/FooterMenuItemAfterLogin';
import FooterMenuItemBeforeLogin from '../parts/FooterMenuItemBeforeLogin';

export default {
  components: {
    FooterMenuItemAfterLogin,
    FooterMenuItemBeforeLogin
  },
  computed: {
    ...mapState({
      isLoggedIn: state => state.authUser.isLoggedIn
    })
  }
};
</script>