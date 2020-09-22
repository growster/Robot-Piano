MODULE MainModule
    !***********************************************************
    Func robtarget SoundToPosition(num i)
        VAR robtarget PositionMiddle;
        VAR num Excursion;
        !Read from file
        !Open "Home:/default.txt",FilePosition;!wait to change
        !SoundData:=ReadNum(FilePosition);
        Excursion:=ButtonLength*(7*SoundArray{i,1}+SoundArray{i,2}-1);
        PositionMiddle:=offs(pCenter,0,Excursion,0);
        RETURN PositionMiddle;
    ENDFUNC
    
    Func num CalcTime(VAR robtarget TargetPositionMiddle,VAR num Speed)
        VAR robtarget CurrentPositionMiddle;
        CurrentPositionMiddle:=CRobT();
        MoveTime:=Abs(TargetPositionMiddle.trans.x-CurrentPositionMiddle.trans.x)/Speed*100;!unit:0.01s
        RETURN MoveTime;
    ENDFUNC
    
    PROC main()
        MoveAbsJ Home,v1000,z50,Tool0;
        MoveL pHome,v300,fine,Tool0;
        MoveL pCenterAbove,v300,fine,Tool0;
        FOR i FROM 1 TO Dim(SoundArray,1) DO
            TargetPosition:=SoundToPosition(i);
            TimeToWait:=CurrentSoundTime-CalcTime(TargetPosition,GlobalSpeed);!??
            MoveL TargetPosition,v200,fine,Tool0;
            MoveL Offs(TargetPosition,0,0,-20),v200,fine,Tool0;
            WaitTime TimeToWait/100;
            MoveL TargetPosition,v300,fine,Tool0;
        ENDFOR
        MoveL pCenterAbove,v300,fine,Tool0;
        MoveL pHome,v300,fine,Tool0;
    ENDPROC
   
ENDMODULE