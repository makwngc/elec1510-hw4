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
// Function: F(A,B,C,D) = A(CD + B) + BC'
// Note:     Removed some redundant NOT gates. I
//           simply could not bring myself to write
//           logic like that.
// ==================================================
module hw4_6a
(
    input a, b, c, d,
    output f
);


endmodule

// ==================================================
// Module:   hw4_6b
// Function: F(A,B,C,D) = (AB' + A'B)(C + D')
// Note:     Same note as 'hw4_6a'.
// ==================================================
module hw4_6b
(
    input a, b, c, d,
    output f
);


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