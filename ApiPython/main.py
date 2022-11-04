from flask import Flask
from flask import jsonify
from flask_cors import CORS
import Ejercicio.Ejercicio_C as data

datos = data.suma_mensual_ventas_a, data.suma_mensual_ventas_b, data.suma_mensual_ventas_c
datos2 = data.empresas

empresa_A = data.mediaA, data.medianaA, data.desviacionA, data.varianzaA, data.correlacionA, data.covarianzaA, data.modaA
empresa_B = data.mediaB, data.medianaB, data.desviacionB, data.varianzaB, data.correlacionB, data.covarianzaB, data.modaB
empresa_C = data.mediaC, data.medianaC, data.desviacionC, data.varianzaC, data.correlacionC, data.covarianzaC, data.modaC

grafico5 = data.mercado, data.month, data.mayor


analisisGrafico1 = data.grafico1_n, data.grafico1, data.grafico1Media, data.grafico1Desviacion, data.grafico1varianza, data.grafico1_P, data.grafico1Menos, data.grafico1Mas
analisisGrafico2 = data.grafico2_n, data.grafico2MediaPoblacional, data.grafico2, data.grafico2MediaMuestral, data.grafico2DesviacionMuestral, data.grafico2_NS, data.grafico2_RR, data.RR, data.grafico2_Zcal, data.grafico2Analisis
analisisGrafico3 = data.grafico3_n, data.grafico3, data.grafico3MediaMuestral, data.grafico3DesviacionMuestral

ICAB = data.abMenos, data.abMas
ICAC = data.acMenos, data.acMas
ICBC = data.bcMenos, data.bcMas

grafico6 = data.emp_a_ventas_diciembre, data.emp_b_ventas_diciembre, data.emp_c_ventas_diciembre

graficoEmpresa_C = data.semestre_n, data.semestre1MediaMuestral, data.semestre2MediaMuestral, data.semestre1DesviacionMuestral, data.semestre2DesviacionMuestral, data.v, data.Tcal, data.empresaC_RR, data.semestre1MediaPoblacional, data.semestre2MediaPoblacional

app = Flask(__name__)
CORS(app)

@app.route('/api/v1/data', methods=['GET'])

def get_data():
    reponse = {"data": datos, "data2": datos2, "empresaA": empresa_A, "empresaB": empresa_B, "empresaC": empresa_C, "grafico5": grafico5, "analisisGrafico1" : analisisGrafico1,
    "analisisGrafico2" : analisisGrafico2, "analisisGrafico3" : analisisGrafico3, "ICAB": ICAB, "ICAC": ICAC, "ICBC": ICBC, "grafico6": grafico6, "graficoEmpresa_C": graficoEmpresa_C}
    return jsonify(reponse)

if __name__ == '__main__':
    app.run(debug=True)
