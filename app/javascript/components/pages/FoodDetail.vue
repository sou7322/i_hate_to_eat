<template>
  <v-card>
    <v-card-title>
      <span class="text-h6">{{ info.name }}</span>
    </v-card-title>
    <v-card-subtitle>
      <span class="text-subtitle-1">{{ info.subname }}</span>
    </v-card-subtitle>
    <v-card-text>
      <v-tabs>
        <v-tab>Macro</v-tab>
        <v-tab>Vitamin</v-tab>
        <v-tab>Mineral</v-tab>

        <v-tab-item>
          <template
            v-for="m in macro"
          >
            <nutrient-card
              :key="m.label"
              :label="m.label"
              :amount="m.amount"
              :unit="m.unit"
              class="left"
            />
          </template>
        </v-tab-item>
        <v-tab-item>
          <template
            v-for="v in vitamins"
          >
            <nutrient-card
              :key="v.label"
              :label="v.label"
              :amount="v.amount"
              :unit="v.unit"
              class="left"
            />
          </template>
        </v-tab-item>
        <v-tab-item>
          <template
            v-for="m in minerals"
          >
            <nutrient-card
              :key="m.label"
              :label="m.label"
              :amount="m.amount"
              :unit="m.unit"
              class="left"
            />
          </template>
        </v-tab-item>
      </v-tabs>
    </v-card-text>
  </v-card>
</template>

<script>
import { mapState } from 'vuex';
import nutrientCard from '../parts/nutrientCard';

export default {
  components: {
    nutrientCard
  },
  computed: {
    ...mapState('foodDetail', {
      info: state => state.basicInfo,
      macro: state => state.macro,
      vitamins: state => state.vitamins,
      minerals: state => state.minerals
    })
  }
};
</script>

<style scoped>
.left {
  float: left
}
</style>
