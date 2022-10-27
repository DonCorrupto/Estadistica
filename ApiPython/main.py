from flask import Flask
from flask import jsonify
from flask_cors import CORS
import Ejercicio.Ejercicio_C as data

datos = data.suma_mensual_ventas_a, data.suma_mensual_ventas_b, data.suma_mensual_ventas_c

app = Flask(__name__)
CORS(app)

@app.route('/api/v1/data', methods=['GET'])

def get_data():
    reponse = {"data": datos}
    return jsonify(reponse)

if __name__ == '__main__':
    app.run(debug=True)
