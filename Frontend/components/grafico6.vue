<template>
  <div>
    <Nuxt />
    <center>
      <h5>Grafico de Dispersión del mes de Diciembre</h5>
    </center>
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

      this.chartData.datasets = [
        {
          label: 'Empresa A',
          fill: false,
          borderColor: '#f87979',
          backgroundColor: '#f87979',
          data:[
            {
              x: 1,
              y: datosGrafico6[0][0]
            },
            {
              x: 2,
              y: datosGrafico6[0][1]
            },
            {
              x: 3,
              y: datosGrafico6[0][2]
            },
            {
              x: 4,
              y: datosGrafico6[0][3]
            },
            {
              x: 5,
              y: datosGrafico6[0][4]
            },
            {
              x: 6,
              y: datosGrafico6[0][5]
            },
            {
              x: 7,
              y: datosGrafico6[0][6]
            },
            {
              x: 8,
              y: datosGrafico6[0][7]
            },
            {
              x: 9,
              y: datosGrafico6[0][8]
            },
            {
              x: 10,
              y: datosGrafico6[0][9]
            },
            {
              x: 11,
              y: datosGrafico6[0][10]
            },
            {
              x: 12,
              y: datosGrafico6[0][11]
            },
            {
              x: 13,
              y: datosGrafico6[0][12]
            },
            {
              x: 14,
              y: datosGrafico6[0][13]
            },
            {
              x: 15,
              y: datosGrafico6[0][14]
            },
            {
              x: 16,
              y: datosGrafico6[0][15]
            },
            {
              x: 17,
              y: datosGrafico6[0][16]
            },
            {
              x: 18,
              y: datosGrafico6[0][17]
            },
            {
              x: 19,
              y: datosGrafico6[0][18]
            },
            {
              x: 20,
              y: datosGrafico6[0][19]
            },
            {
              x: 21,
              y: datosGrafico6[0][20]
            },
            {
              x: 22,
              y: datosGrafico6[0][21]
            },
            {
              x: 23,
              y: datosGrafico6[0][22]
            },
            {
              x: 24,
              y: datosGrafico6[0][23]
            },
            {
              x: 25,
              y: datosGrafico6[0][24]
            },
            {
              x: 26,
              y: datosGrafico6[0][25]
            },
            {
              x: 27,
              y: datosGrafico6[0][26]
            },
            {
              x: 28,
              y: datosGrafico6[0][27]
            },
            {
              x: 29,
              y: datosGrafico6[0][28]
            },
            {
              x: 30,
              y: datosGrafico6[0][29]
            },
            {
              x: 31,
              y: datosGrafico6[0][30]
            },
          ]
        },
        {
          label: 'Empresa B',
          fill: false,
          borderColor: '#7acbf9',
          backgroundColor: '#7acbf9',
          data:[
            {
              x: 1,
              y: datosGrafico6[1][0]
            },
            {
              x: 2,
              y: datosGrafico6[1][1]
            },
            {
              x: 3,
              y: datosGrafico6[1][2]
            },
            {
              x: 4,
              y: datosGrafico6[1][3]
            },
            {
              x: 5,
              y: datosGrafico6[1][4]
            },
            {
              x: 6,
              y: datosGrafico6[1][5]
            },
            {
              x: 7,
              y: datosGrafico6[1][6]
            },
            {
              x: 8,
              y: datosGrafico6[1][7]
            },
            {
              x: 9,
              y: datosGrafico6[1][8]
            },
            {
              x: 10,
              y: datosGrafico6[1][9]
            },
            {
              x: 11,
              y: datosGrafico6[1][10]
            },
            {
              x: 12,
              y: datosGrafico6[1][11]
            },
            {
              x: 13,
              y: datosGrafico6[1][12]
            },
            {
              x: 14,
              y: datosGrafico6[1][13]
            },
            {
              x: 15,
              y: datosGrafico6[1][14]
            },
            {
              x: 16,
              y: datosGrafico6[1][15]
            },
            {
              x: 17,
              y: datosGrafico6[1][16]
            },
            {
              x: 18,
              y: datosGrafico6[1][17]
            },
            {
              x: 19,
              y: datosGrafico6[1][18]
            },
            {
              x: 20,
              y: datosGrafico6[1][19]
            },
            {
              x: 21,
              y: datosGrafico6[1][20]
            },
            {
              x: 22,
              y: datosGrafico6[1][21]
            },
            {
              x: 23,
              y: datosGrafico6[1][22]
            },
            {
              x: 24,
              y: datosGrafico6[1][23]
            },
            {
              x: 25,
              y: datosGrafico6[1][24]
            },
            {
              x: 26,
              y: datosGrafico6[1][25]
            },
            {
              x: 27,
              y: datosGrafico6[1][26]
            },
            {
              x: 28,
              y: datosGrafico6[1][27]
            },
            {
              x: 29,
              y: datosGrafico6[1][28]
            },
            {
              x: 30,
              y: datosGrafico6[1][29]
            },
            {
              x: 31,
              y: datosGrafico6[1][30]
            },
          ]
        },
        {
          label: 'Empresa C',
          fill: false,
          borderColor: 'orange',
          backgroundColor: 'orange',
          data:[
            {
              x: 1,
              y: datosGrafico6[2][0]
            },
            {
              x: 2,
              y: datosGrafico6[2][1]
            },
            {
              x: 3,
              y: datosGrafico6[2][2]
            },
            {
              x: 4,
              y: datosGrafico6[2][3]
            },
            {
              x: 5,
              y: datosGrafico6[2][4]
            },
            {
              x: 6,
              y: datosGrafico6[2][5]
            },
            {
              x: 7,
              y: datosGrafico6[2][6]
            },
            {
              x: 8,
              y: datosGrafico6[2][7]
            },
            {
              x: 9,
              y: datosGrafico6[2][8]
            },
            {
              x: 10,
              y: datosGrafico6[2][9]
            },
            {
              x: 11,
              y: datosGrafico6[2][10]
            },
            {
              x: 12,
              y: datosGrafico6[2][11]
            },
            {
              x: 13,
              y: datosGrafico6[2][12]
            },
            {
              x: 14,
              y: datosGrafico6[2][13]
            },
            {
              x: 15,
              y: datosGrafico6[2][14]
            },
            {
              x: 16,
              y: datosGrafico6[2][15]
            },
            {
              x: 17,
              y: datosGrafico6[2][16]
            },
            {
              x: 18,
              y: datosGrafico6[2][17]
            },
            {
              x: 19,
              y: datosGrafico6[2][18]
            },
            {
              x: 20,
              y: datosGrafico6[2][19]
            },
            {
              x: 21,
              y: datosGrafico6[2][20]
            },
            {
              x: 22,
              y: datosGrafico6[2][21]
            },
            {
              x: 23,
              y: datosGrafico6[2][22]
            },
            {
              x: 24,
              y: datosGrafico6[2][23]
            },
            {
              x: 25,
              y: datosGrafico6[2][24]
            },
            {
              x: 26,
              y: datosGrafico6[2][25]
            },
            {
              x: 27,
              y: datosGrafico6[2][26]
            },
            {
              x: 28,
              y: datosGrafico6[2][27]
            },
            {
              x: 29,
              y: datosGrafico6[2][28]
            },
            {
              x: 30,
              y: datosGrafico6[2][29]
            },
            {
              x: 31,
              y: datosGrafico6[2][30]
            },
          ]
        },
      ]
    },
  },
};
</script>