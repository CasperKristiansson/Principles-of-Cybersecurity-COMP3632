# Cyber Security Final

# Software Exploitation: Others

- Software memory vulnerabilities
  - Memory error allows a program statement to access memory beyond allocated
  - Examples
    - Buffer overflow
    - Use-after-free (heap)
    - Double-free (heap)
    - Type confusion (heap)
    - Format string (stack)
    - SQL injection
- Heap
  - Dynamically allocated
  - Remains allocated until program terminates or free/delete command is used
  - U ![](RackMultipart20221217-1-rygk7f_html_d360e3090d92f74d.png) se after free happens when we free a pointer and then try to set a value to it again. Doing this you can execute arbitrary code
    - This means that an attacker can control the data being written using the freed pointer. This is a very popular way to exploit vulnerabilities
    - It can be prevented by setting a pointer to NULL after freeing it
  - Double free
    - In general, it messes up the heap memory region
    - Can be exploited by deliberately constructing the memory allocation/deallocation chain
    - Can be prevented by setting a pointer to NULL
  - Format string vulnerability
    - Printf will try to retrieve the information from the stack. If you use printf("%S%S%S%S") without supplying all the arguments, it will print the information of the stack. But this can also be used towards the other direction where we can use %n to write to the stack.
    - Prevention includes hard coded string (no arguments) and not using either %n or printf(arg)

# Software Protection: Static security analysis

- Dynamic security methods
  - Fuzzing
    - Stress the software by randomly/crafted inputs
    - This will help with triggering bugs
    - Especially the more inputs the more paths the program must create. Doing this means that the fuzzing might not cover the entire program
- Sanitization
  - Monitoring the execution of a program to capture abnormal behavior
- Static vs Dynamic
  - Dynamic
    - Can cause false negative because it can only assert an executed path at a time
    - Must run the software to performed tests
      - For example, fuzz testing
      - Sanitization
  - Static
    - Can cause false positives but is able to analyze the whole program
    - Do not need to run it
      - For example, access out of bounds for a variable
- Taint analysis
  - Using taint analysis, we can measure unexpected influence that external data have over a software such as detecting format string attacks and buffer overflow attacks
  - It can also measure the sensitive data of a software have on the external environments. Aka making sure that we don't have any password leakage or private data leakage
  - Information flow
    - Data is always being copied and modified all the time in a program
    - We can track information flow using taint analysis
  - It can detect
    - Software flaws
    - Attack vectors
    - Privacy disclosure
  - It is easy to implement and as well really effective
  - Three components
    - Taint source
      - If the source is untrustworthy or sensitive, we start of by taint that source
      - Meaning that we insert a tag or label to the object
      - Untrusted sources/sensitive information
        - Files
        - Network packages
        - Input messages
        - Webcam
        - USB
    - Taint propagation
      - The information flows from source to destination. During this time there is a high chance that the information will pass operations.
    - Taint sink
      - Would sensitive/untrusted program points be being affected by the critical information. Meaning that what point of our system will be affected by the input data.
  - Concept
    - If a sound taint analysis tells you there is no vulnerability, there is no vulnerability. Meaning that it only produces false positives and therefore we need to manually check if the information is correct
    - Complete taint analysis tells you there is a vulnerability, meaning that there is a vulnerability and doesn't manually need to be checked

# Side Channel

- Three aspects
  - Secret dependent program information flow
  - Information flow affects the physical environment
  - Physical environment can be exploitable by adverbial
- Timing Side Channel
  - We can monitor execution of a program if we know that certain if branches are faster/slower then others. For example, with RSA we can monitor if certain bits are either 0 or 1 because they take different amount of time to encrypt/decrypt
- Cache side channel attack
  - If both a victim and a malicious user is using the same cache the malicious user can access the data
  - This especially happens with VM instances and on cloud
    - In these scenarios different instances/users are sharing the same cache line
  - Most of this attack is they're for built on observing the information being passed and stored in the cache
- Power analysis
  - An attacker can monitor the power consumption when running a program
  - This builds on the principle from the timing. We know that if certain executions take longer and draw more power, we can monitor the execution and usage to determine the different outputs

# Authentication: Password & Biometrics

- Access control
  - Authentication, are you who you say you are
  - Authorization, are you allowed to do that
- A attacker could
  - Target one specific account
  - Any accounts on a specific system
  - Any accounts on any system
  - Denial of service (DOS)
- Password
  - When hashing with salt the salt is public information
- Biometrics
  - Fingerprints
  - Handwritten signature
  - Facial
  - Speech
  - Walking

# Networking security

- DNS vulnerabilities
  - False translation stored in cache can lead to poison where the information will be spread to other clients.
  - Doing this can lead to that we can redirect people from a specific website to other ones
- Denial of service
  - SYN flooding
    - Leave TCP 3-way handshakes half open
  - Ping Attack
    - Ping flooding
- ARP Cache poisoning

# Authorization

- Are you allowed to do that
- Firewall
  - Packet filter
    - Filter data on the network layer
    - Filters based on
      - Source IP
      - Destination IP
      - Source/Destination port
    - Advantages are speed
    - Disadvantages are no concept of state, cannot see TCP connections, blind to application data
  - Port scanning
    - Attacker can scan for open ports
  - Stateful packet filter
    - Adds a state to the packet filter
    - Operates at the transport layer
    - Advantages are that it can do everything packet filter can and prevent TCP ACK scan
    - Disadvantage includes slower than packet filter and cannot see the application data
  - Application proxy
    - Looks at the incoming application data
    - Verifies the data is safe before letting it into the network
    - This often includes proxy firewall, application firewall and/or gateway firewall
    - Advantages are a complete view of connections and application data and therefore can filter bad data
    - Disadvantage is that it is slow
    - Process
      - Creates a new packet before sending it into the network
      - Can prevent some scans that stateful packet filter cannot
  - Firewalk
    - 2 phases, network discovery and actual scanning
    - Uses TTL to find the hops to firewall
- Intrusion detection
  - Attacks will happen and their fore an intrusion detection system is important (IDS)
  - Usually evolves from log file analysis
  - Can be detected either using
    - Signature based IDS
    - Anomaly based IDS
  - Usually detect attacks such as
    - Buffer overflow
    - Escalation of privilege


- Access control lists/Capabilities

# Protocol

- Security protocols
  - They need to be efficient, minimize the computational requirements, bandwidth, usage, and delays
  - It should be Robust, meaning that it should work if an attacker tries to break in
  - If the environment changes
  - Should be easy to implement, use and be flexible
- Authentication protocols
  - Remote authentication via untrusted channel
  - Replay attack could happen
- We want to ensure freshness in authentication so that replay attack is not possible
- Nonce
  - Number used once
  - In verification both parties need to know the password and nonce when verifying each other
- See slides for more information

# Finale 2022

1.
  1. Mutual authentication, also known as two-way authentication, is a process in which both parties in a communication exchange verify each other's identity. This ensures that both parties are who they claim to be.
  2. This scenario or subject to a reflection attack. Reflection attack involves in when a one-way authentication protocol is being use both ways.
  3. Timestamps can help communication more efficient; a disadvantage is that it is still subject to an attack if an attacker attacks within the clock skew.

_One advantage of using timestamps to replace nonces in designing secure protocols is that timestamps can provide a more accurate and efficient way to ensure the freshness of messages. This is because nonces are typically generated randomly, which can lead to duplicates and require additional processing to verify their uniqueness. In contrast, timestamps provide a unique and easily verifiable value that can be used to determine the age of a message._

_One disadvantage of using timestamps to replace nonces is that they are susceptible to replay attacks. In a replay attack, an attacker intercepts a valid message and retransmits it at a later time, potentially gaining unauthorized access to a system or resources. This is possible because timestamps are generated based on the current time, which can be easily predicted or spoofed by an attacker. Nonces, on the other hand, are generated randomly and are therefore much more difficult to predict, making them less vulnerable to replay attacks._

1.
  1. Perfect forward secrecy is the process where you want that if even an attacker gets the secret key, they should not be able to decrypt past messages. This can be achieved using a session key which both Bob and Alice will forget after the session.

_Perfect Forward Secrecy, or PFS, is a property of certain cryptographic systems that ensures that the confidentiality of past communications cannot be compromised by the future compromise of secret keys. In other words, even if an attacker is able to obtain the secret keys used to encrypt a particular conversation, they will not be able to use those keys to decrypt past conversations. This property is important because it helps to protect against long-term attacks on cryptographic systems. PFS is achieved by generating a unique, random key for each communication session, rather than using a single long-term key. This way, even if an attacker is able to obtain a secret key, it can only be used to decrypt a single conversation, and not any past or future communications._

  1. The only way for Trudy to break the authentication is if she can figure out the session key and the passwords.
  2. No, the only way for Trudy to convince Bob is if she knows the session key. Meaning that even if she can determine Bobs session key which she can it won't help her because she needs Alice session key.
  3. Yes. This is because Alice session key is being passed during the first message sent. Then both the Pin and K is being encrypted. By encrypting both with the same information K will cause that an attacker being able to figure out the pin code.
1.
  1. SYN flooding. The attack works by leaving a lot of TCPS 3-way handshakes half open
  2. Ping attack. Works by sending a huge ton of …
  3. ARP poisoning. Works by poisoning the ARP where traffic being sent to a specific website. Can be prevented using a static ARP.

_(a) This is likely a SYN flood attack. This attack works by flooding the target server with SYN packets, which are used to initiate a TCP connection. The server responds to each SYN packet with a SYN-ACK, but the attacker never responds to the SYN-ACK, causing the server to wait for a response and eventually become overwhelmed._

_To detect and prevent this attack, one can implement SYN cookie protection on the server. This technique allows the server to track incomplete TCP connections without using system resources, so that it can handle a large number of SYN packets without being overwhelmed. Additionally, using firewalls and rate limiting can also help prevent SYN flood attacks by limiting the number of incoming SYN packets from a single source._

_(b) This is likely a ping flood attack. This attack works by flooding the target server with ICMP echo request (ping) packets. The server responds to each ping with an echo reply, but the attacker sends pings faster than the server can respond, causing the server to become overwhelmed._

_To detect and prevent this attack, one can use firewalls and rate limiting to limit the number of incoming ping packets from a single source. Additionally, the server can be configured to ignore ping requests or to only accept a limited number of ping requests per second._

_(c) This is likely an ARP poisoning attack. This attack works by poisoning the target's ARP cache, which maps IP addresses to MAC addresses on a local network. The attacker sends fake ARP messages to the target, associating the attacker's MAC address with the IP address of the legitimate website. This causes the target's traffic to be sent to the attacker's machine, allowing the attacker to intercept and redirect the traffic to a phishing website._

_To detect and prevent this attack, one can use ARP spoofing detection tools to monitor the network for suspicious ARP activity. Additionally, using secure protocols such as HTTPS can help prevent traffic from being intercepted and redirected to a phishing website. Network administrators can also implement static ARP mapping to prevent ARP poisoning attacks._

1.
  1. Use-after-free is hard to detect when just analyzing program source code. Use after free happens when you free a pointer and then try to assign a value to it and/or use it. A solution to this is to set the pointer to null after freeing it.

_(a) Use-after-free (UAF) is a type of memory corruption vulnerability that occurs when a program accesses memory that has been previously freed. This can cause the program to crash or, in the case of a malicious program, to execute arbitrary code._

_One reason that UAF is hard to prevent is that it can be difficult to track all of the memory allocations and deallocations in a program, especially in complex or large programs. This makes it difficult to ensure that memory is not accessed after it has been freed._

_To prevent UAF, developers can use a number of different techniques, such as implementing reference counting to track the use of dynamically allocated memory, using memory allocators that are designed to detect and prevent UAF, and carefully reviewing and testing their code for UAF vulnerabilities._

  1. SQL injection attack happens when a user input is not validated. A user input could contain mis formatted strings for example containing "DROP TABLE".

_(b) A SQL injection attack is a type of cyber attack in which an attacker inserts malicious code into an SQL statement in order to gain access to or manipulate a database. For example, an attacker might insert code into an SQL query that changes the query's behavior, such as adding an additional condition that allows the attacker to access sensitive data._

_To prevent SQL injection attacks, developers can use a number of different methods, such as using prepared statements with parameterized queries, which separate the SQL code from the user input, and using input validation to ensure that only valid data is entered into the system._

  1. Yes, taint source is the user input, and the taint sink is where the data is being written into memory

_(c) Taint analysis is a method for identifying and tracking potentially sensitive data as it flows through a program. Taint analysis can be used to find a number of different vulnerabilities, including format string vulnerabilities._

_In the context of taint analysis, a taint source is a location in the program where potentially sensitive data is introduced, such as user input or data from an untrusted source. A taint sink is a location in the program where potentially sensitive data is used in an unsafe way, such as when it is passed to a function that can be exploited to gain unauthorized access or execute arbitrary code._

_To use taint analysis to find format string vulnerabilities, a developer would first identify the taint sources in their program, such as user input or data from an untrusted source. They would then track the flow of this potentially sensitive data through the program and identify any taint sinks, such as calls to functions that use the data as a format string. Finally, they would carefully review the code around the taint sinks to identify any potential vulnerabilities and take steps to prevent them._

1.
  1. Secret dependent program information flow, 2) Information flow affects physical environment, and 3) Physical environment is exploitable by adversarial.
  2. Timing based side channel attack is when different branches take different amount of time for executing. For example, processing the bits 0 and 1 could take different amount of time to execute. These bits could be part of the private key

_(b) In a timing-based side channel attack on RSA, the attacker can measure the time it takes for the system to encrypt or decrypt a message using the RSA algorithm. This can reveal information about the private key being used, because the time it takes to perform the encryption or decryption depends on the size of the key. This implementation is vulnerable because it leaks information about the private key through the timing of the encryption or decryption process._

  1. Cache based side channel attack happens when a victim and attacker is sharing the same cache. If a user would access data, it will temporary be stored in the cache which the attacker could use to determine information.

_(c) In a cache-based side channel attack on RSA, the attacker can measure the memory access patterns of the system while it processes the secret information. This can reveal information about the private key being used, because the access patterns depend on the size of the key. This implementation is vulnerable because it leaks information about the private key through the memory access patterns of the system._

  1. ![](RackMultipart20221217-1-rygk7f_html_ffd840f00b921efd.png)

1. _The attacker flushes the cache, clearing it of any previously stored data._
2. _The attacker then performs some operation on the target system, causing it to access the secret information and store it in the cache._
3. _Finally, the attacker measures the access time to the secret information in the cache, which reveals information about the secret._

1.
  1. Static sound analysis tells you there is no vulnerability and there is no vulnerability (meaning that there might be false positive). Complete analysis taint analysis tells that there is a vulnerability you know there is a vulnerability.
  2. Taint source is where the scanf command is happening where it is being written into a. When can then see that a affects b which then is used in an if statement which becomes the taint sink. The taint policy will be both a and c because a could cause a buffer overflow.
  3. The tool is complete because we know that there is a vulnerability. We only taint the parts that we know can cause a vulnerability/where we have secret information.

_(a) Static sound analysis is a type of analysis that is guaranteed to find all vulnerabilities in a program if they exist. Complete analysis, on the other hand, is a type of analysis that is guaranteed to find all vulnerabilities in a program, even if the analysis itself is not sound. In other words, static sound analysis is a subset of complete analysis._

_(b) In designing a taint analysis tool to detect whether the second memory loading in the given program is exploitable, we can identify the following:_

_Taint source: In this case, the taint source is the user input that is read from the scanf function._

_Taint sink: The taint sink is the second memory loading, where the value of b is used as the index to access the buf array._

_Taint policy: The taint policy specifies how the taint should propagate from the source to the sink. In this case, we can specify that the value of b should be tainted if it is derived from a tainted value of a._

_To implement the taint analysis tool, we can instrument the program to track the flow of tainted values from the taint source to the taint sink, and raise an alert if a tainted value is used as an index to access an array._

_(c) In this case, Bob's taint analysis tool is not sound, because it has reported the first memory loading as exploitable even though there may not be any vulnerabilities in this part of the program. The tool may not be complete either, because it may not have considered all possible scenarios that could lead to exploitable vulnerabilities._

_Given that the first memory loading is tainted, the likely reason that the second memory loading is not tainted is that the value of b used as the index is not derived from a tainted value of a. For example, if the value of b is determined by a computation that does not involve the user input, then the second memory loading would not be exploitable._

_(d) If Bob's taint analysis tool reports both the first and the second memory loading as exploitable, then it is not sound, because it has reported vulnerabilities that may not exist in the program. The tool may not be complete either, because it may not have considered all possible scenarios that could lead to exploitable vulnerabilities._

_The likely reason that the first memory loading is tainted is that the value of b used as the index is derived from a tainted value of a, and the taint policy specifies that the value of b should be tainted in this case. However, as mentioned earlier, this does not necessarily mean that there is a vulnerability in the program._

1.
  1. POW is the process of performing a computation that is difficult to perform but easy to verify. In a typical scenario the responsible for solving POW is miners which compete to solve algorithms to add new blocks to the blockchain.
  2. If a miner owns more 51% of the total mining power, it is possible to modify the blockchain history. This is because the miners are always competing in POW to add blocks to the blockchain. If someone would own 51%, they would outperform the other miners. Doing this a miner could possibly rewrite the history like excluding certain transactions or blocks.
  3. If Bob controls 70% of the total mining power in a blockchain network, but does not do anything bad, it is likely because doing so would not be in his best interest. As a miner with a significant amount of mining power, Bob would be able to add new blocks to the blockchain faster than other miners and would therefore be able to earn more cryptocurrency rewards. However, if Bob were to engage in malicious behavior, such as attempting to rewrite the blockchain history, it would likely be detected by other participants in the network.
  4. The vulnerability, known as a "reentrancy" attack, allowed the attacker to repeatedly call certain functions within the smart contract, essentially allowing them to drain the funds held by the contract. The attacker was able to do this by calling the "withdraw" function within the smart contract, which transferred funds from the contract to the attacker's account. However, the attacker was also able to modify the state of the contract in such a way that the "withdraw" function was called again before the contract was able to update its internal state, effectively allowing the attacker to withdraw the same funds multiple times.
  5. To detect this type of vulnerability using taint analysis, the taint source would be the input provided by the attacker, and the taint sink would be the point at which the contract reverts to its initial state. The taint analysis tool would trace the flow of the attacker's input through the contract's code and would flag any points at which the input causes the contract to revert to its initial state as potentially exploitable vulnerabilities.
2.
  1. The typical procedure for launching federated learning to jointly train a model involves four main steps:
    1. Initialization: Download the local model
    2. Local training: Each party trains the model on its own local dataset, using the initial weights and biases as a starting point. This results in four updated models, each of which has been trained on a different dataset.
    3. Upload the model
    4. Perform combined model

The key advantage of using federated learning is that it allows for the training of a model on decentralized data, without the need for the raw data to be centralized or shared among the parties. This can be useful in scenarios where data privacy is a concern, or where the parties involved in the training process do not have the ability or infrastructure to share their data. Additionally, federated learning can be more efficient and scalable than traditional, centralized machine learning approaches, as it allows the training process to be distributed across multiple parties.

  1. It is possible that federated learning could indirectly help to mitigate adversarial examples by improving the overall performance and robustness of the trained model. If a model is trained using federated learning and can achieve high accuracy on a diverse range of decentralized data, it may be less susceptible to being fooled by adversarial examples. However, this would depend on the specific details of the model and the training process and would require further investigation to determine.
  2. It is possible for a backdoor attack to be launched in a federated learning setting, although the threat model may differ somewhat from traditional backdoor attacks. In a typical federated learning setting, the attacker could be any of the parties involved in the training process, or a third party who is able to tamper with the data used by one of the parties for training. The attacker's goal would be to introduce a "backdoor" into the trained model, such that the model behaves normally on most inputs, but produces a predetermined, malicious output when presented with a specific trigger input. The attacker's capability would depend on their access to the data used for training. In a federated learning setting, the attacker would need to be able to tamper with the data used by one of the parties for training, in order to introduce the backdoor.
1.
  1. In general, attackers may use side channel attacks to recover input images because doing so can allow them to gain access to sensitive information. Side channel attacks are a type of attack that exploits the physical characteristics of a system, such as its power consumption or electromagnetic emissions, to infer sensitive information about the system or the data it processes. In the case of recovering input images, an attacker could use a side channel attack to gain access to the contents of the image, which could potentially contain sensitive information.
  2. In general, attackers may use side channel attacks to recover pre-calculated vectors, such as model weights or parameters, because doing so can allow them to gain access to sensitive information and potentially compromise the security of the system. Model weights and parameters contain the information that a machine learning model has learned from training data and can be valuable to attackers who may want to use this information for their own purposes, such as to create a similar or counterfeit model. By using a side channel attack to recover this information, an attacker can potentially bypass security measures and gain unauthorized access to.

(a) Attackers may care about using side channel attacks to recover input images because the input images may contain sensitive or personal information that the attacker could use for malicious purposes. For example, if the DNN model is being used for facial recognition, the input images could contain pictures of individuals that the attacker may want to identify or track.

(b) Attackers may care about using side channel attacks to recover pre-calculated vectors (i.e., model weights/parameters) because these vectors contain important information about the model's behavior and performance. By recovering these vectors, an attacker could potentially gain insight into how the model is making decisions and potentially find ways to manipulate the model's behavior.

(c) The above procedure (DNN for image classification) may be vulnerable to side channel attacks, depending on the specific implementation of the model and the system it is running on. Some potential side channels that may leak either inputs or pre-calculated vectors include:

Power consumption: By measuring the power consumption of the system while the DNN model is running, an attacker may be able to infer information about the inputs and/or pre-calculated vectors being processed by the model.

Timing attacks: By measuring the time it takes for the DNN model to process inputs and/or pre-calculated vectors, an attacker may be able to infer information about the data being processed.

Cache attacks: By measuring the cache usage of the system while the DNN model is running, an attacker may be able to infer information about the inputs and/or pre-calculated vectors being processed by the model.

Electromagnetic emissions: By measuring the electromagnetic emissions of the system while the DNN model is running, an attacker may be able to infer information about the inputs and/or pre-calculated vectors being processed by the model.

D) One potential side channel vulnerability is through timing attacks. Depending on the implementation of the DNN model, the time it takes for the model to process a given input sentence may vary based on the specific words and vectors used as input. An attacker could potentially measure the time it takes for the model to process different input sentences and use this information to infer information about the input sentences.

Another potential side channel vulnerability is through cache attacks. If the hash table and lookup table used by the model are stored in the system's cache, an attacker could potentially measure the cache usage of the system while the model is running and use this information to infer information about the input sentences.

Finally, there may also be potential side channel vulnerabilities through electromagnetic emissions or power consumption, depending on the specific implementation of the model and the system it is running on. An attacker could potentially measure these emissions or power consumption while the model is running and use this information to infer information about the input sentences.