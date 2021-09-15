<template>
  <div>
    <food-index-table
      :headers="headers"
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
      headers: [
        {
          text: '食品名',
          value: 'name',
          align: 'end',
          width: '10px'
        },
        {
          text: '',
          value: 'subname',
          align: 'start',
          width: '10px',
          sortable: false
        },
        {
          text: 'kcal',
          value: 'calorie',
          align: 'center',
          width: '20px'
        }
      ],
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