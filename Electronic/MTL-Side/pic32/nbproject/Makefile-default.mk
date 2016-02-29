#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=Microchip/Common/TimeDelay.c "Microchip/mdd file system/CF-Bit transaction.c" "Microchip/mdd file system/CF-PMP.c" "Microchip/mdd file system/FS Phys Interface Template.c" "Microchip/mdd file system/FSIO.c" "Microchip/mdd file system/Internal Flash.c" "Microchip/mdd file system/SD-SPI.c" "Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.c" "Microchip/tcpip stack/WiFi/WFConnectionManager.c" "Microchip/tcpip stack/WiFi/WFConnectionProfile.c" "Microchip/tcpip stack/WiFi/WFConsole.c" "Microchip/tcpip stack/WiFi/WFConsoleIfconfig.c" "Microchip/tcpip stack/WiFi/WFConsoleIwconfig.c" "Microchip/tcpip stack/WiFi/WFConsoleIwpriv.c" "Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.c" "Microchip/tcpip stack/WiFi/WFConsoleMsgs.c" "Microchip/tcpip stack/WiFi/WFDataTxRx.c" "Microchip/tcpip stack/WiFi/WFDebugStrings.c" "Microchip/tcpip stack/WiFi/WFDriverCom.c" "Microchip/tcpip stack/WiFi/WFDriverCom_24G.c" "Microchip/tcpip stack/WiFi/WFDriverRaw.c" "Microchip/tcpip stack/WiFi/WFDriverRaw_24G.c" "Microchip/tcpip stack/WiFi/WFEasyConfig.c" "Microchip/tcpip stack/WiFi/WFEventHandler.c" "Microchip/tcpip stack/WiFi/WFInit.c" "Microchip/tcpip stack/WiFi/WFMac.c" "Microchip/tcpip stack/WiFi/WFMac_24G.c" "Microchip/tcpip stack/WiFi/WFMgmtMsg.c" "Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.c" "Microchip/tcpip stack/WiFi/WFParamMsg.c" "Microchip/tcpip stack/WiFi/WFParamMsg_24G.c" "Microchip/tcpip stack/WiFi/WFPowerSave.c" "Microchip/tcpip stack/WiFi/WFScan.c" "Microchip/tcpip stack/WiFi/WFTxPower.c" "Microchip/tcpip stack/WiFi/WF_Eint.c" "Microchip/tcpip stack/WiFi/WF_pbkdf2.c" "Microchip/tcpip stack/WiFi/WF_Spi.c" "Microchip/tcpip stack/Announce.c" "Microchip/tcpip stack/ARCFOUR.c" "Microchip/tcpip stack/ARP.c" "Microchip/tcpip stack/AutoIP.c" "Microchip/tcpip stack/BerkeleyAPI.c" "Microchip/tcpip stack/BigInt.c" "Microchip/tcpip stack/Delay.c" "Microchip/tcpip stack/DHCP.c" "Microchip/tcpip stack/DHCPs.c" "Microchip/tcpip stack/DNS.c" "Microchip/tcpip stack/DNSs.c" "Microchip/tcpip stack/DynDNS.c" "Microchip/tcpip stack/ENC28J60.c" "Microchip/tcpip stack/ENCX24J600.c" "Microchip/tcpip stack/ETH97J60.c" "Microchip/tcpip stack/ETHPIC32ExtPhy.c" "Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.c" "Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.c" "Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.c" "Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.c" "Microchip/tcpip stack/ETHPIC32IntMac.c" "Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.c" "Microchip/tcpip stack/FileSystem.c" "Microchip/tcpip stack/FTP.c" "Microchip/tcpip stack/Hashes.c" "Microchip/tcpip stack/Helpers.c" "Microchip/tcpip stack/HTTP2.c" "Microchip/tcpip stack/ICMP.c" "Microchip/tcpip stack/IP.c" "Microchip/tcpip stack/LCDBlocking.c" "Microchip/tcpip stack/MPFS2.c" "Microchip/tcpip stack/NBNS.c" "Microchip/tcpip stack/Random.c" "Microchip/tcpip stack/Reboot.c" "Microchip/tcpip stack/RSA.c" "Microchip/tcpip stack/SMTP.c" "Microchip/tcpip stack/SNMP.c" "Microchip/tcpip stack/SNMPv3.c" "Microchip/tcpip stack/SNMPv3USM.c" "Microchip/tcpip stack/SNTP.c" "Microchip/tcpip stack/SPIEEPROM.c" "Microchip/tcpip stack/SPIFlash.c" "Microchip/tcpip stack/SPIRAM.c" "Microchip/tcpip stack/SSL.c" "Microchip/tcpip stack/StackTsk.c" "Microchip/tcpip stack/TCP.c" "Microchip/tcpip stack/TCPPerformanceTest.c" "Microchip/tcpip stack/Telnet.c" "Microchip/tcpip stack/TFTPc.c" "Microchip/tcpip stack/Tick.c" "Microchip/tcpip stack/UART.c" "Microchip/tcpip stack/UART2TCPBridge.c" "Microchip/tcpip stack/UDP.c" "Microchip/tcpip stack/UDPPerformanceTest.c" "Microchip/tcpip stack/ZeroconfHelper.c" "Microchip/tcpip stack/ZeroconfLinkLocal.c" "Microchip/tcpip stack/ZeroconfMulticastDNS.c" Microchip/Transceivers/MRF24J40/MRF24J40.c Microchip/Transceivers/crc.c Microchip/Transceivers/security.c Microchip/WirelessProtocols/P2P/P2P.c Microchip/WirelessProtocols/SymbolTime.c MyFiles/MyCAN.c MyFiles/MyConsole.c MyFiles/MyCyclone.c MyFiles/MyFlash.c MyFiles/MyHTTP.c MyFiles/MyIO.c MyFiles/MyLED.c MyFiles/MyMDDFS.c MyFiles/MyMIWI.c MyFiles/MyMiniProjet.c MyFiles/MyRTCC.c MyFiles/MySPI.c MyFiles/MyTemperature.c MyFiles/MyWIFI.c MyFiles/MyCamera.c MyFiles/MyApp.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/Microchip/Common/TimeDelay.o "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o" "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o" "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o" "${OBJECTDIR}/Microchip/mdd file system/FSIO.o" "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o" "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o" "${OBJECTDIR}/Microchip/tcpip stack/Announce.o" "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o" "${OBJECTDIR}/Microchip/tcpip stack/ARP.o" "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o" "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o" "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o" "${OBJECTDIR}/Microchip/tcpip stack/Delay.o" "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o" "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o" "${OBJECTDIR}/Microchip/tcpip stack/DNS.o" "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o" "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o" "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o" "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o" "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o" "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o" "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o" "${OBJECTDIR}/Microchip/tcpip stack/FTP.o" "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o" "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o" "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o" "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o" "${OBJECTDIR}/Microchip/tcpip stack/IP.o" "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o" "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o" "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o" "${OBJECTDIR}/Microchip/tcpip stack/Random.o" "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o" "${OBJECTDIR}/Microchip/tcpip stack/RSA.o" "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o" "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o" "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o" "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o" "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o" "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o" "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o" "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o" "${OBJECTDIR}/Microchip/tcpip stack/SSL.o" "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o" "${OBJECTDIR}/Microchip/tcpip stack/TCP.o" "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o" "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o" "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o" "${OBJECTDIR}/Microchip/tcpip stack/Tick.o" "${OBJECTDIR}/Microchip/tcpip stack/UART.o" "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o" "${OBJECTDIR}/Microchip/tcpip stack/UDP.o" "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o" "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o" "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o" "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o" ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o ${OBJECTDIR}/Microchip/Transceivers/crc.o ${OBJECTDIR}/Microchip/Transceivers/security.o ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o ${OBJECTDIR}/MyFiles/MyCAN.o ${OBJECTDIR}/MyFiles/MyConsole.o ${OBJECTDIR}/MyFiles/MyCyclone.o ${OBJECTDIR}/MyFiles/MyFlash.o ${OBJECTDIR}/MyFiles/MyHTTP.o ${OBJECTDIR}/MyFiles/MyIO.o ${OBJECTDIR}/MyFiles/MyLED.o ${OBJECTDIR}/MyFiles/MyMDDFS.o ${OBJECTDIR}/MyFiles/MyMIWI.o ${OBJECTDIR}/MyFiles/MyMiniProjet.o ${OBJECTDIR}/MyFiles/MyRTCC.o ${OBJECTDIR}/MyFiles/MySPI.o ${OBJECTDIR}/MyFiles/MyTemperature.o ${OBJECTDIR}/MyFiles/MyWIFI.o ${OBJECTDIR}/MyFiles/MyCamera.o ${OBJECTDIR}/MyFiles/MyApp.o
POSSIBLE_DEPFILES=${OBJECTDIR}/Microchip/Common/TimeDelay.o.d "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o.d" "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o.d" "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o.d" "${OBJECTDIR}/Microchip/mdd file system/FSIO.o.d" "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o.d" "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o.d" "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Announce.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ARP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o.d" "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Delay.o.d" "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o.d" "${OBJECTDIR}/Microchip/tcpip stack/DNS.o.d" "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o.d" "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o.d" "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o.d" "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o.d" "${OBJECTDIR}/Microchip/tcpip stack/FTP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o.d" "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/IP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o.d" "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o.d" "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Random.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o.d" "${OBJECTDIR}/Microchip/tcpip stack/RSA.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o.d" "${OBJECTDIR}/Microchip/tcpip stack/SSL.o.d" "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o.d" "${OBJECTDIR}/Microchip/tcpip stack/TCP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o.d" "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o.d" "${OBJECTDIR}/Microchip/tcpip stack/Tick.o.d" "${OBJECTDIR}/Microchip/tcpip stack/UART.o.d" "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o.d" "${OBJECTDIR}/Microchip/tcpip stack/UDP.o.d" "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o.d" "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o.d" ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d ${OBJECTDIR}/Microchip/Transceivers/crc.o.d ${OBJECTDIR}/Microchip/Transceivers/security.o.d ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d ${OBJECTDIR}/MyFiles/MyCAN.o.d ${OBJECTDIR}/MyFiles/MyConsole.o.d ${OBJECTDIR}/MyFiles/MyCyclone.o.d ${OBJECTDIR}/MyFiles/MyFlash.o.d ${OBJECTDIR}/MyFiles/MyHTTP.o.d ${OBJECTDIR}/MyFiles/MyIO.o.d ${OBJECTDIR}/MyFiles/MyLED.o.d ${OBJECTDIR}/MyFiles/MyMDDFS.o.d ${OBJECTDIR}/MyFiles/MyMIWI.o.d ${OBJECTDIR}/MyFiles/MyMiniProjet.o.d ${OBJECTDIR}/MyFiles/MyRTCC.o.d ${OBJECTDIR}/MyFiles/MySPI.o.d ${OBJECTDIR}/MyFiles/MyTemperature.o.d ${OBJECTDIR}/MyFiles/MyWIFI.o.d ${OBJECTDIR}/MyFiles/MyCamera.o.d ${OBJECTDIR}/MyFiles/MyApp.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/Microchip/Common/TimeDelay.o ${OBJECTDIR}/Microchip/mdd\ file\ system/CF-Bit\ transaction.o ${OBJECTDIR}/Microchip/mdd\ file\ system/CF-PMP.o ${OBJECTDIR}/Microchip/mdd\ file\ system/FS\ Phys\ Interface\ Template.o ${OBJECTDIR}/Microchip/mdd\ file\ system/FSIO.o ${OBJECTDIR}/Microchip/mdd\ file\ system/Internal\ Flash.o ${OBJECTDIR}/Microchip/mdd\ file\ system/SD-SPI.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionAlgorithm.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionManager.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionProfile.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsole.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIfconfig.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIwconfig.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIwpriv.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleMsgHandler.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleMsgs.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDataTxRx.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDebugStrings.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverCom.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverCom_24G.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverRaw.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverRaw_24G.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFEasyConfig.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFEventHandler.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFInit.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMac.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMac_24G.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMgmtMsg.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMgmtMsg_24G.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFParamMsg.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFParamMsg_24G.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFPowerSave.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFScan.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFTxPower.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_Eint.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_pbkdf2.o ${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_Spi.o ${OBJECTDIR}/Microchip/tcpip\ stack/Announce.o ${OBJECTDIR}/Microchip/tcpip\ stack/ARCFOUR.o ${OBJECTDIR}/Microchip/tcpip\ stack/ARP.o ${OBJECTDIR}/Microchip/tcpip\ stack/AutoIP.o ${OBJECTDIR}/Microchip/tcpip\ stack/BerkeleyAPI.o ${OBJECTDIR}/Microchip/tcpip\ stack/BigInt.o ${OBJECTDIR}/Microchip/tcpip\ stack/Delay.o ${OBJECTDIR}/Microchip/tcpip\ stack/DHCP.o ${OBJECTDIR}/Microchip/tcpip\ stack/DHCPs.o ${OBJECTDIR}/Microchip/tcpip\ stack/DNS.o ${OBJECTDIR}/Microchip/tcpip\ stack/DNSs.o ${OBJECTDIR}/Microchip/tcpip\ stack/DynDNS.o ${OBJECTDIR}/Microchip/tcpip\ stack/ENC28J60.o ${OBJECTDIR}/Microchip/tcpip\ stack/ENCX24J600.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETH97J60.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhy.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83640.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83848.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8700.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8720.o ${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32IntMac.o ${OBJECTDIR}/Microchip/tcpip\ stack/eth_pic32_ext_phy_rtl8201FL.o ${OBJECTDIR}/Microchip/tcpip\ stack/FileSystem.o ${OBJECTDIR}/Microchip/tcpip\ stack/FTP.o ${OBJECTDIR}/Microchip/tcpip\ stack/Hashes.o ${OBJECTDIR}/Microchip/tcpip\ stack/Helpers.o ${OBJECTDIR}/Microchip/tcpip\ stack/HTTP2.o ${OBJECTDIR}/Microchip/tcpip\ stack/ICMP.o ${OBJECTDIR}/Microchip/tcpip\ stack/IP.o ${OBJECTDIR}/Microchip/tcpip\ stack/LCDBlocking.o ${OBJECTDIR}/Microchip/tcpip\ stack/MPFS2.o ${OBJECTDIR}/Microchip/tcpip\ stack/NBNS.o ${OBJECTDIR}/Microchip/tcpip\ stack/Random.o ${OBJECTDIR}/Microchip/tcpip\ stack/Reboot.o ${OBJECTDIR}/Microchip/tcpip\ stack/RSA.o ${OBJECTDIR}/Microchip/tcpip\ stack/SMTP.o ${OBJECTDIR}/Microchip/tcpip\ stack/SNMP.o ${OBJECTDIR}/Microchip/tcpip\ stack/SNMPv3.o ${OBJECTDIR}/Microchip/tcpip\ stack/SNMPv3USM.o ${OBJECTDIR}/Microchip/tcpip\ stack/SNTP.o ${OBJECTDIR}/Microchip/tcpip\ stack/SPIEEPROM.o ${OBJECTDIR}/Microchip/tcpip\ stack/SPIFlash.o ${OBJECTDIR}/Microchip/tcpip\ stack/SPIRAM.o ${OBJECTDIR}/Microchip/tcpip\ stack/SSL.o ${OBJECTDIR}/Microchip/tcpip\ stack/StackTsk.o ${OBJECTDIR}/Microchip/tcpip\ stack/TCP.o ${OBJECTDIR}/Microchip/tcpip\ stack/TCPPerformanceTest.o ${OBJECTDIR}/Microchip/tcpip\ stack/Telnet.o ${OBJECTDIR}/Microchip/tcpip\ stack/TFTPc.o ${OBJECTDIR}/Microchip/tcpip\ stack/Tick.o ${OBJECTDIR}/Microchip/tcpip\ stack/UART.o ${OBJECTDIR}/Microchip/tcpip\ stack/UART2TCPBridge.o ${OBJECTDIR}/Microchip/tcpip\ stack/UDP.o ${OBJECTDIR}/Microchip/tcpip\ stack/UDPPerformanceTest.o ${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfHelper.o ${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfLinkLocal.o ${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfMulticastDNS.o ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o ${OBJECTDIR}/Microchip/Transceivers/crc.o ${OBJECTDIR}/Microchip/Transceivers/security.o ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o ${OBJECTDIR}/MyFiles/MyCAN.o ${OBJECTDIR}/MyFiles/MyConsole.o ${OBJECTDIR}/MyFiles/MyCyclone.o ${OBJECTDIR}/MyFiles/MyFlash.o ${OBJECTDIR}/MyFiles/MyHTTP.o ${OBJECTDIR}/MyFiles/MyIO.o ${OBJECTDIR}/MyFiles/MyLED.o ${OBJECTDIR}/MyFiles/MyMDDFS.o ${OBJECTDIR}/MyFiles/MyMIWI.o ${OBJECTDIR}/MyFiles/MyMiniProjet.o ${OBJECTDIR}/MyFiles/MyRTCC.o ${OBJECTDIR}/MyFiles/MySPI.o ${OBJECTDIR}/MyFiles/MyTemperature.o ${OBJECTDIR}/MyFiles/MyWIFI.o ${OBJECTDIR}/MyFiles/MyCamera.o ${OBJECTDIR}/MyFiles/MyApp.o

# Source Files
SOURCEFILES=Microchip/Common/TimeDelay.c Microchip/mdd file system/CF-Bit transaction.c Microchip/mdd file system/CF-PMP.c Microchip/mdd file system/FS Phys Interface Template.c Microchip/mdd file system/FSIO.c Microchip/mdd file system/Internal Flash.c Microchip/mdd file system/SD-SPI.c Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.c Microchip/tcpip stack/WiFi/WFConnectionManager.c Microchip/tcpip stack/WiFi/WFConnectionProfile.c Microchip/tcpip stack/WiFi/WFConsole.c Microchip/tcpip stack/WiFi/WFConsoleIfconfig.c Microchip/tcpip stack/WiFi/WFConsoleIwconfig.c Microchip/tcpip stack/WiFi/WFConsoleIwpriv.c Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.c Microchip/tcpip stack/WiFi/WFConsoleMsgs.c Microchip/tcpip stack/WiFi/WFDataTxRx.c Microchip/tcpip stack/WiFi/WFDebugStrings.c Microchip/tcpip stack/WiFi/WFDriverCom.c Microchip/tcpip stack/WiFi/WFDriverCom_24G.c Microchip/tcpip stack/WiFi/WFDriverRaw.c Microchip/tcpip stack/WiFi/WFDriverRaw_24G.c Microchip/tcpip stack/WiFi/WFEasyConfig.c Microchip/tcpip stack/WiFi/WFEventHandler.c Microchip/tcpip stack/WiFi/WFInit.c Microchip/tcpip stack/WiFi/WFMac.c Microchip/tcpip stack/WiFi/WFMac_24G.c Microchip/tcpip stack/WiFi/WFMgmtMsg.c Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.c Microchip/tcpip stack/WiFi/WFParamMsg.c Microchip/tcpip stack/WiFi/WFParamMsg_24G.c Microchip/tcpip stack/WiFi/WFPowerSave.c Microchip/tcpip stack/WiFi/WFScan.c Microchip/tcpip stack/WiFi/WFTxPower.c Microchip/tcpip stack/WiFi/WF_Eint.c Microchip/tcpip stack/WiFi/WF_pbkdf2.c Microchip/tcpip stack/WiFi/WF_Spi.c Microchip/tcpip stack/Announce.c Microchip/tcpip stack/ARCFOUR.c Microchip/tcpip stack/ARP.c Microchip/tcpip stack/AutoIP.c Microchip/tcpip stack/BerkeleyAPI.c Microchip/tcpip stack/BigInt.c Microchip/tcpip stack/Delay.c Microchip/tcpip stack/DHCP.c Microchip/tcpip stack/DHCPs.c Microchip/tcpip stack/DNS.c Microchip/tcpip stack/DNSs.c Microchip/tcpip stack/DynDNS.c Microchip/tcpip stack/ENC28J60.c Microchip/tcpip stack/ENCX24J600.c Microchip/tcpip stack/ETH97J60.c Microchip/tcpip stack/ETHPIC32ExtPhy.c Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.c Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.c Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.c Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.c Microchip/tcpip stack/ETHPIC32IntMac.c Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.c Microchip/tcpip stack/FileSystem.c Microchip/tcpip stack/FTP.c Microchip/tcpip stack/Hashes.c Microchip/tcpip stack/Helpers.c Microchip/tcpip stack/HTTP2.c Microchip/tcpip stack/ICMP.c Microchip/tcpip stack/IP.c Microchip/tcpip stack/LCDBlocking.c Microchip/tcpip stack/MPFS2.c Microchip/tcpip stack/NBNS.c Microchip/tcpip stack/Random.c Microchip/tcpip stack/Reboot.c Microchip/tcpip stack/RSA.c Microchip/tcpip stack/SMTP.c Microchip/tcpip stack/SNMP.c Microchip/tcpip stack/SNMPv3.c Microchip/tcpip stack/SNMPv3USM.c Microchip/tcpip stack/SNTP.c Microchip/tcpip stack/SPIEEPROM.c Microchip/tcpip stack/SPIFlash.c Microchip/tcpip stack/SPIRAM.c Microchip/tcpip stack/SSL.c Microchip/tcpip stack/StackTsk.c Microchip/tcpip stack/TCP.c Microchip/tcpip stack/TCPPerformanceTest.c Microchip/tcpip stack/Telnet.c Microchip/tcpip stack/TFTPc.c Microchip/tcpip stack/Tick.c Microchip/tcpip stack/UART.c Microchip/tcpip stack/UART2TCPBridge.c Microchip/tcpip stack/UDP.c Microchip/tcpip stack/UDPPerformanceTest.c Microchip/tcpip stack/ZeroconfHelper.c Microchip/tcpip stack/ZeroconfLinkLocal.c Microchip/tcpip stack/ZeroconfMulticastDNS.c Microchip/Transceivers/MRF24J40/MRF24J40.c Microchip/Transceivers/crc.c Microchip/Transceivers/security.c Microchip/WirelessProtocols/P2P/P2P.c Microchip/WirelessProtocols/SymbolTime.c MyFiles/MyCAN.c MyFiles/MyConsole.c MyFiles/MyCyclone.c MyFiles/MyFlash.c MyFiles/MyHTTP.c MyFiles/MyIO.c MyFiles/MyLED.c MyFiles/MyMDDFS.c MyFiles/MyMIWI.c MyFiles/MyMiniProjet.c MyFiles/MyRTCC.c MyFiles/MySPI.c MyFiles/MyTemperature.c MyFiles/MyWIFI.c MyFiles/MyCamera.c MyFiles/MyApp.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512H
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/Microchip/Common/TimeDelay.o: Microchip/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Common" 
	@${RM} ${OBJECTDIR}/Microchip/Common/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Common/TimeDelay.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Common/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Common/TimeDelay.o.d" -o ${OBJECTDIR}/Microchip/Common/TimeDelay.o Microchip/Common/TimeDelay.c     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/CF-Bit\ transaction.o: Microchip/mdd\ file\ system/CF-Bit\ transaction.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o" "Microchip/mdd file system/CF-Bit transaction.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/CF-PMP.o: Microchip/mdd\ file\ system/CF-PMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o" "Microchip/mdd file system/CF-PMP.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/FS\ Phys\ Interface\ Template.o: Microchip/mdd\ file\ system/FS\ Phys\ Interface\ Template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o" "Microchip/mdd file system/FS Phys Interface Template.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/FSIO.o: Microchip/mdd\ file\ system/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FSIO.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FSIO.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/FSIO.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/FSIO.o" "Microchip/mdd file system/FSIO.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/Internal\ Flash.o: Microchip/mdd\ file\ system/Internal\ Flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o" "Microchip/mdd file system/Internal Flash.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/SD-SPI.o: Microchip/mdd\ file\ system/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o" "Microchip/mdd file system/SD-SPI.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionAlgorithm.o: Microchip/tcpip\ stack/WiFi/WFConnectionAlgorithm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o" "Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionManager.o: Microchip/tcpip\ stack/WiFi/WFConnectionManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o" "Microchip/tcpip stack/WiFi/WFConnectionManager.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionProfile.o: Microchip/tcpip\ stack/WiFi/WFConnectionProfile.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o" "Microchip/tcpip stack/WiFi/WFConnectionProfile.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsole.o: Microchip/tcpip\ stack/WiFi/WFConsole.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o" "Microchip/tcpip stack/WiFi/WFConsole.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIfconfig.o: Microchip/tcpip\ stack/WiFi/WFConsoleIfconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o" "Microchip/tcpip stack/WiFi/WFConsoleIfconfig.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIwconfig.o: Microchip/tcpip\ stack/WiFi/WFConsoleIwconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o" "Microchip/tcpip stack/WiFi/WFConsoleIwconfig.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIwpriv.o: Microchip/tcpip\ stack/WiFi/WFConsoleIwpriv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o" "Microchip/tcpip stack/WiFi/WFConsoleIwpriv.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleMsgHandler.o: Microchip/tcpip\ stack/WiFi/WFConsoleMsgHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o" "Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleMsgs.o: Microchip/tcpip\ stack/WiFi/WFConsoleMsgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o" "Microchip/tcpip stack/WiFi/WFConsoleMsgs.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDataTxRx.o: Microchip/tcpip\ stack/WiFi/WFDataTxRx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o" "Microchip/tcpip stack/WiFi/WFDataTxRx.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDebugStrings.o: Microchip/tcpip\ stack/WiFi/WFDebugStrings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o" "Microchip/tcpip stack/WiFi/WFDebugStrings.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverCom.o: Microchip/tcpip\ stack/WiFi/WFDriverCom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o" "Microchip/tcpip stack/WiFi/WFDriverCom.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverCom_24G.o: Microchip/tcpip\ stack/WiFi/WFDriverCom_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o" "Microchip/tcpip stack/WiFi/WFDriverCom_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverRaw.o: Microchip/tcpip\ stack/WiFi/WFDriverRaw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o" "Microchip/tcpip stack/WiFi/WFDriverRaw.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverRaw_24G.o: Microchip/tcpip\ stack/WiFi/WFDriverRaw_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o" "Microchip/tcpip stack/WiFi/WFDriverRaw_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFEasyConfig.o: Microchip/tcpip\ stack/WiFi/WFEasyConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o" "Microchip/tcpip stack/WiFi/WFEasyConfig.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFEventHandler.o: Microchip/tcpip\ stack/WiFi/WFEventHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o" "Microchip/tcpip stack/WiFi/WFEventHandler.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFInit.o: Microchip/tcpip\ stack/WiFi/WFInit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o" "Microchip/tcpip stack/WiFi/WFInit.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMac.o: Microchip/tcpip\ stack/WiFi/WFMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o" "Microchip/tcpip stack/WiFi/WFMac.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMac_24G.o: Microchip/tcpip\ stack/WiFi/WFMac_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o" "Microchip/tcpip stack/WiFi/WFMac_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMgmtMsg.o: Microchip/tcpip\ stack/WiFi/WFMgmtMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o" "Microchip/tcpip stack/WiFi/WFMgmtMsg.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMgmtMsg_24G.o: Microchip/tcpip\ stack/WiFi/WFMgmtMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o" "Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFParamMsg.o: Microchip/tcpip\ stack/WiFi/WFParamMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o" "Microchip/tcpip stack/WiFi/WFParamMsg.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFParamMsg_24G.o: Microchip/tcpip\ stack/WiFi/WFParamMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o" "Microchip/tcpip stack/WiFi/WFParamMsg_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFPowerSave.o: Microchip/tcpip\ stack/WiFi/WFPowerSave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o" "Microchip/tcpip stack/WiFi/WFPowerSave.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFScan.o: Microchip/tcpip\ stack/WiFi/WFScan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o" "Microchip/tcpip stack/WiFi/WFScan.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFTxPower.o: Microchip/tcpip\ stack/WiFi/WFTxPower.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o" "Microchip/tcpip stack/WiFi/WFTxPower.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_Eint.o: Microchip/tcpip\ stack/WiFi/WF_Eint.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o" "Microchip/tcpip stack/WiFi/WF_Eint.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_pbkdf2.o: Microchip/tcpip\ stack/WiFi/WF_pbkdf2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o" "Microchip/tcpip stack/WiFi/WF_pbkdf2.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_Spi.o: Microchip/tcpip\ stack/WiFi/WF_Spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o" "Microchip/tcpip stack/WiFi/WF_Spi.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Announce.o: Microchip/tcpip\ stack/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Announce.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Announce.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Announce.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Announce.o" "Microchip/tcpip stack/Announce.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ARCFOUR.o: Microchip/tcpip\ stack/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o" "Microchip/tcpip stack/ARCFOUR.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ARP.o: Microchip/tcpip\ stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ARP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ARP.o" "Microchip/tcpip stack/ARP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/AutoIP.o: Microchip/tcpip\ stack/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o" "Microchip/tcpip stack/AutoIP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/BerkeleyAPI.o: Microchip/tcpip\ stack/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o" "Microchip/tcpip stack/BerkeleyAPI.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/BigInt.o: Microchip/tcpip\ stack/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o" "Microchip/tcpip stack/BigInt.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Delay.o: Microchip/tcpip\ stack/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Delay.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Delay.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Delay.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Delay.o" "Microchip/tcpip stack/Delay.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DHCP.o: Microchip/tcpip\ stack/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o" "Microchip/tcpip stack/DHCP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DHCPs.o: Microchip/tcpip\ stack/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o" "Microchip/tcpip stack/DHCPs.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DNS.o: Microchip/tcpip\ stack/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DNS.o" "Microchip/tcpip stack/DNS.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DNSs.o: Microchip/tcpip\ stack/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o" "Microchip/tcpip stack/DNSs.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DynDNS.o: Microchip/tcpip\ stack/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o" "Microchip/tcpip stack/DynDNS.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ENC28J60.o: Microchip/tcpip\ stack/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o" "Microchip/tcpip stack/ENC28J60.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ENCX24J600.o: Microchip/tcpip\ stack/ENCX24J600.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o" "Microchip/tcpip stack/ENCX24J600.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETH97J60.o: Microchip/tcpip\ stack/ETH97J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o" "Microchip/tcpip stack/ETH97J60.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhy.o: Microchip/tcpip\ stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o" "Microchip/tcpip stack/ETHPIC32ExtPhy.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83640.o: Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83640.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o" "Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83848.o: Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o" "Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8700.o: Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8700.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o" "Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8720.o: Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8720.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o" "Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32IntMac.o: Microchip/tcpip\ stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o" "Microchip/tcpip stack/ETHPIC32IntMac.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/eth_pic32_ext_phy_rtl8201FL.o: Microchip/tcpip\ stack/eth_pic32_ext_phy_rtl8201FL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o" "Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/FileSystem.o: Microchip/tcpip\ stack/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o" "Microchip/tcpip stack/FileSystem.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/FTP.o: Microchip/tcpip\ stack/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FTP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FTP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/FTP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/FTP.o" "Microchip/tcpip stack/FTP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Hashes.o: Microchip/tcpip\ stack/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o" "Microchip/tcpip stack/Hashes.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Helpers.o: Microchip/tcpip\ stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o" "Microchip/tcpip stack/Helpers.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/HTTP2.o: Microchip/tcpip\ stack/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o" "Microchip/tcpip stack/HTTP2.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ICMP.o: Microchip/tcpip\ stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o" "Microchip/tcpip stack/ICMP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/IP.o: Microchip/tcpip\ stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/IP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/IP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/IP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/IP.o" "Microchip/tcpip stack/IP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/LCDBlocking.o: Microchip/tcpip\ stack/LCDBlocking.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o" "Microchip/tcpip stack/LCDBlocking.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/MPFS2.o: Microchip/tcpip\ stack/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o" "Microchip/tcpip stack/MPFS2.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/NBNS.o: Microchip/tcpip\ stack/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o" "Microchip/tcpip stack/NBNS.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Random.o: Microchip/tcpip\ stack/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Random.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Random.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Random.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Random.o" "Microchip/tcpip stack/Random.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Reboot.o: Microchip/tcpip\ stack/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o" "Microchip/tcpip stack/Reboot.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/RSA.o: Microchip/tcpip\ stack/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/RSA.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/RSA.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/RSA.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/RSA.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/RSA.o" "Microchip/tcpip stack/RSA.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SMTP.o: Microchip/tcpip\ stack/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o" "Microchip/tcpip stack/SMTP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNMP.o: Microchip/tcpip\ stack/SNMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o" "Microchip/tcpip stack/SNMP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNMPv3.o: Microchip/tcpip\ stack/SNMPv3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o" "Microchip/tcpip stack/SNMPv3.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNMPv3USM.o: Microchip/tcpip\ stack/SNMPv3USM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o" "Microchip/tcpip stack/SNMPv3USM.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNTP.o: Microchip/tcpip\ stack/SNTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o" "Microchip/tcpip stack/SNTP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SPIEEPROM.o: Microchip/tcpip\ stack/SPIEEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o" "Microchip/tcpip stack/SPIEEPROM.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SPIFlash.o: Microchip/tcpip\ stack/SPIFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o" "Microchip/tcpip stack/SPIFlash.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SPIRAM.o: Microchip/tcpip\ stack/SPIRAM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o" "Microchip/tcpip stack/SPIRAM.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SSL.o: Microchip/tcpip\ stack/SSL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SSL.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SSL.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SSL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SSL.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SSL.o" "Microchip/tcpip stack/SSL.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/StackTsk.o: Microchip/tcpip\ stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o" "Microchip/tcpip stack/StackTsk.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/TCP.o: Microchip/tcpip\ stack/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/TCP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/TCP.o" "Microchip/tcpip stack/TCP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/TCPPerformanceTest.o: Microchip/tcpip\ stack/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o" "Microchip/tcpip stack/TCPPerformanceTest.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Telnet.o: Microchip/tcpip\ stack/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o" "Microchip/tcpip stack/Telnet.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/TFTPc.o: Microchip/tcpip\ stack/TFTPc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o" "Microchip/tcpip stack/TFTPc.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Tick.o: Microchip/tcpip\ stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Tick.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Tick.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Tick.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Tick.o" "Microchip/tcpip stack/Tick.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UART.o: Microchip/tcpip\ stack/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UART.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UART.o" "Microchip/tcpip stack/UART.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UART2TCPBridge.o: Microchip/tcpip\ stack/UART2TCPBridge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o" "Microchip/tcpip stack/UART2TCPBridge.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UDP.o: Microchip/tcpip\ stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UDP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UDP.o" "Microchip/tcpip stack/UDP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UDPPerformanceTest.o: Microchip/tcpip\ stack/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o" "Microchip/tcpip stack/UDPPerformanceTest.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfHelper.o: Microchip/tcpip\ stack/ZeroconfHelper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o" "Microchip/tcpip stack/ZeroconfHelper.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfLinkLocal.o: Microchip/tcpip\ stack/ZeroconfLinkLocal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o" "Microchip/tcpip stack/ZeroconfLinkLocal.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfMulticastDNS.o: Microchip/tcpip\ stack/ZeroconfMulticastDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o" "Microchip/tcpip stack/ZeroconfMulticastDNS.c"     
	
${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o: Microchip/Transceivers/MRF24J40/MRF24J40.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Transceivers/MRF24J40" 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d" -o ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o Microchip/Transceivers/MRF24J40/MRF24J40.c     
	
${OBJECTDIR}/Microchip/Transceivers/crc.o: Microchip/Transceivers/crc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Transceivers" 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/crc.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/crc.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Transceivers/crc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Transceivers/crc.o.d" -o ${OBJECTDIR}/Microchip/Transceivers/crc.o Microchip/Transceivers/crc.c     
	
${OBJECTDIR}/Microchip/Transceivers/security.o: Microchip/Transceivers/security.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Transceivers" 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/security.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/security.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Transceivers/security.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Transceivers/security.o.d" -o ${OBJECTDIR}/Microchip/Transceivers/security.o Microchip/Transceivers/security.c     
	
${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o: Microchip/WirelessProtocols/P2P/P2P.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/WirelessProtocols/P2P" 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d" -o ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o Microchip/WirelessProtocols/P2P/P2P.c     
	
${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o: Microchip/WirelessProtocols/SymbolTime.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/WirelessProtocols" 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d" -o ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o Microchip/WirelessProtocols/SymbolTime.c     
	
${OBJECTDIR}/MyFiles/MyCAN.o: MyFiles/MyCAN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyCAN.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyCAN.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyCAN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyCAN.o.d" -o ${OBJECTDIR}/MyFiles/MyCAN.o MyFiles/MyCAN.c     
	
${OBJECTDIR}/MyFiles/MyConsole.o: MyFiles/MyConsole.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyConsole.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyConsole.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyConsole.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyConsole.o.d" -o ${OBJECTDIR}/MyFiles/MyConsole.o MyFiles/MyConsole.c     
	
${OBJECTDIR}/MyFiles/MyCyclone.o: MyFiles/MyCyclone.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyCyclone.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyCyclone.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyCyclone.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyCyclone.o.d" -o ${OBJECTDIR}/MyFiles/MyCyclone.o MyFiles/MyCyclone.c     
	
${OBJECTDIR}/MyFiles/MyFlash.o: MyFiles/MyFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyFlash.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyFlash.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyFlash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyFlash.o.d" -o ${OBJECTDIR}/MyFiles/MyFlash.o MyFiles/MyFlash.c     
	
${OBJECTDIR}/MyFiles/MyHTTP.o: MyFiles/MyHTTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyHTTP.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyHTTP.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyHTTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyHTTP.o.d" -o ${OBJECTDIR}/MyFiles/MyHTTP.o MyFiles/MyHTTP.c     
	
${OBJECTDIR}/MyFiles/MyIO.o: MyFiles/MyIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyIO.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyIO.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyIO.o.d" -o ${OBJECTDIR}/MyFiles/MyIO.o MyFiles/MyIO.c     
	
${OBJECTDIR}/MyFiles/MyLED.o: MyFiles/MyLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyLED.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyLED.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyLED.o.d" -o ${OBJECTDIR}/MyFiles/MyLED.o MyFiles/MyLED.c     
	
${OBJECTDIR}/MyFiles/MyMDDFS.o: MyFiles/MyMDDFS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyMDDFS.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyMDDFS.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyMDDFS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyMDDFS.o.d" -o ${OBJECTDIR}/MyFiles/MyMDDFS.o MyFiles/MyMDDFS.c     
	
${OBJECTDIR}/MyFiles/MyMIWI.o: MyFiles/MyMIWI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyMIWI.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyMIWI.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyMIWI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyMIWI.o.d" -o ${OBJECTDIR}/MyFiles/MyMIWI.o MyFiles/MyMIWI.c     
	
${OBJECTDIR}/MyFiles/MyMiniProjet.o: MyFiles/MyMiniProjet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyMiniProjet.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyMiniProjet.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyMiniProjet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyMiniProjet.o.d" -o ${OBJECTDIR}/MyFiles/MyMiniProjet.o MyFiles/MyMiniProjet.c     
	
${OBJECTDIR}/MyFiles/MyRTCC.o: MyFiles/MyRTCC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyRTCC.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyRTCC.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyRTCC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyRTCC.o.d" -o ${OBJECTDIR}/MyFiles/MyRTCC.o MyFiles/MyRTCC.c     
	
${OBJECTDIR}/MyFiles/MySPI.o: MyFiles/MySPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MySPI.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MySPI.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MySPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MySPI.o.d" -o ${OBJECTDIR}/MyFiles/MySPI.o MyFiles/MySPI.c     
	
${OBJECTDIR}/MyFiles/MyTemperature.o: MyFiles/MyTemperature.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyTemperature.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyTemperature.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyTemperature.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyTemperature.o.d" -o ${OBJECTDIR}/MyFiles/MyTemperature.o MyFiles/MyTemperature.c     
	
${OBJECTDIR}/MyFiles/MyWIFI.o: MyFiles/MyWIFI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyWIFI.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyWIFI.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyWIFI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyWIFI.o.d" -o ${OBJECTDIR}/MyFiles/MyWIFI.o MyFiles/MyWIFI.c     
	
${OBJECTDIR}/MyFiles/MyCamera.o: MyFiles/MyCamera.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyCamera.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyCamera.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyCamera.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyCamera.o.d" -o ${OBJECTDIR}/MyFiles/MyCamera.o MyFiles/MyCamera.c     
	
${OBJECTDIR}/MyFiles/MyApp.o: MyFiles/MyApp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyApp.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyApp.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyApp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyApp.o.d" -o ${OBJECTDIR}/MyFiles/MyApp.o MyFiles/MyApp.c     
	
else
${OBJECTDIR}/Microchip/Common/TimeDelay.o: Microchip/Common/TimeDelay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Common" 
	@${RM} ${OBJECTDIR}/Microchip/Common/TimeDelay.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Common/TimeDelay.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Common/TimeDelay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Common/TimeDelay.o.d" -o ${OBJECTDIR}/Microchip/Common/TimeDelay.o Microchip/Common/TimeDelay.c     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/CF-Bit\ transaction.o: Microchip/mdd\ file\ system/CF-Bit\ transaction.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/CF-Bit transaction.o" "Microchip/mdd file system/CF-Bit transaction.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/CF-PMP.o: Microchip/mdd\ file\ system/CF-PMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/CF-PMP.o" "Microchip/mdd file system/CF-PMP.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/FS\ Phys\ Interface\ Template.o: Microchip/mdd\ file\ system/FS\ Phys\ Interface\ Template.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/FS Phys Interface Template.o" "Microchip/mdd file system/FS Phys Interface Template.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/FSIO.o: Microchip/mdd\ file\ system/FSIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FSIO.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/FSIO.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/FSIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/FSIO.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/FSIO.o" "Microchip/mdd file system/FSIO.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/Internal\ Flash.o: Microchip/mdd\ file\ system/Internal\ Flash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/Internal Flash.o" "Microchip/mdd file system/Internal Flash.c"     
	
${OBJECTDIR}/Microchip/mdd\ file\ system/SD-SPI.o: Microchip/mdd\ file\ system/SD-SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/mdd file system" 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o".d 
	@${RM} "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o.d" -o "${OBJECTDIR}/Microchip/mdd file system/SD-SPI.o" "Microchip/mdd file system/SD-SPI.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionAlgorithm.o: Microchip/tcpip\ stack/WiFi/WFConnectionAlgorithm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.o" "Microchip/tcpip stack/WiFi/WFConnectionAlgorithm.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionManager.o: Microchip/tcpip\ stack/WiFi/WFConnectionManager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionManager.o" "Microchip/tcpip stack/WiFi/WFConnectionManager.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConnectionProfile.o: Microchip/tcpip\ stack/WiFi/WFConnectionProfile.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConnectionProfile.o" "Microchip/tcpip stack/WiFi/WFConnectionProfile.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsole.o: Microchip/tcpip\ stack/WiFi/WFConsole.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsole.o" "Microchip/tcpip stack/WiFi/WFConsole.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIfconfig.o: Microchip/tcpip\ stack/WiFi/WFConsoleIfconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIfconfig.o" "Microchip/tcpip stack/WiFi/WFConsoleIfconfig.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIwconfig.o: Microchip/tcpip\ stack/WiFi/WFConsoleIwconfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwconfig.o" "Microchip/tcpip stack/WiFi/WFConsoleIwconfig.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleIwpriv.o: Microchip/tcpip\ stack/WiFi/WFConsoleIwpriv.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleIwpriv.o" "Microchip/tcpip stack/WiFi/WFConsoleIwpriv.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleMsgHandler.o: Microchip/tcpip\ stack/WiFi/WFConsoleMsgHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.o" "Microchip/tcpip stack/WiFi/WFConsoleMsgHandler.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFConsoleMsgs.o: Microchip/tcpip\ stack/WiFi/WFConsoleMsgs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFConsoleMsgs.o" "Microchip/tcpip stack/WiFi/WFConsoleMsgs.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDataTxRx.o: Microchip/tcpip\ stack/WiFi/WFDataTxRx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDataTxRx.o" "Microchip/tcpip stack/WiFi/WFDataTxRx.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDebugStrings.o: Microchip/tcpip\ stack/WiFi/WFDebugStrings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDebugStrings.o" "Microchip/tcpip stack/WiFi/WFDebugStrings.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverCom.o: Microchip/tcpip\ stack/WiFi/WFDriverCom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom.o" "Microchip/tcpip stack/WiFi/WFDriverCom.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverCom_24G.o: Microchip/tcpip\ stack/WiFi/WFDriverCom_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverCom_24G.o" "Microchip/tcpip stack/WiFi/WFDriverCom_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverRaw.o: Microchip/tcpip\ stack/WiFi/WFDriverRaw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw.o" "Microchip/tcpip stack/WiFi/WFDriverRaw.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFDriverRaw_24G.o: Microchip/tcpip\ stack/WiFi/WFDriverRaw_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFDriverRaw_24G.o" "Microchip/tcpip stack/WiFi/WFDriverRaw_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFEasyConfig.o: Microchip/tcpip\ stack/WiFi/WFEasyConfig.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEasyConfig.o" "Microchip/tcpip stack/WiFi/WFEasyConfig.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFEventHandler.o: Microchip/tcpip\ stack/WiFi/WFEventHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFEventHandler.o" "Microchip/tcpip stack/WiFi/WFEventHandler.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFInit.o: Microchip/tcpip\ stack/WiFi/WFInit.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFInit.o" "Microchip/tcpip stack/WiFi/WFInit.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMac.o: Microchip/tcpip\ stack/WiFi/WFMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac.o" "Microchip/tcpip stack/WiFi/WFMac.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMac_24G.o: Microchip/tcpip\ stack/WiFi/WFMac_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMac_24G.o" "Microchip/tcpip stack/WiFi/WFMac_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMgmtMsg.o: Microchip/tcpip\ stack/WiFi/WFMgmtMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg.o" "Microchip/tcpip stack/WiFi/WFMgmtMsg.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFMgmtMsg_24G.o: Microchip/tcpip\ stack/WiFi/WFMgmtMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.o" "Microchip/tcpip stack/WiFi/WFMgmtMsg_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFParamMsg.o: Microchip/tcpip\ stack/WiFi/WFParamMsg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg.o" "Microchip/tcpip stack/WiFi/WFParamMsg.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFParamMsg_24G.o: Microchip/tcpip\ stack/WiFi/WFParamMsg_24G.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFParamMsg_24G.o" "Microchip/tcpip stack/WiFi/WFParamMsg_24G.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFPowerSave.o: Microchip/tcpip\ stack/WiFi/WFPowerSave.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFPowerSave.o" "Microchip/tcpip stack/WiFi/WFPowerSave.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFScan.o: Microchip/tcpip\ stack/WiFi/WFScan.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFScan.o" "Microchip/tcpip stack/WiFi/WFScan.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WFTxPower.o: Microchip/tcpip\ stack/WiFi/WFTxPower.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WFTxPower.o" "Microchip/tcpip stack/WiFi/WFTxPower.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_Eint.o: Microchip/tcpip\ stack/WiFi/WF_Eint.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Eint.o" "Microchip/tcpip stack/WiFi/WF_Eint.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_pbkdf2.o: Microchip/tcpip\ stack/WiFi/WF_pbkdf2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_pbkdf2.o" "Microchip/tcpip stack/WiFi/WF_pbkdf2.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/WiFi/WF_Spi.o: Microchip/tcpip\ stack/WiFi/WF_Spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack/WiFi" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/WiFi/WF_Spi.o" "Microchip/tcpip stack/WiFi/WF_Spi.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Announce.o: Microchip/tcpip\ stack/Announce.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Announce.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Announce.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Announce.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Announce.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Announce.o" "Microchip/tcpip stack/Announce.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ARCFOUR.o: Microchip/tcpip\ stack/ARCFOUR.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ARCFOUR.o" "Microchip/tcpip stack/ARCFOUR.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ARP.o: Microchip/tcpip\ stack/ARP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ARP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ARP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ARP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ARP.o" "Microchip/tcpip stack/ARP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/AutoIP.o: Microchip/tcpip\ stack/AutoIP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/AutoIP.o" "Microchip/tcpip stack/AutoIP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/BerkeleyAPI.o: Microchip/tcpip\ stack/BerkeleyAPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/BerkeleyAPI.o" "Microchip/tcpip stack/BerkeleyAPI.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/BigInt.o: Microchip/tcpip\ stack/BigInt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/BigInt.o" "Microchip/tcpip stack/BigInt.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Delay.o: Microchip/tcpip\ stack/Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Delay.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Delay.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Delay.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Delay.o" "Microchip/tcpip stack/Delay.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DHCP.o: Microchip/tcpip\ stack/DHCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DHCP.o" "Microchip/tcpip stack/DHCP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DHCPs.o: Microchip/tcpip\ stack/DHCPs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DHCPs.o" "Microchip/tcpip stack/DHCPs.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DNS.o: Microchip/tcpip\ stack/DNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DNS.o" "Microchip/tcpip stack/DNS.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DNSs.o: Microchip/tcpip\ stack/DNSs.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DNSs.o" "Microchip/tcpip stack/DNSs.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/DynDNS.o: Microchip/tcpip\ stack/DynDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/DynDNS.o" "Microchip/tcpip stack/DynDNS.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ENC28J60.o: Microchip/tcpip\ stack/ENC28J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ENC28J60.o" "Microchip/tcpip stack/ENC28J60.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ENCX24J600.o: Microchip/tcpip\ stack/ENCX24J600.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ENCX24J600.o" "Microchip/tcpip stack/ENCX24J600.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETH97J60.o: Microchip/tcpip\ stack/ETH97J60.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETH97J60.o" "Microchip/tcpip stack/ETH97J60.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhy.o: Microchip/tcpip\ stack/ETHPIC32ExtPhy.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhy.o" "Microchip/tcpip stack/ETHPIC32ExtPhy.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83640.o: Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83640.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.o" "Microchip/tcpip stack/ETHPIC32ExtPhyDP83640.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83848.o: Microchip/tcpip\ stack/ETHPIC32ExtPhyDP83848.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.o" "Microchip/tcpip stack/ETHPIC32ExtPhyDP83848.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8700.o: Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8700.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.o" "Microchip/tcpip stack/ETHPIC32ExtPhySMSC8700.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8720.o: Microchip/tcpip\ stack/ETHPIC32ExtPhySMSC8720.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.o" "Microchip/tcpip stack/ETHPIC32ExtPhySMSC8720.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ETHPIC32IntMac.o: Microchip/tcpip\ stack/ETHPIC32IntMac.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ETHPIC32IntMac.o" "Microchip/tcpip stack/ETHPIC32IntMac.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/eth_pic32_ext_phy_rtl8201FL.o: Microchip/tcpip\ stack/eth_pic32_ext_phy_rtl8201FL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.o" "Microchip/tcpip stack/eth_pic32_ext_phy_rtl8201FL.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/FileSystem.o: Microchip/tcpip\ stack/FileSystem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/FileSystem.o" "Microchip/tcpip stack/FileSystem.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/FTP.o: Microchip/tcpip\ stack/FTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FTP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/FTP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/FTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/FTP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/FTP.o" "Microchip/tcpip stack/FTP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Hashes.o: Microchip/tcpip\ stack/Hashes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Hashes.o" "Microchip/tcpip stack/Hashes.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Helpers.o: Microchip/tcpip\ stack/Helpers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Helpers.o" "Microchip/tcpip stack/Helpers.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/HTTP2.o: Microchip/tcpip\ stack/HTTP2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/HTTP2.o" "Microchip/tcpip stack/HTTP2.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ICMP.o: Microchip/tcpip\ stack/ICMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ICMP.o" "Microchip/tcpip stack/ICMP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/IP.o: Microchip/tcpip\ stack/IP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/IP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/IP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/IP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/IP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/IP.o" "Microchip/tcpip stack/IP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/LCDBlocking.o: Microchip/tcpip\ stack/LCDBlocking.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/LCDBlocking.o" "Microchip/tcpip stack/LCDBlocking.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/MPFS2.o: Microchip/tcpip\ stack/MPFS2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/MPFS2.o" "Microchip/tcpip stack/MPFS2.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/NBNS.o: Microchip/tcpip\ stack/NBNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/NBNS.o" "Microchip/tcpip stack/NBNS.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Random.o: Microchip/tcpip\ stack/Random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Random.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Random.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Random.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Random.o" "Microchip/tcpip stack/Random.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Reboot.o: Microchip/tcpip\ stack/Reboot.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Reboot.o" "Microchip/tcpip stack/Reboot.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/RSA.o: Microchip/tcpip\ stack/RSA.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/RSA.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/RSA.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/RSA.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/RSA.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/RSA.o" "Microchip/tcpip stack/RSA.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SMTP.o: Microchip/tcpip\ stack/SMTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SMTP.o" "Microchip/tcpip stack/SMTP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNMP.o: Microchip/tcpip\ stack/SNMP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNMP.o" "Microchip/tcpip stack/SNMP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNMPv3.o: Microchip/tcpip\ stack/SNMPv3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3.o" "Microchip/tcpip stack/SNMPv3.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNMPv3USM.o: Microchip/tcpip\ stack/SNMPv3USM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNMPv3USM.o" "Microchip/tcpip stack/SNMPv3USM.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SNTP.o: Microchip/tcpip\ stack/SNTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SNTP.o" "Microchip/tcpip stack/SNTP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SPIEEPROM.o: Microchip/tcpip\ stack/SPIEEPROM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SPIEEPROM.o" "Microchip/tcpip stack/SPIEEPROM.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SPIFlash.o: Microchip/tcpip\ stack/SPIFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SPIFlash.o" "Microchip/tcpip stack/SPIFlash.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SPIRAM.o: Microchip/tcpip\ stack/SPIRAM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SPIRAM.o" "Microchip/tcpip stack/SPIRAM.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/SSL.o: Microchip/tcpip\ stack/SSL.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SSL.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/SSL.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/SSL.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/SSL.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/SSL.o" "Microchip/tcpip stack/SSL.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/StackTsk.o: Microchip/tcpip\ stack/StackTsk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/StackTsk.o" "Microchip/tcpip stack/StackTsk.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/TCP.o: Microchip/tcpip\ stack/TCP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/TCP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/TCP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/TCP.o" "Microchip/tcpip stack/TCP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/TCPPerformanceTest.o: Microchip/tcpip\ stack/TCPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/TCPPerformanceTest.o" "Microchip/tcpip stack/TCPPerformanceTest.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Telnet.o: Microchip/tcpip\ stack/Telnet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Telnet.o" "Microchip/tcpip stack/Telnet.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/TFTPc.o: Microchip/tcpip\ stack/TFTPc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/TFTPc.o" "Microchip/tcpip stack/TFTPc.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/Tick.o: Microchip/tcpip\ stack/Tick.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Tick.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/Tick.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/Tick.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/Tick.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/Tick.o" "Microchip/tcpip stack/Tick.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UART.o: Microchip/tcpip\ stack/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UART.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UART.o" "Microchip/tcpip stack/UART.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UART2TCPBridge.o: Microchip/tcpip\ stack/UART2TCPBridge.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UART2TCPBridge.o" "Microchip/tcpip stack/UART2TCPBridge.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UDP.o: Microchip/tcpip\ stack/UDP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDP.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDP.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UDP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UDP.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UDP.o" "Microchip/tcpip stack/UDP.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/UDPPerformanceTest.o: Microchip/tcpip\ stack/UDPPerformanceTest.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/UDPPerformanceTest.o" "Microchip/tcpip stack/UDPPerformanceTest.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfHelper.o: Microchip/tcpip\ stack/ZeroconfHelper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfHelper.o" "Microchip/tcpip stack/ZeroconfHelper.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfLinkLocal.o: Microchip/tcpip\ stack/ZeroconfLinkLocal.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfLinkLocal.o" "Microchip/tcpip stack/ZeroconfLinkLocal.c"     
	
${OBJECTDIR}/Microchip/tcpip\ stack/ZeroconfMulticastDNS.o: Microchip/tcpip\ stack/ZeroconfMulticastDNS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/tcpip stack" 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o".d 
	@${RM} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o" 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o.d" -o "${OBJECTDIR}/Microchip/tcpip stack/ZeroconfMulticastDNS.o" "Microchip/tcpip stack/ZeroconfMulticastDNS.c"     
	
${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o: Microchip/Transceivers/MRF24J40/MRF24J40.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Transceivers/MRF24J40" 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o.d" -o ${OBJECTDIR}/Microchip/Transceivers/MRF24J40/MRF24J40.o Microchip/Transceivers/MRF24J40/MRF24J40.c     
	
${OBJECTDIR}/Microchip/Transceivers/crc.o: Microchip/Transceivers/crc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Transceivers" 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/crc.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/crc.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Transceivers/crc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Transceivers/crc.o.d" -o ${OBJECTDIR}/Microchip/Transceivers/crc.o Microchip/Transceivers/crc.c     
	
${OBJECTDIR}/Microchip/Transceivers/security.o: Microchip/Transceivers/security.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/Transceivers" 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/security.o.d 
	@${RM} ${OBJECTDIR}/Microchip/Transceivers/security.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/Transceivers/security.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/Transceivers/security.o.d" -o ${OBJECTDIR}/Microchip/Transceivers/security.o Microchip/Transceivers/security.c     
	
${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o: Microchip/WirelessProtocols/P2P/P2P.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/WirelessProtocols/P2P" 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o.d" -o ${OBJECTDIR}/Microchip/WirelessProtocols/P2P/P2P.o Microchip/WirelessProtocols/P2P/P2P.c     
	
${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o: Microchip/WirelessProtocols/SymbolTime.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/Microchip/WirelessProtocols" 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d 
	@${RM} ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o 
	@${FIXDEPS} "${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o.d" -o ${OBJECTDIR}/Microchip/WirelessProtocols/SymbolTime.o Microchip/WirelessProtocols/SymbolTime.c     
	
${OBJECTDIR}/MyFiles/MyCAN.o: MyFiles/MyCAN.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyCAN.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyCAN.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyCAN.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyCAN.o.d" -o ${OBJECTDIR}/MyFiles/MyCAN.o MyFiles/MyCAN.c     
	
${OBJECTDIR}/MyFiles/MyConsole.o: MyFiles/MyConsole.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyConsole.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyConsole.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyConsole.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyConsole.o.d" -o ${OBJECTDIR}/MyFiles/MyConsole.o MyFiles/MyConsole.c     
	
${OBJECTDIR}/MyFiles/MyCyclone.o: MyFiles/MyCyclone.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyCyclone.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyCyclone.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyCyclone.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyCyclone.o.d" -o ${OBJECTDIR}/MyFiles/MyCyclone.o MyFiles/MyCyclone.c     
	
${OBJECTDIR}/MyFiles/MyFlash.o: MyFiles/MyFlash.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyFlash.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyFlash.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyFlash.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyFlash.o.d" -o ${OBJECTDIR}/MyFiles/MyFlash.o MyFiles/MyFlash.c     
	
${OBJECTDIR}/MyFiles/MyHTTP.o: MyFiles/MyHTTP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyHTTP.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyHTTP.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyHTTP.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyHTTP.o.d" -o ${OBJECTDIR}/MyFiles/MyHTTP.o MyFiles/MyHTTP.c     
	
${OBJECTDIR}/MyFiles/MyIO.o: MyFiles/MyIO.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyIO.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyIO.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyIO.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyIO.o.d" -o ${OBJECTDIR}/MyFiles/MyIO.o MyFiles/MyIO.c     
	
${OBJECTDIR}/MyFiles/MyLED.o: MyFiles/MyLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyLED.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyLED.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyLED.o.d" -o ${OBJECTDIR}/MyFiles/MyLED.o MyFiles/MyLED.c     
	
${OBJECTDIR}/MyFiles/MyMDDFS.o: MyFiles/MyMDDFS.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyMDDFS.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyMDDFS.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyMDDFS.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyMDDFS.o.d" -o ${OBJECTDIR}/MyFiles/MyMDDFS.o MyFiles/MyMDDFS.c     
	
${OBJECTDIR}/MyFiles/MyMIWI.o: MyFiles/MyMIWI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyMIWI.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyMIWI.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyMIWI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyMIWI.o.d" -o ${OBJECTDIR}/MyFiles/MyMIWI.o MyFiles/MyMIWI.c     
	
${OBJECTDIR}/MyFiles/MyMiniProjet.o: MyFiles/MyMiniProjet.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyMiniProjet.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyMiniProjet.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyMiniProjet.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyMiniProjet.o.d" -o ${OBJECTDIR}/MyFiles/MyMiniProjet.o MyFiles/MyMiniProjet.c     
	
${OBJECTDIR}/MyFiles/MyRTCC.o: MyFiles/MyRTCC.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyRTCC.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyRTCC.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyRTCC.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyRTCC.o.d" -o ${OBJECTDIR}/MyFiles/MyRTCC.o MyFiles/MyRTCC.c     
	
${OBJECTDIR}/MyFiles/MySPI.o: MyFiles/MySPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MySPI.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MySPI.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MySPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MySPI.o.d" -o ${OBJECTDIR}/MyFiles/MySPI.o MyFiles/MySPI.c     
	
${OBJECTDIR}/MyFiles/MyTemperature.o: MyFiles/MyTemperature.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyTemperature.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyTemperature.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyTemperature.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyTemperature.o.d" -o ${OBJECTDIR}/MyFiles/MyTemperature.o MyFiles/MyTemperature.c     
	
${OBJECTDIR}/MyFiles/MyWIFI.o: MyFiles/MyWIFI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyWIFI.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyWIFI.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyWIFI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyWIFI.o.d" -o ${OBJECTDIR}/MyFiles/MyWIFI.o MyFiles/MyWIFI.c     
	
${OBJECTDIR}/MyFiles/MyCamera.o: MyFiles/MyCamera.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyCamera.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyCamera.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyCamera.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyCamera.o.d" -o ${OBJECTDIR}/MyFiles/MyCamera.o MyFiles/MyCamera.c     
	
${OBJECTDIR}/MyFiles/MyApp.o: MyFiles/MyApp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/MyFiles" 
	@${RM} ${OBJECTDIR}/MyFiles/MyApp.o.d 
	@${RM} ${OBJECTDIR}/MyFiles/MyApp.o 
	@${FIXDEPS} "${OBJECTDIR}/MyFiles/MyApp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -I"MyIncludes" -I"MyConfig" -I"MyConfig/MyConfig_MIWI" -I"MyConfig/MyConfig_WIFI" -I"MyConfig/MyConfig_MDDFS" -I"Microchip/Include" -I"MyWeb" -MMD -MF "${OBJECTDIR}/MyFiles/MyApp.o.d" -o ${OBJECTDIR}/MyFiles/MyApp.o MyFiles/MyApp.c     
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}            -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,--defsym=_min_heap_size=55000
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}            -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=55000
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/pic32.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
