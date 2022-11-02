<template>
  <div>
    <center>
      <h1>Test Laboral</h1>
    </center>
    <h6 style="margin-left: 1%">
      El archivo ventas.txt contiene los valores de ventas diarias durante el
      año 2020 para las empresas A, B y C. Cabe resaltar, que la fecha se
      encuentra en formato AAAA-MM-DD. Adicionalmente, las empresas A, B y C
      realizan sus ventas en dólares, euros y pesos colombianos respectivamente.
      El archivo divisas.txt contiene los valores de cierre por día del valor
      del dólar y el euro en pesos colombianos. a. Resumir y graficar los
      valores de venta mensuales por empresa convertidos a pesos colombianos. b.
      Identificar la empresa con mayores ventas para el año 2020. c. Asumiendo
      que las tres empresas suman la totalidad del mercado de un producto X,
      ¿cuál fue el mes de mayor crecimiento de dicho mercado?
    </h6>
    <br />
    <div>
      <hr />
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
          <center><h6>Intervalo de Confianza</h6></center>
          <p>
            La empresa A predijo que el valor de venta promedio en el año 2020
            sería de $700.000. finalizando el año, la empresa elige una muestra
            aleatoria de 100 dias y registra su valor de venta en pesos. La
            empresa utilizo un intervalo de confianza del 95% para el valor de
            venta promedio.
          </p>
          <p>
            X = valor de venta &nbsp;&nbsp;&nbsp;&nbsp; μ =
            {{ grafico1Media }} &nbsp;&nbsp;&nbsp;&nbsp; σ² =
            {{ grafico1varianza }} &nbsp;&nbsp;&nbsp;&nbsp; α = 0.05
            &nbsp;&nbsp;&nbsp;&nbsp; 1-α = 0.95
          </p>
          <p>
            P(Z>Z_0.025) = {{ grafico1_P }} &nbsp;&nbsp;&nbsp;&nbsp; Intervalo =
            [{{ grafico1Menos }} , {{ grafico1Mas }}]
          </p>
          <p>
            Con una confianza del 95% se espera que μ este entre [{{
              grafico1Menos
            }}
            , {{ grafico1Mas }}]
          </p>
          <p>
            Como el intervalo de confianza contiene $700.000, la empresa A no
            esta en lo correcto
          </p>
        </div>
      </div>
      <br />
      <hr />
      <grafico2 />
      <br />
      <hr />
      <grafico3 />
      <br />
      <hr />
      <grafico4 />
      <br />
      <hr />
      <grafico5 />
      <br />
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
      grafico1_n: null,
      grafico1: null,
      grafico1Media: null,
      grafico1Desviacion: null,
      grafico1varianza: null,
      grafico1_P: null,
      grafico1Menos: null,
      grafico1Mas: null,
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
      console.log(response);
      this.data = response.data;

      const datosGrafico1 = response.data.data[0];
      //console.log(datosGrafico1);
      this.chartData.datasets = [
        {
          label: "Valor de venta mensual de la empresa A",
          backgroundColor: "#f87979",
          data: datosGrafico1,
        },
      ];

      const empresaA = response.data.empresaA;
      //console.log(empresaA);
      this.items = [
        {
          Media: empresaA[0],
          Mediana: empresaA[1],
          Desviación: empresaA[2],
          Varianza: empresaA[3],
          Correlación: empresaA[4],
          Covarianza: empresaA[5],
          Moda: empresaA[6],
        },
      ];

      const analisisGrafico1 = response.data.analisisGrafico1;
      //console.log(analisisGrafico1);
      (this.grafico1_n = analisisGrafico1[0]),
        (this.grafico1 = analisisGrafico1[1]),
        (this.grafico1Media = analisisGrafico1[2]),
        (this.grafico1Desviacion = analisisGrafico1[3]),
        (this.grafico1varianza = analisisGrafico1[4]),
        (this.grafico1_P = analisisGrafico1[5]),
        (this.grafico1Menos = analisisGrafico1[6]),
        (this.grafico1Mas = analisisGrafico1[7]);
    },
  },
};
</script>
