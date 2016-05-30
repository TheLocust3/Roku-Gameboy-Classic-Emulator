Function Create16BRegister(register1 as Object, register2 as Object) as Object
    obj = {
        CLASS_TYPE  : "16B_REGISTER"
        register1   : 0
        register2   : 0
        
        Init        : Function(register1 as Object, register2 as Object) as Void
            AssertClassType(register1, "REGISTER")
            AssertClassType(register2, "REGISTER")
            
            m.register1 = register1
            m.register2 = register2
        End Function
        
        Get         : Function() as Integer
            Return To16Bit(m.register1.Value, m.register2.Value)
        End Function
        
        Set         : Function(new_value as Integer) as Void
            Assert16Bit(new_value)
            
            byte_array = Split16Bit(new_value)
            m.register1.Set(byte_array[0])
            m.register2.Set(byte_array[1])
        End Function
    }

    obj.Init(register1, register2)

    Return obj
End Function