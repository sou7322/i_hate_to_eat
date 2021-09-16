<template>
  <div>
    <v-tabs>
      <v-tab>Vitamin</v-tab>
      <v-tab>Mineral</v-tab>

      <v-tab-item>
        <v-sheet
          elevation="0"
        >
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
        </v-sheet>
      </v-tab-item>
      <v-tab-item>
        <v-sheet
          elevation="0"
          color="blue"
        >
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
        </v-sheet>
      </v-tab-item>
    </v-tabs>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import nutrientCard from './nutrientCard';

export default {
  components: {
    nutrientCard
  },
  computed: {
    ...mapState('referenceIntakes', {
      vitamins: state => state.vitamins,
      minerals: state => state.minerals
    })
  },
  mounted() {
    this.setData();
  },
  methods: {
    setData() {
      this.axios
        .get('/api/v1/users_dietary_reference')
        .then(response => {
          this.$store.dispatch(
            'referenceIntakes/setAttributes',
            response.data.data.attributes
          );
        });
    },
  }
};
</script>

<style scoped>
.left {
  float: left
}
</style>