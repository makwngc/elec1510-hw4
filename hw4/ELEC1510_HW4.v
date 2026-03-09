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
    
    wire w1, w2, w3, w4, w5;

    and g1(w1, c, d);  // w1 = CD
    or g2(w2, w1, b);  // w2 = w1 + B 
    and g3(w3, w2, a); // w3 = w2 * A
    not g4(w4, c);     // w4 = C'
    and g5(w5, b, w4); // w5 = B * w4
    or g6(f, w3, w5);  // f  = w3 + w5

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

    wire w1, w2, w3, w4;

    and g1(w1, a, !b); // w1 = AB'
    and g2(w2, !a, b); // w2 = A'B
    or g3(w3, w1, w2); // w3 = w1 + w2
    or g4(w4, c, !d);  // w4 = C + D'
    and g5(f, w3, w4); // f  = w3 * w4

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

    wire w1, w2, w3, w4;

    and g1(w1, c, d);  // w1 = CD
    or g2(w2, w1, b);  // w2 = w1 + B
    and g3(w3, a, w2); // w3 = w2 * A
    and g4(w4, b, !c); // w4 = BC'
    or g5(f, w4, w3);  // f  = w4 + w3

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

    wire w1, w2, w3, w4;

    and g1(w1, a, !b); // w1 = AB'
    and g2(w2, !a, b); // w2 = A'B
    or g3(w3, w1, w2); // w3 = w1 + w2
    or g4(w4, c, !d);  // w4 = C + D'
    and g5(f, w3, w4); // f  = w3 * w4

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