<template>
  <v-card
    flat
    tile
    outlined
    height="70"
    width="130"
  >
    <v-card-text>
      <div class="text-subtitle-2 text-center">
        {{ label }}
      </div>
      <div class="text-body-2 text-center">
        {{ amount }} {{ unit }}
      </div>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    label: {
      type: String,
      required: true,
      default: ''
    },
    amount: {
      // TODO: warnログ回避のために一時タイプを複数指定
      type: [String, Number],
      required: true,
      default: ''
    },
    unit: {
      type: String,
      required: true,
      default: 'mg'
    }
  }
};
</script>