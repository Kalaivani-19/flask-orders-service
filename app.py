from flask import Flask, jsonify

app = Flask(__name__)

@app.get("/api/v1/orders/getOrders")
def getOrders():
    return jsonify({"data": [
        {"Order1": [1, "Tomato"]},
        {"Order2": [2, "Carrot"]},
        {"Order3": [3, "Potato"]}
    ]})

if __name__ == "__main__":
    app.run()