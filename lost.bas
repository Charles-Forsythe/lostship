10 CLEAR 1500 : M$ = "ABCABCABCABC" : GOTO 20
11 'Print with line breaks. Z$=string ZS=1 split scroll Z=2 no scroll
13 ZL$="":IF POS(0) + LEN(Z$) < 64 THEN 16
14 for T1 = (64-POS(0)) to 1 step -1:if MID$(Z$, T1, 1) <> " " then next t1:goto 16
15 ZL$ = RIGHT$(Z$, LEN(Z$) - T1):Z$ = LEFT$(Z$, T1)
16 PRINT Z$;:IF ZS=2 and zl$="" THEN 18
17 IF ZS = 1 then gosub 530 else print
18 if ZL$<>"" then Z$=ZL$:gosub 11:'I know how to use recursion now! -CF 2021
19 return
20 M=VARPTR(M$):M1=PEEK(M+1):M2=PEEK(M+2)
30 FOR T = 0 TO 11 : READ M : POKE T + (M2 * 256 + M1), M : NEXT : DATA 33, 128, 62, 17, 64, 62, 1, 128, 1, 237, 176, 201 
90 CLS:R=24:O=29
100 DIM ZL$(4):DIM RD$(R,2),OS$(3,2),DH$(R):IF PEEK(16396)=195 THEN D1=1:DEFUSR0=M2*256+M1 :ELSE POKE 16526,M1:POKE 16527,M2
110 DIM O$(O),P(O):FOR T=1 TO 6:READ AD$(T):NEXT:AL=70:I$="X":I=VARPTR(I$):POKE I+1,197:POKE I+2,63
120 FOR T=1 TO 3:READ OS$(T,1),OS$(T,2):NEXT:READ VH$:READ VI$:VH$=VH$+VI$:VI$="":'Don't do load game GOTO 1880
130 CLS:PRINT@768,CHR$(168)CHR$(176)CHR$(178)CHR$(191)CHR$(177)CHR$(176)CHR$(148)"  LOST SHIP ADVENTURE"
140 PRINTCHR$(172)CHR$(144)" "CHR$(191)" "CHR$(160)CHR$(156)"  BY CHARLES FORSYTHE":PRINT CHR$(130)STRING$(5,131)CHR$(129)
150 PRINT@0,"<"STRING$(22,"-")"Lost Ship Adventure"STRING$(21,"-")">"
160 FOR T=1 TO R:READ RD$(T,1),RD$(T,2):NEXT:FOR T=1 TO O:READ O$(T),P(T):NEXT:FOR T=1 TO R:READ DH$:RD$(T,2)=DH$+RD$(T,2):NEXT:Y1=1
170 PRINT@64,STRING$(255,32):PRINT:PRINT:PRINT@64,"";:z$=RD$(Y1,1):zs=0:gosub 11
180 ZS=2:PRINT@(320),"You see: ";:FOR T=1 TO O:IF P(T)<>Y1 THEN 200
190 FOR N=7 TO LEN(O$(T)):IF MID$(O$(T),N,1)="*" THEN Z$=MID$(O$(T),7,n-7):gosub 11 else next n
191 PRINT"  ";
200 NEXT T:IF PEEK(16416)=72 THEN PRINT"Nothing special"CHR$(30) :ELSE PRINT CHR$(30)
210 PRINT@448,"Obvious exits: ";:FOR T=1 TO 6:IF MID$(RD$(Y1,2),T,1)="1" THEN PRINT AD$(T)" ";:NEXT :ELSE NEXT
220 PRINT@512,"<-------------------------------------------------------------->";
230 PRINT@960,"---->";
240 IF PEEK(14502)=3 THEN PRINT CHR$(15);:GOTO 1050 :ELSE PRINT CHR$(14);:FOR T=1 TO 20:A$=INKEY$:IF A$="" THEN NEXT :ELSE 260
250 IF PEEK(14502)=3 THEN PRINT CHR$(15);:GOTO 1050 :ELSE PRINT CHR$(15);:FOR T=1 TO 20:A$=INKEY$:IF A$="" THEN NEXT:GOTO 240 :ELSE 260
260 IF ASC(A$)=8 AND POS(0)<>5 THEN 300
270 IF A$=CHR$(13) THEN 310' No saving :ELSE IF A$="["THEN PRINT CHR$(15);:GOTO 1970
275 IF ASC(A$) > 96 AND ASC(A$)<123 THEN A$ = CHR$(ASC(A$) - 32)
280 IF ASC(A$)<32 OR ASC(A$)>90 THEN 240
290 IF POS(0)=31 THEN 240 :ELSE IF A$=" " AND POS(0)=5 THEN 240
300 PRINT A$;:GOTO 240
310 IF POS(0)=5 THEN 240 :ELSE POKE I,POS(0)-5:I2$=I$:PRINT CHR$(15);:GOSUB 530
320 V$=LEFT$(I2$,4):IF MID$(V$,3,1)=" " AND RIGHT$(V$,1)<>" " THEN V$=LEFT$(V$,2)+"  "
330 GOSUB 450
340 IF RIGHT$(I2$,1)=" " THEN I2$=LEFT$(I2$,LEN(I2$)-1):GOTO 340
350 FOR NP=LEN(I2$) TO 1 STEP -1:IF MID$(I2$,NP,1)<>" " THEN NEXT:N$="":NP=LEN(I2$)+1 :ELSE N$=MID$(I2$,NP+1,4)
360 FOR T=1 TO LEN(VH$) STEP 6
370 IF V$<> MID$(VH$,T,4) THEN NEXT:PRINT"I don't know how to "CHR$(34)LEFT$(I2$,NP-1)CHR$(34)" something.";:GOTO 911 :ELSE V=VAL(MID$(VH$,T+4,2)):VN=(T-1)/6+1
380 N$=N$+STRING$(4-LEN(N$)," "):IF V=3 THEN 410 :ELSE IF VN=22 THEN 440
390 IF N$="    "THEN N=0:GOTO 440 :ELSE IF N$="SUIT"THEN PRINT"You're wearing it and you can't reach the zipper.";:GOTO 911
400 FOR T=1 TO O:IF N$<>LEFT$(O$(T),4) THEN NEXT:PRINT"I don't know what a "CHR$(34)MID$(I2$,NP+1)CHR$(34)" is.";:GOTO 911 :ELSE N=T:GOTO 420
409 'GO
410 if y1 = 8 and n$="STAI" print "The guard dog won't let you go that way.";:goto 911
415 FOR T=7 TO LEN(RD$(Y1,2))STEP 2:IF LEFT$(N$,2)=MID$(RD$(Y1,2),T,2) THEN Y1=VAL(MID$(RD$(Y1,2),T+2,2)):GOTO 170 :ELSE NEXT:PRINT"You can't go that way yet...";:GOTO 911
420 FOR T=7 TO LEN(O$(N)):IF MID$(O$(N),T,1)<>"*"THEN NEXT
430 IF MID$(O$(N),T-1,1)="s" AND MID$(O$(N),T-2,1)<>"s" THEN HM=2 :ELSE HM=1
440 ON V GOTO 930,1110,170,1140,1270,1340,1440,1530,1050,1570,1620,1760,1830,900,910,920
450 IF Y1=1 OR Y1>7 THEN 480 :ELSE AL=AL-1:IF AL=0 THEN PRINT"You have run out of air in your tanks! You have drowned";:GOSUB 530:INPUT"Play again?";A$:IF LEFT$(A$,1)="Y"THEN RUN :ELSE CLS:END
460 IF AL=1 THEN PRINT"Your air gauge reads in the red!";:GOSUB 530:GOTO 480
470 IF AL<10 THEN PRINT"Your air gauge reads in the yellow...";:GOSUB 530
480 MT=MT-1:IF MT<>0 THEN RETURN
490 IF P(19)=8 THEN P(19)=14:MT=-1:RETURN
500 IF P(11)>7 AND P(11)<14 THEN P(11)=-2
510 IF P(17)>7 AND P(17)<14 THEN P(17)=-2
520 MT=5:P(19)=8:RETURN
530 J=USR(I):PRINT@960,CHR$(30);:RETURN
540 DATA NORTH, SOUTH, EAST, WEST, UP, DOWN
550 DATA That's, Those are, is too much, are too many, that, those
560 DATA GET 01DROP02GO  03EXAM04WITH05SET 06ENTE03GIVE07TAKE01PICK01CLIM03PLOT06BREA08INVE09READ04OPEN10UNLO10KILL11
570 DATA STAB11CUT 11STOR12SAY 11SMAS08SEAR04MARK06SWIM03CATC13FOLL03JUMP03EAT 11DIVE03QUIT14SCOR15HELP16LOWE11SAIL11SING11FEED11CHIP08LOOK04
579 'Locations
580 DATA You are floating above the water next to the side of a large ship. All the life rafts have been taken and the sails need repair.
590 DATA DO02UP08OC02SH08, You are underwater beneath a ship of some sort, UP01SU01EA03WE04NO06SO06
600 DATA You are underwater. You can't see the ship anymore!, NO07SO06EA04WE02
610 DATA You are underwater. You can't see the ship anymore!, NO05SO06EA02WE07, You are underwater. You can't see the ship anymore!, NO03SO07EA06WE05
620 DATA You are underwater. You can't see the ship anymore!, NO03SO05EA07WE04
630 DATA You are underwater at a coral reef.,NO05SO06EA03WE04UP24
635 DATA You are on the deck of the ship. It hasn't been touched in years. The rigging looks in good enough condition for the ship to sail.
640 DATA NO09ST09OC01UN02DO01, You are in the captain's study. It is wet in here. A ladder goes through the ceiling.
650 DATA UP11SO08LA11NE11, You are in the map room. The windows look out onto a secondary deck and then an endless ocean. The sea breeze comes through them.
660 DATA NO08WI12, You are in the crow's nest. You see something that might be an island in the east., DO09LA09OF05
670 DATA You are on a secondary deck in the stern of the ship. The windows of the map room overlook it.  The entrance to the cargo hold is here.
680 DATA DO13HO13EN13WI10RO10MA10, You are in the cargo hold. Most of the old cargo has decayed., UP12TR12
690 DATA You are swimming in a shallow area next to the ship.,UP08SH08BO08NO15, "You are on a beach next to the ocean. You can see the ship.",WA14OC14NO20
700 DATA You are in the jungle. You see a cave entrance., NO22SO20EA21WE18CA22, You are in the jungle. You can't find a path!
710 DATA NO16SO21EA20WE21, You are in the jungle. You can't find a path!, NO21SO21EA17WE18, You are in the jungle. You can't find a path!
720 DATA NO18SO21EA17WE20, You are on a faint path leading from the beach into a jungle., NO19SO15EA18WE18PA21
730 DATA You are in the jungle. You can't find a path!, NO21SO18EA19WE17, You are in a cave., SO16EA23PA23JU16
740 DATA You are in a cave passage. It is hard to see., WE22, You are on a beach. You see the ship in the distance., OC07NO07WA07SH07
749 'Nouns
750 DATA SHIP05Sailing ship*A sign says its name is "S.S DEATH FLOWER",1, SUIT02Diving suit*You are wearing it
760 DATA 1000, CORA05Coral*There is a strange formation of it here., 7, DOG 05Dog guarding south door*It growls when you come near. It looks hungry., 8
770 DATA BONE02Bones*They are coral encrusted bones of an old sailor., -1, FEAT02Feather*It's a pen!, 11, EGGS05Gull eggs*Nothing special
780 DATA 11, PAPE02Papers*They used to be maps but the ink has run, 10
790 DATA MAP 06Map on table*It is nailed down with tacks. An "X" marks the ship's       position., 10
800 DATA LADD06Ladder*It goes up through a trap door to the crow's nest., 9, DAGG03Jeweled dagger*Very good workmanship. The blade could chip through solid   rock!, 11
810 DATA SACK05Rotting sacks*The putrid sacks lie in a heap in one corner, 13, MACH06Rusted machine*It Is Too Corroded To Identify
820 DATA 13, NET 02Net*Small net for catching fish. it seems in good condition., 13
830 DATA SAIL05X*X, -1, COUR05X*X, -1, BAG 03Bag*It's full of gold!!!, 13, BOOK02Book*X, 9
840 DATA MANA05Fat manatee*There's something in it's mouth, -1, PIRA05Dead pirate*Let him rest in peace!, 22, ROCK05Rock*X, 23
850 DATA KEY 03Gold key*Nothing special, -2, SIGN06Sign stuck in sand*"TAKE TREASURES HERE AND SAY 'STORE'", 24
860 DATA FISH02Fishes*They swim quickly, 14, SAND05Sand*It makes up the beach., 15, FLAG05Black flag*It's the skull and cross bones!
870 DATA 8, SEAW05Seaweed*Nothing special, 14, STEA02Steak*It's all rotten. Not even a dog would eat it!, 8
875 DATA STAI05Stairs to lower deck*The dog won't let you close enough to look!, 8
880 DATA 000011, 111110,111100,111100,111100,111100,111110,100001,010010,100000,000001,000001,000010,100010,100000,111100,111100
890 DATA 111100,111100,111100,111100,011000,000100,100000
899 'QUIT
900 PRINT"You quit with"TS"treasures. That's "TS*25"%.";:GOSUB 530:GOSUB 530:PRINT@896,"";:END
909 'SCORE
910 PRINT"You have"TS"treasures stored.";:IF TS=4 THEN GOSUB 530:PRINT "That's all there are.";
911 GOSUB 530:GOTO 230
919 'HELP
920 PRINT"Try examining things.";:GOTO 911
929 'GET
930 IF N=7 AND Y1=11 PRINT"A seagull flies and hits you from behind. You fall into the";:GOSUB 530:PRINT"ocean and lose everything you are holding.";:GOSUB 530:FOR T=3 TO O:IF P(T)=1000 P(T)=6:NEXT:Y1=4:GOTO 170 :ELSE NEXT:Y1=4:GOTO170
931 IF P(N)=1000 THEN PRINT"You have "OS$(3,HM)" already!";:GOTO 911
932 IF P(N)<>Y1 THEN PRINT OS$(1,HM)" not here.";:GOTO 911
940 IF N=19 THEN PRINT"It's too fat!";:GOTO 911
950 IF N=4 OR N=20 THEN 1140
960 IF N=21 AND LEFT$(O$(21),1)="R" THEN PRINT"It's a big rock!";:GOTO 911
970 IF N=24 AND Y1=14 THEN PRINT"You have to 'CATCH' them first.";:GOTO 911
980 IF N=26 THEN PRINT"It's up too high!";:GOTO 911
1010 OT=VAL(MID$(O$(N),5,2)):IF OT=5 THEN PRINT"There "OS$(2,HM)" to get!";:GOTO 911
1020 IF OT=6 THEN PRINT OS$(1,HM)" held down by something.";:GOTO 911
1030 IF OQ=5 THEN PRINT"You have too much already.";:GOTO 911
1040 OQ=OQ+1:P(N)=1000:PRINT"You get "OS$(3,HM);:GOSUB 530:GOTO 180
1049 'INVENTORY
1050 PRINT"You have: ";:FOR T=1 TO O:IF P(T)<>1000 THEN NEXT T:GOTO 1090
1060 FOR N=7 TO LEN(O$(T)):N$=MID$(O$(T),N,1):IF N$="*" THEN 1100 :ELSE PRINT N$;
1070 IF POS(0)=60 THEN GOSUB 530
1080 NEXT N:NEXT T
1090 GOTO 911
1100 IF POS(0)>58 THEN GOSUB 530:NEXT T:GOTO 1090 :ELSE PRINT"    ";:NEXT T:GOTO 1090
1110 'DROP
1120 IF P(N)<>1000 THEN PRINT"You don't have "OS$(3,HM)"!";:GOTO 911
1130 OQ=OQ-1:P(N)=Y1:PRINT"You drop "OS$(3,HM)".";:GOSUB 530:GOTO 180
1139 'EXAM
1140 IF P(N)<>Y1 AND P(N)<>1000 THEN PRINT OS$(1,HM)" not here.";:GOTO 911
1141 IF N=7 THEN 930
1150 IF N=6 THEN O$(N)="PEN 02Pen*It's a pen!":GS=1
1160 IF N=21 AND LEFT$(O$(21),1)="R" THEN O$(21)="CHES02Chest*It's a treasure chest, but it's locked.":GS=1
1170 IF N<>18 THEN 1220' This shouldn't be needed :ELSE IF P(18)<>Y1 AND P(18)<>1000 THEN 1210
1180 PRINT"Full fathom five thy father lies;";:GOSUB 530:PRINT"Of his bones are coral made;";
1190 GOSUB 530:PRINT"Those were pearls that were his eyes.";:GOSUB 530:PRINT"Nothing of hime that doth fade";:GOSUB 530
1200 PRINT"But doth suffer a sea change.";:GOSUB 530:PRINT"Into something rich and strange...";:GOTO 911
1210 '
1220 '
1230 FOR T=7 TO LEN(O$(N)):IF MID$(O$(N),T,1)<>"*" THEN NEXT
1240 FOR X=T+1 TO LEN(O$(N)):PRINT MID$(O$(N),X,1);:IF POS(0)=60 THEN: GOSUB 530:NEXT :ELSE NEXT
1250 GOSUB 530
1260 IF GS=1 THEN GS=0:GOTO 180 :ELSE 230
1269 'WITH
1270 IF N=11 AND Y1=7 AND P(5)=-1 THEN PRINT"You've uncovered something";:GOSUB 530:P(5)=7:GOTO 170
1280 IF N=14 AND P(24)<>Y1 PRINT"They're not here.";:GOTO 911
1290 IF N=14 AND OQ=5 PRINT"You have too much already.";:GOTO 911
1300 IF N=14 AND P(14)<>1000 THEN PRINT"You don't have that.";:GOTO 911
1310 IF N=11 AND Y1=7 PRINT"You've broken enough already.";:GOTO 911
1320 IF N=14 THEN OQ=OQ+1:P(24)=1000:PRINT"O.K.";:GOSUB 530:GOTO 170
1330 PRINT"It doesn't work.";:GOTO 911
1339 'SET/PLOT
1340 IF N=15 THEN 1400
1350 IF Y1<>10 THEN PRINT"You can't do that here!";:GOTO 911
1360 IF N<>16 AND N<>9 THEN PRINT"You can't "V$ " "OS$(3,HM)"!";:GOTO 911
1370 IF P(6)<>1000 OR LEFT$(O$(6),1)="F" THEN PRINT"You don't have anything to mark the map with!";:GOTO 911
1380 IF CS=0 THEN PRINT"You mark a course to a near island in the east.";:GOSUB 530:CS=1:O$(9)="MAP 06Map on table*Stuck down with tacks. It now has a course plotted.":GOTO 230
1390 PRINT"You've done that already.";:GOTO 911
1400 IF Y1<8 OR Y1>13 THEN PRINT"You can't do that here!";:GOTO 911 :ELSE IF CS=0 THEN PRINT"You have no course!";:GOTO 911
1410 IF CS=1 THEN CS=2:MT=10:P(19)=15
1420 IF CS=2 THEN RD$(8,2)="110001DO14OC14NO09SO10WA14ST09":P(7)=-1:CS=3:PRINT"You sail along the course.";:GOSUB 530:P(1)=14:GOTO 230
1430 IF CS=3 THEN RD$(8,2)="110001NO09ST09UN02DO01OC01RO10SO10":P(7)=11:CS=2:PRINT"You reverse course to your original position.";:P(1)=1:GOSUB530:GOTO 230
1439 'GIVE
1440 IF Y1<>8 THEN 1480
1450 IF P(N)<>1000 THEN PRINT"You don't have "OS$(3,HM)".";:GOTO 911
1460 IF N<>5 THEN PRINT"O.K... nothing happens.";:OQ=OQ-1:GOSUB 530:P(N)=Y1:GOTO 180
1470 P(5)=-1:z$="The dog takes the bones to the top of the stairs and begins gnawing them.":ZS=1:gosub 11:OQ=OQ-1
1475 O$(4)="DOG 05Dog gnawing bones*It growls when you come near.":RD$(8,2)="110001NO09ST09UN02OC01RO10SO10DO01":GOTO 170
1480 IF N<>24 OR Y1<>P(19) OR P(N)<>1000 THEN 1520
1490 OQ=OQ-1:PRINT"The manatee takes the fish. when he opens his mouth,something";:GOSUB 530
1500 PRINT"falls out.";:GOSUB 530:FOR T=1 TO O:IF P(T)=-2 THEN P(T)=Y1:NEXT :ELSE NEXT
1510 P(19)=-1:P(24)=-1:PRINT"The manatee goes off";:GOSUB 530:GOTO 170
1520 IF P(N)<>1000 THEN PRINT"You don't have "OS$(3,HM)".";:GOTO 911 :ELSE PRINT"O.K... nothing happens.";:OQ=OQ-1:GOSUB 530:P(N)=Y1:GOTO 180
1529 'BREAK/CHIP
1530 IF N=7 THEN 930
1540 IF N=3 AND Y1=7 THEN PRINT"With what, i.e. "CHR$(34)"WITH FEATHER"CHR$(34);:GOTO 911
1550 IF N=3 THEN PRINT"It's not here.";:GOTO 911
1560 PRINT"You can't break that.";:GOTO 911
1569 'UNLOCK/OPEN
1570 IF N<>21 THEN PRINT"You can't open "OS$(3,HM);:GOSUB 530:GOTO  230
1580 IF MID$(O$(21),7,1)="O"THEN PRINT"It's open already!";:GOTO 911
1590 IF P(21)<>1000 AND P(21)<>Y1 THEN PRINT"It's not here.";:GOTO 911
1600 IF P(22)<>1000 THEN PRINT"It's locked and you don't have anything to open it with!";:GOTO 911
1610 PRINT"O.K.";:GOSUB 530:O$(21)="CHES03Open chest*It's full of gems.":GOTO 170
1619 'KILL/STAB/SING/FEED/LOWE
1620 IF VN=18 OR VN=19 OR VN=20 THEN PRINT"Don't be so destructive!";:GOTO 911
1630 IF VN<>22 THEN 1650 :ELSE PRINT CHR$(34);:FOR X=1 TO LEN(I2$):IF MID$(I2$,X,1)<>" " THEN NEXT:PRINT CHR$(34);:GOTO 911
1640 FOR T=X+1 TO LEN(I2$):PRINT MID$(I2$,T,1);:NEXT:PRINT CHR$(34);:GOTO 911
1650 IF VN=30 AND N=28 AND P(28)=1000 THEN P(N)=-1:PRINT"You feel sick.";:GOSUB 530:GOTO 180
1660 IF VN=30 AND N=28 AND P(28)=Y1 THEN P(28)=-1:PRINT"You feel sick.";:GOSUB 530:GOTO 180
1670 IF VN=35 AND Y1=8 THEN PRINT"There is no rope.";:GOTO 911
1680 IF VN=35 THEN PRINT"There is nothing to lower here.";:GOTO 911
1690 IF VN=36 THEN N=15:GOTO 1340
1700 IF VN=37 THEN PRINT"LA LA LA DEE DA...";:GOTO 911
1710 IF VN=30 AND N=28 THEN PRINT"That's not here!";:GOTO 911
1720 IF VN=30 THEN PRINT"It would be foolish to eat "OS$(3,HM)"!";:GOTO 911
1730 IF VN=38 AND Y1=8 AND P(4)=8 THEN PRINT"If he's hungry 'GIVE' him something.";:GOTO 911
1740 IF VN=38 AND Y1=P(19) THEN PRINT"If it's hungry 'GIVE' it something.";:GOTO 911
1750 PRINT"There's nothing to 'FEED' here.";:GOTO 911
1759 'STORE
1760 IF Y1<>24 THEN PRINT"You can't do that here.";:GOTO 911 :ELSE 1780
1770 OQ=OQ-1:TS=TS+1:P(N)=-1:PRINT"Score:"TS"treasures.";:GOTO 911
1780 IF N=21 THEN 1820
1790 IF N=0 THEN PRINT"Store what?";:GOTO 911
1800 IF VAL(MID$(O$(N),5,2))<>3 THEN PRINT OS$(1,HM)" not a treasure!";:GOTO 911
1810 IF P(N)<>1000 THEN PRINT"You can't store something you don't have!";:GOTO 911
1815 IF N<>21 THEN 1770
1820 IF MID$(O$(21),7,1)<>"O"THEN PRINT"You're not sure it's a treasure, it could be full of dirt!";:GOTO 911 :ELSE 1770
1829 'CATCH
1830 IF N=17 THEN PRINT"It's too big to catch.";:GOSUB 530
1840 IF N=4 THEN PRINT"You try but it bites you.";:GOTO 911
1850 IF N<>24 THEN PRINT"You can't catch "OS$(3,HM)".";:GOTO 911
1860 IF Y1<>P(24) THEN PRINT"Those are not here.";:GOTO 911
1870 PRINT"With what i.e. " CHR$(34) "WITH FEATHER"CHR$(34)".";:GOTO 911
1880 PRINT@0,"<"STRING$(22,"-")"LOST SHIP ADVENTURE"STRING$(21,"-")">":PRINT:PRINTTAB(24) STRING$(17,176):PRINTTAB(24) CHR$(191)" 1) NEW GAME   "CHR$(191):PRINTTAB(24) CHR$(191)" 2) SAVED GAME "CHR$(191):PRINTTAB(24) STRING$(17,131)
1890 '
1900 '
1910 '
1920 '
1930 '
1940 PRINT:PRINT"    TO SAVE A GAME TO DISK, SIMPLY PRESS THE 'UP ARROW' KEY"
1950 PRINTTAB(28)"GOOD LUCK"
1955 A$=INKEY$:IF A$=""THEN 1955 :ELSE IF A$="2" THEN 2000 :ELSE IF A$<>"1" THEN 1955
1960 GOTO 130
1970 GOSUB 530:PRINT"SAVING TO DISK.";:GOSUB 530:A$=INKEY$:FOR T=1 TO 500:NEXT:PRINT"PRESS <ENTER>";:GOSUB 530
1980 IF INKEY$<>CHR$(13) THEN 1980 :ELSE IF D1=1 THEN CMD"T"
1990 OPEN"O",1,"LSDATA"
1991 PRINT#1,O$(6):PRINT#1,O$(9):PRINT#1,O$(21):PRINT#1,RD$(8,2)
1992 FOR T=1 TO O STEP 4:PRINT#1,P(T)
1993 PRINT#1,P(T+1):PRINT#1,P(T+2):PRINT#1,P(T+3)
1994 NEXT
1995 PRINT#1,OQ,Y1
1996 PRINT#1,AL,CS
1997 PRINT#1,MT,TS
1998 CLOSE 1:CLS:END
2000 PRINT"TO LOAD PREVIOUSLY SAVED GAME -- PRESS <ENTER>"
2010 IF INKEY$<>CHR$(13) THEN 2010
2020 FOR T=1 TO R:READ RD$(T,1),RD$(T,2):NEXT:FOR T=1 TO O:READ O$(T),P:NEXT
2030 FOR T=1 TO R:READ DH$:RD$(T,2)=DH$+RD$(T,2):NEXT:IF D1=1 THEN CMD"T"
2040 OPEN"I",1,"LSDATA"
2042 INPUT#1,O$(6),O$(9),O$(21),RD$(8,2)
2043 FOR T=1 TO O STEP 4
2044 INPUT#1,P(T):INPUT#1,P(T+1):INPUT#1,P(T+2):INPUT#1,P(T+3)
2045 NEXT
2046 INPUT#1,OQ,Y1
2047 INPUT#1,AL,CS
2048 INPUT#1,MT,TS
2049 CLOSE 1:CLS
2050 PRINT@0,"<"STRING$(22,"-")"LOST SHIP ADVENTURE"STRING$(21,"-")">":GOTO 170
4001 'Copyright (c) 2021 Charles Forsythe
4002 '
4003 'Permission is hereby granted, free of charge, to any person obtaining a copy
4004 'of this software and associated documentation files (the "Software"), to deal
4005 'in the Software without restriction, including without limitation the rights
4006 'to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
4007 'copies of the Software, and to permit persons to whom the Software is
4008 'furnished to do so, subject to the following conditions:
4009 '
4010'The above copyright notice and this permission notice shall be included in all
4011'copies or substantial portions of the Software.
4012'
4013'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
4014'IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
4015'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
4016'AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
4017'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
4018'OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
4018'SOFTWARE.
