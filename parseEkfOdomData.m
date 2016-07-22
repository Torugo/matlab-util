function parseEkfOdomData(~, odomData)

  global odomPos;
  odomObj = odomData ();
  odomPos = [odomObj.Pose.Pose.Position.X odomObj.Pose.Pose.Position.Y odomObj.Pose.Pose.Position.Z];
  

end