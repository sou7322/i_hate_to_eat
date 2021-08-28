<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog"
      max-width="600"
    >
      <template #activator="{ on }">
        <v-btn
          text
          v-on="on"
        >
          login
        </v-btn>
      </template>
      <v-card
        flat
        outlined
      >
        <v-card-title>
          <div class="text-4">
            ログイン
          </div>
        </v-card-title>
        <validation-observer
          ref="observer"
          v-slot="{ handleSubmit }"
        >
          <v-form @submit.prevent="handleSubmit(loginUser)">
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
                    <v-col>
                      {{ e }}
                    </v-col>
                  </v-row>
                </v-alert>
              </div>
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
            </v-card-text>
            <v-card-actions>
              <v-row class="text-center">
                <v-col>
                  <v-btn type="submit">
                    ログイン
                  </v-btn>
                </v-col>
                <v-col>
                  <v-btn @click="dialog = false">
                    キャンセル
                  </v-btn>
                </v-col>
              </v-row>
            </v-card-actions>
          </v-form>
        </validation-observer>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
      user: {
        email: '',
        password: ''
      },
      railsErrors: {
        message: '',
        errorMessages: []
      }
    };
  },
  methods: {
    loginUser() {
      this.axios
        .post('api/v1/authentication', { user: this.user })
        .then(response => {
          console.log(response.status);
          this.$store.commit('flashMessage/setMessage', {
            type: 'success',
            message: 'ログインしました'
          });
          this.dialog = false;
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