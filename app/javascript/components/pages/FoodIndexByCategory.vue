<template>
  <div>
    <food-index-table
      :foods="foods"
    />
  </div>
</template>

<script>
import FoodIndexTable from '../parts/FoodIndexTable';

export default {
  components: {
    FoodIndexTable
  },
  data() {
    return {
      foods: []
    };
  },
  mounted() {
    this.setFoods();
  },
  methods: {
    setFoods() {
      this.axios
        .get(`/api/v1/food_categories/${this.$route.params.id}/foods`)
        .then(res => {
          console.log(res.status);
          this.foods = res.data;
        })
        .catch(e => {
          console.error(e.response.status);
        });
    }
  }
};
</script>