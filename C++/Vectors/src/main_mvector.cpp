//=======================================================================
// Basic C++: a simple mathematical vector class
//      Test
//-----------------------------------------------------------------------
// Jean-Paul Rigault --- Copyright 2004
// $Id: main_MVector.cpp,v 1.1 2004/11/28 11:38:07 jpr Exp $
//=======================================================================

#include "common_defs.hpp"
#include "MVector.hpp"

int main()
{
    MSG(Constructors);

    MVector mv0; 
    MVector mv1(5, 1.5);
    OUT(mv0);
    OUT(mv1);
    OUT(mv0 == mv1);

    MSG(Assignments);

    EXEC(mv0 = mv1);
    OUT(mv0);
    OUT(mv0 == mv1);
    OUT(mv1 += mv1);
    OUT(mv1 -= mv1);

    MSG (Scalar product and norm);

    OUT(mv0.norm());
    OUT(mv0 * mv0);

    MSG(Arithmetic operations);

    OUT(mv0 + mv0);
    OUT(mv0 - mv0);

    MSG(Subscript);

    EXEC(mv0[2] = 5.5);
    OUT(mv0[2]);

    // const MVector cmv = mv1;
    // OUT(cmv[2]);
    // // cmv[2] = 3.5; DOES NOT COMPILE. WHY?

	// MVector mv3(vv); // conversion constructor with vector<double>

	// OUT(mv3 + vv); // implicit conversion of second argument
	// OUT(vv + mv3); // implicit conversion of first argument


    return 0;
}
