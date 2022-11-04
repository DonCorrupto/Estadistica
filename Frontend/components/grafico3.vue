<template>
  <div>
    <Nuxt />
    <div style="display: flex">
      <div  style="width: 50%">
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
        <h5>Prueba de Hipotesis</h5>
        <b-table striped hover :items="items"></b-table>
        <p>
          Hipotesis:
        </p>
        <p>
          Ho: μ2 = μ1 Vs Ha: μ2 > μ1
          Ho: μ2 - μ1 = 0 Vs Ha: μ2 - μ1 > 0
        </p>
        <p>
          {{Rta}}
        </p>
      </div>
    </div>
    <br>
    <p style="margin-left: 1%">
      La empresa C empieza el año mal pero con el tiempo tiene un crecimiento casi lineal. El segundo semestre fue el mas beneficio en comparación al primer semestre.
      Teniendo en cuenta que el mercado de la empresa esta ubicado en Colombia ya que maneja un flujo de caja en pesos colombianos, hay que reconocer que tuvo mejores
      resultados que la empresa A. Prueba de hipotesis que realizo la empresa C de que la media del segundo semestre es mayor a la del primer semestre es verdadera.
      Se debe analizar el mes de noviembre ya que fue el mes que decrecio teniendo un pasado de crecimiento; posiblemente por la temporada.
    </p>
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
      Rta: null,

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

      const datosGrafico3 = response.data.data[2];
      //console.log(datosGrafico3);
      this.chartData.datasets = [
        {
          label: "Valor de venta mensual de la empresa C",
          backgroundColor: "dodgerblue",
          data: datosGrafico3,
        },
      ];

      const empresaC = response.data.empresaC;
      const semestreC = response.data.graficoEmpresa_C;
      //console.log(empresaC);
      this.items = [
        {
          variables: "Y_muestral",
          Semestre_1: semestreC[1],
          Semestre_2: semestreC[2],
        },
        {
          variables: "S",
          Semestre_1: semestreC[3],
          Semestre_2: semestreC[4],
        },
        {
          variables: "n",
          Semestre_1: semestreC[0],
          Semestre_2: semestreC[0],
        },
        {
          variables: "Media Poblacional",
          Semestre_1: semestreC[8],
          Semestre_2: semestreC[9],
        },
      ];
      const Rta = "No se rechaza Ho con una confianza del 95%";
      this.Rta = Rta
    },
  },
};
</script>