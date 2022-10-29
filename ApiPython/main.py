from flask import Flask
from flask import jsonify
from flask_cors import CORS
import Ejercicio.Ejercicio_C as data

datos = data.suma_mensual_ventas_a, data.suma_mensual_ventas_b, data.suma_mensual_ventas_c
datos2 = data.empresas

empresa_A = data.mediaA, data.medianaA, data.desviacionA, data.varianzaA, data.correlacionA, data.covarianzaA, data.modaA
empresa_B = data.mediaB, data.medianaB, data.desviacionB, data.varianzaB, data.correlacionB, data.covarianzaB, data.modaB
empresa_C = data.mediaC, data.medianaC, data.desviacionC, data.varianzaC, data.correlacionC, data.covarianzaC, data.modaC

app = Flask(__name__)
CORS(app)

@app.route('/api/v1/data', methods=['GET'])

def get_data():
    reponse = {"data": datos, "data2": datos2, "empresaA": empresa_A, "empresaB": empresa_B, "empresaC": empresa_C}
    return jsonify(reponse)

if __name__ == '__main__':
    app.run(debug=True)
