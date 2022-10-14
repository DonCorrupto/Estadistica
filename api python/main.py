from flask import Flask
from flask import jsonify

app = Flask(__name__)

@app.route('/api/v1/data', methods=['GET'])

def get_data():
    reponse = {'data': 'Probando el return'}
    return jsonify(reponse)

if __name__ == '__main__':
    app.run(debug=True)
