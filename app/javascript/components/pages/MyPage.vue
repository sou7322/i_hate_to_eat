<template>
  <v-tabs vertical>
    <v-tab>
      摂取基準設定
    </v-tab>
    <v-tab>
      アカウント設定
    </v-tab>
    <v-tab>
      退会
    </v-tab>

    <v-tab-item>
      <my-page-intake-standards />
    </v-tab-item>
    <v-tab-item>
      <p>
        coming soon...
      </p>
    </v-tab-item>
    <v-tab-item>
      <p>
        coming soon...
      </p>
    </v-tab-item>
  </v-tabs>
</template>

<script>
import MyPageIntakeStandards from '../parts/MyPageIntakeStandards';

export default {
  components: {
    MyPageIntakeStandards
  }
};
</script>
