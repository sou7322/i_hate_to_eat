<template>
  <v-card
    class="mx-auto my-16"
    flat
    outlined
    max-width="500"
  >
    <v-card-title>
      <v-row class="text-center">
        <v-col cols="12">
          <div class="text-h5">
            新規ユーザー登録
          </div>
        </v-col>
      </v-row>
    </v-card-title>
    <validation-observer
      ref="observer"
      v-slot="{ handleSubmit }"
    >
      <v-form @submit.prevent="handleSubmit(createUser)">
        <v-card-text>
          <div v-if="railsErrors.errorMessages.length != 0">
            <v-alert
              v-for="e in railsErrors.errorMessages"
              :key="e"
              class="text-center"
              dense
              type="error"
            >
              <v-row>
                {{ e }}
              </v-row>
            </v-alert>
          </div>
          <v-row>
            <v-col>
              <validation-provider
                v-slot="{ errors }"
                name="ユーザーネーム"
                rules="required"
              >
                <v-text-field
                  v-model="user.name"
                  :error-messages="errors"
                  type="text"
                  label="ユーザーネーム"
                />
              </validation-provider>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <validation-provider
                v-slot="{ errors }"
                name="メールアドレス"
                rules="email|required"
              >
                <v-text-field
                  v-model="user.email"
                  :error-messages="errors"
                  label="メールアドレス"
                  type="email"
                  required
                />
              </validation-provider>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <validation-provider
                v-slot="{ errors }"
                name="パスワード"
                rules="alpha_num|min:5|required"
                vid="confirmation"
              >
                <v-text-field
                  v-model="user.password"
                  :error-messages="errors"
                  label="パスワード"
                  type="password"
                  required
                />
              </validation-provider>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <validation-provider
                v-slot="{ errors }"
                name="パスワード（確認）"
                rules="confirmed:confirmation|required"
              >
                <v-text-field
                  v-model="user.password_confirmation"
                  :error-messages="errors"
                  label="パスワード（確認）"
                  type="password"
                  required
                />
              </validation-provider>
            </v-col>
          </v-row>
        </v-card-text>
        <v-card-actions>
          <v-row class="text-center">
            <v-col>
              <v-btn
                type="submit"
              >
                登録
              </v-btn>
            </v-col>
          </v-row>
        </v-card-actions>
      </v-form>
    </validation-observer>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      },
      railsErrors: {
        message: '',
        errorMessages: []
      }
    };
  },
  methods: {
    createUser() {
      this.axios
        .post('api/v1/registration', { user: this.user })
        .then(response => {
          console.log(response.status);
          this.$store.commit('flashMessage/setMessage', {
            type: 'success',
            message: '登録が完了しました'
          });
          // [ToDO] 遷移先を一時的にTopに、後に修正
          this.$router.push({ name: 'TopPage' });
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);
          if (e.data. errors ) { this.railsErrors.errorMessages = e.data. errors; };
        });
    }
  }
};
</script>