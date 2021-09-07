<template>
  <div>
    <div v-if="railsErrors.show">
      <v-alert
        v-for="e in railsErrors.errorMessages"
        :key="e"
        class="text-center"
        dense
        type="error"
      >
        <v-row>
          {{ e }}
        </v-row>
      </v-alert>
    </div>
    <my-page-pfc-balance-chart
      :chart-data="chartdata"
      :options="options"
    />
    <my-page-pfc-balance-form @submit="updatePfc" />
  </div>
</template>

<script>
import MyPagePfcBalanceChart from './MyPagePfcBalanceChart';
import MyPagePfcBalanceForm from './MyPagePfcBalanceForm';

export default {
  components: {
    MyPagePfcBalanceChart,
    MyPagePfcBalanceForm
  },
  data(){
    return {
      chartdata: {},
      options: {
        cutoutPercentage: 65,
        legend: {
          display: false
        },
        responsive: true
      },
      railsErrors: {
        show: false,
        message: '',
        errorMessages: []
      }
    };
  },
  mounted() {
    this.setData();
  },
  methods: {
    setData() {
      this.axios
        .get('/api/v1/pfc')
        .then(response => {
          console.log(response.status);

          this.$store.dispatch(
            'pfcBalance/setAttributes',
            response.data.pct
          );
          this.setChart();
        });
    },
    setChart() {
      this.chartdata = {
        labels: ['Protein', 'Fat', 'Carbo'],
        datasets: [
          {
            backgroundColor: ['#5A7899', '#995A5A', '#5A998E'],
            data: [
              Math.floor(this.$store.state.pfcBalance.percentage_protein * 100),
              Math.floor(this.$store.state.pfcBalance.percentage_fat * 100),
              Math.floor(this.$store.state.pfcBalance.percentage_carbohydrate * 100)
            ]
          }
        ]
      };
    },
    updatePfc() {
      this.axios
        .patch('/api/v1/pfc', { user: this.$store.state.pfcBalance })
        .then(response => {
          console.log(response.status);
          this.setChart();
        })
        .catch(error => {
          let e = error.response;
          console.error(e.status);

          if (e.data.errors) { this.railsErrors.errorMessages = e.data.errors; };
          if (this.railsErrors.errorMessages.length != 0) {
            this.railsErrors.show = true;
            setTimeout(() => { this.railsErrors.show = false; }, 5000);
          }
        });
    }
  }
};
</script>
