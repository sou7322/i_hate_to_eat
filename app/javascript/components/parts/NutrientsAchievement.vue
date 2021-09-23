<template>
  <v-tabs>
    <v-tab>Macro</v-tab>
    <v-tab>Vitamin</v-tab>
    <v-tab>Mineral</v-tab>

    <v-tab-item class="tab-item">
      <template
        v-for="m in macro"
      >
        <v-card
          :key="m.key"
          flat
          tile
          width="190"
          height="120"
          color="pDark"
          class="left"
        >
          <v-card-title>
            <span class="text-subtitle-1 base--text">
              {{ m.label }}
            </span>
          </v-card-title>
          <v-card-text>
            <div class="base--text">
              <span class="text-caption">Total:</span>
              <span class="text-body-2">{{ m.total }}</span>
              <span class="text-caption">{{ m.unit }}</span>
            </div>
            <div class="base--text">
              <span class="text-caption">Achv:</span>
              <span class="text-body-2">{{ m.achv }}</span>
              <span class="text-caption">%</span>
            </div>
          </v-card-text>
        </v-card>
      </template>
    </v-tab-item>
    <v-tab-item class="tab-item">
      <template
        v-for="v in vitamins"
      >
        <v-card
          :key="v.key"
          flat
          tile
          width="190"
          height="120"
          color="pDark"
          class="left"
        >
          <v-card-title>
            <span class="text-subtitle-1 base--text">
              {{ v.label }}
            </span>
          </v-card-title>
          <v-card-text>
            <div class="base--text">
              <span class="text-caption">Total:</span>
              <span class="text-body-2">{{ v.total }}</span>
              <span class="text-caption">{{ v.unit }}</span>
            </div>
            <div class="base--text">
              <span class="text-caption">Achv:</span>
              <span class="text-body-2">{{ v.achv }}</span>
              <span class="text-caption">%</span>
            </div>
          </v-card-text>
        </v-card>
      </template>
    </v-tab-item>
    <v-tab-item class="tab-item">
      <template
        v-for="m in minerals"
      >
        <v-card
          :key="m.key"
          flat
          tile
          width="190"
          height="120"
          color="pDark"
          class="left"
        >
          <v-card-title>
            <span class="text-subtitle-1 base--text">
              {{ m.label }}
            </span>
          </v-card-title>
          <v-card-text>
            <div class="base--text">
              <span class="text-caption">Total:</span>
              <span class="text-body-2">{{ m.total }}</span>
              <span class="text-caption">{{ m.unit }}</span>
            </div>
            <div class="base--text">
              <span class="text-caption">Achv:</span>
              <span class="text-body-2">{{ m.achv }}</span>
              <span class="text-caption">%</span>
            </div>
          </v-card-text>
        </v-card>
      </template>
    </v-tab-item>
  </v-tabs>
</template>

<script>
import { mapGetters } from 'vuex';

export default {
  computed: {
    ...mapGetters('nutrientsAchievement', [
      'macro',
      'vitamins',
      'minerals'
    ])
  }
};
</script>

<style scoped>
.left {
  float: left;
  margin: 1px;
}

.tab-item {
  padding: 15px;
}
</style>
