# 2D Fly Scan

Included here are the pmac files for the 2D fly scan test bench.

At the moment there are no encoders and positioning is done by counts relative to the home position.  The home position is defined by the negative limit switch with some offset.  Since direct micro-stepping is not connected to the IC that does position compare another solution is found.  In this scheme #5 and #6 are setup for PFM and they follow #1 and #2 respectively.  The triggers are then setup using the position compare for #5 and #6 (if needed).

For the convenience of EPICS and bluesky the motors are encorperated into a coordinate system using forward and inverse kinematics following the prescription of pmacAsynCoord and loosely the Diamond Light Source standards.  The kinematics of the coordinate system use mirco-meters, but the trigger is required to be in counts, so the scan program must differ in scale, and you will see calls to the coordinate system for motion are scaled.

In order to run the scan you must set properly P1100..1106.  P1107 is the feedrate and calculated automatically given the input TriggerRate (P1006).
