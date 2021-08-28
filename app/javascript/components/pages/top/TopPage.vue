<template>
  <div>
    <v-row>
      <h1>{{ title }}</h1>
    </v-row>
    <!-- 一時的にリンクを設置、メニュー作成後移動 -->
    <v-row>
      <v-col>
        <v-btn
          text
          :to="{ name: 'RegisterPage' }"
        >
          to register
        </v-btn>
      </v-col>
      <v-col>
        <login-modal />
      </v-col>
      <v-col>
        <v-btn
          @click="logoutUser"
          text
        >
          logout
        </v-btn>
      </v-col>
    </v-row>
    <!-- ここまで -->
  </div>
</template>

<script>
// ToDo: 一時的に設置、フッターメニュー作成後移動
import LoginModal from '../login/LoginModal';

export default {
  components: {
    // ToDo: 一時的に設置、フッターメニュー作成後移動
    LoginModal
  },
  data() {
    return {
      title: 'Dummy Top'
    };
  },
  methods: {
    // ToDo: 一時的に設置、フッターメニュー作成後移動
    logoutUser() {
      this.axios
        .delete('api/v1/authentication')
        .then(response => {
          console.log(response.status);
          this.$store.commit('flashMessage/setMessage', {
            type: 'success',
            message: 'ログアウトしました'
          });
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);
        });
    }
  }
};
</script>
