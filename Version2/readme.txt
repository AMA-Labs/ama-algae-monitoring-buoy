The new version of the buoy developed by Izmir Science High School students based on this.
This version of buoy uses a waterproof box as the main enclosure.
To block the ambient light from affecting sensor readings, a light blocking structure was made which is controlled by a servo inside the waterproof enclosure with magnets linking the two.
Uses photodiodes for both turbidity and fluorescence measurements. To amplify the signal from theese photodiodes, an ADPD2210 low noise current amplifier was used.
ADS1115 is used to convert analog readings from sensors, battery voltage and convert them into digital values which are then sent to arduino via I2C.
A DHT11 digital humidity and temperature sensor was used to get the humidity and temperature values from the inside of the enclosure.
A SIM808+Arduino Leonardo board from DFRobot was used as the main controller board. 
Uses gsm network in order to upload data to a remote server.
