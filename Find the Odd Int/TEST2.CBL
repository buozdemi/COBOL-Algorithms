       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  ARR.
           05 ARR-LENGTH     PIC 99.
           05 XS             PIC S99 OCCURS 1 TO 99 TIMES
                                  DEPENDING ON ARR-LENGTH.
       01  RESULT            PIC S99 SIGN LEADING.
       01  EXPECTED          PIC S99 SIGN LEADING.
       01  J                 PIC 99.
       01  I                 PIC 99.
       01  X-STR             PIC X(10).
       01  X-DELIM           PIC X.
       01  FIXED-TEST        PIC X(100).
       01  N-DISP            PIC -(9)9.

       PROCEDURE DIVISION.
           MOVE '20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5'  TO FIXED-TEST
           MOVE 5 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST

           MOVE '1,1,2,-2,5,2,4,4,-1,-2,5'  TO FIXED-TEST
           MOVE -1 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST

           MOVE '20,1,1,2,2,3,3,5,5,4,20,4,5'  TO FIXED-TEST
           MOVE 5 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST

           MOVE '10'  TO FIXED-TEST
           MOVE 10 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST

           MOVE '10,10,10'  TO FIXED-TEST
           MOVE 10 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST

           MOVE '1,1,1,1,1,1,10,1,1,1,1'  TO FIXED-TEST
           MOVE 10 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST

           MOVE '5,4,3,2,1,5,4,3,2,10,10'  TO FIXED-TEST
           MOVE 1 TO EXPECTED
           PERFORM STRING-TO-ARR
           PERFORM DOTEST
           STOP RUN.

       STRING-TO-ARR.
           MOVE 1 TO I
           MOVE 0 TO ARR-LENGTH
           PERFORM WITH TEST AFTER UNTIL X-DELIM = SPACE
               UNSTRING FIXED-TEST
                   DELIMITED BY ',' OR SPACE
                   INTO X-STR DELIMITER IN X-DELIM
                   WITH POINTER I
               ADD 1 TO ARR-LENGTH
               COMPUTE XS(ARR-LENGTH) = FUNCTION NUMVAL(X-STR)
           END-PERFORM
           .

       DOTEST.
           INITIALIZE RESULT
           CALL 'FINDIT' USING
               BY CONTENT ARR
               BY REFERENCE RESULT
           EVALUATE true
             WHEN RESULT = EXPECTED 
               DISPLAY 'TRUE'
               DISPLAY 'Result: ' Result(2:1) 
               DISPLAY 'Expected: ' EXPECTED(2:1) 
               PERFORM DISPLAY-INPUT
             WHEN OTHER
               DISPLAY 'YOUR RESULT IS NOT EQUAL EXPECTED :'
               DISPLAY 'EXPECTED: ' EXPECTED ' != '
               DISPLAY 'RESULT: ' RESULT
           END-EVALUATE 
           .

       DISPLAY-INPUT.
           DISPLAY 'XS = [' WITH NO ADVANCING
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > ARR-LENGTH
               MOVE XS(I) TO N-DISP
               DISPLAY FUNCTION TRIM(N-DISP) WITH NO ADVANCING 
               IF I < ARR-LENGTH
                   DISPLAY ', ' WITH NO ADVANCING 
               END-IF
           END-PERFORM
           DISPLAY ']'
           .

       END PROGRAM TEST2.
