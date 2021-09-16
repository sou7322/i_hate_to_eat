<template>
  <v-app-bar
    app
    color="blue"
    flat
    fixed
    height="100"
  >
    <v-row>
      <flash-message />
    </v-row>
    <!-- <v-row>
      <v-col>
        <v-card
          color="red"
          flat
          width="300px"
          height="50px"
        >
          <div class="text-center text-h3">
            Ad
          </div>
        </v-card>
      </v-col>
    </v-row> -->
  </v-app-bar>
</template>

<script>
import FlashMessage from './FlashMessage';

export default {
  components: {
    FlashMessage
  }
};
</script>