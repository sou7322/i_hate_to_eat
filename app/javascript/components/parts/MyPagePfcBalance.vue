<template>
  <my-page-pfc-balance-chart
    :chart-data="chartdata"
    :options="options"
  />
</template>

<script>
import MyPagePfcBalanceChart from './MyPagePfcBalanceChart';

export default {
  components: {
    MyPagePfcBalanceChart
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
          console.log(this.chartdata);
          const res = response.data;
          console.log(res.pct);
          this.chartdata = {
            labels: ['Protein', 'Fat', 'Carbo'],
            datasets: [
              {
                backgroundColor: ['#5A7899', '#5A998E', '#995A5A'],
                data: res.pct
              }
            ]
          };
          console.log(this.chartdata);
        });
    }
  }
};
</script>
