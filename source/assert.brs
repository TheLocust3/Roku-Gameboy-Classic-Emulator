Function Assert(bool as Boolean) as Void
    If Not bool
        Stop
    End If
End Function

Function Assert8Bit(value as Integer) as Void
    Assert((value < &hFF) and (value >= 0))
End Function

Function Assert16Bit(value as Integer) as Void
    Assert((value < &hFFFF) and (value >= 0))
End Function

Function AssertClassType(class as Object, expected_type as String) as Void
    Assert(class.CLASS_TYPE = expected_type)
End Function