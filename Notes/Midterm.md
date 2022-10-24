
# Security Mindset (cont.') | Classic Crypto

## Cryptography

- A cryptosystem consists of:
  - Key(s)
  - Encryption mechanism
  - Decryption mechanism
- **Symmetric key** in crypto is the concept where the same key for encrypting and decrypting is used
- Kerckhoffs' principle states that the keys of a cryptosystem should be hidden but the mechanisms should be public. This is because algorithms never stay secret forever and it's better to discover weaknesses beforehand.
- Different type of cryptos could be:
  - Codebook
  - One time pad (OTP)
    - One time-pad is having the same length as the result text. Each character of the Onetime pad and the plain text is then XORed to get the cipher text
  - Stream cipher
  - Block cipher
- Caesar cipher builds on the algorithm to shift the alphabet
- Saltzer and Schroeder's Principles
  - The system design should be openly available to everyone
  - Principle of Economy of Mechanism states that "The system should be simple enough to understand and visualize"
  - A subject should be given the minimum privileges possible for executing tasks

# Symmetric Key Crypto

- Stream cipher
  - Stream cipher is a generalized OTP
  - The key is stretched into a long **keystream**
  - Used to be the most populate of crypto
  - A5/1
    - Based on shift registers in the hardware
    - **How it works**
    - Uses 3 shift registers
    - Each iteration the formula majority is performed on three bits (Maj (x8, y10, z10)
    - A key is used as an initial fill for the registers
    - This was a very slow method
    - Now days the encryption is done within software due to fast processors
  - RC4
    - Based on changing lookup table
    - A table that contains **permutation** of the bytes between 0 and 255
- Block cipher
  - Works on larger chunks of data at the time
  - The plaintext and ciphertext contains **fixed-size blocks** bits
  - Iterated using a round function
    - The algorithm consists of a key and the output of the previous round
  - Example of block cipher is **Feistel Cipher**

- DES
  - Attacks by exhaustive key search
  - Is a Feistel cipher
  - 56-bit key which nowadays are too small
  - Systems like 3-DES did improve the system to increase the key length. But this doesn't always help due to attacks like in-the-middle attacks
- AES (Advanced Encryption Standard)
  - Not a Feistel cipher algorithm
  - Variable key lengths
  - **Block size:** 128 bits, **key length:** 128,192 or 256 bits
  - Can be effectively implemented in an 8bit and 32bit CPU
  - Requires only one key
  - **Avalanche effect** ; one small difference in the plaintext results in a big change in the cipher text
  - In short, the algorithm works by performing certain types of operation in multiple rounds on the plain text. The rounds usually are (10-14)
  - Each round consists of four different functions; Shift row, mix column, add round key, and byte sub
  - See online exactly how the encryption works
- TEA (Tiny encryption algorithm)
  - Feistel structure
  - 64-bit block, 128 bits key
  - Has a weak round function so many rounds are required (32)
  - Uses a Magic number

## Overview of Linear Cryptanalysis

- Typical nonlinear functions are s-box which is the primary contribution of security of block ciphers
- Multiple blocks by chaining the blocks together
- ECB
  - Encrypt block independently
  - Use the same key repeatedly on different types of blocks
  - If a attacker can intercept the message it can be subject of Cut and Paste where the attacker mix the order of the messages
  - For example, because if we encrypt a block and the key and block is the same for two. If will result in for example an image leaving trace behind

- CBC
  - Chain blocks together
  - Uses a initialization vector
  - Cut and paste could still be possible
- CTR
  - Block ciphers acts like a stream cipher
  - Popular for random access
  - Increases the initialization vector by one for each trip (no blocks are chained together)
- CIA
  - Confidentiality ©
    - No one is supposed to read what data or information is sent unless he is authorized
  - Integrity (I)
    - The ability to ensure that data is an accurate and unchanged representation of the original secure information
  - Availability (A)
    - The information concerned is always readily accessible to the authorized viewer
- Data integrity
  - Encryption provides confidentiality but does not provide integrity
  - The MAC address is often used for integrity
  - The MAC address serves as a checksum for the data
  - If a message has for example in CTR been changed the finale message (MAC) will not be the same. Therefore, the receiver can verify with the last message if it has been tampered with

# Public Key Crypto

- Public and private key system
  - Public key = Encryption
  - Private key = Decryption
- Trap Door function, easy to compute towards one direction but hard towards the other direction
  - Easy to calculate N if you know p and q
  - But hard to find p and q if you know N
- Signature
  - If you encrypt something using your private key anyone can verify your identity by decrypting it using his public key
- How it works
  - Choose two large prime numbers (p and q)
  - Calculate n = p\*q and z = (p-1)(q-1)
  - Choose a number e where 1 \< e \< (p-1)or(q-1).
  - Calculate d\*e = 1mod(p-1)(q-1)
  - You can bundle private key pair as (n,d)
  - You can bundle public key pair as (n,e)
  - To encrypt messages:
    -
  - To decrypt:
    -
- Efficiency in RSA
  - If keys get too big the modulus calculations can take a lot of time
  - A solution for this is repeating squaring
  - Because of this public key crypto is much harder to encrypt and decrypt compared to Symmetric Key crypto
- Diffie-Hellman
  - Key exchange
  - Can publicly find a shared private key between two users that has not had any contact before
  - Subject to man in the middle attack
  - [https://www.youtube.com/watch?v=M-0qt6tdHzk](https://www.youtube.com/watch?v=M-0qt6tdHzk)
- Certified Authority (CA)
  - Trusted 3rd party creates and signs certifications
  - usually bundled with software (OS/browser…)
- Hash Functions
  - Similar to Block cipher (DES)
  - Hashing for fingerprint verification in messages
    - Instead of Encrypting message with private key which is costly the sender could use a hashing function which could do the exact same thing
    - Hashing would provide much less computations and smaller in size in many cases
  - Has many different types of functionalities such as
    - Authentication
    - Message integrity
    - Message Fingerprint
    - Data corruption detection
    - Digital Signature efficiently
  - Hashing Passwords
    - Provide a fixed length output from any input
    - Uses salt so that not the same input gives the same output
  - Hashing for email spam reduction
    - If email client think that the sender is spam in order for the sender to send a message, they have to compute functions. Doing this could be very CPU costly
  - Dictionary attack
    - The process of testing random salt with random passwords with hashing functions to see if you get any matches
- Different type of Crypto hashes
  - MD5
    - Broken due to collision too easy to find
  - SHA-1
    - Was US government standard but during 2005 was broken
  - SHA-224, SHA-364, SHA-512

# Reverse Engineering

The process of taking something apart and analyzing the working in detail and gradually extracting the abstract and high-level representation

- Protocol reverse engineering
  - Taking apart how the application/network protocol
  - Intercept the traffic and reverse the protocol
- Algorithm/Model reverse engineering
  - Reverse engineering to get source code
  - Find Magic numbers in the code
- Software reverse engineering
  - Reverse engineers an executable to source code
  - Different types of source code could be represented as the same assembly code and therefore it is impossible to always get the exact same source code back
  - Java is easier to reverse engineer then C/C++
  - Doing this you could extract hard coded values in if statements for example serial number registration

- Disassembling
  - Linear
    - Start from the first byte of the code in an executable and decode each byte (map bytes to an assembly instruction)
  - Recursive
    - Follow jump and branches
  - Variable Recovery
    - Involves largely of figuring out which types of certain variables is of
  - Control-Flow recovery
    - Builds a graph of the assembly code
    - From the graph tries to map it into source code type instructions. Meaning converting assembly instructions into while/if/for loops
- Preventions
  - Embed data into the code
  - Code obfuscation
    - Rename variables
    - Remove comments
    - Opaque predicate of having if statements that is hard for a malicious user to figure out

# Malware

The process of an attacker trying to run code on your machine

- The reason for malware
  - Steal personal information
  - Delete files
  - Click fraud
  - Steal software serial numbers
  - Use your computer as relay
- Types of Viruses:
  - Worm/Virus (Active or passive)
    - Worm
      - Worm is usually a program which effects a host by exploiting a vulnerability
      - When the host has been exploited it then continues by trying to find new hosts to attack
      - Grows in an exponential way
    - Viruses
      - Usually, a modified program by adding extra code to it
      - Viruses usually lives in Boot sector, applications, libraries, compilers, debuggers, virus checkers
      - Gets usually added by modifying a Portable executer (PE) header and attaching a malicious code section.
      - There are two different types of viruses
        - Passive: infects a host, wait for host to be executed, try to find new host to infect
          - Normal software
          - USB
        - Active: Looks for vulnerable hosts, exploits them (propagate), look for new hosts
          - Like email URL
  - Trojan Virus (Unexpected)
    - Disguises itself as a legitimate software
    - Often controlled remotely
    - Does not duplicate itself
    - Trojan is popular in android
      - Downloads a replicate from the store
      - Modifies the application
      - Makes people download it as an APK
  - Trapdoor/Backdoor (Unauthorized access)
    - Remote access to a host
- Ransomware
  - Locks all files on the host
- Malware detection
  - Static
    - Can be detected using signature
    - Finding bytes sequences in program
    - Disadvantage
      - Signature files could be long
      - Long scan time
      - Cannot detect virus if we don't know the different signatures of them
  - Dynamic
    - Can be detected using behavior
    - Detect weird behavior of programs
      - Can be detected through identifying normal behavior
      - File access in some unexpected way
      - System misbehaves in some way
      - Unexpected network activity
    - Could have bad accuracy
    - Good if no signature is not detected
- Malware browser crypto mining
- Isolation testing
  - Sandbox
  - Virtual machine
  - But there are malwares that can detect if you are running it in a sandbox so called "sandbox evading"
- Malware clustering
  - Lists of known viruses
- Encrypting malware
  - Could make it so viruses couldn't be detected using signature because they won't have the same
  - Usually, can be detected because they need to be decrypted during runtime which means that there is often dump code during runtime
- Metamorphic Malware
  - Malware mutates before trying to infect a new system to evade signature detection
  - It functions the same as the normal malware but needs to avoid detection
  - Can be achieved by disassembling itself and adding random code variation, dead code, and permutations of the code
- Heartbleed attack on openSSL
-

# Software Exploitation: Buffer Overflow

- Stack
  - Consists of logical stack frames that are pushed when calling a function and popped when returning
  - Meaning that when a function is called the variables, return address, stack frame pointer is pushed to the stack
  - Stack grows from high address to low address
- Buffer overflow attacks (aka, stack smashing, buffer overrun)
  - This means that the buffer can be overflown where values can be overwritten, return addresses changed, and even code injection
- Buffer overflow defenses
  - Never execute code on the stack, meaning use write or execute
  - Canary to detect overflow
    - Not fool proofed but still a good solution
  - Randomize the stack
    - Make the address stack unpredictable and different from machine to machine
    - Attacks could still be launched against it by Repeatedly guessing randomized addresses
  - Don't use C or C#. Use Java or C#. You should also make sure that with C that you used safe libraries functions rather than unsafe ones

# Software Protection: Obfuscation

With software obfuscation is that the attacker is always able to reverse engineer using exhaustive search. But the goal is to transform the resources so that it becomes too expensive for the attacker to perform.

- Layout Obfuscation
  - Involves in stripping a program of the comments
  - Identifier renaming
  - Doing this is an efficient option and lightweight
- Data obfuscation
  - Arrays can be split into sub arrays, or the other way around
  - Arrays can be folded to increase the number of dimensions, or the other way around flatten
  - Data can also be encrypted
  - Strings can also be encoded
- Control-Flow obfuscation
  - Instruction insertion
    - Meaningless instructions
      - Sub -\> Add
      - Xor -\> Xor
    - Easy to implement
    - Can easily break signatures/patterns
  - Instruction replacement
    - Certain instructions in assembly could be represented in different (more complicated) ways
  - Opaque predicts
- Evaluation of obfuscation
  - Potency
    - How much complexity the obfuscation algorithm adds
  - Stealth
    - How well the obfuscated code blends in with the rest of the "real" code
  - Resilience
    - How difficult to undo obfuscation
  - Cost
    - Performance penalty, size, execution slowdown

# Software Security Analysis: Dynamic Vulnerability Detection

- Security Bugs
  - avoid authentication
  - privilege escalation
  - bypass security check
  - deny service
  - run code remotely
- Automatic Vulnerability is like finding a needle in a haystack
- Formal verification
  - Can ideally eliminate all bugs
  - Like writing a math inductive proof
    - What properties would I like to approve?
      - Sorting?
      - Memory safety?
- Type system
  - Specifies the different types of variables and so on in a program
  - Doesn't eliminate all problems but can pinpoint certain bugs
- Fuzz testing
  - Automatically generate test cases
  - Many abnormal/random/corner-case test cases are tested
  - Used for monitoring for errors
  - Simply send the program random inputs until it usually crashes
  - What fuzz shows
    - Crashes: Caused by memory access errors, aka overread or overwrite
    - Hang: System lost response
    - Race condition: need to enable dynamic error detector
  - Fuzz testing is usually not used to find logical errors
- Software testing vs Fuzz testing
  - Software testing
    - Run the program on normal inputs. Made for normal users so they don't stumble upon an error
  - Fuzzing
    - Run abnormal inputs, prevent attacks from identifying exploits
- Mutation based Fuzzing
  - Usually describes that the user specifies some input which then is mutated. Doing this will help to identify more bugs
  - For example, if a function reads a pdf document
  - The Fuzz program will collect seed of pdf and randomly mutate the file and test it if the function crashes
  - Super easy to setup and automate
- Generation-based
  - Test cases are generated from some sort of description of the input
- Generation-based vs Mutation Based
  - Generation-based
    - Pros: Completeness, can theoretically deal with complex dependencies
    - Cons: writing generation is hard, performance depend on the specification provided
  - Mutation based
    - Pros: Easy to setup and automate
    - Cons: Limited by initial seed for inputs
- Black box fuzzing
  - Keep generating mutated inputs to the test application
  - Pros: Easy, low programming cost
  - Cons: inefficient
- Gray box fuzzing
  - Run mutated inputs and measure code coverage
  - Genetic algorithm
  - random mutations on test corpus and only keep mutants for further usage if coverage increases
- Recommendations
  - It is recommended to fuzz at least 12 hours for realworld applications.
  - Best result comes from guiding the application
  - More fuzzing is better

# Other

- Testing
  - **Regression testing** is testing existing software applications to make sure that a change or addition hasn't broken any existing functionality.
  - **Integration testing** the phase in software testing in which individual software modules are combined and tested as a group
  - **Security testing** is testing if a system protects its data and maintain functionality
  - **Penetration testing** is simulating cyber-attacks against a system
- Stream Cipher vs Block Cipher
  - Stream ciphers encrypt individual characters (usually binary digits) of a plaintext one at a time, using an encryption transformation which varies with time. By contrast, block ciphers tend to simultaneously encrypt groups of characters of a plaintext message using a fixed encryption transformation.
