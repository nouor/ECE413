<img align="right"  src="https://user-images.githubusercontent.com/76975105/103967327-9bcd8580-5116-11eb-875d-a8a945ed88e3.png">
![google icon](https://th.bing.com/th/id/Rcbc91b79e3dd4579132f53c0133708a8?rik=Rd2rkYu9n98nfg&riu=http%3a%2f%2fwww.bu.edu.eg%2fportal%2fuploads%2fNewsImgs%2f1486454345.jpg&ehk=cGdMNJ0HatPPFD%2b1sM06OhCTR1bQiLc%2bEPYOJA2cPcc%3d&risl=&pid=ImgRaw)
   ### Shoubra Faculty Of Engineering
   
 <h1 align="center">  Stepper motor controller with rotation and speed levels functionality </h1>
  
 <h2 align="center"> Supervisors : Dr. Abdelhamid Attaby </h2>
 <h2 align="center">Eng. Ahmed bakr</h2>
 
#### Nour eldein Mohamed

 #### Hind Emad Elsayed

#### Kholoud Elsayed

#### Nour elhoda osama

#### Maria kamel  

#### Data of Submission: [11/1/2021]
---
## Project Description
Our project explain how to controlling stepper motor rotation by using 3switches: Half Step Switch,Full Step Switch and Stop Switch
we will add another Switch called Get Tempreture ,used to get command from Keypad that connected with Microcintroller (AT89C51RD2).
Stepper motor rotaining by using :-

**1.Half Step Switch:-**

When the half step switch is pressed, the stepper motor will rotate by angles which are multiplies of 45(45,90,135,...360).
it repeates several times until stop switch is pressed.

**2-Full Step Switch:-**

When the full step switch is pressed, the stepper motor will rotate by angles which are multiplies of 90(90,180,270,...360).
it repeates several times until stop switch is pressed.

**3-Stop Switch:-**

It is used to stop stepper motor rotation but if it pressed when the motor rotates in the middle of full rotation or half rotation the motor is rotates first to 360° and then stop.

**4-Get From Keypad Switch:-**

When Get From Keypad Switch is pressed the angle is taken from the keypad. After writing the number in the keypad the (*)button must be pressed which represents the enter button and then the motor will rotate one time with this angle.

---

 ## Components
- Stepper Motor
- Resistance
- Keypad
- L293D
- Button
- AT89C51RD2
---


## How to Work?
1- We choose Microcontroller AT89C51RD2 Features in 8051 Instruction Compatible and get datasheet as shown in Reference.

2- Studying Playlist with 8051 found in Reference .

3- Each one in team Creat Account in Github.

4- open Datasheet and Get How to Interface Switches in Microcontroller .

5- How to coding Timer and Interface Keypad in Microcontroller.

6- Simulation components by using Proteus.

7- Upload code in Proteus and Check it.

---

## System Design:

![micro (1)](https://user-images.githubusercontent.com/76975105/103894599-042f4f00-50a4-11eb-86f1-e77cd3511361.png)

---
## Reference

**1-Microprocessor 8051**

https://www.youtube.com/playlist?list=PLXus5Oy3gD22Htt2_sox71InuHy_QbCAx

https://www.electronicshub.org/8051-microcontroller-assembly-language-programming/

https://www.tutorialspoint.com/embedded_systems/es_microcontroller.htm

**2- Datasheet of Microcontroller AT89C51RD2**

https://www.alldatasheet.com/datasheet-pdf/pdf/256131/ATMEL/AT89C51RD2.html

**3-External Interrupts 8051 Microcontroller**

https://microcontrollerslab.com/interrupts-8051-microcontroller/

**4-Delay using 8051 timer**

https://www.circuitstoday.com/delay-using-8051-timer

**5-Interfacing hex keypad to 8051**

https://www.circuitstoday.com/interfacing-hex-keypad-to-8051

**6- Interface Stepper motor with Driver L293D**

https://electrosome.com/interfacing-dc-motor-8051-keil-c-at89c51/

https://www.8051projects.net/wiki/Stepper_Motor_Tutorial





