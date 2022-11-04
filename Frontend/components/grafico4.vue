<template>
<div>
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
    <div style="margin-left: 4%; width: 50%">
        <center>
          <h5>Intervalos de confianza entre las empresas</h5>
        </center>
        <b-table striped hover :items="items"></b-table>
        <p>
          Intervalo de Confianza A-B [{{ICABMenos}}, {{ICABMas}}] este intervalo no contiene
          el cero. Por tanto, es razonable suponer que hay diferencia en los incrementos de las empresas. 
          Esto quiere decir que la empresa B tiene mayor ventas que la empresa A.
        </p>
        <p>
          Intervalo de Confianza A-C [{{ICACMenos}}, {{ICACMas}}] este intervalo no contiene
          el cero. Por tanto, es razonable suponer que hay diferencia en los incrementos de las empresas. 
          Esto quiere decir que la empresa C tiene mayor ventas que la empresa A.
        </p>
        <p>
          Intervalo de Confianza B-C [{{ICBCMenos}}, {{ICBCMas}}] este intervalo si contiene el cero. Por tanto,
          es razonable suponer que no hay diferencia en los incrementos de las empresas a comparacion de la empresa B.
        </p>
    </div>
  </div>
  <br>
  <p style="margin-left: 1%">
    Viendo la comparación entre las empresas y teniendo en cuenta que estan en el mismo mercado, la empresa por mucho se llevo la mayor parte de ella. Posiblemente la empresa A,
    es un empresa pequeña o iniciando ya que esta en un mercado estadounidense. La empresa B ya tiene una gran cantidad del mercado a nivel mundial.
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
      mayorVentas: null,
      ICABMenos: null,
      ICABMas: null,
      ICACMenos: null,
      ICACMas: null,
      ICBCMenos: null,
      ICBCMas: null,
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

      const ICAB = response.data.ICAB
      this.ICABMenos = ICAB[0]
      this.ICABMas = ICAB[1]

      const ICAC = response.data.ICAC
      this.ICACMenos = ICAC[0]
      this.ICACMas = ICAC[1]

      const ICBC = response.data.ICBC
      this.ICBCMenos = ICBC[0]
      this.ICBCMas = ICBC[1]


      const analisisEmpresaA = response.data.analisisGrafico1;
      //console.log(analisisEmpresaA);
      const analisisEmpresaB = response.data.analisisGrafico2;
      const analisisEmpresaC = response.data.analisisGrafico3;
      this.items = [
        {
          
          variables: 'X_muestral',
          Empresa_A: analisisEmpresaA[2],
          Empresa_B: analisisEmpresaB[3],
          Empresa_C: analisisEmpresaC[2]
        },

        {
          variables: 'S',
          Empresa_A: analisisEmpresaA[3],
          Empresa_B: analisisEmpresaB[4],
          Empresa_C: analisisEmpresaC[3]

        },
        {
          variables:'n',
          Empresa_A: analisisEmpresaA[0],
          Empresa_B: analisisEmpresaB[0],
          Empresa_C: analisisEmpresaC[0]
        }
      ];

    },
  },
};
</script>