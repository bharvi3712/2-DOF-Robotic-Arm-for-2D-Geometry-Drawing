# 🤖 2-DOF Robotic Arm for 2D Geometry Drawing

This project showcases a **2 Degrees of Freedom (2-DOF) planar robotic arm** developed using **MATLAB** for simulation and **Arduino Nano** for real-time control. The robotic arm is designed to draw 2D geometric shapes like **circles, ellipses, and polygons** based on user-defined inputs.

It combines concepts of **robotic kinematics, control systems, embedded programming**, and **mechanical design**, making it a perfect interdisciplinary project.

---

## 📌 Features

- Simulates a 2-DOF robotic arm using MATLAB
- Draws geometric shapes: circle, ellipse, and polygons
- Implements forward and inverse kinematics
- Real-time actuation with Arduino Nano and servo motors
- User input-driven drawing system
- Mechanical components designed using AutoCAD and fabricated at Tinkerer's Lab

---

## 🛠️ Tools & Technologies

- **MATLAB** – for simulation and kinematics
- **Arduino IDE** – for servo control via embedded code
- **AutoCAD** – for mechanical design
- **Tinkerer's Lab (Nirma University)** – for prototyping and fabrication
- **Servo motors + Arduino Nano** – for physical movement

---

## 📁 Project Structure
```bash
.
├── code.m               # Main MATLAB simulation code
├── main.tex             # LaTeX report file
├── robo_arm.jpg         # Robotic arm schematic/image
├── image_1.png          # Simulation screenshot
├── image_2.png          # Simulation screenshot
├── imag_3.png           # Simulation screenshot
├── video.mp4            # Simulation demo video
└── README.md            # Project Description

---

## 🧠 How It Works

- MATLAB takes user input (shape + parameters)
- Computes required joint angles via inverse kinematics
- Sends joint angles to Arduino Nano via Serial Communication
- Arduino maps the angles to servo motor positions and controls movement
- User sees simulated output in MATLAB and physical drawing via servo-controlled arm

---

## 🔢 Kinematics Logic

Forward Kinematics:
```math
x = L1 * cos(θ1) + L2 * cos(θ1 + θ2)
y = L1 * sin(θ1) + L2 * sin(θ1 + θ2)

Inverse Kinematics:
θ2 = atan2(s2, c2) θ1 = atan2(y, x) − atan2(L2 * s2, L1 + L2 * c2)

Where:
- `L1`, `L2`: link lengths
- `θ1`, `θ2`: joint angles
- `s2`, `c2`: sine and cosine of angle θ2
