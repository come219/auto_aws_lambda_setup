def hello_world():
    """
    Prints "Hello, World!" to the console.

    Returns:
        None
    """
    try:
        print("Hello, World!")
    except Exception as e:
        print("An error occurred:", e)

if __name__ == "__main__":
    hello_world()
