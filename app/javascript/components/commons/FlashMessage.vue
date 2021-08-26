<template>
  <v-alert
    v-show="message"
    dense
    :type="type"
  >
    {{ message }}
  </v-alert>
</template>

<script>
import { mapState } from 'vuex';

export default {
  computed: {
    ...mapState({
      type: state => state.flashMessage.type,
      message: state => state.flashMessage.message
    })
  }
};
</script>