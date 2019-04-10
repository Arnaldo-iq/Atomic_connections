MODULE Parameters
!
IMPLICIT NONE
!
REAL(8),PARAMETER :: pi = 3.14159265359
!
CHARACTER(LEN=3), DIMENSION(104) :: atomlab = (/"H ", "He ", "Li ", "Be ", "B ", "C ", "N ", "O ", "F", "Ne ", "Na ", "Mg ", "Al ", "Si ", "P ", &
& "S " , "Cl ", "Ar ", "K " , "Ca ", "Sc ", "Ti ", "V " , "Cr ", "Mn ", "Fe ", "Co ", "Ni ", "Cu ", "Zn ", &
& "Ga ", "Ge ", "As ", "Se ", "Br ", "Kr ", "Rb ", "Sr ", "Y " , "Zr ", "Nb ", "Mo ", "Tc ", "Ru ", "Rh ", &
& "Pd ", "Ag ", "Cd ", "In ", "Sn ", "Sb ", "Te ", "I " , "Xe ", "Cs ", "Ba ", "La ", "Ce ", "Pr ", "Nd ", &
& "Pm ", "Sm ", "Eu ", "Gd ", "Td ", "Dy ", "Ho ", "Er ", "Tm ", "Yb ", "Lu ", "Hf ", "Ta ", "W " , "Re ", &
& "Os ", "Ir ", "Pt ", "Au ", "Hg ", "Tl ", "Pb ", "Bi ", "Po ", "At ", "Rn ", "Fr ", "Ra ", "Ac ", "Th ", &
& "Pa ", "U " , "Np ", "Pu ", "Am ", "Cm ", "Bk ", "Es ", "Fm ", "Md ", "No ", "Lr ", "Rf ", "Db "/)
!
REAL, DIMENSION(104) :: radi=(/1.20, 1.40, 1.23, 0.89,  0.81 , 1.70, 1.55, 1.52, &
& 1.47, 1.54, 1.57, 1.36, 1.25, 2.10, 1.80, 1.80, &
& 1.75, 1.88, 2.03, 1.74, 1.44, 1.32, 1.22, 1.18, &
& 1.18, 1.16, 1.16, 1.15, 1.17, 1.25, 1.25, 1.22, &
& 1.85, 1.90, 1.85, 2.02, 2.16, 1.91, 1.62, 1.45, &
& 1.34, 1.30, 2.06, 1.25, 1.25, 1.28, 1.34, 1.41, &
& 1.50, 1.40, 2.20, 2.20, 1.98, 2.16, 2.53, 1.98, &
& 1.69, 1.65, 1.65, 1.64, 1.63, 1.62, 1.85, 1.61, &
& 1.59, 1.59, 1.58, 1.57, 1.56, 1.74, 1.56, 1.44, &
& 1.34, 1.30, 1.28, 1.26, 1.27, 1.30, 1.34, 1.44, &
& 1.55, 1.54, 1.46, 1.46, 1.45, 2.00, 2.50, 2.00, &
& 2.00, 1.65, 1.56, 1.42, 1.30, 1.51, 2.00, 2.00, &
& 2.00, 2.00, 2.00, 2.00, 2.00, 2.00, 2.00, 2.00/)
!
TYPE atomdata
!
CHARACTER (len=2) :: label
INTEGER ::atom_num
REAL :: x, y, z
REAL :: WdW
!
END TYPE atomdata 
!
!
TYPE bonddata
!
INTEGER ::atom_i, atom_j
REAL :: vx, vy, vz, d
!
END TYPE bonddata
!
!
TYPE angledata
!
REAL, DIMENSION(4) :: atoms_i_j_k 
REAL :: theta
!
END TYPE angledata
!
!
TYPE dihedata
!
REAL, DIMENSION(4) :: atoms_i_j_k_l
REAL :: thetad

END TYPE dihedata
! 
!
END MODULE Parameters
