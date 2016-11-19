LibMyoProportional myoProportional;


void setup() {
  try {
    myoProportional = new LibMyoProportional(this);
    calibrate();
    myoProportional.writeCalibrationSettings("calibration.csv");

  } catch (MyoNotDetectectedError e) {
    println("[ERROR] Could not detect armband, exiting.");
    System.exit(1);

  } catch (CalibrationFailedException e) {
    println("[ERROR] Could not successfully calibrate, exiting.");
    System.exit(2);
  }

  exit();
}

private void calibrate() throws CalibrationFailedException {
  SensorConfig s;

  println("Left (5 seconds):");
  delay(5000);
  s = myoProportional.registerAction(Action.LEFT);
  println("[INFO] Registered sensor " + s.sensorID + " with sensitivity " + s.maxReading + ".");

  println("Right (5 seconds):");
  delay(5000);
  s = myoProportional.registerAction(Action.RIGHT);
  println("[INFO] Registered sensor " + s.sensorID + " with sensitivity " + s.maxReading + ".");

  assert(myoProportional.isCalibrated());
}
