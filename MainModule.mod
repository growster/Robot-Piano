MODULE MainModule
    !***********************************************************
    Func robtarget SoundToPosition(num i)
        VAR robtarget PositionIntermediate;
        VAR num Excursion;
        !Read from file
        !Open "Home:/default.txt",FilePosition;!wait to change
        !SoundData:=ReadNum(FilePosition);
        Excursion:=ButtonLength*(7*SoundArray{i,1}+SoundArray{i,2}-1);
        PositionIntermediate:=offs(pCenter,0,Excursion,0);
        RETURN PositionIntermediate;
    ENDFUNC
    
    !Func num CalcTime(VAR robtarget TargetPositionIntermediate,VAR num Speed)
        !VAR robtarget CurrentPositionIntermediate;
        !CurrentPositionIntermediate:=CRobT();
        !MoveTime:=Abs(TargetPositionIntermediate.trans.x-CurrentPositionIntermediate.trans.x)/Speed;!unit:1s
        !RETURN MoveTime;
    !ENDFUNC
        
    PROC main()
        !MoveAbsJ Home,v1000,z50,Tool0;
        MoveL pHome,v300,fine,Tool0;
        MoveL pCenterAbove,v300,fine,Tool0;
        FOR i FROM 1 TO Dim(SoundArray,1) DO
            TargetPosition:=SoundToPosition(i);
            !TimeToWait:=CurrentSoundTime-CalcTime(TargetPosition,GlobalSpeed);
            ClkReset clock1;
            ClkStart clock1;
            MoveJ TargetPosition,vmax,fine,Tool0;
            TimeToWait:=CurrentSoundTime-ClkRead(clock1)-0.323;!unit:1s
            MoveL Offs(TargetPosition,0,0,-20),vmax,fine,Tool0;
            IF TimeToWait>0 THEN
                WaitTime TimeToWait;
            ENDIF
            MoveL TargetPosition,vmax,fine,Tool0;
        ENDFOR
        MoveL pCenterAbove,v300,fine,Tool0;
        MoveL pHome,v300,fine,Tool0;
    ENDPROC
   
ENDMODULE