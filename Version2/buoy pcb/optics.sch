EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "Duba Optik Sensörler"
Date "2022-12-28"
Rev "1.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R1
U 1 1 638E7943
P 8900 5100
F 0 "R1" H 8970 5146 50  0000 L CNN
F 1 "100k" H 8970 5055 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8830 5100 50  0001 C CNN
F 3 "~" H 8900 5100 50  0001 C CNN
	1    8900 5100
	0    1    1    0   
$EndComp
$Comp
L lib1:ADPD2210 IC1
U 1 1 638ED60D
P 9350 5450
F 0 "IC1" H 9600 5715 50  0000 C CNN
F 1 "ADPD2210" H 9600 5624 50  0000 C CNN
F 2 "lib1:LFCSP-6" H 9600 5600 50  0001 C CNN
F 3 "" H 9600 5600 50  0001 C CNN
	1    9350 5450
	1    0    0    -1  
$EndComp
$Comp
L Sensor_Optical:BPW34 D1
U 1 1 638EE347
P 10500 5850
F 0 "D1" H 10450 6145 50  0000 C CNN
F 1 "BPW34" H 10450 6054 50  0000 C CNN
F 2 "OptoDevice:BPW34_SMD" H 10500 6025 50  0001 C CNN
F 3 "http://www.vishay.com/docs/81521/bpw34.pdf" H 10450 5850 50  0001 C CNN
	1    10500 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9950 5700 10500 5700
Wire Wire Line
	10500 5700 10500 5750
Wire Wire Line
	10500 6050 10500 6100
Wire Wire Line
	10500 6100 9950 6100
Wire Wire Line
	9950 6100 9950 5950
$Comp
L power:GND #PWR023
U 1 1 63A6C992
P 9600 6250
F 0 "#PWR023" H 9600 6000 50  0001 C CNN
F 1 "GND" H 9605 6077 50  0000 C CNN
F 2 "" H 9600 6250 50  0001 C CNN
F 3 "" H 9600 6250 50  0001 C CNN
	1    9600 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 6250 9600 6150
$Comp
L Device:C C10
U 1 1 63A6E09F
P 10300 5250
F 0 "C10" V 10048 5250 50  0000 C CNN
F 1 "0.01uF" V 10139 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10338 5100 50  0001 C CNN
F 3 "~" H 10300 5250 50  0001 C CNN
	1    10300 5250
	0    1    1    0   
$EndComp
$Comp
L Device:C C9
U 1 1 63A6F24A
P 10300 4800
F 0 "C9" V 10048 4800 50  0000 C CNN
F 1 "1uF" V 10139 4800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10338 4650 50  0001 C CNN
F 3 "~" H 10300 4800 50  0001 C CNN
	1    10300 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 5450 10150 5450
Wire Wire Line
	10150 5450 10150 5250
Wire Wire Line
	10150 5250 10150 4800
Connection ~ 10150 5250
$Comp
L power:GND #PWR028
U 1 1 63A6FA62
P 10650 4800
F 0 "#PWR028" H 10650 4550 50  0001 C CNN
F 1 "GND" V 10655 4672 50  0000 R CNN
F 2 "" H 10650 4800 50  0001 C CNN
F 3 "" H 10650 4800 50  0001 C CNN
	1    10650 4800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR029
U 1 1 63A70088
P 10650 5250
F 0 "#PWR029" H 10650 5000 50  0001 C CNN
F 1 "GND" V 10655 5122 50  0000 R CNN
F 2 "" H 10650 5250 50  0001 C CNN
F 3 "" H 10650 5250 50  0001 C CNN
	1    10650 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10450 4800 10650 4800
Wire Wire Line
	10450 5250 10650 5250
Wire Wire Line
	10150 4800 10150 4400
Connection ~ 10150 4800
Wire Wire Line
	9250 5450 9100 5450
Wire Wire Line
	9100 5450 9100 5100
Wire Wire Line
	9100 5100 9050 5100
$Comp
L power:GND #PWR019
U 1 1 63A72F1E
P 8650 5100
F 0 "#PWR019" H 8650 4850 50  0001 C CNN
F 1 "GND" V 8655 4972 50  0000 R CNN
F 2 "" H 8650 5100 50  0001 C CNN
F 3 "" H 8650 5100 50  0001 C CNN
	1    8650 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 5100 8650 5100
Wire Wire Line
	9250 5950 9150 5950
$Comp
L power:GND #PWR021
U 1 1 63A74538
P 9150 6050
F 0 "#PWR021" H 9150 5800 50  0001 C CNN
F 1 "GND" H 9155 5877 50  0000 C CNN
F 2 "" H 9150 6050 50  0001 C CNN
F 3 "" H 9150 6050 50  0001 C CNN
	1    9150 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 6050 9150 5950
$Comp
L Device:R R13
U 1 1 63A75994
P 8600 6000
F 0 "R13" H 8670 6046 50  0000 L CNN
F 1 "1M" H 8670 5955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8530 6000 50  0001 C CNN
F 3 "~" H 8600 6000 50  0001 C CNN
	1    8600 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 63A77D39
P 8600 6250
F 0 "#PWR017" H 8600 6000 50  0001 C CNN
F 1 "GND" H 8605 6077 50  0000 C CNN
F 2 "" H 8600 6250 50  0001 C CNN
F 3 "" H 8600 6250 50  0001 C CNN
	1    8600 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 6250 8600 6150
$Comp
L Analog_ADC:ADS1115IDGS U2
U 1 1 63A787E6
P 3700 3400
F 0 "U2" H 3700 4081 50  0000 C CNN
F 1 "ADS1115IDGS" H 3700 3990 50  0000 C CNN
F 2 "lib1:ADS1115_X2QFN" H 3700 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 3650 2500 50  0001 C CNN
	1    3700 3400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 63A87A96
P 3700 3900
F 0 "#PWR010" H 3700 3650 50  0001 C CNN
F 1 "GND" H 3705 3727 50  0000 C CNN
F 2 "" H 3700 3900 50  0001 C CNN
F 3 "" H 3700 3900 50  0001 C CNN
	1    3700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3900 3700 3800
$Comp
L power:+3.3V #PWR025
U 1 1 63A88374
P 10150 4400
F 0 "#PWR025" H 10150 4250 50  0001 C CNN
F 1 "+3.3V" H 10165 4573 50  0000 C CNN
F 2 "" H 10150 4400 50  0001 C CNN
F 3 "" H 10150 4400 50  0001 C CNN
	1    10150 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 63A89673
P 7850 5950
F 0 "C6" H 7965 5996 50  0000 L CNN
F 1 "100p" H 7965 5905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7888 5800 50  0001 C CNN
F 3 "~" H 7850 5950 50  0001 C CNN
	1    7850 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5800 7850 5700
Connection ~ 7850 5700
$Comp
L power:GND #PWR015
U 1 1 63A8E4D4
P 7850 6200
F 0 "#PWR015" H 7850 5950 50  0001 C CNN
F 1 "GND" H 7855 6027 50  0000 C CNN
F 2 "" H 7850 6200 50  0001 C CNN
F 3 "" H 7850 6200 50  0001 C CNN
	1    7850 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 6200 7850 6100
$Comp
L Device:C C3
U 1 1 63A99169
P 3900 1350
F 0 "C3" H 4015 1396 50  0000 L CNN
F 1 "1uF" H 4015 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3938 1200 50  0001 C CNN
F 3 "~" H 3900 1350 50  0001 C CNN
	1    3900 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1200 3900 1100
$Comp
L power:GND #PWR012
U 1 1 63A99170
P 3900 1600
F 0 "#PWR012" H 3900 1350 50  0001 C CNN
F 1 "GND" H 3905 1427 50  0000 C CNN
F 2 "" H 3900 1600 50  0001 C CNN
F 3 "" H 3900 1600 50  0001 C CNN
	1    3900 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1600 3900 1500
$Comp
L Device:C C2
U 1 1 63A99F4F
P 2500 1350
F 0 "C2" H 2615 1396 50  0000 L CNN
F 1 "100pF" H 2615 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2538 1200 50  0001 C CNN
F 3 "~" H 2500 1350 50  0001 C CNN
	1    2500 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1200 2500 1100
$Comp
L power:GND #PWR04
U 1 1 63A99F56
P 2500 1600
F 0 "#PWR04" H 2500 1350 50  0001 C CNN
F 1 "GND" H 2505 1427 50  0000 C CNN
F 2 "" H 2500 1600 50  0001 C CNN
F 3 "" H 2500 1600 50  0001 C CNN
	1    2500 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1600 2500 1500
$Comp
L Device:C C1
U 1 1 63A9AB59
P 1950 1350
F 0 "C1" H 2065 1396 50  0000 L CNN
F 1 "10uF" H 2065 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1988 1200 50  0001 C CNN
F 3 "~" H 1950 1350 50  0001 C CNN
	1    1950 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 63A9AB60
P 1950 1600
F 0 "#PWR02" H 1950 1350 50  0001 C CNN
F 1 "GND" H 1955 1427 50  0000 C CNN
F 2 "" H 1950 1600 50  0001 C CNN
F 3 "" H 1950 1600 50  0001 C CNN
	1    1950 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 1600 1950 1500
$Comp
L Device:C C4
U 1 1 63A9B7CA
P 4350 1350
F 0 "C4" H 4465 1396 50  0000 L CNN
F 1 "100pF" H 4465 1305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4388 1200 50  0001 C CNN
F 3 "~" H 4350 1350 50  0001 C CNN
	1    4350 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1200 4350 1100
$Comp
L power:GND #PWR013
U 1 1 63A9B7D1
P 4350 1600
F 0 "#PWR013" H 4350 1350 50  0001 C CNN
F 1 "GND" H 4355 1427 50  0000 C CNN
F 2 "" H 4350 1600 50  0001 C CNN
F 3 "" H 4350 1600 50  0001 C CNN
	1    4350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1600 4350 1500
Wire Wire Line
	3650 1100 3900 1100
Connection ~ 3900 1100
Wire Wire Line
	3900 1100 4350 1100
Connection ~ 2500 1100
Wire Wire Line
	2500 1100 1950 1100
$Comp
L power:+3.3V #PWR011
U 1 1 63A9ED43
P 3900 900
F 0 "#PWR011" H 3900 750 50  0001 C CNN
F 1 "+3.3V" H 3915 1073 50  0000 C CNN
F 2 "" H 3900 900 50  0001 C CNN
F 3 "" H 3900 900 50  0001 C CNN
	1    3900 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1100 3900 900 
$Comp
L power:+5V #PWR01
U 1 1 63AA0CFC
P 1950 900
F 0 "#PWR01" H 1950 750 50  0001 C CNN
F 1 "+5V" H 1965 1073 50  0000 C CNN
F 2 "" H 1950 900 50  0001 C CNN
F 3 "" H 1950 900 50  0001 C CNN
	1    1950 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 900  1950 1100
Wire Wire Line
	1950 1200 1950 1100
Connection ~ 1950 1100
$Comp
L power:GND #PWR08
U 1 1 63AA3A26
P 3350 1600
F 0 "#PWR08" H 3350 1350 50  0001 C CNN
F 1 "GND" H 3355 1427 50  0000 C CNN
F 2 "" H 3350 1600 50  0001 C CNN
F 3 "" H 3350 1600 50  0001 C CNN
	1    3350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1600 3350 1500
$Comp
L power:+3.3V #PWR09
U 1 1 63AA5494
P 3700 2550
F 0 "#PWR09" H 3700 2400 50  0001 C CNN
F 1 "+3.3V" H 3715 2723 50  0000 C CNN
F 2 "" H 3700 2550 50  0001 C CNN
F 3 "" H 3700 2550 50  0001 C CNN
	1    3700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2550 3700 2600
$Comp
L power:+3.3V #PWR05
U 1 1 63AA78A4
P 2700 2550
F 0 "#PWR05" H 2700 2400 50  0001 C CNN
F 1 "+3.3V" H 2715 2723 50  0000 C CNN
F 2 "" H 2700 2550 50  0001 C CNN
F 3 "" H 2700 2550 50  0001 C CNN
	1    2700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5850 8600 5700
Connection ~ 8600 5700
Wire Wire Line
	8600 5700 9250 5700
$Comp
L Device:R R5
U 1 1 63AACEC9
P 2700 2950
F 0 "R5" H 2770 2996 50  0000 L CNN
F 1 "4k7" H 2770 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2630 2950 50  0001 C CNN
F 3 "~" H 2700 2950 50  0001 C CNN
	1    2700 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 63AB13F4
P 2350 2950
F 0 "R4" H 2420 2996 50  0000 L CNN
F 1 "4k7" H 2420 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2280 2950 50  0001 C CNN
F 3 "~" H 2350 2950 50  0001 C CNN
	1    2350 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR03
U 1 1 63AB29C7
P 2350 2550
F 0 "#PWR03" H 2350 2400 50  0001 C CNN
F 1 "+3.3V" H 2365 2723 50  0000 C CNN
F 2 "" H 2350 2550 50  0001 C CNN
F 3 "" H 2350 2550 50  0001 C CNN
	1    2350 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2550 2350 2800
$Comp
L Device:R R7
U 1 1 63AB9A2B
P 3300 3850
F 0 "R7" H 3370 3896 50  0000 L CNN
F 1 "10K" H 3370 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3230 3850 50  0001 C CNN
F 3 "~" H 3300 3850 50  0001 C CNN
	1    3300 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 63AB9A31
P 3300 4100
F 0 "#PWR07" H 3300 3850 50  0001 C CNN
F 1 "GND" H 3305 3927 50  0000 C CNN
F 2 "" H 3300 4100 50  0001 C CNN
F 3 "" H 3300 4100 50  0001 C CNN
	1    3300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4100 3300 4000
Wire Wire Line
	3300 3600 3300 3700
$Comp
L Device:R R6
U 1 1 63ABC65D
P 3050 3850
F 0 "R6" H 3120 3896 50  0000 L CNN
F 1 "1k" H 3120 3805 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2980 3850 50  0001 C CNN
F 3 "~" H 3050 3850 50  0001 C CNN
	1    3050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4100 3050 4000
Wire Wire Line
	3050 3600 3050 3700
$Comp
L power:+3.3V #PWR06
U 1 1 63ABF477
P 3050 4100
F 0 "#PWR06" H 3050 3950 50  0001 C CNN
F 1 "+3.3V" H 3065 4273 50  0000 C CNN
F 2 "" H 3050 4100 50  0001 C CNN
F 3 "" H 3050 4100 50  0001 C CNN
	1    3050 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 3600 3300 3600
Connection ~ 3300 3600
Wire Wire Line
	1700 3400 2700 3400
Wire Wire Line
	1700 3500 2350 3500
Wire Wire Line
	2700 2550 2700 2800
Wire Wire Line
	2700 3100 2700 3400
Connection ~ 2700 3400
Wire Wire Line
	2700 3400 3300 3400
Wire Wire Line
	2350 3100 2350 3500
Connection ~ 2350 3500
Wire Wire Line
	2350 3500 3300 3500
Text Label 4200 3300 0    50   ~ 0
AN_IN1
$Comp
L power:GND #PWR022
U 1 1 63AFF669
P 8000 3800
F 0 "#PWR022" H 8000 3550 50  0001 C CNN
F 1 "GND" H 8005 3627 50  0000 C CNN
F 2 "" H 8000 3800 50  0001 C CNN
F 3 "" H 8000 3800 50  0001 C CNN
	1    8000 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3800 8000 3700
Text Label 4200 3500 0    50   ~ 0
AN_IN2
Wire Wire Line
	4200 3500 4100 3500
$Comp
L Regulator_Linear:LP5907MFX-3.3 U1
U 1 1 63A91FA0
P 3350 1200
F 0 "U1" H 3350 1567 50  0000 C CNN
F 1 "LP5907MFX-3.3" H 3350 1476 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3350 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lp5907.pdf" H 3350 1700 50  0001 C CNN
	1    3350 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1100 3050 1100
Wire Wire Line
	3050 1200 2950 1200
Wire Wire Line
	2950 1200 2950 1600
Text Label 2950 1600 0    50   ~ 0
EN
Text Label 1700 3400 0    50   ~ 0
SCL
Text Label 1700 3500 0    50   ~ 0
SDA
Text Label 4200 3600 0    50   ~ 0
ADC_EXT_0
Wire Wire Line
	4200 3400 4100 3400
Text Label 7600 1250 3    50   ~ 0
ADC_EXT_0
Text Label 7500 1250 3    50   ~ 0
EN
$Comp
L power:GND #PWR0101
U 1 1 63AC344F
P 7300 1250
F 0 "#PWR0101" H 7300 1000 50  0001 C CNN
F 1 "GND" H 7305 1077 50  0000 C CNN
F 2 "" H 7300 1250 50  0001 C CNN
F 3 "" H 7300 1250 50  0001 C CNN
	1    7300 1250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 63AC39A5
P 7400 1250
F 0 "#PWR0102" H 7400 1100 50  0001 C CNN
F 1 "+5V" V 7415 1378 50  0000 L CNN
F 2 "" H 7400 1250 50  0001 C CNN
F 3 "" H 7400 1250 50  0001 C CNN
	1    7400 1250
	-1   0    0    1   
$EndComp
Text Label 7800 1250 3    50   ~ 0
SCL
Text Label 7700 1250 3    50   ~ 0
SDA
Wire Wire Line
	7300 1250 7300 1050
Wire Wire Line
	7400 1250 7400 1050
Wire Wire Line
	7500 1250 7500 1050
Wire Wire Line
	7600 1250 7600 1050
Wire Wire Line
	7700 1250 7700 1050
Wire Wire Line
	7800 1250 7800 1050
$Comp
L Device:LED D2
U 1 1 63AAEFD5
P 2600 5500
F 0 "D2" V 2639 5382 50  0000 R CNN
F 1 "LED" V 2548 5382 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 2600 5500 50  0001 C CNN
F 3 "~" H 2600 5500 50  0001 C CNN
	1    2600 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 63AB4FCB
P 2900 5500
F 0 "D3" V 2939 5382 50  0000 R CNN
F 1 "LED" V 2848 5382 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 2900 5500 50  0001 C CNN
F 3 "~" H 2900 5500 50  0001 C CNN
	1    2900 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D4
U 1 1 63AB7C05
P 3250 5500
F 0 "D4" V 3289 5382 50  0000 R CNN
F 1 "LED" V 3198 5382 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 3250 5500 50  0001 C CNN
F 3 "~" H 3250 5500 50  0001 C CNN
	1    3250 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D5
U 1 1 63ABAABF
P 3550 5500
F 0 "D5" V 3589 5382 50  0000 R CNN
F 1 "LED" V 3498 5382 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 3550 5500 50  0001 C CNN
F 3 "~" H 3550 5500 50  0001 C CNN
	1    3550 5500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D6
U 1 1 63ABD90E
P 4500 5500
F 0 "D6" V 4447 5580 50  0000 L CNN
F 1 "LED" V 4538 5580 50  0000 L CNN
F 2 "LED_THT:LED_D5.0mm" H 4500 5500 50  0001 C CNN
F 3 "~" H 4500 5500 50  0001 C CNN
	1    4500 5500
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:2N7002E Q1
U 1 1 63AC5A01
P 2500 6200
F 0 "Q1" H 2704 6246 50  0000 L CNN
F 1 "2N7002E" H 2704 6155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 2700 6125 50  0001 L CIN
F 3 "http://www.diodes.com/assets/Datasheets/ds30376.pdf" H 2500 6200 50  0001 L CNN
	1    2500 6200
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002E Q3
U 1 1 63ADB79D
P 4400 5950
F 0 "Q3" H 4604 5996 50  0000 L CNN
F 1 "2N7002E" H 4604 5905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4600 5875 50  0001 L CIN
F 3 "http://www.diodes.com/assets/Datasheets/ds30376.pdf" H 4400 5950 50  0001 L CNN
	1    4400 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 5750 4500 5650
Wire Wire Line
	2600 6000 2600 5650
Wire Wire Line
	3550 5650 3250 5650
Connection ~ 2600 5650
Connection ~ 2900 5650
Wire Wire Line
	2900 5650 2600 5650
Connection ~ 3250 5650
Wire Wire Line
	3250 5650 2900 5650
$Comp
L Device:R R19
U 1 1 63AECF52
P 3550 5200
F 0 "R19" V 3343 5200 50  0000 C CNN
F 1 "10R" V 3434 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3480 5200 50  0001 C CNN
F 3 "~" H 3550 5200 50  0001 C CNN
	1    3550 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 63AF41F2
P 3250 5200
F 0 "R18" V 3043 5200 50  0000 C CNN
F 1 "10R" V 3134 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3180 5200 50  0001 C CNN
F 3 "~" H 3250 5200 50  0001 C CNN
	1    3250 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R17
U 1 1 63AF7598
P 2900 5200
F 0 "R17" V 2693 5200 50  0000 C CNN
F 1 "10R" V 2784 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2830 5200 50  0001 C CNN
F 3 "~" H 2900 5200 50  0001 C CNN
	1    2900 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R16
U 1 1 63AFA7A7
P 2600 5200
F 0 "R16" V 2393 5200 50  0000 C CNN
F 1 "10R" V 2484 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2530 5200 50  0001 C CNN
F 3 "~" H 2600 5200 50  0001 C CNN
	1    2600 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 63AFE30E
P 4500 6400
F 0 "R21" V 4293 6400 50  0000 C CNN
F 1 "10R" V 4384 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4430 6400 50  0001 C CNN
F 3 "~" H 4500 6400 50  0001 C CNN
	1    4500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6250 4500 6200
$Comp
L power:GND #PWR0103
U 1 1 63B06B83
P 2600 6500
F 0 "#PWR0103" H 2600 6250 50  0001 C CNN
F 1 "GND" H 2605 6327 50  0000 C CNN
F 2 "" H 2600 6500 50  0001 C CNN
F 3 "" H 2600 6500 50  0001 C CNN
	1    2600 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6500 2600 6400
$Comp
L power:GND #PWR0104
U 1 1 63B0A0F5
P 4500 6600
F 0 "#PWR0104" H 4500 6350 50  0001 C CNN
F 1 "GND" H 4505 6427 50  0000 C CNN
F 2 "" H 4500 6600 50  0001 C CNN
F 3 "" H 4500 6600 50  0001 C CNN
	1    4500 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5050 3550 4900
Wire Wire Line
	2600 4900 2600 5050
Wire Wire Line
	2900 5050 2900 4900
Connection ~ 2900 4900
Wire Wire Line
	2900 4900 2600 4900
Wire Wire Line
	3250 5050 3250 4900
Wire Wire Line
	2900 4900 3250 4900
Connection ~ 3250 4900
Wire Wire Line
	3250 4900 3550 4900
$Comp
L Transistor_BJT:BC848W Q2
U 1 1 63B28C92
P 4150 6200
F 0 "Q2" H 4340 6246 50  0000 L CNN
F 1 "BC848W" H 4340 6155 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4350 6125 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 4150 6200 50  0001 L CNN
	1    4150 6200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 63B30886
P 4050 6550
F 0 "#PWR0105" H 4050 6300 50  0001 C CNN
F 1 "GND" H 4055 6377 50  0000 C CNN
F 2 "" H 4050 6550 50  0001 C CNN
F 3 "" H 4050 6550 50  0001 C CNN
	1    4050 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 6400 4050 6550
Connection ~ 4500 6200
Wire Wire Line
	4500 6200 4500 6150
Wire Wire Line
	4050 6000 4050 5950
Wire Wire Line
	4050 5950 4200 5950
Wire Wire Line
	4050 5950 3850 5950
Connection ~ 4050 5950
Wire Wire Line
	4350 6200 4500 6200
Wire Wire Line
	4500 6600 4500 6550
$Comp
L Device:R R20
U 1 1 63B56946
P 3700 5950
F 0 "R20" V 3493 5950 50  0000 C CNN
F 1 "10k" V 3584 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3630 5950 50  0001 C CNN
F 3 "~" H 3700 5950 50  0001 C CNN
	1    3700 5950
	0    1    1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 63B5B028
P 2100 6200
F 0 "R15" V 1893 6200 50  0000 C CNN
F 1 "10k" V 1984 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2030 6200 50  0001 C CNN
F 3 "~" H 2100 6200 50  0001 C CNN
	1    2100 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 6200 2250 6200
Wire Wire Line
	1600 6200 1950 6200
Text Label 3000 5950 0    50   ~ 0
TirbudityLED
Wire Wire Line
	3000 5950 3550 5950
Text Label 1600 6200 0    50   ~ 0
UV_Led
$Comp
L power:+5V #PWR0106
U 1 1 63B843E7
P 3250 4850
F 0 "#PWR0106" H 3250 4700 50  0001 C CNN
F 1 "+5V" H 3265 5023 50  0000 C CNN
F 2 "" H 3250 4850 50  0001 C CNN
F 3 "" H 3250 4850 50  0001 C CNN
	1    3250 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4850 3250 4900
$Comp
L power:+5V #PWR0107
U 1 1 63B8916C
P 4500 4850
F 0 "#PWR0107" H 4500 4700 50  0001 C CNN
F 1 "+5V" H 4515 5023 50  0000 C CNN
F 2 "" H 4500 4850 50  0001 C CNN
F 3 "" H 4500 4850 50  0001 C CNN
	1    4500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 4850 4500 5250
$Comp
L Device:C C12
U 1 1 63B8F286
P 4800 5250
F 0 "C12" V 4548 5250 50  0000 C CNN
F 1 "1uF" V 4639 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4838 5100 50  0001 C CNN
F 3 "~" H 4800 5250 50  0001 C CNN
	1    4800 5250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 63B8F28C
P 5150 5250
F 0 "#PWR0108" H 5150 5000 50  0001 C CNN
F 1 "GND" V 5155 5122 50  0000 R CNN
F 2 "" H 5150 5250 50  0001 C CNN
F 3 "" H 5150 5250 50  0001 C CNN
	1    5150 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 5250 5150 5250
$Comp
L Device:C C11
U 1 1 63B93DFE
P 3700 4900
F 0 "C11" V 3448 4900 50  0000 C CNN
F 1 "1uF" V 3539 4900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3738 4750 50  0001 C CNN
F 3 "~" H 3700 4900 50  0001 C CNN
	1    3700 4900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 63B93E04
P 4050 4900
F 0 "#PWR0109" H 4050 4650 50  0001 C CNN
F 1 "GND" V 4055 4772 50  0000 R CNN
F 2 "" H 4050 4900 50  0001 C CNN
F 3 "" H 4050 4900 50  0001 C CNN
	1    4050 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 4900 4050 4900
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 63BAF563
P 7000 5800
F 0 "J2" H 6892 5475 50  0000 C CNN
F 1 "Conn_01x03_Female" H 6892 5566 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 7000 5800 50  0001 C CNN
F 3 "~" H 7000 5800 50  0001 C CNN
	1    7000 5800
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR031
U 1 1 63BB3B16
P 7300 6050
F 0 "#PWR031" H 7300 5900 50  0001 C CNN
F 1 "+3.3V" H 7315 6223 50  0000 C CNN
F 2 "" H 7300 6050 50  0001 C CNN
F 3 "" H 7300 6050 50  0001 C CNN
	1    7300 6050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 63BB90EB
P 7300 5800
F 0 "#PWR030" H 7300 5550 50  0001 C CNN
F 1 "GND" H 7305 5627 50  0000 C CNN
F 2 "" H 7300 5800 50  0001 C CNN
F 3 "" H 7300 5800 50  0001 C CNN
	1    7300 5800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7300 5800 7200 5800
Wire Wire Line
	7300 5900 7200 5900
Wire Wire Line
	7300 6050 7300 5900
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 63BFE155
P 5000 3750
F 0 "J3" H 4892 3425 50  0000 C CNN
F 1 "Conn_01x03_Female" H 4892 3516 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 5000 3750 50  0001 C CNN
F 3 "~" H 5000 3750 50  0001 C CNN
	1    5000 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR032
U 1 1 63C06C87
P 5000 3450
F 0 "#PWR032" H 5000 3200 50  0001 C CNN
F 1 "GND" H 5005 3277 50  0000 C CNN
F 2 "" H 5000 3450 50  0001 C CNN
F 3 "" H 5000 3450 50  0001 C CNN
	1    5000 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 3450 5000 3550
Wire Wire Line
	4900 3550 4900 3300
$Comp
L power:+3.3V #PWR033
U 1 1 63C11EFF
P 5100 3450
F 0 "#PWR033" H 5100 3300 50  0001 C CNN
F 1 "+3.3V" H 5115 3623 50  0000 C CNN
F 2 "" H 5100 3450 50  0001 C CNN
F 3 "" H 5100 3450 50  0001 C CNN
	1    5100 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3450 5100 3550
Wire Wire Line
	7850 5700 8600 5700
Wire Wire Line
	7200 5700 7850 5700
Wire Wire Line
	4100 3300 4900 3300
Wire Wire Line
	4100 3600 4200 3600
Wire Wire Line
	7900 1050 7900 1250
Wire Wire Line
	8000 1050 8000 1250
Text Label 7900 1250 3    50   ~ 0
UV_Led
Text Label 8000 1250 3    50   ~ 0
TirbudityLED
$Comp
L Connector:Conn_01x08_Male J1
U 1 1 63D5F1ED
P 7700 850
F 0 "J1" V 7535 778 50  0000 C CNN
F 1 "Conn_01x08_Male" V 7626 778 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 7700 850 50  0001 C CNN
F 3 "~" H 7700 850 50  0001 C CNN
	1    7700 850 
	0    1    1    0   
$EndComp
Text Label 4200 3400 0    50   ~ 0
V_BAT
$Comp
L power:+5V #PWR034
U 1 1 63DA685C
P 5600 900
F 0 "#PWR034" H 5600 750 50  0001 C CNN
F 1 "+5V" H 5615 1073 50  0000 C CNN
F 2 "" H 5600 900 50  0001 C CNN
F 3 "" H 5600 900 50  0001 C CNN
	1    5600 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 63DB0668
P 5600 1150
F 0 "R3" H 5670 1196 50  0000 L CNN
F 1 "100k" H 5670 1105 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5530 1150 50  0001 C CNN
F 3 "~" H 5600 1150 50  0001 C CNN
	1    5600 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 63DB1269
P 5600 1650
F 0 "R8" H 5670 1696 50  0000 L CNN
F 1 "1M" H 5670 1605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5530 1650 50  0001 C CNN
F 3 "~" H 5600 1650 50  0001 C CNN
	1    5600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 900  5600 1000
Wire Wire Line
	5600 1500 5600 1400
$Comp
L power:GND #PWR035
U 1 1 63DC2A7B
P 5600 1900
F 0 "#PWR035" H 5600 1650 50  0001 C CNN
F 1 "GND" H 5605 1727 50  0000 C CNN
F 2 "" H 5600 1900 50  0001 C CNN
F 3 "" H 5600 1900 50  0001 C CNN
	1    5600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1900 5600 1800
Wire Wire Line
	5600 1400 6000 1400
Connection ~ 5600 1400
Wire Wire Line
	5600 1400 5600 1300
$Comp
L Device:C C13
U 1 1 63DCEBA2
P 6000 1650
F 0 "C13" H 6115 1696 50  0000 L CNN
F 1 "1uF" H 6115 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6038 1500 50  0001 C CNN
F 3 "~" H 6000 1650 50  0001 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1500 6000 1400
Connection ~ 6000 1400
Wire Wire Line
	6000 1400 6200 1400
Wire Wire Line
	6000 1800 6000 1900
Wire Wire Line
	6000 1900 5600 1900
Connection ~ 5600 1900
Text Label 6200 1400 0    50   ~ 0
V_BAT
Wire Wire Line
	4650 5250 4500 5250
Connection ~ 4500 5250
Wire Wire Line
	4500 5250 4500 5350
$Comp
L Device:C C7
U 1 1 63F452F7
P 3950 2600
F 0 "C7" H 4065 2646 50  0000 L CNN
F 1 "100pF" H 4065 2555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 2450 50  0001 C CNN
F 3 "~" H 3950 2600 50  0001 C CNN
	1    3950 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 63F452FE
P 4200 2600
F 0 "#PWR026" H 4200 2350 50  0001 C CNN
F 1 "GND" H 4205 2427 50  0000 C CNN
F 2 "" H 4200 2600 50  0001 C CNN
F 3 "" H 4200 2600 50  0001 C CNN
	1    4200 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 2600 4100 2600
Wire Wire Line
	3800 2600 3700 2600
Connection ~ 3700 2600
Wire Wire Line
	3700 2600 3700 2900
$Comp
L Device:R R9
U 1 1 63AE8176
P 2300 6400
F 0 "R9" V 2093 6400 50  0000 C CNN
F 1 "100k" V 2184 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2230 6400 50  0001 C CNN
F 3 "~" H 2300 6400 50  0001 C CNN
	1    2300 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 63AEDC47
P 2300 6600
F 0 "#PWR036" H 2300 6350 50  0001 C CNN
F 1 "GND" H 2305 6427 50  0000 C CNN
F 2 "" H 2300 6600 50  0001 C CNN
F 3 "" H 2300 6600 50  0001 C CNN
	1    2300 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6600 2300 6550
Wire Wire Line
	2300 6250 2300 6200
Connection ~ 2300 6200
$Comp
L Device:R R10
U 1 1 63AFDD5F
P 4050 5700
F 0 "R10" V 3843 5700 50  0000 C CNN
F 1 "100k" V 3934 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 3980 5700 50  0001 C CNN
F 3 "~" H 4050 5700 50  0001 C CNN
	1    4050 5700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR037
U 1 1 63AFDD65
P 4050 5500
F 0 "#PWR037" H 4050 5250 50  0001 C CNN
F 1 "GND" H 4055 5327 50  0000 C CNN
F 2 "" H 4050 5500 50  0001 C CNN
F 3 "" H 4050 5500 50  0001 C CNN
	1    4050 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 5500 4050 5550
Wire Wire Line
	4050 5850 4050 5950
Wire Bus Line
	11200 4100 9900 4100
Wire Bus Line
	9900 4100 9900 4850
Wire Bus Line
	9900 4850 6450 4850
Wire Bus Line
	6450 4850 6450 7750
Text Notes 6550 5000 0    100  ~ 0
Photodiode and Amplifier for the Flourumeter
Connection ~ 6650 3250
Wire Wire Line
	6400 3250 6650 3250
Text Label 6400 3250 0    50   ~ 0
AN_IN2
Wire Wire Line
	7000 3250 7650 3250
Connection ~ 7000 3250
Wire Wire Line
	7000 3400 7000 3250
Wire Wire Line
	6650 3250 7000 3250
Wire Wire Line
	6650 3750 6650 3650
$Comp
L power:GND #PWR014
U 1 1 63AFF6CD
P 6650 3750
F 0 "#PWR014" H 6650 3500 50  0001 C CNN
F 1 "GND" H 6655 3577 50  0000 C CNN
F 2 "" H 6650 3750 50  0001 C CNN
F 3 "" H 6650 3750 50  0001 C CNN
	1    6650 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3350 6650 3250
$Comp
L Device:C C5
U 1 1 63AFF6C3
P 6650 3500
F 0 "C5" H 6765 3546 50  0000 L CNN
F 1 "100p" H 6765 3455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6688 3350 50  0001 C CNN
F 3 "~" H 6650 3500 50  0001 C CNN
	1    6650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3800 7000 3700
$Comp
L power:GND #PWR016
U 1 1 63AFF6AA
P 7000 3800
F 0 "#PWR016" H 7000 3550 50  0001 C CNN
F 1 "GND" H 7005 3627 50  0000 C CNN
F 2 "" H 7000 3800 50  0001 C CNN
F 3 "" H 7000 3800 50  0001 C CNN
	1    7000 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 63AFF6A4
P 7000 3550
F 0 "R12" H 7070 3596 50  0000 L CNN
F 1 "220k" H 7070 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6930 3550 50  0001 C CNN
F 3 "~" H 7000 3550 50  0001 C CNN
	1    7000 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3600 7550 3500
$Comp
L power:GND #PWR020
U 1 1 63AFF69D
P 7550 3600
F 0 "#PWR020" H 7550 3350 50  0001 C CNN
F 1 "GND" H 7555 3427 50  0000 C CNN
F 2 "" H 7550 3600 50  0001 C CNN
F 3 "" H 7550 3600 50  0001 C CNN
	1    7550 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3500 7550 3500
Wire Wire Line
	7150 2650 7050 2650
$Comp
L power:GND #PWR018
U 1 1 63AFF693
P 7050 2650
F 0 "#PWR018" H 7050 2400 50  0001 C CNN
F 1 "GND" V 7055 2522 50  0000 R CNN
F 2 "" H 7050 2650 50  0001 C CNN
F 3 "" H 7050 2650 50  0001 C CNN
	1    7050 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 2650 7450 2650
Wire Wire Line
	7500 3000 7500 2650
Wire Wire Line
	7650 3000 7500 3000
$Comp
L lib1:ADPD2210 IC2
U 1 1 63AFF658
P 7750 3000
F 0 "IC2" H 8000 3265 50  0000 C CNN
F 1 "ADPD2210" H 8000 3174 50  0000 C CNN
F 2 "lib1:LFCSP-6" H 8000 3150 50  0001 C CNN
F 3 "" H 8000 3150 50  0001 C CNN
	1    7750 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 63AFF652
P 7300 2650
F 0 "R14" H 7370 2696 50  0000 L CNN
F 1 "100k" H 7370 2605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7230 2650 50  0001 C CNN
F 3 "~" H 7300 2650 50  0001 C CNN
	1    7300 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 3000 8550 3000
Wire Wire Line
	8350 3250 8900 3250
Wire Wire Line
	8550 1950 8550 2800
$Comp
L Sensor_Optical:SFH203 D7
U 1 1 63BA6850
P 8900 3400
F 0 "D7" V 8896 3322 50  0000 R CNN
F 1 "SFH203" V 8805 3322 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm_IRGrey" H 8900 3575 50  0001 C CNN
F 3 "http://www.osram-os.com/Graphics/XPic9/00101656_0.pdf/SFH%20203,%20SFH%20203%20FA,%20Lead%20(Pb)%20Free%20Product%20-%20RoHS%20Compliant.pdf" H 8850 3400 50  0001 C CNN
	1    8900 3400
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR024
U 1 1 63AFF6B1
P 8550 1950
F 0 "#PWR024" H 8550 1800 50  0001 C CNN
F 1 "+3.3V" H 8565 2123 50  0000 C CNN
F 2 "" H 8550 1950 50  0001 C CNN
F 3 "" H 8550 1950 50  0001 C CNN
	1    8550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2800 9050 2800
$Comp
L power:GND #PWR027
U 1 1 63AFF686
P 9050 2800
F 0 "#PWR027" H 9050 2550 50  0001 C CNN
F 1 "GND" V 9055 2672 50  0000 R CNN
F 2 "" H 9050 2800 50  0001 C CNN
F 3 "" H 9050 2800 50  0001 C CNN
	1    9050 2800
	0    -1   -1   0   
$EndComp
Connection ~ 8550 2800
Wire Wire Line
	8550 3000 8550 2800
$Comp
L Device:C C8
U 1 1 63AFF670
P 8700 2800
F 0 "C8" V 8448 2800 50  0000 C CNN
F 1 "0.01uF" V 8539 2800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8738 2650 50  0001 C CNN
F 3 "~" H 8700 2800 50  0001 C CNN
	1    8700 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 3650 8350 3500
Wire Wire Line
	8900 3650 8350 3650
Wire Wire Line
	8900 3600 8900 3650
Wire Wire Line
	8900 3250 8900 3300
Text Notes 600  650  0    100  ~ 0
Nephlerometer, Regulator, LED and ADC Mainboard
$EndSCHEMATC