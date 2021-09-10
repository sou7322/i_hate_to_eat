<template>
  <v-row>
    <v-col>
      <v-card
        class="mx-auto my-16"
        flat
        outlined
        max-width="500"
      >
        <v-card-title>
          <div class="text-h5">
            新規ユーザー登録
          </div>
        </v-card-title>
        <validation-observer
          ref="observer"
          v-slot="{ handleSubmit }"
        >
          <v-form @submit.prevent="handleSubmit(createUser)">
            <v-card-text>
              <div v-if="railsErrors.show">
                <v-alert
                  v-for="e in railsErrors.errorMessages"
                  :key="e"
                  class="text-center"
                  dense
                  type="error"
                >
                  {{ e }}
                </v-alert>
              </div>
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
              <v-radio-group
                v-model="user.gender"
                label="性別"
                row
                mandatory
              >
                <v-radio
                  label="女性"
                  value="female"
                />
                <v-radio
                  label="男性"
                  value="male"
                />
              </v-radio-group>
              <v-menu
                v-model="birthInput"
                :close-on-content-click="false"
              >
                <template #activator="{ on }">
                  <validation-provider
                    v-slot="{ errors }"
                    name="生年月日"
                    rules="required|abailable_age"
                  >
                    <v-text-field
                      v-model="user.birth"
                      :error-messages="errors"
                      label="生年月日"
                      type="date"
                      readonly
                      v-on="on"
                    />
                  </validation-provider>
                </template>
                <v-date-picker
                  v-model="user.birth"
                  @input="birthInput = false"
                />
              </v-menu>
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
            </v-card-text>
            <v-card-actions>
              <v-btn
                type="submit"
              >
                登録
              </v-btn>
            </v-card-actions>
          </v-form>
        </validation-observer>
      </v-card>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      user: {
        name: '',
        email: '',
        gender: '',
        birth: '',
        password: '',
        password_confirmation: ''
      },
      birthInput: false,
      railsErrors: {
        show: false,
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
          // TODO: 遷移先を一時的にTopに、後に修正
          this.$router.push({ name: 'TopPage' });
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);

          if (e.data. errors ) { this.railsErrors.errorMessages = e.data. errors; };
          if (this.railsErrors.errorMessages.length != 0) {
            this.railsErrors.show = true;
            setTimeout(() => { this.railsErrors.show = false; }, 5000);
          }
        });
    }
  }
};
</script>