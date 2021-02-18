# ALU
ALU stands for "Arithmetic Logic Unit." An ALU is an integrated circuit within a CPU or GPU that performs arithmetic and logic operations. Arithmetic instructions include addition, subtraction, and shifting operations, while logic instructions include boolean comparisons, such as AND, OR, XOR, and NOT operations.The control unit supplies the data required by the ALU from memory, or from input devices, and directs the ALU to perform a specific operation based on the instruction fetched from the memory. ALU is the “calculator” portion of the computer.Different operation as carried out by ALU can be categorized as follows –

logical operations − These include operations like AND, OR, NOT, XOR, NOR, NAND, etc.

Bit-Shifting Operations − This pertains to shifting the positions of the bits by a certain number of places either towards the right or left, which is considered a multiplication or division operations.

Arithmetic operations − This refers to bit addition and subtraction. Although multiplication and division are sometimes used, these operations are more expensive to make. Multiplication and subtraction can also be done by repetitive additions and subtractions respectively.

![alu](https://user-images.githubusercontent.com/67804840/108409318-19270280-724c-11eb-9cdf-e786010022c9.jpg)

This is an 4 bit alu. It can perform basic arithmetic and logic functions like addition, subtraction, AND, OR,NOT. To keep it simple i just designed it with this basic functions.
It can also perform  various status flag operation i.e.(carry,zero,overflow,parity,sign). This flags are generally used in microprocessor. There is specific opcode for every function and it is peroformed in modelsim student version.

