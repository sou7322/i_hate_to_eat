<template>
  <v-tabs vertical>
    <v-tab>
      カテゴリー一覧
    </v-tab>
    <v-tab>
      タグ一覧
    </v-tab>

    <v-tab-item>
      <food-index-categories />
    </v-tab-item>
    <v-tab-item>
      <p>
        comming soon...
      </p>
    </v-tab-item>
  </v-tabs>
</template>

<script>
import FoodIndexCategories from '../parts/FoodIndexCategories';

export default {
  components: {
    FoodIndexCategories
  }
};
</script>