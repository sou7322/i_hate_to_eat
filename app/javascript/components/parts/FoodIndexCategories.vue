<template>
  <div>
    <template v-for="c in categories">
      <v-btn
        :key="c.id"
        depressed
        large
        outlined
        tile
        height="80"
        width="150"
        :to="{ name: 'FoodIndexByCategory', params: {id: c.id}}"
      >
        {{ c.attributes.name }}
      </v-btn>
    </template>
  </div>
</template>

<script>
export default {
  data() {
    return {
      categories: {}
    };
  },
  mounted() {
    this.setCategories();
  },
  methods: {
    setCategories() {
      this.axios
        .get('/api/v1/food_categories')
        .then(response => {
          console.log(response.status);
          this.categories = response.data.data;
        })
        .catch(error => {
          console.error(error.response.status);
        });
    }
  }
};
</script>
