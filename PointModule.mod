MODULE PointModule
    !***********************************************************
    CONST jointtarget Home:=[[0,0,0,0,90,0],[9e9,9e9,9e9,9e9,9e9,9e9]];
    CONST robtarget pHome:=[[290.00,0.00,220.20],[0,1,0,0],[0,0,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
    CONST robtarget pCenterAbove:=[[290,0,200],[0,1,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pCenter:=[[290.04,0.29,99.85],[0,1,0,0],[-1,1,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
    !VAR robtarget CurrentPosition:=[[290,200,300],[0,1,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    VAR robtarget TargetPosition:=[[290.00,336.73,100],[0,1,0,0],[0,1,0,0],[9E+9,9E+9,9E+9,9E+9,9E+9,9E+9]];
    !***********************************************************
    VAR num MoveTime:=0;
    VAR num TimeToWait:=0;
    VAR num GlobalSpeed:=1000;
    VAR num SoundData:=0;
    VAR num SoundData1:=0;
    VAR num SoundData2:=0;
    !****************basic*data*********************************
    CONST num ButtonLength:=22;
    CONST num BlackToWhite:=40;
    CONST num PressDepth:=8;
    VAR num CurrentSoundTime:=0.5;!unit 1s
    !VAR num NoteNo:=4;
    !*******************ini*************************************
    !VAR num per_minute:=120;
    !******pitch(step,alter,octave)******Middle C in step 4*****
    VAR num SoundArray{4,3}:=[[4,0,-13],[4,0,10],[4,0,0],[4,0,-10]];
    VAR string InputProcessStringArray{4,3};
    !***********************************************************
    VAR iodev FilePosition;
    VAR bool Rest:=FALSE;
    !***********************************************************
    VAR socketdev client_socket;
    VAR string received_string;
ENDMODULE