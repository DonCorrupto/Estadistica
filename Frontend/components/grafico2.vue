<template>
  <div>
    <Nuxt />
    <div style="display: flex">
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
        <b-table striped hover :items="items"></b-table>
        <center><h6>Prueba de Hipotesis</h6></center>
        <p>
            Con experiencias pasadas, la empresa B predijo que el valor de venta anual sería de $2.500.000 en el año 2020. A finales del año, la empresa elige
            una muestra aleatoria de 150 dias y calcula una media y una desviacion estandar de # y # respectivamente.
            Utilice un nivel de significancia de 0.05 para determiar si el pronostico de la empresa B era razonable.
          </p>
      </div>
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
      items: [{}],
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

      const datosGrafico2 = response.data.data[1];
      //console.log(datosGrafico2);
      this.chartData.datasets = [
        {
          label: "Valor de venta mensual de la empresa B",
          backgroundColor: "orange",
          data: datosGrafico2,
        },
      ];

      const empresaB = response.data.empresaB;
      //console.log(empresaB);
      this.items = [
        {
          Media: empresaB[0],
          Mediana: empresaB[1],
          Desviación: empresaB[2],
          Varianza: empresaB[3],
          Correlación: empresaB[4],
          Covarianza: empresaB[5],
          Moda: empresaB[6],
        },
      ];
    },
  },
};
</script>