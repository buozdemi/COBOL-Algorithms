       IDENTIFICATION DIVISION.
       PROGRAM-ID. FINALGRA.     
       DATA DIVISION.
       LINKAGE SECTION.
        01  EXAM          PIC 9(3).
        01  PROJECTS      PIC 9(2).   
        01  RESULT        PIC 9(3).      
       PROCEDURE DIVISION USING EXAM PROJECTS RESULT. 
           EVALUATE TRUE
             WHEN (EXAM > 90 OR PROJECTS > 10)
               MOVE 100 TO RESULT
             WHEN (EXAM > 75 AND PROJECTS >= 5)
               MOVE 90 TO RESULT
             WHEN (EXAM > 50 AND PROJECTS >= 2)
               MOVE 75 TO RESULT
             WHEN OTHER
               MOVE 0 TO RESULT
           END-EVALUATE.
           DISPLAY EXAM ', ' PROJECTS ' --> ' RESULT.
           GOBACK.
       END PROGRAM FINALGRA.
