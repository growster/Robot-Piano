MODULE PointModule
    !***********************************************************
    !
    !***********************************************************
    CONST jointtarget Home:=[[0,0,0,0,90,0],[9e9,9e9,9e9,9e9,9e9,9e9]];
    CONST robtarget pHome:=[[100,200,300],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pCenterAbove:=[[100,200,200],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    CONST robtarget pCenter:=[[100,200,100],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    !VAR robtarget CurrentPosition:=[[100,200,300],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    VAR robtarget TargetPosition:=[[100,200,300],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];
    !***********************************************************
    VAR num MoveTime:=0;
    VAR num TimeToWait:=0;
    VAR num GlobalSpeed:=1000;
    VAR num CurrentSoundTime:=100;!unit 0.01s
    VAR num SoundData:=0;
    VAR num SoundData1:=0;
    VAR num SoundData2:=0;
    VAR num Length:=10;
    VAR num SoundArray{14,2}:=[[0,1],[0,1],[0,5],[0,5],[0,6],[0,6],[0,5],[0,4],[0,4],[0,3]];
    !***********************************************************
    VAR iodev FilePosition;
ENDMODULE