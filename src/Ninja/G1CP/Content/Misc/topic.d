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
 * Count the entries of one log topic
 */
func int G1CP_LogCountEntries(var string topic) {
    var int count; count = -1;
    var int lt; lt = G1CP_LogGetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        if (logTopic.m_lstEntries_next) {
            count = List_Length(logTopic.m_lstEntries_next);
        } else {
            count = 0;
        };
    };
    return count;
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
