% Function to draw a circle with specified radius
function drawCircle(robot, radius)
    angles = linspace(0, 2*pi, 100); % Angles for drawing circle
    x = radius * cos(angles); % X coordinates of circle points
    y = radius * sin(angles); % Y coordinates of circle points
    drawShape(robot, x, y);
end

% Function to draw an ellipse with specified major and minor axes
function drawEllipse(robot, a, b)
    angles = linspace(0, 2*pi, 100); % Angles for drawing ellipse
    x = a * cos(angles); % X coordinates of ellipse points
    y = b * sin(angles); % Y coordinates of ellipse points
    drawShape(robot, x, y);
end

% Function to draw a polygon with specified vertices
function drawPolygon(robot, vertices)
    x = vertices(:, 1); % X coordinates of polygon vertices
    y = vertices(:, 2); % Y coordinates of polygon vertices
    drawShape(robot, x, y);
end

% Function to simulate drawing a shape using robotic arm
function drawShape(robot, x, y)
    % Initialize plot for robotic arm
    figure;
    hold on;
    axis equal;
    grid on;
    title('Drawing with 2 DOF Robotic Arm');
    xlabel('X');
    ylabel('Y');

    % Plot the shape points
    plot(x, y, 'k', 'LineWidth', 2);

    % Calculate joint angles for each point in the shape
    for i = 1:length(x)
        % Inverse kinematics to determine joint angles (theta1, theta2)
        [theta1, theta2] = inverseKinematics(robot, x(i), y(i));

        % Plot robotic arm configuration for each point
        plotArm(robot, theta1, theta2);

        % Pause to visualize the movement (adjust timing as needed)
        pause(0.1);
    end
end

% Function to perform inverse kinematics and calculate joint angles
function [theta1, theta2] = inverseKinematics(robot, x, y)
    L1 = robot.L1; % Length of link 1 (shoulder to elbow)
    L2 = robot.L2; % Length of link 2 (elbow to end-effector)

    % Calculate theta2 using cosine rule
    c2 = (x^2 + y^2 - L1^2 - L2^2) / (2 * L1 * L2);
    s2 = sqrt(1 - c2^2);
    theta2 = atan2(s2, c2);

    % Calculate theta1 using inverse tangent
    theta1 = atan2(y, x) - atan2(L2 * s2, L1 + L2 * c2);
end

% Function to plot the robotic arm configuration
function plotArm(robot, theta1, theta2)
    L1 = robot.L1; % Length of link 1 (shoulder to elbow)
    L2 = robot.L2; % Length of link 2 (elbow to end-effector)

    % Compute joint positions
    x1 = L1 * cos(theta1);
    y1 = L1 * sin(theta1);
    x2 = x1 + L2 * cos(theta1 + theta2);
    y2 = y1 + L2 * sin(theta1 + theta2);

    % Plot links and joints
    plot([0, x1, x2], [0, y1, y2], 'ro-', 'LineWidth', 2);
    plot(0, 0, 'ko', 'MarkerFaceColor', 'k'); % Base joint
    plot(x1, y1, 'ko', 'MarkerFaceColor', 'k'); % Elbow joint
    plot(x2, y2, 'ko', 'MarkerFaceColor', 'k'); % End-effector
end

% Main script to test drawing functionalities
% Define robotic arm parameters (link lengths)
robot.L1 = 3; % Length of link 1 (shoulder to elbow)
robot.L2 = 2; % Length of link 2 (elbow to end-effector)

% Test drawing different shapes
drawCircle(robot, 2); % Draw a circle with radius 2
drawEllipse(robot, 3, 2); % Draw an ellipse with major axis 3 and minor axis 2
drawPolygon(robot, [1, 1; 2, 3; 4, 2]); % Draw a triangle (example vertices)

