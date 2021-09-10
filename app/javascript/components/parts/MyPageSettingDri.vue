<template>
  <div>
    <v-tabs>
      <v-tab>Vitamin</v-tab>
      <v-tab>Mineral</v-tab>

      <v-tab-item>
        <v-sheet
          elevation="0"
          color="blue"
        >
          <template
            v-for="v in vitamins"
          >
            <my-page-setting-dri-card
              :key="v.label"
              :label="v.label"
              :amount="v.amount"
              :unit="v.unit"
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
            <my-page-setting-dri-card
              :key="m.label"
              :label="m.label"
              :amount="m.amount"
              :unit="m.unit"
            />
          </template>
        </v-sheet>
      </v-tab-item>
    </v-tabs>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import MyPageSettingDriCard from './MyPageSettingDriCard';

export default {
  components: {
    MyPageSettingDriCard
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