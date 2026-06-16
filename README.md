# Two-Node-Thermal-System
MATLAB and Simulink project modelling a two-node thermal system with an interactive App Designer interface for parameter analysis and dynamic response simulation.

## Overview

This project models and analyses a two-node thermal system using MATLAB, Simulink, and App Designer. The system consists of two thermal capacitances connected through thermal resistances, with heat input applied to the first node and heat exchange occurring with the surrounding environment.

The project was developed as part of the **ACS133 Physical Systems** module and demonstrates dynamic system modelling, simulation, control-oriented analysis, and graphical user interface development.

## Features

* Dynamic modelling of a two-node thermal system
* Simulink implementation using transfer function representations
* Interactive MATLAB App Designer interface
* Adjustable thermal parameters:

  * Thermal resistances (R1, R2, R3)
  * Thermal capacitances (C1, C2)
  * Ambient temperature
  * Heat input magnitude
  * Heat input step time
* Automatic simulation and plotting
* Steady-state temperature calculation
* Settling time analysis
* Input validation and error handling
* Parameter sensitivity analysis

## System Description

The thermal system consists of:

* Two thermal nodes with capacitances **C1** and **C2**
* Three thermal resistances **R1**, **R2**, and **R3**
* Heat input applied to Node 1
* Heat exchange with ambient temperature

The governing energy balance equations were transformed into transfer functions using Laplace methods and implemented within Simulink to simulate the temperature response of both nodes.

## Simulink Model

The Simulink model contains:

* Step Input Block for heat input
* Transfer Function Blocks representing the thermal dynamics
* Workspace Output Blocks for:

  * Heat input q₁(t)
  * Node 1 temperature θ₁(t)
  * Node 2 temperature θ₂(t)

Simulation outputs are exported to MATLAB for analysis and visualisation.

## MATLAB App

The project includes an interactive MATLAB App developed using App Designer.

### App Capabilities

* Modify thermal system parameters in real time
* Run simulations directly from the GUI
* Display temperature responses for both thermal nodes
* Visualise heat input profiles
* Calculate:

  * Steady-state temperatures
  * Settling times
* Reset parameters to default values

### Input Validation

The application includes validation checks to ensure:

* Inputs are numeric
* Inputs are finite
* Resistance values are non-zero
* Required fields are not empty

## Parameter Analysis

Several parameter studies were performed to investigate system behaviour:

* Increasing thermal resistance R1
* Increasing thermal resistance R2
* Increasing thermal resistance R3
* Increasing capacitance C1
* Increasing capacitance C2
* Increasing heat input amplitude
* Modifying heat input step time
* Changing ambient temperature

The results demonstrate how thermal resistance and capacitance influence steady-state temperatures, response speed, and settling time.

## Technologies Used

* MATLAB
* Simulink
* MATLAB App Designer

## Learning Outcomes

This project provided practical experience in:

* Dynamic system modelling
* Thermal system analysis
* Transfer function implementation
* Simulink simulation
* MATLAB App development
* User interface design
* Parameter sensitivity analysis
* Engineering data visualisation

## Author

**Rotimi Dayo**

University of Sheffield
MEng Mechatronics and Robotics Engineering 2025

## License

This project is provided for educational and portfolio purposes.
