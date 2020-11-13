import SAMBA 3.2
import SAMBA.Connection.Serial 3.2
import SAMBA.Device.SAMA5D2 3.2

SerialConnection {
	port: "ttyACM0"
	baudRate: 115200

	device: SAMA5D2Xplained {
		config {
			qspiflash {
				instance: 1
				ioset: 2
				freq: 66
			}
		}
	}

	onConnectionOpened: {
		// initialize QSPI applet
		initializeApplet("qspiflash")

		// erase all memory
		applet.erase(0, applet.memorySize)

		// write files
		applet.write(0x0000, "at91bootstrap.bin", true)
		applet.write(0x8000, "u-boot-env.bin")
		applet.write(0x10000, "u-boot.bin")
		applet.write(0xA0000, "eink_extcon_demo.dtb")
		applet.write(0xAC000, "zImage.bin")

		// initialize boot config applet
		initializeApplet("bootconfig")

		// Use BUREG0 as boot configuration word
		applet.writeBootCfg(BootCfg.BSCR, BSCR.fromText("VALID,BUREG0"))

		// Enable external boot only on QSPI1 IOSET2
		applet.writeBootCfg(BootCfg.BUREG0,
			BCW.fromText("EXT_MEM_BOOT,UART1_IOSET1,JTAG_IOSET3," + 
							"SDMMC0_DISABLED,SDMMC1_DISABLED,NFC_DISABLED," +
							"SPI0_DISABLED,SPI1_DISABLED," +
							"QSPI1_IOSET2,QSPI1_DISABLED"))

	}
}
