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
          <v-card-actions>
            <v-btn
              text
              outlined
              @click.stop="setFoodDetails(food.id); showDetail = true"
            >
              詳細
            </v-btn>

            <v-row justify="center">
              <v-dialog
                v-model="showDetail"
                width="600"
                scrollable
              >
                <food-detail />
              </v-dialog>
            </v-row>
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-data-iterator>
</template>

<script>
import FoodDetail from '../pages/FoodDetail';

export default {
  components: {
    FoodDetail
  },
  props: {
    foods: {
      type: Array,
      default: () => ([])
    }
  },
  data() {
    return {
      showDetail: false,
    };
  },
  methods: {
    setFoodDetails(foodId) {
      this.axios
        .get(`/api/v1/food_categories/${ this.$route.params.id }/foods/${ foodId }`)
        .then(res => {
          console.log(res.status);
          this.$store.dispatch(
            'foodDetail/setAttributes',
            res.data.data.attributes
          );
        })
        .catch(e => {
          console.error(e.response.status);
        });
    }
  }
};
</script>