<template>
  <v-row>
    <v-col>
      <v-btn
        :to="{ name: 'TopPage' }"
        color="base"
        text
        class="text-capitalize"
      >
        Top
      </v-btn>
    </v-col>
    <v-col>
      <v-btn
        :to="{ name: 'RegisterPage' }"
        color="base"
        text
        class="text-capitalize"
      >
        register
      </v-btn>
    </v-col>
    <v-col>
      <login-modal />
    </v-col>
    <v-col>
      <v-btn
        :to="{ name: 'FoodIndex' }"
        color="base"
        text
        class="text-capitalize"
      >
        foods
      </v-btn>
    </v-col>
  </v-row>
</template>

<script>
import LoginModal from '../pages/LoginModal';

export default {
  components: {
    LoginModal
  }
};
</script>