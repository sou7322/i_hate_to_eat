<template>
  <v-row>
    <v-col
      cols="12"
      md="4"
    >
      <bmr-form />
    </v-col>
    <v-col
      cols="12"
      md="4"
    >
      <my-page-pfc-balance />
    </v-col>
    <v-col
      cols="12"
      md="4"
    >
      <p>coming soon...</p>
    </v-col>
  </v-row>
</template>

<script>
import BmrForm from './BmrForm';
import MyPagePfcBalance from '../parts/MyPagePfcBalance';

export default {
  components: {
    BmrForm,
    MyPagePfcBalance
  },
};
</script>