      // write the projct name to the string object for visualisation
      SetProjectName(#ProjectInfos.ProjectName[0]);
      // continue with the revision number
      tmpretcode := SAFETY_FILE_GET_REVNBR(pSafety, #ProjectInfos.RevisionNumber[0], sizeof(_PRJ_INFO_STRING));

      if (tmpretcode = 0) then
        // write it to the connected string object
        SetRevisionNo(#ProjectInfos.RevisionNumber[0]);
        // and last but not least we read the SCPU name
        tmpretcode := SAFETY_FILE_GET_SCPUNAME(pSafety, #ProjectInfos.SCPUName[0], sizeof(_PRJ_INFO_STRING));

        if (tmpretcode = 0) then
          // and write it down for visualisation
          SetSCPUName(#ProjectInfos.SCPUName[0]);

          // set the propt command for entering the safety number
          SAFETY_DISABLE_USERPROMPT_CHECK(pSafety);

          // fine?
          if (tmpretcode = 0) then
          
          // send safety number
          tmpretcode := SAFETY_SET_SAFETY_NBR(pSafety, SafetyNumber);

            if (tmpretcode = 0) then
            // open the connection if everything is fine
            tmpretcode := SAFETY_OPEN_CONNECTION(pSafety);

            if (tmpretcode = 0) then
              // set the prompt command again for entering the password
              SAFETY_DISABLE_USERPROMPT_CHECK(pSafety);


              if (tmpretcode = 0) then
              tmpretcode := SAFETY_GET_RUNSTATE(pSafety, #RunState$USINT);

              // get the config state and the run state and go to finish step if everything is fine
                tmpretcode := SAFETY_GET_CFGSTATE(pSafety, #ConfigState$USINT);

                  if (tmpretcode = 0) then

                  tmpretcode := SAFETY_GET_RUNSTATE(pSafety, #runState$USINT);
                    if (tmpretcode = 0) then
                       if (GetPassword(#tmppwtxt[0]) = true) then
                          LoginLevel := 2;        
                        // send login level and password
                        tmpretcode := SAFETY_LOGIN(pSafety, LoginLevel$USINT, #tmppwtxt[0]);

                        // everything works so we can continue
                        if (tmpretcode = 0) then

                          // set servicemode
                          tmpretcode := SAFETY_SET_SERVICE_MODE(pSafety);

									  
                          // everything works so we can continue
                          if (tmpretcode = 0) then

                            // init lokal variable
                            tmptransferedbytes := 0;

                            repeat