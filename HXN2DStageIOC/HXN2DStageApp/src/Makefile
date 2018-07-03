TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#=============================
# Build the IOC support library

#=============================
# Build the IOC application

PROD_IOC = HXN2DStage
# HXN2DStage.dbd will be created and installed
DBD += HXN2DStage.dbd

# HXN2DStage.dbd will be made up from these files:
HXN2DStage_DBD += base.dbd



HXN2DStage_DBD += base.dbd
HXN2DStage_DBD += asyn.dbd
HXN2DStage_DBD += motorSupport.dbd
HXN2DStage_DBD += drvAsynIPPort.dbd
HXN2DStage_DBD += drvAsynSerialPort.dbd
HXN2DStage_DBD += pmacAsynMotorPort.dbd
HXN2DStage_DBD += pmacAsynMotor.dbd
HXN2DStage_DBD += pmacAsynIPPort.dbd
HXN2DStage_DBD += pmacAsynCoord.dbd
HXN2DStage_DBD += asSupport.dbd
HXN2DStage_DBD += busySupport.dbd
HXN2DStage_DBD += calcSupport.dbd
HXN2DStage_DBD += system.dbd
HXN2DStage_DBD += stream.dbd
HXN2DStage_DBD += devIocStats.dbd


HXN2DStage_LIBS += pmacAsynMotorPort
HXN2DStage_LIBS += pmacAsynIPPort
HXN2DStage_LIBS += pmacAsynCoord
HXN2DStage_LIBS += motor
HXN2DStage_LIBS += asyn
HXN2DStage_LIBS += autosave
HXN2DStage_LIBS += busy
HXN2DStage_LIBS += calc
HXN2DStage_LIBS += stream
HXN2DStage_LIBS += devIocStats
HXN2DStage_LIBS += pmacAsynMotor





























# HXN2DStage_registerRecordDeviceDriver.cpp derives from HXN2DStage.dbd
HXN2DStage_SRCS += HXN2DStage_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
HXN2DStage_SRCS_DEFAULT += HXN2DStageMain.cpp

# NOTE: To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file


# Finally link to the EPICS Base libraries
HXN2DStage_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

