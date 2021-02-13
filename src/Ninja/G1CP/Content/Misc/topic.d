/*
 * Find a topic by its name
 */
func int Ninja_G1CP_GetTopic(var string topic) {
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
 * Get the section of a log topic (LOG_MISSION or LOG_NOTE)
 */
func int Ninja_G1CP_GetTopicSection(var string topic) {
    var int lt; lt = Ninja_G1CP_GetTopic(topic);
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
func int Ninja_G1CP_GetTopicStatus(var string topic) {
    var int lt; lt = Ninja_G1CP_GetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        return logTopic.m_enuStatus;
    } else {
        return -1;
    };
};

/*
 * Function to check whether a the log topic has a certain entry
 */
func int Ninja_G1CP_TopicHasEntry(var string topic, var string entry) {
    var int lt; lt = Ninja_G1CP_GetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);

        // Iterate over all entries of that topic
        var int list; list = _@(logTopic.m_lstEntries_data);
        var zCList l;
        while(list);
            l = _^(list);
            list = l.next;
            if (Hlp_StrCmp(MEM_ReadString(l.data), entry)) {
                return TRUE;
            };
        end;

    };

    // Not found
    return FALSE;
};

/*
 * Rename the topic (does not perform any safety checks, i.e. if there is already a topic of the same name)
 * Use with caution!
 */
func void Ninja_G1CP_RenameTopic(var string topic, var string newName) {
    var int lt; lt = Ninja_G1CP_GetTopic(topic);
    if (lt) {
        var oCLogTopic logTopic; logTopic = _^(lt);
        logTopic.m_strDescription = newName;
    };
};

/*
 * Remove a topic from the log completely
 */
func void Ninja_G1CP_RemoveTopic(var string topic) {
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
