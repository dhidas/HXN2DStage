#!../../bin/linux-x86_64/HXN2DStage

## You may have to change HXN2DStage to something else
## everywhere it appears in this file

< envPaths
cd ${TOP}

epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
epicsEnvSet("EPICS_CA_ADDR_LIST", "10.3.0.255")

# Envirnment setup
epicsEnvSet("ENGINEER", "Dean Andrew Hidas is not an engineer. <dhidas@bnl.gov>")
epicsEnvSet("PMACUTIL", "/usr/share/epics-pmacutil-dev")
epicsEnvSet("PMAC1_IP", "10.3.0.111:1025")
epicsEnvSet("sys", "HXN")
epicsEnvSet("dev", "2DStage")
#epicsEnvSet ("STREAM_PROTOCOL_PATH", "${TOP}/protocols")
epicsEnvSet ("STREAM_PROTOCOL_PATH", "/usr/share/epics-pmacutil-dev/protocol")




## Register all support components
dbLoadDatabase "dbd/HXN2DStage.dbd"
HXN2DStage_registerRecordDeviceDriver pdbbase








pmacAsynIPConfigure("P0", $(PMAC1_IP))


pmacCreateController("PMAC1", "P0", 0, 6, 50, 500)
pmacCreateAxis("PMAC1", 1)
pmacCreateAxis("PMAC1", 2)
pmacCreateAxis("PMAC1", 5)
pmacCreateAxis("PMAC1", 6)


dbLoadRecords("db/motor.db","P=$(sys),M={$(dev)-MtrX},MOTOR=PMAC1,ADDR=1,DESC=Horizontal Motor,DTYP=asynMotor,MRES=0.0048828125,ERES=0.0048828125,EGU=um")
dbLoadRecords("db/motor.db","P=$(sys),M={$(dev)-MtrY},MOTOR=PMAC1,ADDR=2,DESC=Vertical Motor,DTYP=asynMotor,MRES=0.0048828125,ERES=0.0048828125,EGU=um")
dbLoadRecords("db/motorstatus.db","SYS=$(sys),DEV={$(dev)-MtrX},PORT=P0,AXIS=1")
dbLoadRecords("db/motorstatus.db","SYS=$(sys),DEV={$(dev)-MtrY},PORT=P0,AXIS=2")
dbLoadRecords("db/motor.db","P=$(sys),M={$(dev)-MtrVX},MOTOR=PMAC1,ADDR=5,DESC=Virtual Horizontal Motor,DTYP=asynMotor,MRES=0.0048828125,ERES=0.0048828125,EGU=um")
dbLoadRecords("db/motor.db","P=$(sys),M={$(dev)-MtrVY},MOTOR=PMAC1,ADDR=6,DESC=Virtual Vertical Motor,DTYP=asynMotor,MRES=0.0048828125,ERES=0.0048828125,EGU=um")
#
dbLoadRecords("db/pmacStatus.db","SYS=$(sys),PMAC=$(dev),VERSION=1,PLC=5,NAXES=2,PORT=P0")
#
#dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV={$(dev)-Mtr1},ADDR=1,SPORT=P0,DESC=motor1,PREC=5,EGU=cts")
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)-Ax:1},AXIS=1,PORT=P0")
#
#dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV={$(dev)-Mtr2},ADDR=2,SPORT=P0,DESC=motor2,PREC=5,EGU=cts")
dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)-Ax:2},AXIS=2,PORT=P0")
#
#dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV={$(dev)-Mtr5},ADDR=5,SPORT=P0,DESC=motor5,PREC=5,EGU=cts")
#dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)-Ax:5},AXIS=5,PORT=P0")
#
#dbLoadRecords("db/pmac_asyn_motor.db","SYS=$(sys),DEV={$(dev)-Mtr6},ADDR=6,SPORT=P0,DESC=motor6,PREC=5,EGU=cts")
#dbLoadRecords("db/pmacStatusAxis.db","SYS=$(sys),DEV={$(dev)-Ax:6},AXIS=6,PORT=P0")
#


# Create CS (ControllerPort, Addr, CSNumber, CSRef, Prog)
pmacAsynCoordCreate("P0", 0, 2, 0, 10)                  ; Real axis coord system
pmacAsynCoordCreate("P0", 0, 2, 1, 10)                  ; 
pmacAsynCoordCreate("P0", 0, 3, 2, 10)                  ; Real axis coord system
pmacAsynCoordCreate("P0", 0, 3, 3, 10)                  ; 

# Configure CS (PortName, DriverName, CSRef, NAxes)
drvAsynMotorConfigure("CoordX", "pmacAsynCoord", 0, 9)  ; Real Axis X
drvAsynMotorConfigure("CoordY", "pmacAsynCoord", 1, 9)  ; Real Axis Y
drvAsynMotorConfigure("CoordVX", "pmacAsynCoord", 2, 9) ; Virt Axis X
drvAsynMotorConfigure("CoordVY", "pmacAsynCoord", 3, 9) ; Virt Axis Y

# Set scale factor (CS_Ref, axis, stepsPerUnit)
pmacSetCoordStepsPerUnit(0, 6, 204.8)
pmacSetCoordStepsPerUnit(1, 7, 204.8)
pmacSetCoordStepsPerUnit(2, 6, 204.8)
pmacSetCoordStepsPerUnit(3, 7, 204.8)

# Set Idle and Moving poll periods (CS_Ref, PeriodMilliSeconds)
pmacSetCoordIdlePollPeriod(0, 500)
pmacSetCoordIdlePollPeriod(1, 500)
pmacSetCoordMovingPollPeriod(2, 100)
pmacSetCoordMovingPollPeriod(3, 100)

dbLoadRecords("db/HXN2DStage.db","SYS=$(sys),DEV=$(dev),PORT=P0")
dbLoadRecords("db/asynRecord.db","P=$(sys),R={$(dev)}-Asyn,ADDR=1,PORT=P0,IMAX=128,OMAX=128")





cd ${TOP}/iocBoot/${IOC}
iocInit

