FUNC VOID B_SpreadAndMemorize(VAR INT newsid, VAR INT source )
{                                  
	B_AssessAndMemorize(newsid,
						source,
						self, 	/*witness*/
						other, 	/*offender*/
						victim 	/*victim*/ 
						);
};
