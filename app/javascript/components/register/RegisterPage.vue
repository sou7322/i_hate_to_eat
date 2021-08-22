<template>
  <div>
    <h1>新規ユーザー登録</h1>
    <v-form @submit.prevent="createUser">
      <div v-if="errors.errorMessages.length != 0">
        <ul
          v-for="e in errors.errorMessages"
          :key="e"
        >
          <li>{{ e }}</li>
        </ul>
      </div>
      <v-text-field
        v-model="user.name"
        label="ユーザーネーム"
      />
      <v-text-field
        v-model="user.email"
        label="メールアドレス"
      />
      <v-text-field
        v-model="user.password"
        label="パスワード"
      />
      <v-text-field
        v-model="user.password_confirmation"
        label="パスワード（確認）"
      />
      <v-btn type="submit">
        登録
      </v-btn>
    </v-form>
    <div>
      <p>
        <router-link :to="{ name: 'TopPage' }">
          ログイン
        </router-link>
      </p>
      <p>
        <router-link :to="{ name: 'TopPage' }">
          パスワードをお忘れの方
        </router-link>
      </p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
axios.defaults.headers.common = {
  'X-Requested-With': 'XMLHttpRequest',
  'X-CSRF-TOKEN': document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute('content')
};

export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      errors: {
        message: '',
        errorMessages: []
      }
    };
  },
  methods: {
    createUser() {
      axios
        .post('api/v1/registration', { user: this.user })
        .then(response => {
          console.log(response.status);
          // [ToDO] 遷移先を一時的にTopに、後に修正
          this.$router.push({ name: 'TopPage' });
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);
          if (e.data.errors) { this.errors.errorMessages = e.data.errors; };
        });
    }
  }
};
</script>