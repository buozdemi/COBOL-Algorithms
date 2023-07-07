       IDENTIFICATION DIVISION.
       PROGRAM-ID. FINDIT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  M  PIC 99 VALUE 00.
       01  KALAN PIC 99 VALUE 00.
       LINKAGE SECTION.
       01  ARR.
           05 ARR-LENGTH     PIC 99.
           05 XS             PIC S99 OCCURS 1 TO 99 TIMES
                                  DEPENDING ON ARR-LENGTH
                                  INDEXED BY J.
       01  RESULT            PIC S99 SIGN LEADING.
       PROCEDURE DIVISION USING ARR RESULT.
       0000-MAIN.
           PERFORM VARYING J FROM 1 BY 1 UNTIL J > ARR-LENGTH
             PERFORM 1000-IKINCIDONGU
             COMPUTE KALAN = FUNCTION MOD(RESULT, 2)
             EVALUATE TRUE
               WHEN NOT KALAN = 0 OR RESULT = 1
                 MOVE XS(J) TO RESULT
                 GOBACK
               WHEN OTHER
                 MOVE 00 TO RESULT
                 MOVE 00 TO KALAN
             END-EVALUATE
           END-PERFORM
           GOBACK.
       0000-END. EXIT.
      *
       1000-IKINCIDONGU.
           PERFORM VARYING M FROM 1 BY 1 UNTIL M > ARR-LENGTH
              EVALUATE TRUE
                WHEN XS(J) = XS(M)
                  ADD 1 TO RESULT
              END-EVALUATE
           END-PERFORM
           MOVE 00 TO M.
       1000-IKINCIDONGU-END. EXIT.
      *
       END PROGRAM FINDIT.
