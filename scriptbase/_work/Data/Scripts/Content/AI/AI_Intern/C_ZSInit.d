// ---- C_ZSInit(); genereller "Constuctor" für Zustände ---- //


func void C_ZSInit()
{
	self.aivar[AIV_FIGHTSPEACHFLAG] = 0;

	C_StopLookAt(self);
	
	//CS: WorkAround, bis Bug #3023 gefixt ist
	if self.aivar[AIV_INVINCIBLE]==TRUE
	{
	    self.aivar[AIV_INVINCIBLE]=FALSE;
	    hero.aivar[AIV_INVINCIBLE]=FALSE;
	};    
	
};

func void C_Orc_ZSInit()
{
	Npc_SetPercTime( self, 2 );

	self.aivar[AIV_FIGHTSPEACHFLAG] = 0;
};
