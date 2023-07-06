       IDENTIFICATION DIVISION.
       PROGRAM-ID. TEST11.
       AUTHOR. "BURAK OZDEMIR(BUOZDEMI)".
      
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  EXAM          PIC 9(3).
       01  PROJECTS      PIC 9(2).
       01  EXAM-DISP     PIC Z(2)9.
       01  PROJECTS-DISP PIC Z9.
       01  RESULT        PIC 9(3).
       01  EXPECTED      PIC 9(3).
      
       PROCEDURE DIVISION.
           MOVE 100  TO EXAM
           MOVE 5    TO PROJECTS
           MOVE 100  TO EXPECTED
           PERFORM DOTEST.

           INITIALIZE EXAM
           INITIALIZE PROJECTS
           INITIALIZE EXPECTED
           MOVE 99   TO EXAM
           MOVE 0    TO PROJECTS
           MOVE 100  TO EXPECTED
           PERFORM DOTEST. 

           INITIALIZE EXAM
           INITIALIZE PROJECTS
           INITIALIZE EXPECTED
           MOVE 10   TO EXAM
           MOVE 15   TO PROJECTS
           MOVE 100  TO EXPECTED
           PERFORM DOTEST.

           INITIALIZE EXAM
           INITIALIZE PROJECTS
           INITIALIZE EXPECTED
           MOVE 85   TO EXAM
           MOVE 5    TO PROJECTS
           MOVE 90   TO EXPECTED
           PERFORM DOTEST.

           INITIALIZE EXAM
           INITIALIZE PROJECTS
           INITIALIZE EXPECTED
           MOVE 55   TO EXAM
           MOVE 3    TO PROJECTS
           MOVE 75   TO EXPECTED
           PERFORM DOTEST.

           INITIALIZE EXAM
           INITIALIZE PROJECTS
           INITIALIZE EXPECTED
           MOVE 55   TO EXAM
           MOVE 0    TO PROJECTS
           MOVE 0    TO EXPECTED
           PERFORM DOTEST.

           INITIALIZE EXAM
           INITIALIZE PROJECTS
           INITIALIZE EXPECTED
           MOVE 20   TO EXAM
           MOVE 2    TO PROJECTS
           MOVE 0    TO EXPECTED
           PERFORM DOTEST.
           STOP RUN.

       DOTEST.
           MOVE EXAM TO EXAM-DISP
           MOVE PROJECTS TO PROJECTS-DISP
           DISPLAY 'TESTING EXAM = ' EXAM-DISP
                    ', PROJECTS = ' PROJECTS-DISP
           INITIALIZE RESULT
           CALL 'FINALGRA' USING BY CONTENT EXAM PROJECTS
                                   BY REFERENCE RESULT
           IF RESULT = EXPECTED
             DISPLAY 'TRUE'
           IF NOT RESULT = EXPECTED
             DISPLAY 'FALSE'.
       END-DOTEST.

       END PROGRAM TEST11.
