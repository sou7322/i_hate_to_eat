<template>
  <div>
    <h1 v-if="{userId}">
      {{ userId }}
    </h1>
    <h1 v-else>
      Null
    </h1>
    <h1>{{ isLoggedIn }}</h1>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  computed: {
    ...mapState({
      userId: state => state.authUser.userId,
      isLoggedIn: state => state.authUser.isLoggedIn
    })
  }
};
</script>