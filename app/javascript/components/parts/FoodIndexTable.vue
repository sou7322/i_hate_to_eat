<template>
  <v-data-iterator
    :items="foods"
    item-key="id"
    loading
    loading-text="loading..."
  >
    <v-row>
      <v-col
        v-for="food in foods"
        :key="food.id"
        cols="12"
        sm="6"
        md="4"
      >
        <v-card
          flat
          outlined
          tile
        >
          <v-card-title>
            <p>
              <span class="text-subtitle-1">
                {{ food.name }}
              </span>
              <span class="text-body-2">
                {{ food.subname }}
              </span>
            </p>
          </v-card-title>
          <v-card-subtitle>
            <p class="text-caption">
              {{ food.calorie * food.reference_amount }}kcal / {{ food.reference_amount * 100 }}g
            </p>
          </v-card-subtitle>
        </v-card>
      </v-col>
    </v-row>
  </v-data-iterator>
</template>

<script>
export default {
  props: {
    foods: {
      type: Array,
      default: () => ([])
    }
  }
};
</script>