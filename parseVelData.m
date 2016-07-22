function parseVelData(~, velData)

  global vel_linear
  global vel_angular

  vel_linear = [velData.Linear.X velData.Linear.Y velData.Linear.Z];
  vel_angular = [velData.Angular.X velData.Angular.Y velData.Angular.Z];

end

