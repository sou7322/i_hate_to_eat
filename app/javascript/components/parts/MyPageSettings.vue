<template>
  <v-row>
    <v-col
      cols="12"
      md="4"
    >
      <bmr-form class="margin" />
    </v-col>
    <v-col
      cols="12"
      md="4"
    >
      <my-page-setting-pfc class="margin" />
    </v-col>
    <v-col
      cols="12"
      md="4"
    >
      <my-page-setting-dri class="margin" />
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

<style scoped>
.margin {
  margin: 30px;
}
</style>