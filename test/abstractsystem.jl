using ModelingToolkit
using Test
MT = ModelingToolkit

@variables t x
struct MyNLS <: MT.AbstractSystem
    name
    systems
end
@test_logs (:warn,) tmp = independent_variables(MyNLS("sys", []))
tmp = independent_variables(MyNLS("sys", []))
@test tmp == []

struct MyTDS <:MT.AbstractSystem
    iv
    name
    systems
end
@test_logs (:warn,) iv = independent_variables(MyTDS(t, "sys", []))
iv = independent_variables(MyTDS(t, "sys", []))
@test all(isequal.(iv, [t]))

struct MyMVS <:MT.AbstractSystem
    ivs
    name
    systems
end
@test_logs (:warn,) ivs = independent_variables(MyMVS([t, x], "sys", []))
ivs = independent_variables(MyMVS([t, x], "sys", []))
@test all(isequal.(ivs, [t, x]))