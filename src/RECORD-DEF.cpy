01  PASSENGER-RECORD.
           05  PR-PASSENGER-NAME     PIC X(30).
           05  PR-PASSENGER-ID       PIC 9(8).
           05  PR-LOYALTY-TIER       PIC X(1).
               88  TIER-BRONZE       VALUE "B".
               88  TIER-SILVER       VALUE "S".
               88  TIER-GOLD         VALUE "G".
               88  TIER-PLATINUM     VALUE "P".
           05  PR-MILEAGE-BALANCE    PIC 9(7).
           05  PR-TICKET-CLASS       PIC X(1).
               88  CLASS-ECONOMY     VALUE "E".
               88  CLASS-BUSINESS    VALUE "B".
               88  CLASS-FIRST       VALUE "F".
           05  PR-BASE-FARE          PIC 9(5)V99.
           05  PR-FLIGHT-DATE        PIC X(10).

       01  REPORT-RECORD.
           05  RR-PASSENGER-NAME     PIC X(30).
           05  RR-PASSENGER-ID       PIC 9(8).
           05  RR-LOYALTY-TIER       PIC X(1).
           05  RR-TICKET-CLASS       PIC X(1).
           05  RR-BASE-FARE          PIC $$$,$$9.99.
           05  RR-DISCOUNT           PIC $$$,$$9.99.
           05  RR-TAX                PIC $$$,$$9.99.
           05  RR-FINAL-PRICE        PIC $$$,$$9.99.
           05  RR-MILES-EARNED       PIC 9(6).
