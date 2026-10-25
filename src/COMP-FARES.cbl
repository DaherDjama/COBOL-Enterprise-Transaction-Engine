IDENTIFICATION DIVISION.
       PROGRAM-ID. COMP-FARES.
       AUTHOR. DJAMA AHMED DAHER.
      *
      * Fare calculation subprogram
      * Handles loyalty discounts, tax calculations, and mileage awards
      *
       DATA DIVISION.
       LINKAGE SECTION.
       01  LS-PASSENGER-RECORD.
           05  LS-PASSENGER-NAME     PIC X(30).
           05  LS-PASSENGER-ID       PIC 9(8).
           05  LS-LOYALTY-TIER       PIC X(1).
               88  LS-TIER-BRONZE    VALUE "B".
               88  LS-TIER-SILVER    VALUE "S".
               88  LS-TIER-GOLD      VALUE "G".
               88  LS-TIER-PLATINUM  VALUE "P".
           05  LS-MILEAGE-BALANCE    PIC 9(7).
           05  LS-TICKET-CLASS       PIC X(1).
               88  LS-CLASS-ECONOMY  VALUE "E".
               88  LS-CLASS-BUSINESS VALUE "B".
               88  LS-CLASS-FIRST    VALUE "F".
           05  LS-BASE-FARE          PIC 9(5)V99.
           05  LS-FLIGHT-DATE        PIC X(10).

       01  LS-CALCULATED-FARE.
           05  LS-DISCOUNT-AMT       PIC 9(5)V99.
           05  LS-TAX-AMT            PIC 9(5)V99.
           05  LS-FINAL-PRICE        PIC 9(5)V99.
           05  LS-MILES-EARNED       PIC 9(6).

       WORKING-STORAGE SECTION.
       01  WS-DISCOUNT-RATE          PIC V99 VALUE 0.
       01  WS-TAX-RATE               PIC V99 VALUE 0.12.
       01  WS-MILEAGE-MULTIPLIER     PIC 9 VALUE 1.

       PROCEDURE DIVISION USING LS-PASSENGER-RECORD
                                LS-CALCULATED-FARE.
       CALCULATE-FARE.
           PERFORM DETERMINE-LOYALTY-DISCOUNT
           PERFORM DETERMINE-TAX-RATE
           PERFORM CALCULATE-AMOUNTS
           PERFORM CALCULATE-MILES
           GOBACK.

       DETERMINE-LOYALTY-DISCOUNT.
           EVALUATE TRUE
               WHEN LS-TIER-PLATINUM
                   MOVE 0.25 TO WS-DISCOUNT-RATE
               WHEN LS-TIER-GOLD
                   MOVE 0.15 TO WS-DISCOUNT-RATE
               WHEN LS-TIER-SILVER
                   MOVE 0.10 TO WS-DISCOUNT-RATE
               WHEN LS-TIER-BRONZE
                   MOVE 0.05 TO WS-DISCOUNT-RATE
               WHEN OTHER
                   MOVE 0 TO WS-DISCOUNT-RATE
           END-EVALUATE.

       DETERMINE-TAX-RATE.
           EVALUATE TRUE
               WHEN LS-CLASS-FIRST
                   MOVE 0.15 TO WS-TAX-RATE
               WHEN LS-CLASS-BUSINESS
                   MOVE 0.12 TO WS-TAX-RATE
               WHEN LS-CLASS-ECONOMY
                   MOVE 0.08 TO WS-TAX-RATE
               WHEN OTHER
                   MOVE 0.10 TO WS-TAX-RATE
           END-EVALUATE.

       CALCULATE-AMOUNTS.
           COMPUTE LS-DISCOUNT-AMT =
               LS-BASE-FARE * WS-DISCOUNT-RATE
           COMPUTE LS-TAX-AMT =
               (LS-BASE-FARE - LS-DISCOUNT-AMT) * WS-TAX-RATE
           COMPUTE LS-FINAL-PRICE =
               LS-BASE-FARE - LS-DISCOUNT-AMT + LS-TAX-AMT.

       CALCULATE-MILES.
           EVALUATE TRUE
               WHEN LS-CLASS-FIRST
                   MOVE 3 TO WS-MILEAGE-MULTIPLIER
               WHEN LS-CLASS-BUSINESS
                   MOVE 2 TO WS-MILEAGE-MULTIPLIER
               WHEN LS-CLASS-ECONOMY
                   MOVE 1 TO WS-MILEAGE-MULTIPLIER
               WHEN OTHER
                   MOVE 1 TO WS-MILEAGE-MULTIPLIER
           END-EVALUATE

           COMPUTE LS-MILES-EARNED =
               500 * WS-MILEAGE-MULTIPLIER.
