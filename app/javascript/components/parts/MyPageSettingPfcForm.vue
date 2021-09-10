<template>
  <validation-observer
    ref="observer"
    v-slot="{ handleSubmit }"
  >
    <v-form @submit.prevent="handleSubmit(emitSubmit)">
      <validation-provider
        v-slot="{ errors }"
        name="P"
        rules="required|numeric|max_value:80|min_value:10"
      >
        <v-slider
          v-model.number="percentage_protein"
          thumb-label
          :thumb-size="32"
          thumb-color="#5A7899"
          :error-messages="errors"
          color="#5A7899"
          label="P"
          :max="80"
          :min="10"
        >
          <template #thumb-label="item">
            {{ item.value }}%
          </template>
        </v-slider>
      </validation-provider>
      <validation-provider
        v-slot="{ errors }"
        name="F"
        rules="required|numeric|max_value:80|min_value:10"
      >
        <v-slider
          v-model.number="percentage_fat"
          thumb-label
          :thumb-size="32"
          thumb-color="#995A5A"
          :error-messages="errors"
          color="#995A5A"
          label="F"
          :max="80"
          :min="10"
        >
          <template #thumb-label="item">
            {{ item.value }}%
          </template>
        </v-slider>
      </validation-provider>
      <validation-provider
        v-slot="{ errors }"
        name="C"
        rules="required|numeric|max_value:80|min_value:10"
      >
        <v-slider
          v-model.number="percentage_carbohydrate"
          thumb-label
          :thumb-size="32"
          thumb-color="#5A998E"
          :error-messages="errors"
          color="#5A998E"
          label="C"
          :max="80"
          :min="10"
        >
          <template #thumb-label="item">
            {{ item.value }}%
          </template>
        </v-slider>
      </validation-provider>
      <v-btn
        type="submit"
        depressed
        outlined
        small
      >
        更新
      </v-btn>
    </v-form>
  </validation-observer>
</template>

<script>
export default {
  data() {
    return{
    };
  },
  computed: {
    percentage_protein: {
      get() { return Math.floor(this.$store.state.pfcBalance.percentage_protein * 100); },
      set(value) { this.$store.commit('pfcBalance/updateP', value / 100); }
    },
    percentage_fat: {
      get() { return Math.floor(this.$store.state.pfcBalance.percentage_fat * 100); },
      set(value) { this.$store.commit('pfcBalance/updateF', value / 100); }
    },
    percentage_carbohydrate: {
      get() { return Math.floor(this.$store.state.pfcBalance.percentage_carbohydrate * 100); },
      set(value) { this.$store.commit('pfcBalance/updateC', value / 100); }
    },
  },
  methods: {
    emitSubmit() {
      this.$emit('submit');
    }
  }
};
</script>