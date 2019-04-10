PROGRAM MAIN 
USE Parameters
USE Functions
!
INTEGER :: natom, nbond, nangle, i, j, k=0
REAL :: dx, dy, dz
REAL, DIMENSION(:), ALLOCATABLE :: X, Y, Z
CHARACTER (len=2), DIMENSION(:), ALLOCATABLE :: symbol
TYPE(bonddata), DIMENSION(:), ALLOCATABLE :: bonds
TYPE(atomdata), DIMENSION(:), ALLOCATABLE :: atoms
TYPE(angledata), DIMENSION(:), ALLOCATABLE :: angles
!
PRINT*,"How many atoms in the molecules, and how many bonds?"
READ(*,*) natom, nbond, nangle
!
OPEN(UNIT=1, FILE='input',STATUS='OLD')
OPEN(UNIT=2, FILE='output',STATUS='REPLACE')
!
ALLOCATE(angles(nangle))
ALLOCATE(bonds(nbond))
ALLOCATE(symbol(natom))
ALLOCATE(X(natom))
ALLOCATE(Y(natom))
ALLOCATE(Z(natom))
ALLOCATE(atoms(natom))
!
PRINT*, atomlab
!
	DO i=1, natom
	READ(1,*) symbol(i), X(i), Y(i), Z(i)
	END DO
!
	DO i=1, natom
	
atoms(i)%label = symbol(i)
atoms(i)%x = X(i)
atoms(i)%y = Y(i)
atoms(i)%z = Z(i)
	END DO
!
	DO j=1, 104 
		DO i=1, natom 
			IF (atoms(i)%label.EQ.atomlab(j)) THEN 
			atoms(i)%atom_num=j
			END IF
		END DO
	END DO  
!
	DO j=1, 104
		DO i=1, natom
			IF (atoms(i)%atom_num.EQ.(j)) THEN
			atoms(i)%WdW=radi(j)
			END IF
		END DO
	END DO
!
	DO i=1, natom
		DO j = i+1, natom
		dx=(atoms(i)%x-atoms(j)%x)
		dy=(atoms(i)%y-atoms(j)%y)
		dz=(atoms(i)%z-atoms(j)%z)
			IF  (dist(atoms(i)%x, atoms(i)%y, atoms(i)%z, atoms(j)%x, atoms(j)%y, atoms(j)%z) <= 0.5*(atoms(i)%WdW+atoms(j)%WdW)) THEN 
			k=k+1
			bonds(k)%vx = dx
			bonds(k)%vy = dy
			bonds(k)%vz = dz
			bonds(k)%atom_i = i
			bonds(k)%atom_j = j
			bonds(k)%d = dist(atoms(i)%x, atoms(i)%y, atoms(i)%z, atoms(j)%x, atoms(j)%y, atoms(j)%z)
			END IF
		END DO
	END DO 
	
k=0
	DO i=1, nbond
		DO j= i+1, nbond
			IF (bonds(i)%atom_i==bonds(j)%atom_i.OR.bonds(i)%atom_i==bonds(j)%atom_j.OR.bonds(i)%atom_j==bonds(j)%atom_i.OR.bonds(i)%atom_j==bonds(j)%atom_j) THEN
			PRINT*, "THERE`S AN ANGLE BETWEEN BOND", i, "AND", j 
			k=k+1
			angles(k)%atoms_i_j_k = (/bonds(i)%atom_i, bonds(i)%atom_j, bonds(j)%atom_i, bonds(j)%atom_j/)
			angles(k)%theta=(angle(bonds(i)%vx, bonds(i)%vy, bonds(i)%vz, bonds(j)%vx, bonds(j)%vy, bonds(j)%vz))*(180/pi)
			END IF
		END DO
	END DO
k=0

PRINT*, angles
WRITE(2,*) atoms
!
END PROGRAM MAIN
