# Smart Buoy V2
## The new version of the buoy developed by Izmir Science High School students based on ama-algae-monitoring-buoy.

-This version of buoy uses a waterproof box as the main enclosure. To block the ambient light from affecting sensor readings, a light blocking structure was made which is controlled by a servo inside the waterproof enclosure with magnets linking the two. Small bearing balls were embedded into plastic in order to reduce friction with other surfaces. 

-Uses a SFH203FA IR photodiode for turbidity and a BPW34 photodiode for fluorescence measurements. To amplify the signal from theese photodiodes, an ADPD2210 low noise current amplifier was used.

-2x 18650 Li-İon battery cells were used in parallel to power the buoy.

-A constant current source was used to power IR photodiode to avoid any inconsistent measurements due to external factors such as battery voltage, temperature etc.

-ADS1115 is used to convert analog readings from sensors, battery voltage and convert them into digital values which are then sent to arduino via I2C bus.

-A DHT11 digital humidity and temperature sensor was used to get the humidity and temperature values from the inside of the enclosure.

-A SIM808+Arduino Leonardo board from DFRobot was used as the main controller board. Batteries are connected to its onboard battery power connector.

-Uses a CN3791 MPPT+lithium ion battery charger IC board to harvest energy from solar panels.

-Uses gsm network in order to upload data to a remote server in json format.

## Insides of the finished buoy
![A](https://github.com/AMA-Labs/ama-algae-monitoring-buoy/blob/main/Version2/pictures/buoy_insides.jpeg?raw=true)

## Light blocking structure 
![A](https://github.com/AMA-Labs/ama-algae-monitoring-buoy/blob/main/Version2/pictures/buoy_lightblocker.jpeg?raw=true)

## Main sensor board & fluorescence photodiode board
![A](https://github.com/AMA-Labs/ama-algae-monitoring-buoy/blob/main/Version2/pictures/analog_mainboard.jpeg?raw=true)
![A](https://github.com/AMA-Labs/ama-algae-monitoring-buoy/blob/main/Version2/pictures/fluorometer_photodiode.jpeg?raw=true)
