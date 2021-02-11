/*
 * Function to get the log topic status
 */
func int Ninja_G1CP_GetTopicStatus(var string topic) {
    // Iterate over all topics (irrespective of their section)
    var int list; list = oCLogManager_Ptr;
    var zCList l;
    while(list);
        l = _^(list);
        list = l.next;
        if (l.data) {

            // Check for match
            var oCLogTopic logTopic; logTopic = _^(l.data);
            if (Hlp_StrCmp(logTopic.m_strDescription, topic)) {
                return logTopic.m_enuStatus;
            };
        };
    end;

    // Not found
    return -1;
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
