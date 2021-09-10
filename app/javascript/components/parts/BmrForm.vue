<template>
  <v-row>
    <v-col>
      <validation-observer
        ref="observer"
        v-slot="{ handleSubmit }"
      >
        <v-form @submit.prevent="handleSubmit(updateBmrAndReference)">
          <div v-if="railsErrors.show">
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
                label="性別"
                row
                mandatory
                :disabled="disableGender"
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
            </v-col>
            <v-btn
              v-show="disableGender"
              x-small
              @click="changeGender"
            >
              変更
            </v-btn>
          </v-row>
          <v-row>
            <v-col>
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
                      v-model="birth"
                      :error-messages="errors"
                      label="生年月日"
                      type="date"
                      readonly
                      :disabled="disableBirth"
                      v-on="on"
                    />
                  </validation-provider>
                </template>
                <v-date-picker
                  v-model="birth"
                  @input="birthInput = false"
                />
              </v-menu>
            </v-col>
            <v-btn
              v-show="disableBirth"
              x-small
              @click="changeBirth"
            >
              変更
            </v-btn>
          </v-row>
          <v-row>
            <v-col>
              <validation-provider
                v-slot="{ errors }"
                name="身長"
                rules="required|numeric"
              >
                <v-text-field
                  v-model.number="height"
                  :error-messages="errors"
                  type="number"
                  suffix="cm"
                  label="身長"
                />
              </validation-provider>
            </v-col>
          </v-row>
          <v-row>
            <v-col>
              <validation-provider
                v-slot="{ errors }"
                name="体重"
                rules="required|numeric"
              >
                <v-text-field
                  v-model.number="weight"
                  :error-messages="errors"
                  type="number"
                  suffix="kg"
                  label="体重"
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
        基礎代謝量: <span class="text-h5">{{ bmr }}</span>kcal
      </p>
      <!-- TODO: 国立健康・栄養研究所の式に変更予定 -->
      <p>BMR（基礎代謝量）の計算にはハリス・ベネディクト方程式(改良版)を採用しています</p>
      <p>日常的に家事・通勤などにおける歩行運動またはスポーツなどの身体活動を行なっている場合は、必要なエネルギー量は多くなります。</p>
    </v-col>
  </v-row>
</template>

<script>
export default {
  data() {
    return {
      railsErrors: {
        show: false,
        message: '',
        errorMessages: []
      },
      disableGender: true,
      disableBirth: true,
      birthInput: false,
    };
  },
  computed: {
    // TODO: 要リファクタリング
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
    this.setData();
  },
  methods: {
    changeGender() {
      this.disableGender = !this.disableGender;
    },
    changeBirth() {
      this.disableBirth = !this.disableBirth;
    },
    setData() {
      this.axios
        .get('/api/v1/bmr')
        .then(response => {
          this.$store.dispatch(
            'bmrParams/setAttributes',
            response.data
          );
        });
    },
    updateBmrAndReference() {
      this.updateBmr();
      // TODO: gender, birthが変更された時のみ実行
      this.updateReferenceIntake();
    },
    updateBmr() {
      this.axios
        .patch('/api/v1/bmr', { user: this.$store.state.bmrParams.user })
        .then(response => {
          console.log(response.status);
          this.$store.commit('bmrParams/updateBmr', response.data.bmr);
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
    },
    updateReferenceIntake() {
      this.axios
        .patch('/api/v1/users_dietary_reference')
        .then(response => {
          console.log(response.status);
          this.$store.dispatch(
            'referenceIntakes/setAttributes',
            response.data.data.attributes
          );
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);
        });
    }
  }
};
</script>