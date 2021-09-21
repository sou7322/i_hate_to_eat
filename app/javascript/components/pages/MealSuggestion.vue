<template>
  <v-tabs>
    <v-tab>Today's meal</v-tab>
    <v-tab>Achievement</v-tab>

    <v-tab-item class="tab-item">
      <template
        v-for="m in suggests"
      >
        <v-card
          :key="m.id"
          flat
          tile
          outlined
          color="pDark"
          height="80"
          width="190"
          class="left"
        >
          <v-card-title>
            <span class="text-subtitle-1 base--text">
              {{ m.name }}
            </span>
          </v-card-title>
          <v-card-subtitle>
            <span class="text-body-2 base--text">
              {{ m.subname }}
            </span>
            <span class="text-body-2 base--text">
              {{ m.reference_amount * 100 }}
            </span>
            <span class="text-caption base--text">%</span>
          </v-card-subtitle>
        </v-card>
      </template>
    </v-tab-item>
    <v-tab-item class="tab-item">
      <nutrients-achievement />
    </v-tab-item>
  </v-tabs>
</template>

<script>
import NutrientsAchievement from '../parts/NutrientsAchievement';

export default {
  components: {
    NutrientsAchievement
  },
  data() {
    return {
      suggests: {}
    };
  },
  mounted() {
    this.setSuggest();
  },
  methods: {
    setSuggest() {
      this.axios
        .get('/api/v1/suggestion')
        .then(res => {
          console.log(res.status);
          const r = res.data;

          this.suggests = r.meals;
          this.$store.dispatch(
            'nutrientsAchievement/setAttributes',
            {
              totals: r.total.attributes,
              achvs: r.achv.attributes
            }
          );
        })
        .catch(e => {
          console.error(e.response.status);
        });
    }
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