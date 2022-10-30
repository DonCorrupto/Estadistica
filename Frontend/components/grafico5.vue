<template>
  <div style="display: flex">
    <Nuxt />
    <div style="width: 50%">
      <Bar
        :chart-options="chartOptions"
        :chart-data="chartData"
        :chart-id="chartId"
        :dataset-id-key="datasetIdKey"
        :plugins="plugins"
        :css-classes="cssClasses"
        :styles="styles"
        :width="width"
        :height="height"
      />
    </div>
    <div style="margin-left: 4%; width: 50%">
      <h5>{{ mayorMercado }}</h5>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { Bar } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);

export default {
  name: "BarChart",
  components: { Bar },
  props: {
    chartId: {
      type: String,
      default: "bar-chart",
    },
    datasetIdKey: {
      type: String,
      default: "label",
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
      type: Object,
      default: () => {},
    },
  },
  data() {
    return {
      data: null,
      mayorMercado: null,
      chartData: {
        labels: [
          "Enero",
          "Febrero",
          "Marzo",
          "Abril",
          "Mayo",
          "Junio",
          "Julio",
          "Agosto",
          "Septiembre",
          "Octubre",
          "Noviembre",
          "Diciembre",
        ],
        datasets: [{}],
      },
      chartOptions: {
        responsive: true,
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

      const datosGrafico5 = response.data.grafico5;
      //console.log(datosGrafico5);
      this.chartData.datasets = [
        {
          label: "Mes de mayor crecimiento del mercado",
          backgroundColor: "#A569BD",
          data: datosGrafico5[0],
        },
      ];
 
      this.mayorMercado = "El mes de mayor crecimiento del mercado es: " + datosGrafico5[1] + " con " + datosGrafico5[2];
    },
  },
};
</script>