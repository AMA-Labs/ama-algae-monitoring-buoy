/*
 * Install the following libraries:
 * Adafruit BME280
 * Adafruit Unified Sensor
 *
 * Author: Alex Horvath, Analytical Mechanics Associates
 * With code contributed from Arjun Tambe and Oguz Yetkin
 *
 */

#include <Wire.h>
#include <Adafruit_BME280.h>
#include <Adafruit_Sensor.h>
#include <TinyGPS++.h>
#include <avr/wdt.h>
#include "RTClib.h"
#include <SPI.h>
#include <SD.h>
#include <Adafruit_ADS1X15.h>

//Create software serial object to communicate with SIM808. Pin 7 is RX on GPRS/GPS/GSM shield and pin 8 is TX for the robotshop GPS/GPRS/GSM shield here
// https://www.robotshop.com/en/sim808-gps-gprsgsm-arduino-shield-mkf.html?gclid=EAIaIQobChMIl-Hpytn58QIVdGxvBB3DMgZVEAQYDSABEgJUg_D_BwE
// If you are using a different GSM/GPS/GPRS module, use the RX/TX pins given in the board specification.

Adafruit_BME280 bme; // Create a BME 280 instance
RTC_PCF8523 rtc; // Create a real time clock instance
TinyGPSPlus gps;
String device_name = "Ursula_2"; // Name your station
String dataout;
File myFile;
Adafruit_ADS1115 ads;  /* Use this for the 16-bit version */

const int pHPin = 23; // pH probe pin
const int FluorometerPin = 24; // Flurometer digital input pin
const int ThermPin = 25; // Thermistor pin
const int ComTurbPin = 26; // Commercial turbidity pin

const int ActiveFluor = 35; // Pin for +5V to fluorometer
const int ActiveCTurb = 37; // Pin for +5V to Comm Turbidity Sensor
const int ActiveTurbLDR1 = 39; // Pin for +5V for Turb LDR 1
const int ActiveTurbLDR2 = 41; // Pin for +5V for Turb LDR 2
const int ActivepH = 43; // Pin for +5V for pH]
const int ActiveTherm = 45; // Pin for +5V for Thermistor

pinMode(ActivepH, OUTPUT);

const int NumSamples = 5; // How many samples do you want each sensor to take
float samples = 0; // This object collects a sum of each sample data, which is then divided by the number of samples to get the average.

const int red_led = 53;
const int green_led = 47;
const int blue_led = 51;
const int blue_led_fluor = 22;

int16_t blank_valuer = 0;
int16_t red_value = 0;
int16_t blank_valueg = 0;
int16_t green_value = 0;
int16_t blank_valueb = 0;
int16_t blue_value =  0;
int16_t blank_value2r = 0;
int16_t red_value2 = 0;
int16_t blank_value2g = 0;
int16_t green_value2 = 0;
int16_t blank_value2b = 0;
int16_t blue_value2 =  0;
int delay_intersample = 400;
int delay_intertest = 500;
int delay_blank = 5;  //keep this short

uint8_t i;
float average;

//This struct defines a category of measurement, like "temperature" or "humidity."
struct measurement {
  float min_value; //min recordable by senseor
  float resolution; //sensor resolution
  String unit; //e.g. "Celsius"
  String type; //e.g. "temperature"
  float graph_lower; //lowest value to display on graph
  float graph_upper; //highest value for graph
  String hardware_name; //optionally, hardware used to collect the measurement
};

typedef struct measurement Measurement;
  
//Create an instance of Measurement for each of the kinds of measurements your sensor will record
//the format is {min_value, increment, units, measurement name, graph_min, graph_max, hardware name}

Measurement pressure = {80000.0, 1.0, "Pa", "pressure", 30000, 140000, "BME280"};
Measurement temperature = {0.0, 0.01, "Celsius", "temperature", -40, 85, "BME280"};
Measurement humidity = {0, 0.01, "Relative %", "humidity", 0, 100, "BME280"};
Measurement redturbidity = {0, 0.01, "Relative %", "redturbidity", 0, 100, "TurbSens"};
Measurement redturbidity2 = {0, 0.01, "Relative %", "redturbidity2", 0, 100, "TurbSens"};
Measurement greenturbidity = {0, 0.01, "Relative %", "greenturbidity", 0, 100, "TurbSens"};
Measurement greenturbidity2 = {0, 0.01, "Relative %", "greenturbidity2", 0, 100, "TurbSens"};
Measurement blueturbidity = {0, 0.01, "Relative %", "blueturbidity", 0, 100, "TurbSens"};
Measurement blueturbidity2 = {0, 0.01, "Relative %", "blueturbidity2", 0, 100, "TurbSens"};
Measurement comTurbidity = {0, 0.01, "Relative %", "commturbidity", 0, 100, "ComTurbSens"};
Measurement pH = {0, 0.01, "pH", "pH", 0, 14, "pHProbe"};
Measurement waterTemp = {0, 0.01, "Celsius", "temperature", 0, 100, "Thermistor"};
Measurement fluorescence = {0, 0.01, "Relative %", "fluorescence", 0, 100, "Fluorometer"};

void setup()
{    
//    
    if (! rtc.begin()) { // Flush serial, this is necessary for the program to work
    Serial.flush();
    abort();
  }
  rtc.start();  
  rtc.adjust(DateTime(F(__DATE__), F(__TIME__)));
  Serial.begin(57600); //Begin serial communication with Arduino and Arduino IDE (Serial Monitor)

  Serial1.begin(57600); //Begin serial communication with Arduino and SIM808

  delay(100);
  
  }


void Initialize()
{ 
  ads.begin();

  bme.begin(); // Initialize the BME 280

  Serial1.println("AT"); //Once the handshake test is successful, it will back to OK

  updateSerial(); // Return the response to the serial port for display purposes, and print anything from either serial or SoftwareSerial. May be able to remove in actual deployment pending testing
  
  Serial1.println("AT+CSQ"); //Signal quality test, value range is 0-31 , 31 is the best
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+CCID"); //Read SIM information to confirm whether the SIM is plugged in
  
  delay(1000);
  
  updateSerial();
  
  Serial1.println("AT+CREG?"); //Check whether it has registered in the network
  
  delay(1000);
  
  updateSerial();
  
  Serial1.println("AT+CGREG?"); // Check to see if the device is registered again
  
  delay(1000);
  
  updateSerial();
  
  Serial1.println("AT+COPS?"); // Returns the mobile network name i.e. T-mobile
  
  delay(1000);
  
  updateSerial();
  
  Serial1.println("AT+cgatt=1"); 
  
  delay(1000);
  
  updateSerial();
  
  Serial1.println("AT+CMGF=1"); // Set to SMS text mode
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+SAPBR=3,1,Contype,GPRS"); // Set connection type to GPRS
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+SAPBR=3,1,APN,TM"); // Change "TM" to the APN provided by your carrier
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+CGACT=1,1"); // Perform GPRS attach, which must occur befpre PDP context can be established
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+SAPBR=1,1"); // Enable bearer 1
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+SAPBR=2,1"); // Check whether bearer 1 is open
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+HTTPINIT"); // Initialize HTTP service
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+HTTPPARA=CID,1"); // Set bearer profile ID
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+HTTPPARA=URL,http://52.26.55.255:8080/api/v0p1/sensor"); // Server address
  
  delay(3000);
  
  updateSerial();
  
  Serial1.println("AT+HTTPPARA=\"CONTENT\",\"application/json\"");
  
  delay(3000);
  
  updateSerial();

//  if (!SD.begin()) {
//    while (1);
//  }
//  if (SD.exists("data.txt")){
//  SD.remove("data.txt");
//  }
}

void updateSerial()
{
  delay(20);
  while (Serial.available()) 
  {
    Serial1.write(Serial.read());//Forward what Serial received to Software Serial Port
  }
  while(Serial1.available()) 
  {
    Serial.write(Serial1.read());//Forward what Software Serial received to Serial Port
  }
}

void UplinkData(measurement m, float dataval)
{
  Serial.flush(); // Make sure that serial is flushed
  
  Serial1.flush(); // Make sure software serial is flushed
    
  delay(2000);
  DateTime now = rtc.now();
  String json = "{\"key\":\"" + device_name + "\",\"measurement_name\":\"" + m.type + "\",\"unit\":\"" + m.unit +"\",\"value\":" + String(dataval) + ",\"timestamp\":\"" + String(now.month()) + "/" + String(now.day()) + "/" + String(now.year()) + " " + String(now.hour()) + ":" + String(now.minute()) + ":" + String(now.second()) + "\",\"lat\":\"" +  String(gps.location.lat()) + "\",\"lon\":\"" + String(gps.location.lng()) + "\"}";
  //  const char *fulljson = json.c_str(); // Because SoftwareSerial truncates pure strings, save json as a char

  // How many bytes the server should expect , how many seconds/1000 the server should wait for those bytes. Set to 120 bytes for now, trouble calculating sizeof(json)
  // Set to 89 if no date time
  // Set to 120 if date time
  Serial1.println("AT+HTTPDATA=" + String(json.length()) + ",10000"); 
  
  delay(2000);
  
  updateSerial();
  
  delay(2000);
  updateSerial();
  Serial1.println("{\"key\":\"" + device_name + "\",\"measurement_name\":\"" + m.type + "\",\"unit\":\"" + m.unit +"\",\"value\":" + String(dataval) + ",\"timestamp\":\"" + String(now.month()) + "/" + String(now.day()) + "/" + String(now.year()) + " " + String(now.hour()) + ":" + String(now.minute()) + ":" + String(now.second()) + "\",\"lat\":\"" +  String(gps.location.lat()) + "\",\"lon\":\"" + String(gps.location.lng()) + "\"}"); // Send the json string
  delay(5000);
  updateSerial();
  Serial1.println("AT+HTTPACTION=1"); // 1 for post, 0 for get
  
  delay(5000);
  
  updateSerial();
  
  Serial1.println("AT+HTTPREAD"); // Read response, should be 1, 500, 21 and also will say Internal server error even though data has uploaded
  
  delay(5000);
  
  updateSerial();

  delay(1000);

}

void DownlinkData()
{
  Serial1.println("AT+HTTPACTION=0"); // 1 for post, 0 for get
 
  delay(5000);  
  
  updateSerial();
  
  Serial1.println("AT+HTTPREAD"); // Read response, should be 0, 200, number of bytes/bits? transmitted
  
  delay(5000);
  
  updateSerial();
  
  Serial1.println("AT+HTTPTERM"); // Terminate HTTP session
  
  delay(1000);
  
  updateSerial();
  
  Serial1.println("AT+SAPBR=0,1"); // Close bearer
  
  updateSerial();
}


void SDWrite(String device_name, Measurement m, float dataval, String timestr, String coords){

  myFile = SD.open("data.txt", FILE_WRITE);
  myFile.println("{\"key\":\"" + device_name + "\",\"measurement_name\":\"" + m.type + "\",\"unit\":\"" + m.unit + "\",\"value\":" + String(dataval) + "\",\"timestamp\":\"" + "\",\"lat\":\"" +  String(gps.location.lat()) + "\",\"lon\":\"" + String(gps.location.lng()) + "}"); // Creates post string
  myFile.close();
}

String SDRead(){
  myFile = SD.open("data.txt");
  while (myFile.available()) {
  dataout = String(myFile.read());
    }
  myFile.close();
  SD.remove("data.txt");
  return dataout;
}


int* readTurbidity()
{
  int16_t adc0, adc1, adc2, adc3;
  ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV
  blank_valuer = ads.readADC_SingleEnded(0);
  blank_value2r = ads.readADC_SingleEnded(1);
  delay(delay_blank);
  digitalWrite(red_led, HIGH);
  delay(2000);
  red_value = ads.readADC_SingleEnded(0);
  red_value2 = ads.readADC_SingleEnded(1);
  digitalWrite(red_led, LOW);
  delay(delay_intersample);

  blank_valueg = ads.readADC_SingleEnded(0);
  blank_value2g = ads.readADC_SingleEnded(1);
  delay(delay_blank);
  digitalWrite(green_led, HIGH);
  delay(2000);
  green_value = ads.readADC_SingleEnded(0);
  green_value2 = ads.readADC_SingleEnded(1);
  digitalWrite(green_led, LOW);
  delay(delay_intersample);

  blank_valueb = ads.readADC_SingleEnded(0);
  blank_value2b = ads.readADC_SingleEnded(1);
  delay(delay_blank);
  digitalWrite(blue_led, HIGH);
  delay(2000);
  blue_value = ads.readADC_SingleEnded(0);
  blue_value2 = ads.readADC_SingleEnded(1);
  digitalWrite(blue_led, LOW);

  int16_t red_corrected = red_value - blank_valuer;
  int16_t green_corrected = green_value - blank_valueg;
  int16_t blue_corrected =  blue_value - blank_valueb;
  int16_t red_corrected2 = red_value2 - blank_value2r;
  int16_t green_corrected2 = green_value2 - blank_value2g;
  int16_t blue_corrected2 = blue_value2 - blank_value2b;

  static int RGB_vals[6] = {red_corrected, red_corrected2, green_corrected, green_corrected2, blue_corrected, blue_corrected2};
  return RGB_vals;
  
}

float readComTurbidity()
{
  samples = 0;
  digitalWrite(ActiveCTurb, HIGH); // Turn on commercial turbidity sensor
  for (i=0; i< NumSamples; i++) {  // take N samples in a row, with a slight delay
    
   samples+= analogRead(ComTurbPin);
   delay(10);
  }
  average = samples/NumSamples; // Calculate the average of all samples
  average = 5*average/1023; // Convert to voltage
  digitalWrite(ActiveCTurb, LOW); // Turn off commercial turbidity sensor
  return average;
}

float readpH()
{
  samples = 0;
  digitalWrite(ActivepH, HIGH); // Turn on pH sensor
  for (i=0; i< NumSamples; i++) {  // take N samples in a row, with a slight delay
   samples+= analogRead(pHPin);
   delay(10);
  }
  average = samples/NumSamples; // Calculate the average of all samples
  float pH = (-0.00165*average) + 41.122;
  digitalWrite(ActivepH, LOW); // Turn off pH sensor
  return pH;
}

float readWaterTemp()
{
  
  float Bval = 3950.0;   // best fit B-Value
  float Rstd = 10000.0;   // best fit standard resistance
  float Tstd = 25.0;     // best fit standard temp
  
  // Code modified from https://learn.adafruit.com/thermistor/using-a-thermistor
  Data = 0;
  digitalWrite(ActiveTherm, HIGH); // Turn on thermistor
  for (i=0; i< NumSamples; i++) {  // take N samples in a row, with a slight delay
   Data += ads.readADC_SingleEnded(2);  
   delay(10);
  }

  Data = Data/NumSamples;

  float stA = (1.0 / (Tstd + 273.15)) - ((1.0 / Bval) * log(Rstd));  // Steinhart A
  float stB = 1.0 / Bval;      // Steinhart B
  float Tc = 1.0 / (stA + (stB * log(Data))) - 273.15;
  digitalWrite(ActiveTherm, LOW); // Turn off Thermistor
  
  return Tc;
}

float readFluorescence()
{
  samples = 0;
  digitalWrite(ActiveFluor, HIGH); // Turn on fluorometer
  digitalWrite(blue_led_fluor, HIGH);
  for (i=0; i< NumSamples; i++) {  // take N samples in a row, with a slight delay
   samples+= analogRead(FluorometerPin);
   delay(100);
  }
  average = samples/NumSamples; // Calculate the average of all samples
  average = 5*average/1023; // Convert to voltage
  digitalWrite(ActiveFluor, LOW); // Turn off fluorometer
  digitalWrite(blue_led_fluor, HIGH);
  return average;
}

void loop()
{
  Initialize();

  delay(1000);  

  UplinkData(temperature, bme.readTemperature()); // Read temperature
  
  delay(1000);
  
  UplinkData(pressure, bme.readPressure()); // Read pressure

  delay(1000);
  
  UplinkData(humidity, bme.readHumidity()); // Read humidity

  delay(1000);
  
  int *Turbvals;
  
  Turbvals = readTurbidity();

  delay(1000);
  
  UplinkData(redturbidity, Turbvals[0]);

  delay(1000);

  UplinkData(redturbidity2, Turbvals[1]);

  delay(1000);

  UplinkData(greenturbidity, Turbvals[2]);

  delay(1000);

  UplinkData(greenturbidity2, Turbvals[3]);

  delay(1000);

  UplinkData(blueturbidity, Turbvals[4]);

  delay(1000);

  UplinkData(blueturbidity2, Turbvals[5]);

  delay(1000);

  UplinkData(comTurbidity, readComTurbidity());

  delay(1000);

  UplinkData(pH, readpH());

  delay(1000);

  UplinkData(waterTemp, readWaterTemp());

  delay(1000);

  UplinkData(fluorescence, readFluorescence());
}
