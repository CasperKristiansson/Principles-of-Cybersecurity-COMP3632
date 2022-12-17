def main(): 
    # Read the c binary file Reverse-challenge\crypt4
    with open('Reverse-challenge\crypt4', 'rb') as f:
        data = f.read()
    
    # Get all of the instructions. Convert them to readable format
    # decode('utf-8') is used to convert the bytes to a string
    print(data)

if __name__ == "__main__":
    main()
