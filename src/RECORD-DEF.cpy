    01  INPUT-RECORD.
        05  IN-PASSENGER-NAME    PIC X(20).
        05  IN-LOYALTY-TIER      PIC X(10).
        05  IN-TICKET-CLASS      PIC X(01).
        05  IN-BASE-FARE         PIC 9(5)V99.

    01  OUTPUT-RECORD.
        05  OUT-PASSENGER-NAME   PIC X(20).
        05  FILLER               PIC X(02) VALUE "  ".
        05  OUT-LOYALTY-TIER     PIC X(10).
        05  FILLER               PIC X(02) VALUE "  ".
        05  OUT-FINAL-FARE       PIC 9(5).99.
        05  FILLER               PIC X(02) VALUE "  ".
        05  OUT-MILES-EARNED     PIC 9(4).
