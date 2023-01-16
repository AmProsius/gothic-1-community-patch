/*
 * Get a topic by its name
 */
func int G1CP_LogGetTopic(var string topic) {
    // Iterate over all topics (irrespective of their section)
    var int list; list = oCLogManager_Ptr;
    var zCList l;
    while(list);
        l = _^(list);
        list = l.next;
        if (l.data) {
            var oCLogTopic logTopic; logTopic = _^(l.data);
            if (Hlp_StrCmp(logTopic.m_strDescription, topic)) {
                return l.data;
            };
        };
    end;

    // Not found
    return 0;
};

/*
 * Check whether a certain log topic exists
 */
func int G1CP_LogHasTopic(var string topic) {
    return (G1CP_LogGetTopic(topic) != 0);
};

/*
 * Get the section of a log topic (LOG_MISSION or LOG_NOTE)
 */
func int G1CP_LogGetTopicSection(var string topic) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        return logTopic.m_enuSection;
    } else {
        return -1;
    };
};

/*
 * Get the status of a log topic
 */
func int G1CP_LogGetTopicStatus(var string topic) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        return logTopic.m_enuStatus;
    } else {
        return -1;
    };
};

/*
 * Set the section of a log topic (LOG_MISSION or LOG_NOTE)
 */
func void G1CP_LogSetTopicSection(var string topic, var int section) {
    // Define possibly missing symbols locally
    const int LOG_MISSION = 0;
    const int LOG_NOTE    = 1;

    if (section != LOG_MISSION) && (section != LOG_NOTE) {
        return;
    };

    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        logTopic.m_enuSection = section;
    };
};

/*
 * Rename the topic (does not perform any safety checks, i.e. if there is already a topic of the same name)
 * Use with caution!
 */
func void G1CP_LogRenameTopic(var string topic, var string newName) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        logTopic.m_strDescription = newName;
    };
};

/*
 * Remove a topic from the log completely
 */
func void G1CP_LogRemoveTopic(var string topic) {
    // Iterate over all topics (irrespective of their section)
    var int list; list = oCLogManager_Ptr;
    var int prev; prev = 0;
    var zCList l;
    while(list);
        l = _^(list);
        if (l.data) {

            // Check for match
            var oCLogTopic logTopic; logTopic = _^(l.data);
            if (Hlp_StrCmp(logTopic.m_strDescription, topic)) {

                // Remove this element from the list
                var int data; data = l.data;
                var int next; next = l.next;
                l.next = 0; // Important before calling the destructor below. Otherwise the entire list is deleted
                if (prev) {
                    l = _^(prev);
                    l.next = next;
                };

                // Destroy the topic and the list element
                const int oCLogTopic___oCLogTopic        = 7530272; //0x72E720
                const int zCList_oCLogTopic___destructor = 7532848; //0x72F130
                const int call = 0;
                const int one = -1; // Set all bits, because char
                if (CALL_Begin(call)) {
                    CALL__thiscall(_@(data), oCLogTopic___oCLogTopic);
                    CALL_PtrParam(_@(one));
                    CALL__thiscall(_@(list), zCList_oCLogTopic___destructor);
                    call = CALL_End();
                };

                return;
            };
        };

        prev = list;
        list = l.next;
    end;
};

/*
 * Get a log entry by its topic and its name
 */
func int G1CP_LogGetEntry(var string topic, var string entry) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);

        // Iterate over all entries of that topic
        var int list; list = _@(logTopic.m_lstEntries_data);
        var zCList l;
        while(list);
            l = _^(list);
            list = l.next;
            if (l.data) {
                if (Hlp_StrCmp(MEM_ReadString(l.data), entry)) {
                    return l.data;
                };
            };
        end;
    };

    // Not found
    return 0;
};

/*
 * Check whether a log topic has a certain entry
 */
func int G1CP_LogHasEntry(var string topic, var string entry) {
    return (G1CP_LogGetEntry(topic, entry) != 0);
};

/*
 * Replace the entry of a log topic
 */
func void G1CP_LogReplaceEntry(var string topic, var string needle, var string replace) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);

        // Iterate over all entries of that topic
        var int list; list = _@(logTopic.m_lstEntries_data);
        var zCList l;
        while(list);
            l = _^(list);
            list = l.next;
            if (l.data) {
                if (Hlp_StrCmp(MEM_ReadString(l.data), needle)) {
                    MEM_WriteString(l.data, replace);
                    return;
                };
            };
        end;
    };
};

/*
 * Remove the entry of a log topic
 */
func void G1CP_LogRemoveEntry(var string topic, var string entry) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);

        // Iterate over all entries of that topic
        var int list; list = _@(logTopic.m_lstEntries_data);
        var int prev; prev = 0;
        var zCList l;
        while(list);
            l = _^(list);
            if (l.data) {
                if (Hlp_StrCmp(MEM_ReadString(l.data), entry)) {

                    // Remove this element from the list
                    var int data; data = l.data;
                    var int next; next = l.next;
                    l.next = 0; // Important before calling the destructor below. Otherwise the entire list is deleted
                    if (prev) {
                        l = _^(prev);
                        l.next = next;
                    };

                    // Destroy the entry from the topic's entry list
                    const int oCLogEntry___oCLogEntry        = 7532544; //0x72F000
                    const int zCList_oCLogEntry___destructor = 7532784; //0x72F0F0
                    const int call = 0;
                    const int one = -1; // Set all bits, because char
                    if (CALL_Begin(call)) {
                        CALL__thiscall(_@(data), oCLogEntry___oCLogEntry);
                        CALL_PtrParam(_@(one));
                        CALL__thiscall(_@(list), zCList_oCLogEntry___destructor);
                        call = CALL_End();
                    };
                    return;
                };
            };

            prev = list;
            list = l.next;
        end;
    };
};

/*
 * Move entry to the front of the log topic
 */
func void G1CP_LogMoveEntryToTop(var string topic, var string entry) {
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);

        // Iterate over all entries of that topic
        var int list; list = _@(logTopic.m_lstEntries_data);
        var int prev; prev = 0;
        var zCList l;
        while(list);
            l = _^(list);
            if (l.data) {
                if (Hlp_StrCmp(MEM_ReadString(l.data), entry)) {
                    if (prev) && (list != logTopic.m_lstEntries_next) {

                        // Place element at the beginning of the list
                        var int next; next = l.next;
                        l.next = logTopic.m_lstEntries_next;
                        logTopic.m_lstEntries_next = list;

                        // Fill the hole
                        l = _^(prev);
                        l.next = next;
                    };
                    return;
                };
            };

            prev = list;
            list = l.next;
        end;
    };
};

/*
 * Create a log topic in a dialog function. Returns true on success.
 */
func int G1CP_LogCreateTopicInDialog(var int topicSection, var string topicName, var string infoName,
                                     var string funcName, var string hookName, var int apply) {
    // Retrieve the topic and entry strings once and modify the info function
    const int infoId = -2; // -1 is reserved for invalid symbols
    const int topicId = -1;
    const int entryId = -1;
    const string topic = "G1CP invalid topic name";
    const string entry = "G1CP invalid topic entry";

    if (infoId == -2) {
        infoId = G1CP_GetInfoInstId(infoName);
        topicId = G1CP_GetStringConstId(topicName, 0);
        var int funcId; funcId = G1CP_GetFuncId(funcName, "void|none");
        var int bLogEntryId; bLogEntryId = G1CP_GetFuncId("B_LogEntry", "void|string|string");

        // Do this only once (this is never reverted, i.e. session fix)
        if (infoId == -1) || (funcId == -1) || (bLogEntryId == -1) || (topicId == -1) {
            return FALSE;
        };

        // Find all calls to 'B_LogEntry' within the dialog function
        const int bytes[2] = {zPAR_TOK_CALL<<24, -1};
        var zCPar_Symbol needleSymb; needleSymb = _^(MEM_GetSymbolByIndex(bLogEntryId));
        bytes[1] = needleSymb.content;
        var int matches; matches = G1CP_FindInFunc(funcId, _@(bytes)+3, 5);

        /* We are looking for:
            zPAR_TOK_PUSHVAR topic
            zPAR_TOK_PUSHVAR xxxx
            zPAR_TOK_CALL    B_LogEntry
        */

        // Narrow down the search to calls with the correct topic as first argument to find the pushed entry
        repeat(i, MEM_ArraySize(matches)); var int i;
            var int pos; pos = MEM_ArrayRead(matches, i);
            if (MEM_ReadByte(pos-10) == zPAR_TOK_PUSHVAR) && (MEM_ReadInt(pos-9) == topicId)
            && (MEM_ReadByte(pos-5)  == zPAR_TOK_PUSHVAR) {
                entryId = MEM_ReadInt(pos-4);
                break;
            };
        end;
        MEM_ArrayFree(matches);

        // Check if we have found a valid entry
        if (entryId <= 0) || (entryId >= MEM_Parser.symtab_table_numInArray) {
            return FALSE;
        };

        // Get the topic strings
        topic = G1CP_GetStringConstI(topicId, 0, topic);
        entry = G1CP_GetStringI(entryId, 0, entry);

        // Now that all is established, let's replace the call to 'B_LogEntry' to squeeze in the creation of the topic
        i = G1CP_ReplaceCall(funcId, 0, bLogEntryId, MEM_GetSymbolIndex(hookName));
        if (i <= 0) {
            return FALSE;
        };
    };

    // Now, on to the actual revertible fix
    if (infoId == -1) || (entryId == -1) || (topicId == -1) {
        return FALSE;
    };

    // Apply or revert
    if (apply) {
        // Add the log entry silently if it should be there
        return G1CP_LogCreateTopicInDialogAddEntry(infoId, topic, entry, topicSection);
    } else {
        // Revert the fix by removing the entry again
        return G1CP_LogCreateTopicInDialogRemoveEntry(topic, entry);
    };

    // Even if the dialog function is fixed, the fix is not marked as applied here!
    return FALSE;
}
func int G1CP_LogCreateTopicInDialogAddEntry(var int infoId, var string topic, var string entry, var int topicSection) {
    if (!Npc_KnowsInfo(hero, infoId))
    || (G1CP_LogHasEntry(topic, entry)) {
        return FALSE;
    };

    Log_CreateTopic(topic, topicSection);
    Log_AddEntry(topic, entry);
    G1CP_LogMoveEntryToTop(topic, entry); // Move entry to the top otherwise it is always the newest entry

    return TRUE;
}
func int G1CP_LogCreateTopicInDialogRemoveEntry(var string topic, var string entry) {
    G1CP_LogRemoveEntry(topic, entry);

    if (G1CP_LogHasEntry(topic, entry)) {
        return FALSE;
    };

    return TRUE;
}

/*
 * Intercept the call of 'B_LogEntry' within a dialog function
 */
func void G1CP_LogInterceptEntry(var string topicName, var string topic, var int topicSection, var string entry,
                                    var int fixNumber) {
    // Check if this is the correct topic
    if (!Hlp_StrCmp(topic, G1CP_GetStringConst(topicName, 0, "G1CP invalid topic string")))
    || (G1CP_LogGetTopic(topic)) {
        return;
    };

    Log_CreateTopic(topic, topicSection);
    G1CP_SetFixStatus(fixNumber, G1CP_FIX_APPLIED); // If it did not exist before, our fix will have to be reverted

    // Go on with the original call
    G1CP_LogEntry(topic, entry);
}

/*
 * Forward the call to "B_LogEntry"
 */
func void G1CP_LogEntry(var string topic, var string entry) {
    var int funcId; funcId = G1CP_GetFuncId("B_LogEntry", "void|string|string");

    if (funcId == -1) {
        return;
    }

    MEM_PushStringParam(topic);
    MEM_PushStringParam(entry);
    MEM_CallByString("B_LogEntry");
}
