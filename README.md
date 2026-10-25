# COBOL Enterprise Transaction Engine

A production-simulated, modular COBOL batch-processing engine built to demonstrate core mainframe logic layout concepts. The system handles overnight sequential ledger data files, matches corporate frequent-flyer profiles, executes transactional rate computations via external subprograms, and exports a structured audit ledger.

## 🏗️ Architectural Blueprint

The engine utilizes a decoupled structure mirroring high-volume banking systems:
* **`src/AIRLINE-MAIN.cbl`**: Main transaction workflow, file handling routines, loops, and control parameters.
* **`src/COMP-FARES.cbl`**: Independent subprogram executing critical enterprise business logic.
* **`src/RECORD-DEF.cpy`**: Standardized copybook data layouts shared across both applications to preserve parameter alignment.
* **`data/FLIGHT-INPUT.dat`**: Flat input database stream simulating corporate batch queue dumps.

## 🛠️ Local Environment & Compilation

The project is compiled and tested using **GnuCOBOL 3.2** in modern free-format context layout modes:

```bash
# Compilation Command
cobc -x -free -o run_processor -I src src/AIRLINE-MAIN.cbl src/COMP-FARES.cbl

# Execution Command
./run_processor
```
