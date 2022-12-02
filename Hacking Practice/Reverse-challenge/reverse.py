import re

def main(): 
    # Read the c binary file Reverse-challenge\crypt4. Extract the all strings from the binary file.
    with open('Reverse-challenge\crypt4', 'rb') as f:
        data = f.read()
    
    # Find all variable strings in the binary file. Meaning the entire sentences

    # strings = re.findall(b'[\x20-\x7e]{2,}', data)
    
    # strings = [string.decode('utf-8') for string in strings]

    # # Print the strings
    # for string in strings:
    #     print(string)
    
    # # save all of the strings to a text file but add "" around them
    # with open('Reverse-challenge\strings.txt', 'w') as f:
    #     for string in strings:
    #         f.write(f'"{string}"\n')

    # Read the bytes of the binary file
    with open('Reverse-challenge\crypt4', 'rb') as f:
        data = f.read()
    
    # Read the data stored in the 

if __name__ == "__main__":
    main()

# q: How to run a c binary file in cmd
# a: By using the command: .\crypt4.exe