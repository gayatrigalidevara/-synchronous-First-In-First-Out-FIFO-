# First-In First-Out (FIFO) Buffer Using Verilog HDL

## Project Overview

This project implements a synchronous First-In First-Out (FIFO) buffer using Verilog HDL. FIFO is a widely used memory structure in digital systems for temporary data storage and buffering between producer and consumer modules.

The design is implemented as an 8-depth, 4-bit wide circular buffer with separate read and write pointers, full and empty status flags, and synchronous reset functionality.

---

## Features

- 8-location FIFO memory
- 4-bit data width
- Synchronous operation
- Circular buffer implementation
- Separate read and write pointers
- Full flag generation
- Empty flag generation
- Overflow protection
- Underflow protection
- Synthesizable RTL design

---

## FIFO Specifications

| Parameter | Value |
|------------|--------|
| FIFO Depth | 8 |
| Data Width | 4-bit |
| Read Pointer | 3-bit |
| Write Pointer | 3-bit |
| Reset Type | Synchronous |
| Clock Edge | Positive Edge |

---

## Block Diagram

```
                +-------------------+
                |       FIFO        |
                |                   |
   din[3:0] --->|                   |----> dout[3:0]
     write ---->|                   |
      read ---->|                   |
       clk ---->|                   |
       rst ---->|                   |
                |                   |
      full <----|                   |
     empty <----|                   |
                +-------------------+
```

---

## Inputs and Outputs

### Inputs

| Signal | Width | Description |
|----------|--------|-------------|
| clk | 1 | System Clock |
| rst | 1 | Synchronous Reset |
| write | 1 | Write Enable |
| read | 1 | Read Enable |
| din | 4 | Data Input |

### Outputs

| Signal | Width | Description |
|----------|--------|-------------|
| dout | 4 | Data Output |
| full | 1 | FIFO Full Flag |
| empty | 1 | FIFO Empty Flag |

---

## FIFO Architecture

The FIFO consists of:

1. Memory Array (8 × 4-bit)
2. Write Pointer
3. Read Pointer
4. Full Flag Logic
5. Empty Flag Logic
6. Control Logic

The write pointer advances during write operations and the read pointer advances during read operations.

---

## Working Principle

### Write Operation

- Assert write = 1
- FIFO stores data at write pointer location
- Write pointer increments
- Empty flag is cleared

### Read Operation

- Assert read = 1
- FIFO outputs data from read pointer location
- Read pointer increments
- Empty flag is asserted when all data is read

### Full Condition

FIFO becomes full when:

```
wr_ptr + 1 == rd_ptr
```

### Empty Condition

FIFO becomes empty when:

```
rd_ptr == wr_ptr
```

---

## Verilog Design File

```
fifo.v
```

Contains:

- FIFO memory implementation
- Pointer logic
- Full/Empty flag generation
- Read/Write control logic

---

## Testbench File

```
tb.v
```

The testbench verifies:

- Reset operation
- Multiple write operations
- Multiple read operations
- FIFO ordering property
- Full and Empty flag behavior

---

## Simulation Procedure

### Vivado

1. Create new project
2. Add fifo.v
3. Add tb.v
4. Run Behavioral Simulation

### ModelSim

Compile:

```bash
vlog fifo.v
vlog tb.v
```

Simulate:

```bash
vsim tb
add wave *
run -all
```

---

## Expected Output

### Write Sequence

```
7
5
4
```

### Read Sequence

```
7
5
4
```

FIFO maintains First-In First-Out ordering.

---

## RTL Schematic

The synthesized RTL contains:

- FIFO Memory Block
- Write Pointer Register
- Read Pointer Register
- Full Detection Logic
- Empty Detection Logic
- Output Register

---

## Applications

- UART Buffers
- SPI Interfaces
- I2C Controllers
- Processor Pipelines
- Data Streaming Systems
- Clock Domain Crossing
- Communication Systems

---

## Future Enhancements

- Asynchronous FIFO
- Parameterized FIFO Depth
- Parameterized Data Width
- Almost Full Flag
- Almost Empty Flag
- First Word Fall Through (FWFT)
- FPGA Hardware Implementation

---

## Conclusion

This project successfully demonstrates the design and verification of an 8-depth, 4-bit synchronous FIFO using Verilog HDL. The FIFO correctly stores and retrieves data while maintaining strict FIFO ordering and generating accurate full and empty status flags.

---

### Author

**Gayatri Galidevara**

Digital System Design Laboratory Project
