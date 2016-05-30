Function CreateRegister() as Object
	obj = {
	    CLASS_TYPE  : "REGISTER"
		value		: 0
		
		Get         : Function() as Integer
			Return m.value
		End Function
		
		Set         : Function(new_value as Integer) as Void
			Assert8Bit(new_value)
			
			m.value = new_value
		End Function
	}
	
	Return obj
End Function
