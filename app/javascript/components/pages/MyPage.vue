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
      <my-page-settings />
    </v-tab-item>
    <v-tab-item>
      <p>
        my-page-accounts
      </p>
    </v-tab-item>
    <v-tab-item>
      <p>
        my-page-unsubscribe
      </p>
    </v-tab-item>
  </v-tabs>
</template>

<script>
import MyPageSettings from '../parts/MyPageSettings';

export default {
  components: {
    MyPageSettings
  }
};
</script>

