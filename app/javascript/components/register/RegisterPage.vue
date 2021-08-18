<template>
  <div>
    <h1>新規ユーザー登録</h1>
    <v-form @submit.prevent="createUser">
      <div v-if="errors.length != 0">
        <ul v-for="e in errors" :key="e">
          <li>{{ e }}</li>
        </ul>
      </div>
      <v-text-field
        v-model="user.name"
        label="ユーザーネーム">
      </v-text-field>
      <v-text-field
        v-model="user.email"
        label="Email">
      </v-text-field>
      <v-text-field
        v-model="user.password"
        label="パスワード">
      </v-text-field>
      <v-text-field
        v-model="user.password_confirmation"
        label="パスワード（確認）">
      </v-text-field>
      <v-btn type="submit">登録</v-btn>
    </v-form>
    <div>
      <p><router-link :to="{ name: 'TopPage' }">ログイン</router-link></p>
      <p><router-link :to="{ name: 'TopPage' }">パスワードをお忘れの方</router-link></p>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      errors: ''
    } 
  },
  methods: {
    createUser() {
      axios
        .post('api/v1/registration', this.user)
        .then(response => {
          let e = response.data;
          // 画面遷移処理を後ほど追加
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  }
}
</script>