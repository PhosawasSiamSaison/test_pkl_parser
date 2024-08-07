import pickle

# Define a function
def calculate(a, b):
    return a + b

# Data to be serialized
data = {
    'name': 'Alice',
    'function': calculate
}

# Serialize the data and function
def main():
    with open('data_with_function.pkl', 'wb') as file:
        pickle.dump(data, file)

def open_file(a, b):
    # Deserialize the data and function
    with open('data_with_function.pkl', 'rb') as file:
        loaded_data = pickle.load(file)

    print(loaded_data)
    # Use the deserialized function
    result = loaded_data['function'](a, b)
    print(f"Result of calculate function: {result}")
    result