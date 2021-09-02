<template>
  <v-tabs vertical>
    <v-tab>
      摂取基準設定
    </v-tab>
    <v-tab>
      アカウント設定
    </v-tab>
    <v-tab>
      退会
    </v-tab>

    <v-tab-item>
      <v-row>
        <v-col>
          <validation-observer>
            <v-form @submit.prevent="updateBmr">
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
                  <v-radio-group
                    v-model="gender"
                    label="gender"
                    row
                    mandatory
                  >
                    <v-radio
                      label="female"
                      value="female"
                    />
                    <v-radio
                      label="male"
                      value="male"
                    />
                  </v-radio-group>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <validation-provider>
                    <v-menu
                      v-model="birthInput"
                      :close-on-content-click="false"
                    >
                      <template #activator="{ on }">
                        <v-text-field
                          v-model="birth"
                          label="birthday"
                          readonly
                          v-on="on"
                        />
                      </template>
                      <v-date-picker
                        v-model="birth"
                        @input="birthInput = false"
                      />
                    </v-menu>
                  </validation-provider>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <validation-provider>
                    <v-text-field
                      v-model.number="height"
                      type="number"
                      suffix="cm"
                      label="height"
                    />
                  </validation-provider>
                </v-col>
              </v-row>
              <v-row>
                <v-col>
                  <validation-provider>
                    <v-text-field
                      v-model.number="weight"
                      type="number"
                      suffix="kg"
                      label="weight"
                    />
                  </validation-provider>
                </v-col>
              </v-row>
              <v-row class="text-center">
                <v-col>
                  <v-btn
                    type="submit"
                    outlined
                  >
                    =
                  </v-btn>
                </v-col>
              </v-row>
            </v-form>
          </validation-observer>
          <p>
            <span class="text-h5">{{ bmr }}</span>kcal
          </p>
        </v-col>
      </v-row>
    </v-tab-item>
    <v-tab-item>
      <p>
        coming soon...
      </p>
    </v-tab-item>
    <v-tab-item>
      <p>
        coming soon...
      </p>
    </v-tab-item>
  </v-tabs>
</template>

<script>
export default {
  data() {
    return {
      railsErrors: {
        message: '',
        errorMessages: []
      },
      birthInput: false
    };
  },
  computed: {
    gender: {
      get() { return this.$store.state.bmrParams.user.gender; },
      set(value) { this.$store.commit('bmrParams/updateGender', value); }
    },
    birth: {
      get() { return this.$store.state.bmrParams.user.birth; },
      set(value) { this.$store.commit('bmrParams/updateBirth', value); }
    },
    height: {
      get() { return this.$store.state.bmrParams.user.height; },
      set(value) { this.$store.commit('bmrParams/updateHeight', value); }
    },
    weight: {
      get() { return this.$store.state.bmrParams.user.weight; },
      set(value) { this.$store.commit('bmrParams/updateWeight', value); }
    },
    bmr: {
      get() { return this.$store.state.bmrParams.bmr; },
      set(value) { this.$store.commit('bmrParams/updateBmr', value); }
    }
  },
  mounted() {
    console.log('mounted'); // 確認用、これは削除
    this.axios
      .get('/api/v1/bmr')
      .then(response => {
        console.log(response.data); // 確認用、これは削除
        this.$store.dispatch(
          'bmrParams/setAttributes',
          response.data
        );
      });
  },
  methods: {
    updateBmr() {
      this.axios
        .patch('/api/v1/bmr', { user: this.$store.state.bmrParams.user })
        .then(response => {
          console.log(response.data.bmr); // 確認用、これは削除
          console.log(response.status);
          this.$store.commit('bmrParams/updateBmr', response.data.bmr);
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
