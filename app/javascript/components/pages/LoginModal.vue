<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog"
      max-width="600"
    >
      <template #activator="{ on }">
        <v-row>
          <v-col>
            <v-btn
              text
              class="text-capitalize"
              v-on="on"
            >
              login
            </v-btn>
          </v-col>
        </v-row>
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
              <div v-if="railsErrors.show">
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
        show: false,
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
          this.dialog = false;
          this.$store.commit('authUser/login', response.data);
          this.$store.commit('flashMessage/setMessage', {
            type: 'success',
            message: 'ログインしました'
          });
          this.$router.push({ name: 'HomePage' });
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);

          if (e.data.errors) { this.railsErrors.errorMessages = e.data.errors; };
          if (this.railsErrors.errorMessages.length != 0) {
            this.railsErrors.show = true;
            setTimeout(() => { this.railsErrors.show = false; }, 5000);
          }
        });
    }
  }
};
</script>