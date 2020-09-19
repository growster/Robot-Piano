MODULE MainModule
    !***********************************************************
    PERS tooldata Tool1:=[TRUE,[[0,0,1],[1,0,0,0]],[1,[0,0,0],[1,0,0,0],0,0,0]];
    !***********************************************************
    Func robtarget SoundToPosition()
        VAR robtarget PositionMiddle;
        Open "Home:/default.txt",FilePosition;!wait to change
        SoundData:=ReadNum(FilePosition);
        !???????? ???????
        RETURN PositionMiddle;
    ENDFunc
    
    Func num CalcTime(VAR robtarget TargetPositionMiddle,VAR num Speed)
        VAR robtarget CurrentPositionMiddle;
        CurrentPositionMiddle:=CRobT();
        MoveTime:=Abs(TargetPositionMiddle.trans.x-CurrentPositionMiddle.trans.x)/Speed*100;!unit:0.01s
        RETURN MoveTime;
    ENDFUNC
    
    PROC main()
        GlobalSpeed:=1000;
        MoveAbsJ Home,v1000,z50,Tool1;
        MoveL pHome,v300,fine,Tool1;
        MoveL pCenterAbove,v300,fine,Tool1;
        FOR i FROM 1 TO Length DO
            TargetPosition:=SoundToPosition();
            TimeToWait:=CurrentSoundTime-CalcTime(TargetPosition,GlobalSpeed);!??
            MoveL TargetPosition,v200,fine,Tool1;
            MoveL Offs(TargetPosition,0,0,-20),v200,fine,Tool1;
            WaitTime TimeToWait/100;
            MoveL TargetPosition,v300,fine,Tool1;
        ENDFOR
    ENDPROC
   
ENDMODULE