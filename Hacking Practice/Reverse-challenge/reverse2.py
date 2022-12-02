import re
import os

def main(): 
    # Read the c binary file Reverse-challenge\crypt4
    with open('Reverse-challenge\crypt4', 'rb') as f:
        data = f.read()

    # Find data stored in the binary file
    data = re.findall(b'[\x20-\x7e]{2,}', data)
    data = [string.decode('utf-8') for string in data]

    # Print the strings
    for string in data:
        print(string)
        # Run the compiled c file crypt4 with the string as an argument
        os.system(f'Reverse-challenge\crypt4.exe {string}')
        break

if __name__ == "__main__":
    main()

# q: How to run a c binary file in cmd
# a: By using the command: .\crypt4.exe