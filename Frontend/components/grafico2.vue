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
          Con experiencias pasadas, la empresa B predijo que el valor de venta
          anual sería de $2.500.000 en el año 2020. A finales del año, la
          empresa elige una muestra aleatoria de {{grafico2_n}} dias y calcula una media y
          una desviacion estandar de {{grafico2MediaMuestral}} y {{grafico2DesviacionMuestral}} respectivamente. Utilice un nivel de
          significancia de {{grafico2_NS}} para determiar si el pronostico de la empresa B
          era razonable.
        </p>
        <p>
          Se debe probar Ho μ = {{grafico2MediaPoblacional}} Vs μ ≠ {{grafico2MediaPoblacional}}
        </p>
        <p>
          RR = {{grafico2_RR}}
        </p>
        <p>
          Zcal = -{{grafico2_Zcal}}
          <br>
          Como |{{grafico2_Zcal}}| > Zα/2
        </p>
        <p>
          {{grafico2Analisis}}.
        </p>
      </div>
    </div>
    <br>
    <p style="margin-left: 1%"> 
      La empresa B fue la tuvo mejores ventas ya que maneja un mercado europeo y la mayoria de las ventas fueron en euros. Debemos tener en cuenta que el euro es mas costoso que el dolar
      en cuestiones de moneda. Los tres meses mas significativos de la empresa B fueron Junio, Noviembre y Diciembre, siendo este ultimo el mas destacado. Hay que tener en cuenta las 
      festividades del mes de Diciembre que puede ser una causa de alto crecimiento de ventas en este mes. A simple vista casi tiene un crecimiento lineal. La empresa pudo sostener
      su profit, me refiero que no tuvo decaidas en la mayoria de los meses.
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
      grafico2_n: null,
      grafico2MediaPoblacional: null,
      grafico2: null,
      grafico2MediaMuestral: null,
      grafico2DesviacionMuestral: null,
      grafico2_NS: null,
      grafico2_RR: null,
      RR: null,
      grafico2_Zcal: null,
      grafico2Analisis: null,
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
          Covarianza: empresaB[5],
          Moda: empresaB[6],
        },
      ];

      const analisisGrafico2 = response.data.analisisGrafico2;
      //console.log(analisisGrafico2);

      this.grafico2_n = analisisGrafico2[0]
      this.grafico2MediaPoblacional = analisisGrafico2[1] 
      this.grafico2 = analisisGrafico2[2] 
      this.grafico2MediaMuestral = analisisGrafico2[3] 
      this.grafico2DesviacionMuestral = analisisGrafico2[4] 
      this.grafico2_NS = analisisGrafico2[5] 
      this.grafico2_RR = analisisGrafico2[6] 
      this.RR = analisisGrafico2[7]
      this.grafico2_Zcal = analisisGrafico2[8] 
      this.grafico2Analisis = analisisGrafico2[9] 
    },
  },
};
</script>