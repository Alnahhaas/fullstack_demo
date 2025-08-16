from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Allow cross-origin requests (needed for frontend)

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
