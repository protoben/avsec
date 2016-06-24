## Goals

- Set up a basic platform for doing experiments on autonomous vehicles
- Get up to speed with the state of the art so we can figure out what research
  questions would be interesting to ask
- Experiment ideas
  + Use a computer-vision approach to navigation
  + Explore the vulnerabilities of the standard sensors we're using
  + See how far we can go with security using Ivory/Tower

## Component candidate list

### Core logic unit
- [Raspberry Pi Zero](https://www.amazon.com/Raspberry-Pi-Zero-Camera-Version/dp/B01GEHPI0E/ref=sr_1_4?ie=UTF8&qid=1466619833&sr=8-4&keywords=pi+zero)
  - $22.90
  - 23g wt.

### Obstacle sensors
- [Raspberry Pi FFC camera (x2)](https://www.amazon.com/Raspberry-5MP-Camera-Board-Module/dp/B00E1GGE40/ref=sr_1_1?ie=UTF8&qid=1466465854&sr=8-1&keywords=raspberry+pi+5mp+camera+board+module)
  - $32 = $16x2
  - ~0.6g wt = ~0.3gx2
- [Raspberry Pi multi-camera adapter](https://www.amazon.com/Arducam-Camera-Adapter-Compatible-Raspberry/dp/B012UQWOOQ)
  - $53
  - ~0.3g wt
- [Ultrasonic range finder, 5-pc kit](https://www.amazon.com/CJRSLRB%C2%AE-Ultrasonic-Measuring-Transducer-Duemilanove/dp/B016XJABP0/ref=sr_1_fkmr1_3?ie=UTF8&qid=1466619689&sr=8-3-fkmr1&keywords=sonic+sensor+breakout)
  - $11
  - 1.6g wt.

### F450 kit alternative
- [F450 ARF kit](https://www.amazon.com/gp/product/B00G4A2RBU/ref=ox_sc_act_title_6?ie=UTF8&psc=1&smid=A1YFBJ3XA49LVS)
  - $199
- [GPS and compass](https://www.amazon.com/gp/product/B013UW2KKM/ref=ox_sc_act_title_2?ie=UTF8&psc=1&smid=A9QIOY9HGDU88)
  - $24.39
- [APM2.8 Flight Controller](https://www.amazon.com/Hobby-Ace-Apm2-8-Controller-Absorber-Multicopter/dp/B015CPDD4W/ref=pd_sim_sbs_107_18?ie=UTF8&dpID=41X83lZQFVL&dpSrc=sims&preST=_AC_UL160_SR160%2C160_&refRID=ASX4CM6CN5EX7GEJC5F5)
  - $49.99

### Battery
- [Turnigy 3S 20C 1300mAh LiPo battery](https://www.amazon.com/Turnigy-1300mAh-20C-Lipo-Pack/dp/B0072AEKY8/ref=sr_1_7?ie=UTF8&qid=1466620852&sr=8-7&keywords=3s+lipo+battery)
  - $14.99
  - 111g wt.
- [RiteCharge iMAX B6 multi-chemistry computerized battery charger](https://www.amazon.com/RiteCharge-Professional-Battery-Discharger-Charging/dp/B01DB1BWGA/ref=sr_1_11?ie=UTF8&qid=1466621122&sr=8-11&keywords=lipo+battery+charger)
  - $24.95

### Total: $432.22

## Things we probably don't need:

### IMU
_Intertial Measurement Unit (provides flight control telemetry)_
- [AdaFruit 10-DOF IMU (Gyro, Accel, Magnet, Alti) - IIC breakout](https://www.amazon.com/Adafruit-Accelerometer-Temperature-Gyroscope-L3GD20H/dp/B00QPQ60YS/ref=sr_1_1?ie=UTF8&qid=1466615995&sr=8-1&keywords=Adafruit+10-DOF+IMU)
  - ~$32

### GPS unit
- [AdaFruit Ultimate GPS Breakout](https://www.amazon.com/Adafruit-Ultimate-GPS-Breakout-channel/dp/B00GLW4016/ref=sr_1_1?ie=UTF8&qid=1466615843&sr=8-1&keywords=gps+breakout)
  - ~$40

### Flight control unit
_(This may, or may not, be the same component as the flight controller)_

### Quadcopter kit
- [Flamewheel F450](https://www.amazon.com/Quadcopter-controller-Bracket-Brushless-Propeller/dp/B01AABWVJQ/ref=pd_sim_sbs_236_2?ie=UTF8&dpID=51Ot8nhK9dL&dpSrc=sims&preST=_AC_UL160_SR160%2C160_&refRID=BS56TV6NS53WK075R7TA)
  - $141.66

