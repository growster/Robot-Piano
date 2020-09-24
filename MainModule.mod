MODULE MainModule
    !***********************************************************
    Func robtarget SoundToPosition(num i,num SoundArrayMiddle2{*,*})
        VAR robtarget PositionIntermediate;
        VAR num Excursion;
        !Read from file
        !Open "Home:/default.txt",FilePosition;!wait to change
        !SoundData:=ReadNum(FilePosition);
        IF SoundArrayMiddle2{i,3}<0 OR SoundArrayMiddle2{i,3}>7 THEN
            ErrWrite "?????","??????"\RL2:="???????";
            stop;
        ENDIF
        IF (SoundArrayMiddle2{i,2}<0)and(SoundArrayMiddle2{i,3}=1 or SoundArrayMiddle2{i,3}=4) THEN
            ErrWrite "?????","??????"\RL2:="???????";
            stop;
        ELSEIF (SoundArrayMiddle2{i,2}>0)and(SoundArrayMiddle2{i,3}=7 or SoundArrayMiddle2{i,3}=3) THEN
            ErrWrite "?????","??????"\RL2:="???????";
            stop;
        ENDIF
        Excursion:=ButtonLength*(7*(SoundArrayMiddle2{i,1}-4)+SoundArrayMiddle2{i,3}-1+SoundArrayMiddle2{i,2}/2);
        IF abs(Excursion)>55 THEN
            ErrWrite "??????","???????"\RL2:="???????";
            stop;
        ENDIF
        PositionIntermediate:=offs(pCenter,abs(SoundArrayMiddle2{i,2})*(-BlackToWhite),Excursion,0);
        RETURN PositionIntermediate;
    ENDFUNC
    
    !Func num CalcTime(VAR robtarget TargetPositionIntermediate,VAR num Speed)
        !VAR robtarget CurrentPositionIntermediate;
        !CurrentPositionIntermediate:=CRobT();
        !MoveTime:=Abs(TargetPositionIntermediate.trans.x-CurrentPositionIntermediate.trans.x)/Speed;!unit:1s
        !RETURN MoveTime;
    !ENDFUNC
    
    PROC Play(num SoundArrayMiddle1{*,*})
        FOR i FROM 1 TO Dim(SoundArrayMiddle1,1) DO
            TargetPosition:=SoundToPosition(i,SoundArrayMiddle1);
            !TimeToWait:=CurrentSoundTime-CalcTime(TargetPosition,GlobalSpeed);
            ClkReset clock1;
            ClkStart clock1;
            MoveJ TargetPosition,vmax,fine,Tool0;
            TimeToWait:=CurrentSoundTime-ClkRead(clock1)-0.323;!unit:1s
            MoveL Offs(TargetPosition,0,0,-PressDepth),vmax,fine,Tool0;
            IF TimeToWait>0 THEN
                WaitTime TimeToWait;
            ELSE
                ErrWrite \I,"?????","";
            ENDIF
            MoveL TargetPosition,vmax,fine,Tool0;
        ENDFOR
    ENDPROC
    PROC main()
        !MoveAbsJ Home,v1000,z50,Tool0;
        MoveL pHome,v300,fine,Tool0;
        MoveL pCenterAbove,v300,fine,Tool0;
        Play(SoundArray);
        MoveL pCenterAbove,v300,fine,Tool0;
        MoveL pHome,v300,fine,Tool0;
    ENDPROC
   
ENDMODULE