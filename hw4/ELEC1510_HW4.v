/*
File Name: ELEC1510_HW4.v
Author: Mason Wilcox
Date: 03/09/2026
*/

// ==================================================
// Module:   hw4_5a
// Function: F(A,B,C,D) = A(CD + B) + BC'
// ==================================================
module hw4_5a
(
    input a, b, c, d,
    output f
);
    
    wire c_prime;
    wire w_one, w_two, w_three, w_four;

    // Level One
    and and_one(wire_one, c, d);              // wire_one = CD
    and and_two(wire_two, b, c_prime);        // wire_two = B * c_prime

    // Level Two
    or or_one(wire_three, wire_one, b);       // wire_three = wire_one + b

    // Level Three
    and and_three(wire_four, wire_three, a);  // wire_four = wire_three * A

    // Level Four (Output)
    or or_two(f, wire_four, wire_two);        // f = wire_four + wire_two

endmodule

// ==================================================
// Module:   hw4_5b
// Function: F(A,B,C,D) = (AB' + A'B)(C + D')
// ==================================================
module hw4_5b
(
    input a, b, c, d,
    output f
);

    wire a_prime, b_prime, d_prime;
    wire w_one, w_two, w_three, w_four;

    // Level One
    not not_one(a_prime, a);    // a_prime = A'
    not not_two(b_prime, b);    // b_prime = B'
    not not_three(d_prime, d);  // d_prime = D'

    // Level Two
    and and_one(w_one, a, b_prime);     // w_one   = A * b_prime
    and and_two(w_two, a_prime, b);     // w_two   = a_prime * B
    or or_one(w_three, c, d_prime);     // w_three = C + d_prime

    // Level Three
    or or_two(w_four, w_one, w_two);    // w_four = w_one + w_two

    // Level Four (Output)
    and and_three(f, w_four, w_three);  // f = w_four + w_three

endmodule

// ==================================================
// Module:   hw4_6a
// Function: F(A,B,C,D) = 
//           (((((CD)')' + (B')')A)')' + ((BC')')'
// ==================================================
module hw4_6a
(
    input a, b, c, d,
    output f
);

    wire b_prime, c_prime;
    wire w_one, w_two, w_three, w_four, w_five, w_six, w_seven, w_eight;

    // Level One
    not not_one(b_prime, b);             // b_prime = B'
    not not_two(c_prime, c);             // c_prime = C'

    // Level Two
    nand nand_one(w_one, c, d);          // w_one = (CD)'
    nand nand_two(w_two, b, c_prime);    // w_two = (B * c_prime)'

    // Level Three
    not not_three(w_three, w_one);       // w_three = (w_one)'
    not not_four(w_four, b_prime);       // w_four = (b_prime)'

    // Level Four
    or or_one(w_five, w_three, w_four);  // w_five = w_three + w_four

    // Level Five
    nand nand_three(w_six, w_five, a);   // w_six = (w_five * A)'

    // Level Six
    not not_five(w_seven, w_six);        // w_seven = (w_six)'
    not not_six(w_eight, w_two);         // w_eight = (w_two)'

    // Level Seven (Output)
    or or_two(f, w_seven, w_eight);      // f = w_seven + w_eight

endmodule

// ==================================================
// Module:   hw4_6b
// Function: F(A,B,C,D) = 
//           (((((AB')')' + ((A'B)')')((C')' + (D)'))')'
// ==================================================
module hw4_6b
(
    input a, b, c, d,
    output f
);

    wire a_prime, b_prime, c_prime;
    wire w_one, w_two, w_three, w_four, w_five, w_six, w_seven, w_eight, w_nine;

    // Level One
    not not_one(b_prime, b);                  // b_prime = B'
    not not_two(a_prime, a);                  // a_prime = A'
    not not_three(c_prime, c);                // c_prime = C'

    // Level Two
    not not_four(w_one, c_prime);             // w_one = (c_prime)'
    not not_five(w_two, d);                   // w_two = D'

    // Level Three
    nand nand_one(w_three, a, b_prime);       // w_three = (A * b_prime)'
    nand nand_two(w_four, a_prime, b);        // w_four = (a_prime * B)'
    or or_one(w_five, w_one, w_two);          // w_five = w_one + w_two

    // Level Four
    not not_six(w_six, w_three);              // w_six = (w_three)'
    not not_seven(w_seven, w_four);           // w_seven = (w_four)'

    // Level Five
    or or_two(w_eight, w_six, w_seven);       // w_eight = w_six + w_seven

    // Level Six
    nand nand_three(w_nine, w_eight, w_five); // w_nine = (w_eight * w_five)'

    // Level Seven (Output)
    not not_eight(f, w_nine);                 // f = (w_nine)'

endmodule

// ==================================================
// Module:    hw4_8
// Functions: A(x,y,z) = xy + yz
// Note:      Just a fun "challenge".
// ==================================================
module hw4_8
(
    input x, y, z,
    output a, b, c
);
    
    assign a = (x & y) | (y & z); // a = xy + yz

endmodule