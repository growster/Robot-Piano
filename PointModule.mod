MODULE PointModule
    !***********************************************************
    !
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
    VAR num CurrentSoundTime:=100;!unit 0.01s
    VAR num SoundData:=0;
    VAR num SoundData1:=0;
    VAR num SoundData2:=0;
    VAR num ButtonLength:=10;
    VAR num SoundArray{14,2}:=[[0,1],[0,1],[0,5],[0,5],[0,6],[0,6],[0,5],[0,4],[0,4],[0,3],[0,3],[0,2],[0,2],[0,1]];
    !***********************************************************
    VAR iodev FilePosition;
ENDMODULE