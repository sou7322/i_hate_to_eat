<template>
  <v-row>
    <v-col>
      <v-btn
        :to="{ name: 'HomePage' }"
        color="base"
        text
        class="text-capitalize"
      >
        home
      </v-btn>
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
    <v-col>
      <v-btn
        :to="{ name: 'MealSuggestion' }"
        color="base"
        text
        class="text-capitalize"
      >
        suggestion
      </v-btn>
    </v-col>
    <v-col>
      <v-btn
        :to="{ name: 'MyPage' }"
        color="base"
        text
        class="text-capitalize"
      >
        mypage
      </v-btn>
    </v-col>
    <v-col>
      <v-btn
        color="base"
        text
        class="text-capitalize"
        @click="logoutUser"
      >
        logout
      </v-btn>
    </v-col>
  </v-row>
</template>

<script>
export default {
  methods: {
    logoutUser() {
      this.axios
        .delete('api/v1/authentication')
        .then(response => {
          console.log(response.status);
          this.$store.commit('authUser/RESET_AUTHUSER_STATE');
          this.$store.commit('flashMessage/setMessage', {
            type: 'success',
            message: 'ログアウトしました'
          });
          this.$router.push({ name: 'TopPage' });
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);
        });
    }
  }
};
</script>