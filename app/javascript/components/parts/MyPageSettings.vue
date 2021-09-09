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
      <my-page-setting-pfc />
    </v-col>
    <v-col
      cols="12"
      md="4"
    >
      <my-page-setting-dri />
    </v-col>
  </v-row>
</template>

<script>
import BmrForm from './BmrForm';
import MyPageSettingPfc from '../parts/MyPageSettingPfc';
import MyPageSettingDri from '../parts/MyPageSettingDri';

export default {
  components: {
    BmrForm,
    MyPageSettingPfc,
    MyPageSettingDri
  },
};
</script>