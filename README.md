# ALU-for-complex-numbers
![image](https://github.com/user-attachments/assets/4364de68-f949-4eab-af9f-87ef5de1175f)
This architecture illustrates a design using four multipliers to perform complex arithmetic operations efficiently. The inputs a, b, c, and d represent the components of two complex numbers (a + bi) and (c + di). The multipliers calculate the necessary terms for complex multiplication directly: ac, bd, ad and bc. Two multiplexers control whether the outputs are used for complex multiplication or addition, based on a select signal (S). 
###Complex Multiplication (S=0):  
• The real part is calculated as y=ac−bd, achieved by subtracting the products bd from ac using an adder-subtractor.  
• The imaginary part is calculated as z = ad + bc, combining the products ad and bc through an adder.  
###Complex Addition (S=1):  
• The real part is w = a + c, directly summing a and c.  
• The imaginary part is x = b + d, directly summing b and d.  
This design uses dedicated multipliers for each term, ensuring that all operations are performed in parallel. The result is high speed and throughput but with increased hardware resource consumption due to the use of four multipliers. 
![image](https://github.com/user-attachments/assets/1f6dd953-a0e1-44d0-925b-aae8ae496473)
This architecture represents an optimized design that reduces the number of multipliers from four to three by leveraging algebraic manipulation to compute the complex multiplication terms. 
The optimization works by rearranging the terms for the real and imaginary parts of the product (a+bi) × (c+di).  
• Real part (y): (ac - bd)  
• Imaginary part (z): (ad + bc)   
Instead of directly computing all four terms ac, bd, ad, and bc, this design computes:  
• M1 = ac (first multiplier)  
• M2 = bd (second multiplier)  
• M3 = (a+b)×(c+d) (third multiplier)  
From these three multiplications, the required results are derived:  
• y = M1 – M2 (real part)  
• z = M3 − M1 − M2 (imaginary part)   
The diagram uses multiplexers to select the appropriate inputs for the multipliers and adders/subtractors for the final computation. Complex addition remains unchanged and is computed using basic adders for w = a + c and x = b + d. This approach significantly reduces hardware utilization while maintaining functionality. However, it introduces a slight increase in computational complexity due to the additional add/subtract operations required for M3. 
