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

    <!-- <template v-slot:footer>
      <v-row>
        <p>表示件数</p>
        <v-menu offset-y>
          <template v-slot:activator="{ on, attrs }">
            <v-btn
              text
              v-bind="attrs"
              v-on="on"
            >
              {{ itemsPerPage }}
              <v-icon>mdi-chevron-down</v-icon>
            </v-btn>
          </template>
          <v-list>
            <v-list-item
              v-for="(num, index) in itemsPerPageArray"
              :key="index"
              @click="updateItemsPage(num)"
            >
              <v-list-item-title>{{ num }}</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
        <p>{{ page }} / {{ numberOfPages }}</p>
        <v-btn @click="formerPage">
          <v-icon>mdi-chevron-left</v-icon>
        </v-btn>
        <v-btn @click="nextPage">
          <v-icon>mdi-chevron-right</v-icon>
        </v-btn>
      </v-row>
    </template> -->
  </v-data-iterator>
</template>

<script>
export default {
  props: {
    headers: {
      type: Array,
      default: () => ([])
    },
    foods: {
      type: Array,
      default: () => ([])
    }
  },
  data() {
    return {
      itemsPerPage: 10,
      itemsPerPageArray: [10, 20, 30],
      page: 1
    };
  },
  computed: {
    numberOfPages() {
      return Math.ceil(this.foods.length / this.itemsPerPage);
    }
  },
  methods: {
    nextPage() {
      if (this.page + 1 <= this.numberOfPages) this.page += 1;
    },
    formerPage() {
      if (this.page - 1 >= 1) this.page -=1;
    },
    updateItemsPerPage(num) {
      this.itemsPerPage = num;
    }
  }
};
</script>