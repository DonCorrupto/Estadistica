<template>
  <div style="display:flex">
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
    <div style="margin-left: 2%">
        <h5 style="margin-top:5%">{{mayorVentas}}</h5>
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
      mayorVentas: null,
      chartData: {
        labels: [
          "Empresa A",
          "Empresa B",
          "Empresa C",
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

      const datosGrafico4 = response.data.data2;
      //console.log(datosGrafico4);
      this.chartData.datasets = [
        {
          label: "Ventas del año 2020",
          backgroundColor: "mediumseagreen",
          data: datosGrafico4,
        },
      ];

      if (datosGrafico4[0] > datosGrafico4[1] || datosGrafico4[0]  > datosGrafico4[2] ) {
        this.mayorVentas = "La empresa con mayores ventas del año 2020 es: Empresa A";
      } else if (datosGrafico4[1] > datosGrafico4[0] || datosGrafico4[1]  > datosGrafico4[2]) {
        this.mayorVentas = "La empresa con mayores ventas del año 2020 es: Empresa B";
      } else {
        this.mayorVentas = "La empresa con mayores ventas del año 2020 es: Empresa C";
      }

    },
  },
};
</script>