function parseImuData(~, imuData)

  global orientation
  global angular_velocity
  global linear_acceleration

  [y p r] = quat2angle([imuData.Orientation.X imuData.Orientation.Y imuData.Orientation.Z imuData.Orientation.W]);
  orientation = [r p y];
  angular_velocity = [imuData.AngularVelocity.X imuData.AngularVelocity.Y imuData.AngularVelocity.Z];
  linear_acceleration = [imuData.LinearAcceleration.X imuData.LinearAcceleration.Y imuData.LinearAcceleration.Z];

end
