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

### 1. **User Input**
   The user selects a shape (circle, ellipse, or polygon) and provides the required parameters such as radius or coordinates.

### 2. **MATLAB Simulation**
   MATLAB calculates the required joint angles for the robotic arm to trace the shape using inverse kinematics.

### 3. **Kinematics**
   
   a) **Forward Kinematics**:
   x = L1 * cos(theta1) + L2 * cos(theta1 + theta2);  % X position of the end-effector
   y = L1 * sin(theta1) + L2 * sin(theta1 + theta2);  % Y position of the end-effector

   b) **Inverse Kinematics**:
   θ2 = atan2(s2, c2) θ1 = atan2(y, x) − atan2(L2 * s2, L1 + L2 * c2)

Where:
- `L1`, `L2`: link lengths
- `θ1`, `θ2`: joint angles
- `s2`, `c2`: sine and cosine of angle θ2
