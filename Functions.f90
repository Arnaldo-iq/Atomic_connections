Module Functions

IMPLICIT NONE

CONTAINS
!--------------------------------------------------!
!DISTANCE BETWEEN TWO POINTS IN THE CARTESIAN SPACE!
!--------------------------------------------------!

	FUNCTION dist(x1, y1, z1, x2, y2, z2)
		REAL dist
		REAL, INTENT( IN ) :: x1, y1, z1, x2, y2, z2 
		dist=((((x1-x2)**2)+((y1-y2)**2)+((z1-z2)**2)))**0.5
	END FUNCTION dist

!-----------------------------!
!THE ANGLE BETWEEN TWO VECTORS!
!-----------------------------!
	FUNCTION angle(VX1, VY1, VZ1, VX2, VY2, VZ2)
		REAL angle
		REAL, INTENT( IN ) :: VX1, VY1, VZ1, VX2, VY2, VZ2
		angle=acos(((VX1*VX2)+(VY1*VY2)+(VZ1*VZ2))/(((((VX1)**2)+((VY1)**2)+((VZ1)**2))**0.5)*((((VX2)**2)+((VY2)**2)+((VZ2)**2))**0.5)))

	END FUNCTION angle

END MODULE Functions


