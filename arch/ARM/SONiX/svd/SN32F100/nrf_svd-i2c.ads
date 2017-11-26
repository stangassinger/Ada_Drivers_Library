--

--  This spec has been automatically generated from SN32F100.svd

pragma Restrictions (No_Elaboration_Code);
pragma Ada_2012;
pragma Style_Checks (Off);

with HAL;
with System;

package NRF_SVD.I2C is
   pragma Preelaborate;

   ---------------
   -- Registers --
   ---------------

   --  NACK assert flag
   type CTRL_NACK_Field is
     (
      No ACTION,
      --  Assert NACK during the acknowledge clock pulse on SCLn
      Assert)
     with Size => 1;
   for CTRL_NACK_Field use
     (No ACTION => 0,
      Assert => 1);

   --  ACK assert flag
   type CTRL_ACK_Field is
     (
      --  Master: No action/Slave: Assert NACK after receiving
      No,
      --  Assert ACK during the acknowledge clock pulse on SCLn
      Assert)
     with Size => 1;
   for CTRL_ACK_Field use
     (No => 0,
      Assert => 1);

   --  STOP assert flag
   type CTRL_STO_Field is
     (
      --  STOP condition idle
      Idle,
      --  Transmit a STOP condition in master mode, or recover from an error
      --  condition in slave mode
      Assert)
     with Size => 1;
   for CTRL_STO_Field use
     (Idle => 0,
      Assert => 1);

   --  START assert flag
   type CTRL_STA_Field is
     (
      --  No START condition or Repeated START condition will be generated
      No ACTION,
      --  Enter master mode and transmit a START or Repeated START condition
      Assert)
     with Size => 1;
   for CTRL_STA_Field use
     (No ACTION => 0,
      Assert => 1);

   --  I2Cn interface enable
   type CTRL_I2CEN_Field is
     (
      --  Disable I2Cn interface
      Disable,
      --  Enable I2Cn interface
      Enable)
     with Size => 1;
   for CTRL_I2CEN_Field use
     (Disable => 0,
      Enable => 1);

   --  Offset:0x00 I2Cn Control Register
   type CTRL_Register is record
      --  unspecified
      Reserved_0_0  : HAL.Bit := 16#0#;
      --  NACK assert flag
      NACK          : CTRL_NACK_Field := NRF_SVD.I2C.No ACTION;
      --  ACK assert flag
      ACK           : CTRL_ACK_Field := NRF_SVD.I2C.No;
      --  unspecified
      Reserved_3_3  : HAL.Bit := 16#0#;
      --  STOP assert flag
      STO           : CTRL_STO_Field := NRF_SVD.I2C.Idle;
      --  START assert flag
      STA           : CTRL_STA_Field := NRF_SVD.I2C.No ACTION;
      --  unspecified
      Reserved_6_7  : HAL.UInt2 := 16#0#;
      --  I2Cn interface enable
      I2CEN         : CTRL_I2CEN_Field := NRF_SVD.I2C.Disable;
      --  unspecified
      Reserved_9_31 : HAL.UInt23 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for CTRL_Register use record
      Reserved_0_0  at 0 range 0 .. 0;
      NACK          at 0 range 1 .. 1;
      ACK           at 0 range 2 .. 2;
      Reserved_3_3  at 0 range 3 .. 3;
      STO           at 0 range 4 .. 4;
      STA           at 0 range 5 .. 5;
      Reserved_6_7  at 0 range 6 .. 7;
      I2CEN         at 0 range 8 .. 8;
      Reserved_9_31 at 0 range 9 .. 31;
   end record;

   --  RX done status
   type STAT_RX_DN_Field is
     (
      --  No RX with ACK/NACK transfer
      Not DONE,
      --  8-bit RX with ACK/NACK transfer
      Done)
     with Size => 1;
   for STAT_RX_DN_Field use
     (Not DONE => 0,
      Done => 1);

   --  ACK done status
   type STAT_ACK_STAT_Field is
     (
      --  No ACK received
      No,
      --  Receive an ACK
      Done)
     with Size => 1;
   for STAT_ACK_STAT_Field use
     (No => 0,
      Done => 1);

   --  NACK done status
   type STAT_NACK_STAT_Field is
     (
      --  No NACK received
      No,
      --  Receive a NACK
      Done)
     with Size => 1;
   for STAT_NACK_STAT_Field use
     (No => 0,
      Done => 1);

   --  STOP done status
   type STAT_STOP_DN_Field is
     (
      --  No STOP condition
      No,
      --  Transmit or receive a STOP condition
      Done)
     with Size => 1;
   for STAT_STOP_DN_Field use
     (No => 0,
      Done => 1);

   --  START done status
   type STAT_START_DN_Field is
     (
      --  No START condition
      No,
      --  Transmit or receive a START condition
      Assert)
     with Size => 1;
   for STAT_START_DN_Field use
     (No => 0,
      Assert => 1);

   --  I2C master/slave status
   type STAT_I2C_MST_Field is
     (
      Slave MODE,
      Master MODE)
     with Size => 1;
   for STAT_I2C_MST_Field use
     (Slave MODE => 0,
      Master MODE => 1);

   --  Slave RX address hit flag
   type STAT_SLV_RX_HIT_Field is
     (
      No MATCHED SLAVE ADDRESS,
      --  Slave address hit, and is called for RX
      Hit)
     with Size => 1;
   for STAT_SLV_RX_HIT_Field use
     (No MATCHED SLAVE ADDRESS => 0,
      Hit => 1);

   --  Slave TX address hit flag
   type STAT_SLV_TX_HIT_Field is
     (
      No MATCHED SLAVE ADDRESS,
      --  Slave address hit, and is called for TX
      Hit)
     with Size => 1;
   for STAT_SLV_TX_HIT_Field use
     (No MATCHED SLAVE ADDRESS => 0,
      Hit => 1);

   --  Lost arbitration status
   type STAT_LOST_ARB_Field is
     (
      Not LOST ARBITRATION,
      Lost ARBITRATION)
     with Size => 1;
   for STAT_LOST_ARB_Field use
     (Not LOST ARBITRATION => 0,
      Lost ARBITRATION => 1);

   --  Time-out status
   type STAT_TIMEOUT_Field is
     (
      No TIMEOUT,
      Timeout)
     with Size => 1;
   for STAT_TIMEOUT_Field use
     (No TIMEOUT => 0,
      Timeout => 1);

   --  I2C interrupt flag
   type STAT_I2CIF_Field is
     (
      I2C STATUS DOESN'T CHANGE,
      I2C STATUS CHANGES)
     with Size => 1;
   for STAT_I2CIF_Field use
     (I2C STATUS DOESN'T CHANGE => 0,
      I2C STATUS CHANGES => 1);

   --  Offset:0x04 I2Cn Status Register
   type STAT_Register is record
      --  Read-only. RX done status
      RX_DN          : STAT_RX_DN_Field := NRF_SVD.I2C.Not DONE;
      --  Read-only. ACK done status
      ACK_STAT       : STAT_ACK_STAT_Field := NRF_SVD.I2C.No;
      --  Read-only. NACK done status
      NACK_STAT      : STAT_NACK_STAT_Field := NRF_SVD.I2C.No;
      --  Read-only. STOP done status
      STOP_DN        : STAT_STOP_DN_Field := NRF_SVD.I2C.No;
      --  Read-only. START done status
      START_DN       : STAT_START_DN_Field := NRF_SVD.I2C.No;
      --  Read-only. I2C master/slave status
      I2C_MST        : STAT_I2C_MST_Field := NRF_SVD.I2C.Slave MODE;
      --  Read-only. Slave RX address hit flag
      SLV_RX_HIT     : STAT_SLV_RX_HIT_Field :=
                        NRF_SVD.I2C.No MATCHED SLAVE ADDRESS;
      --  Read-only. Slave TX address hit flag
      SLV_TX_HIT     : STAT_SLV_TX_HIT_Field :=
                        NRF_SVD.I2C.No MATCHED SLAVE ADDRESS;
      --  Read-only. Lost arbitration status
      LOST_ARB       : STAT_LOST_ARB_Field :=
                        NRF_SVD.I2C.Not LOST ARBITRATION;
      --  Read-only. Time-out status
      TIMEOUT        : STAT_TIMEOUT_Field := NRF_SVD.I2C.No TIMEOUT;
      --  unspecified
      Reserved_10_14 : HAL.UInt5 := 16#0#;
      --  I2C interrupt flag
      I2CIF          : STAT_I2CIF_Field :=
                        NRF_SVD.I2C.I2C STATUS DOESN'T CHANGE;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for STAT_Register use record
      RX_DN          at 0 range 0 .. 0;
      ACK_STAT       at 0 range 1 .. 1;
      NACK_STAT      at 0 range 2 .. 2;
      STOP_DN        at 0 range 3 .. 3;
      START_DN       at 0 range 4 .. 4;
      I2C_MST        at 0 range 5 .. 5;
      SLV_RX_HIT     at 0 range 6 .. 6;
      SLV_TX_HIT     at 0 range 7 .. 7;
      LOST_ARB       at 0 range 8 .. 8;
      TIMEOUT        at 0 range 9 .. 9;
      Reserved_10_14 at 0 range 10 .. 14;
      I2CIF          at 0 range 15 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   subtype TXDATA_Data_Field is HAL.UInt8;

   --  Offset:0x08 I2Cn TX Data Register
   type TXDATA_Register is record
      --  TX Data
      Data          : TXDATA_Data_Field := 16#0#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TXDATA_Register use record
      Data          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype RXDATA_Data_Field is HAL.UInt8;

   --  Offset:0x0C I2Cn RX Data Register
   type RXDATA_Register is record
      --  Read-only. RX Data received when RX_DN=1
      Data          : RXDATA_Data_Field;
      --  unspecified
      Reserved_8_31 : HAL.UInt24;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for RXDATA_Register use record
      Data          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SLVADDR0_ADDR_Field is HAL.UInt10;

   --  General call address enable
   type SLVADDR0_GCEN_Field is
     (
      --  Disable general call address
      Disable,
      --  Enable general call address (0x0)
      Enable)
     with Size => 1;
   for SLVADDR0_GCEN_Field use
     (Disable => 0,
      Enable => 1);

   --  Slave address mode
   type SLVADDR0_ADD_MODE_Field is
     (
      SLVADDR0_ADD_MODE_Field_7-BIT ADDRESS MODE,
      SLVADDR0_ADD_MODE_Field_10-BIT ADDRESS MODE)
     with Size => 1;
   for SLVADDR0_ADD_MODE_Field use
     (SLVADDR0_ADD_MODE_Field_7-BIT ADDRESS MODE => 0,
      SLVADDR0_ADD_MODE_Field_10-BIT ADDRESS MODE => 1);

   --  Offset:0x10 I2Cn Slave Address 0 Register
   type SLVADDR0_Register is record
      --  I2Cn slave address 0
      ADDR           : SLVADDR0_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_10_29 : HAL.UInt20 := 16#0#;
      --  General call address enable
      GCEN           : SLVADDR0_GCEN_Field := NRF_SVD.I2C.Disable;
      --  Slave address mode
      ADD_MODE       : SLVADDR0_ADD_MODE_Field :=
                        NRF_SVD.I2C.SLVADDR0_ADD_MODE_Field_7-BIT ADDRESS MODE;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SLVADDR0_Register use record
      ADDR           at 0 range 0 .. 9;
      Reserved_10_29 at 0 range 10 .. 29;
      GCEN           at 0 range 30 .. 30;
      ADD_MODE       at 0 range 31 .. 31;
   end record;

   subtype SLVADDR_ADDR_Field is HAL.UInt10;

   --  Offset:0x14 I2Cn Slave Address 1 Register
   type SLVADDR_Register is record
      --  I2Cn slave address 1
      ADDR           : SLVADDR_ADDR_Field := 16#0#;
      --  unspecified
      Reserved_10_31 : HAL.UInt22 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SLVADDR_Register use record
      ADDR           at 0 range 0 .. 9;
      Reserved_10_31 at 0 range 10 .. 31;
   end record;

   subtype SCLHT_SCLH_Field is HAL.UInt8;

   --  Offset:0x20 I2Cn SCL High Time Register
   type SCLHT_Register is record
      --  SCLn High period time=(SCLHT+1)*I2Cn_PCLK cycle
      SCLH          : SCLHT_SCLH_Field := 16#4#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCLHT_Register use record
      SCLH          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype SCLLT_SCLL_Field is HAL.UInt8;

   --  Offset:0x24 I2Cn SCL Low Time Register
   type SCLLT_Register is record
      --  SCLn Low period time=(SCLLT+1)*I2Cn_PCLK cycle
      SCLL          : SCLLT_SCLL_Field := 16#4#;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for SCLLT_Register use record
      SCLL          at 0 range 0 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype TOCTRL_TO_Field is HAL.UInt16;

   --  Offset:0x2C I2Cn Timeout Control Register
   type TOCTRL_Register is record
      --  Timeout period time = TO*I2Cn_PCLK cycle
      TO             : TOCTRL_TO_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for TOCTRL_Register use record
      TO             at 0 range 0 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Monitor mode enable
   type MMCTRL_MMEN_Field is
     (
      --  Disable monitor mode
      Disable,
      --  Enable monitor mode
      Enable)
     with Size => 1;
   for MMCTRL_MMEN_Field use
     (Disable => 0,
      Enable => 1);

   --  SCLn output enable
   type MMCTRL_SCLOEN_Field is
     (
      --  Disable SCLn output, SCLn is forced High
      Disable,
      --  I2C module may hold the SCLn Low until it has time to respond to an
      --  I2C interrupt
      Enable)
     with Size => 1;
   for MMCTRL_SCLOEN_Field use
     (Disable => 0,
      Enable => 1);

   --  Match address selection
   type MMCTRL_MATCH_ALL_Field is
     (
      --  Interrupt will only be generated when the address matches one of the
      --  I2Cn_SLVADDR0~3 register
      I2Cn_Slvaddr0~3,
      --  Interrupt will be generated on ANY address received if in monitor
      --  mode
      All_k)
     with Size => 1;
   for MMCTRL_MATCH_ALL_Field use
     (I2Cn_Slvaddr0~3 => 0,
      All_k => 1);

   --  Offset:0x30 I2Cn Monitor Mode Control Register
   type MMCTRL_Register is record
      --  Monitor mode enable
      MMEN          : MMCTRL_MMEN_Field := NRF_SVD.I2C.Disable;
      --  SCLn output enable
      SCLOEN        : MMCTRL_SCLOEN_Field := NRF_SVD.I2C.Disable;
      --  Match address selection
      MATCH_ALL     : MMCTRL_MATCH_ALL_Field := NRF_SVD.I2C.I2Cn_Slvaddr0~3;
      --  unspecified
      Reserved_3_31 : HAL.UInt29 := 16#0#;
   end record
     with Volatile_Full_Access, Size => 32,
          Bit_Order => System.Low_Order_First;

   for MMCTRL_Register use record
      MMEN          at 0 range 0 .. 0;
      SCLOEN        at 0 range 1 .. 1;
      MATCH_ALL     at 0 range 2 .. 2;
      Reserved_3_31 at 0 range 3 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  I2C0
   type I2C_Peripheral is record
      --  Offset:0x00 I2Cn Control Register
      CTRL     : aliased CTRL_Register;
      --  Offset:0x04 I2Cn Status Register
      STAT     : aliased STAT_Register;
      --  Offset:0x08 I2Cn TX Data Register
      TXDATA   : aliased TXDATA_Register;
      --  Offset:0x0C I2Cn RX Data Register
      RXDATA   : aliased RXDATA_Register;
      --  Offset:0x10 I2Cn Slave Address 0 Register
      SLVADDR0 : aliased SLVADDR0_Register;
      --  Offset:0x14 I2Cn Slave Address 1 Register
      SLVADDR1 : aliased SLVADDR_Register;
      --  Offset:0x18 I2Cn Slave Address 2 Register
      SLVADDR2 : aliased SLVADDR_Register;
      --  Offset:0x1C I2Cn Slave Address 3 Register
      SLVADDR3 : aliased SLVADDR_Register;
      --  Offset:0x20 I2Cn SCL High Time Register
      SCLHT    : aliased SCLHT_Register;
      --  Offset:0x24 I2Cn SCL Low Time Register
      SCLLT    : aliased SCLLT_Register;
      --  Offset:0x2C I2Cn Timeout Control Register
      TOCTRL   : aliased TOCTRL_Register;
      --  Offset:0x30 I2Cn Monitor Mode Control Register
      MMCTRL   : aliased MMCTRL_Register;
   end record
     with Volatile;

   for I2C_Peripheral use record
      CTRL     at 16#0# range 0 .. 31;
      STAT     at 16#4# range 0 .. 31;
      TXDATA   at 16#8# range 0 .. 31;
      RXDATA   at 16#C# range 0 .. 31;
      SLVADDR0 at 16#10# range 0 .. 31;
      SLVADDR1 at 16#14# range 0 .. 31;
      SLVADDR2 at 16#18# range 0 .. 31;
      SLVADDR3 at 16#1C# range 0 .. 31;
      SCLHT    at 16#20# range 0 .. 31;
      SCLLT    at 16#24# range 0 .. 31;
      TOCTRL   at 16#2C# range 0 .. 31;
      MMCTRL   at 16#30# range 0 .. 31;
   end record;

   --  I2C0
   SN_I2C0_Periph : aliased I2C_Peripheral
     with Import, Address => System'To_Address (16#40018000#);

   --  I2C0
   SN_I2C1_Periph : aliased I2C_Peripheral
     with Import, Address => System'To_Address (16#4005A000#);

end NRF_SVD.I2C;