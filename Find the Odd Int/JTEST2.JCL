//JTEST2 JOB 1,NOTIFY=&SYSUID
//***************************************************/
//* Copyright Contributors to the COBOL Programming Course
//* SPDX-License-Identifier: CC-BY-4.0
//***************************************************/
//COBRUN1  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(FINDIT),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(FINDIT),DISP=SHR
// IF RC = 0 THEN
//COBRUN2  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(TEST2),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(TEST2),DISP=SHR
//LKED.SYSLIB  DD DSN=&SYSUID..LOAD(FINDIT),DISP=SHR
// IF RC = 0 THEN
//***************************************************/
//RUN     EXEC PGM=TEST2
//STEPLIB   DD DSN=&SYSUID..LOAD,DISP=SHR
//PRTLINE   DD SYSOUT=*,OUTLIM=1500
//SYSOUT    DD SYSOUT=*,OUTLIM=1500
// ELSE
// ENDIF
// ELSE
// ENDIF
