<template>
  <div>
    <Nuxt />
    <div>
      <Scatter
        :chart-options="chartOptions"
        :chart-data="chartData"
        :chart-id="chartId"
        :dataset-id-key="datasetIdKey"
        :plugins="plugins"
        :css-classes="cssClasses"
        :styles="styles"
        :width="width"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { Scatter } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement,
  Plugin,
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  LineElement,
  CategoryScale,
  LinearScale,
  PointElement
);

export default {
  name: "ScatterChart",
  components: {
    Scatter,
  },
  props: {
    chartId: {
      type: String,
      default: "scatter-chart",
    },
    datasetIdKey: {
      type: String,
      default: "scatter"
    },
    width: {
      type: Number,
      default: 400,
    },
    height: {
      type: Number,
      default: 400,
    },
    cssClasses: {
      default: "",
      type: String,
    },
    styles: {
      type: Object,
      default: () => {},
    },
    plugins: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      chartData: {
        datasets: [{}],
      },

      chartOptions: {
        responsive: true,
        maintainAspectRatio: false,
      },
    };
  },

  beforeMount() {
    this.getDatos();
  },

  methods: {
    async getDatos() {
      const url = "http://127.0.0.1:5000/api/v1/data";
      const response = await axios.get(url);
      //console.log(response);
      this.data = response.data;

      const datosGrafico6 = response.data.grafico6;
      console.log(datosGrafico6);

      let ejeX = []

      for (let i = 0; i < 366; i++) {
        ejeX.push(i);
        
      }
      //console.log(x);

      this.chartData.datasets = [
        {
          label: 'Empresa A',
          fill: false,
          borderColor: '#f87979',
          backgroundColor: '#f87979',
          data:[
            {
              x: 1,
              y: 3
            }
          ]
        }
      ]
    },
  },
};
</script>