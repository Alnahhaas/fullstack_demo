from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)

# Allow only frontend-service inside the cluster
CORS(app, resources={r"/square": {"origins": "*"}})

# seting for production
# origins=["https://alnahhas_demo.com","http://alnahhas_demo.com"]
# CORS(app, resources={r"/square": {"origins": origins}})

@app.route('/square', methods=['POST'])
def square_number():
    data = request.get_json()
    number = data.get('number')
    try:
        result = float(number) ** 2
        return jsonify({"result": result})
    except (ValueError, TypeError):
        return jsonify({"error": "Invalid number"}), 400

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
