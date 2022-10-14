from flask import Flask
from flask import jsonify
import Ejercicio.Ejercicio_C as data

datos = data.suma_mensual_ventas_a

app = Flask(__name__)

@app.route('/api/v1/data', methods=['GET'])

def get_data():
    reponse = {datos}
    return jsonify(reponse)

if __name__ == '__main__':
    app.run(debug=True)
